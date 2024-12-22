package com.gulfunion.medicalportal

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.core.io.ClassPathResource
import org.springframework.core.io.InputStreamResource
import org.springframework.http.*
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MaxUploadSizeExceededException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.servlet.LocaleResolver
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler
import reactor.core.publisher.Mono
import java.io.InputStream
import java.security.SecureRandom
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.HttpSession


@Controller

class MainController {

    @Autowired
    lateinit var session: HttpSession

    @Autowired
    lateinit var client: WebClient

    @Autowired
    lateinit var sender: JavaMailSender

    @Autowired
    lateinit var language: LocaleResolver

    @Autowired
    lateinit var messageSource: MessageSource


    @RequestMapping("/pre-main")
    fun preMain(@RequestParam("id") id: String):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }

        val customer = client.get()
                .uri("/finduser?id={id}", id)
                .retrieve().bodyToMono(CustomerInfo::class.java).block()
        customer?.ID = id
        session.setAttribute("customer", customer)

        val cchiStatus = client.get()
                .uri("/getcchi?id={id}", id)
                .retrieve().bodyToMono(CCHIStatus::class.java).block()

        println(cchiStatus)
        session.setAttribute("cchi", cchiStatus)


        return "redirect:/main"
    }

    @RequestMapping("/main")
    fun main(modle: Model, request: HttpServletRequest):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        val customer = session.getAttribute("customer")
        val user = session.getAttribute("loginInfo")
        val cchi = session.getAttribute("cchi")

        if(user is User && user.hasDependents=="T" ) {
            val dependents = session.getAttribute("dependents")
            modle["dependents"] = dependents
        }
        val benefitsCode: ArrayList<BenefitCode>
        val benefits: Benefits
        if (session.getAttribute("benfit-list") == null) {
            callAPI("benfit-list", customer as CustomerInfo)
            benefitsCode = session.getAttribute("benfit-list")  as ArrayList<BenefitCode>
            benefits = getBenefit(benefitsCode)
            session.setAttribute("benfit-list", benefits)
        }else{
            benefits =  session.getAttribute("benfit-list") as Benefits
        }
        println(customer)

        modle["lang"] = language.resolveLocale(request).language
        modle["user"] = user
        modle["customer"] = customer
        modle["cchi"] = cchi
        modle["benefit"] = benefits

        return "main"
    }

    @RequestMapping("/message")
    fun message(model: Model):String{

        model["title"] = session.getAttribute("title")
        model["message"] = session.getAttribute("message")

        return "message"

    }

    @RequestMapping("/pdf")
    fun pdf(@RequestParam("name") name: String, model: Model, request: HttpServletRequest):String{

        model["lang"] = language.resolveLocale(request).language
        when (name){
            "benefits_pdf" -> {
                model["benefit_data"] = session.getAttribute("benfit-list") as Benefits
                model["customer"] = session.getAttribute("customer") as CustomerInfo
            }
            "provider_pdf" -> {
                model["benefit"] = session.getAttribute("benfit-list") as Benefits
                model["providers"] = session.getAttribute("provider-list") as ArrayList<Provider>
            }
            "card_pdf" -> {
                model["benefit"] = session.getAttribute("benfit-list") as Benefits
                model["customer"] = session.getAttribute("customer") as CustomerInfo
            }
            "approval_pdf" -> {
                model["approvals"] = session.getAttribute("medical-approval") as ArrayList<Approval>
            }
            "certificate_pdf" -> {
                model["certificate"] = session.getAttribute("certificate") as Certificate
            }
            "claim_pdf" -> {
                model["claims"] = session.getAttribute("medical-claim") /*as ArrayList<Claim>*/
            }
        }

        return "pdf/$name"

    }


    @RequestMapping("/profile")
    fun profile(model: Model,
                method: HttpMethod, request: HttpServletRequest,
                @RequestParam(required = false) body: MutableMap<String, Any>?):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        val user = session.getAttribute("loginInfo") as User
        val customer = client.get()
                .uri("/finduser?id={id}", user.nationalID)
                .retrieve().bodyToMono(CustomerInfo::class.java).block()
//        val customer = session.getAttribute("customer") as CustomerInfo
        customer?.ID = user.nationalID

        model["customer"] = customer as CustomerInfo
        model["user"] = user
        model["lang"] = language.resolveLocale(request).language


        if (method.name == "POST"){
            val singupVerifier =  body?.get("password") == "" && body["confirm_password"] ==""
            if (singupVerifier) {
                model["passError"] = "Please Fill all the required fields"
                return "profile"
            }


            if(body?.get("password")?.equals(body["confirm_password"])!!){
                val strength: Int = 10 // work factor of bcrypt

                val bCryptPasswordEncoder = BCryptPasswordEncoder(strength, SecureRandom())
                val encodedPassword: String = bCryptPasswordEncoder.encode(body["password"].toString())
                user.password =encodedPassword
            }
            else{
                model["passError"] = "Password doesn't match"
                return "profile"
            }

            val updateResponse= client.post().
            uri("/updateUser").
            body(Mono.just(user), User::class.java)
                    .retrieve()
                    .bodyToMono(ResponseStatus::class.java)
                    .block()

            if(updateResponse?.status==500){
                model["passError"] = "Something went wrong try again"

            }else {
                model["passError"] = "Password has been changed successfully "
            }
            }

        return "profile"
    }

    @RequestMapping("/complints", method = [RequestMethod.POST, RequestMethod.GET])
    fun complints(model: Model,
                  method: HttpMethod,
                  request: HttpServletRequest,
                  @RequestParam(required = false) body: MutableMap<String, Any>?):String{
        val templetName = if (session.isNew) {
            "complaints_no_login"
//            session.setAttribute("title",messageSource.getMessage("error.session",null, LocaleContextHolder.getLocale()))
//            session.setAttribute("message",messageSource.getMessage("error.sessionmsg",null, LocaleContextHolder.getLocale()))
//            return "redirect:/message"
        }
        else{
            val user = session.getAttribute("loginInfo")
            model["user"] = user
            "complaints"
        }

        model["lang"] = language.resolveLocale(request).language



        if(method.name == "GET"){
            return templetName
        }

//        val customer = session.getAttribute("customer") as CustomerInfo
//        val user = session.getAttribute("loginInfo") as User


        val name = body?.get("name")
        val id = body?.get("id")
//        val member = customer.membershipNo
        val email = body?.get("email")//user.email
        val mobile = body?.get("mobile")
        val bodyMessage = body?.get("body")

        val sendTo = "complaints@gulfunion-saudi.com"
        val cc="$email"
        val subject = "Customer Medical Complaints from ID#$id"
        val htmlBody = """
           
          <p>Dear Customer Care,</p> 
            <p> Below Complaints Filled by Customer through the medical Client Portal</p>
           <table>
               <tbody>
                <tr>
                   <th>Name </th>
                   <th>ID </th>
                   <th>Mobile </th>
                   <th>Email </th>
               </tr>
               <tr> 
                    <td>$name  </td>
                   <td>$id  </td>
                   <td>$mobile  </td>
                  <td>$email  </td>
                </tr>
               </tbody>
            </table>
           <p> Complaints Body:</p>
           <p> $bodyMessage </p>
           Best regards, 
           IT Department.
       """.trimIndent()

        sendEmail(sender = sender, subject = subject, sendTo = sendTo, cc = cc, htmlBody = htmlBody)

        return templetName
    }

    @RequestMapping("/submit-claim", method = [RequestMethod.POST, RequestMethod.GET])
    fun submitClaim(model: Model,
                    method: HttpMethod,
                    request: HttpServletRequest,
                    @RequestParam("file", required = false) file: ArrayList<MultipartFile>?,
                    @RequestParam(required = false) body: MutableMap<String, Any>?):String{
        val templetName = if (session.isNew) {
//            "complaints_no_login"
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        else{
            val user = session.getAttribute("loginInfo")
            model["user"] = user
            "submit_claim"
        }

        model["lang"] = language.resolveLocale(request).language



        if(method.name == "GET"){
            return templetName
        }

//        val customer = session.getAttribute("customer") as CustomerInfo
//        val user = session.getAttribute("loginInfo") as User


        val name = body?.get("name")
        val id = body?.get("id")
//        val member = customer.membershipNo
        val email = body?.get("email")//user.email
        val mobile = body?.get("mobile")
        val bodyMessage = body?.get("body")
//        val file = body?.get("file") as MultipartFile
        val sendTo = "myousuf@gulfunion-saudi.com"
        val cc="$email"
        val subject = "Customer Medical Claim from ID#$id"
        val htmlBody = """
           
          <p>Dear Medical Claim Team,</p> 
            <p> This is Claim Filled by Customer through the medical Client Portal</p>
           <table>
               <tbody>
                <tr>
                   <th>Name </th>
                   <th>ID </th>
                   <th>Mobile </th>
                   <th>Email </th>
               </tr>
               <tr> 
                    <td>$name  </td>
                   <td>$id  </td>
                   <td>$mobile  </td>
                  <td>$email  </td>
                </tr>
               </tbody>
            </table>
           <p> Additional Information:</p>
           <p> $bodyMessage </p>
           Best regards, 
           IT Department.
       """.trimIndent()

        sendEmail(sender = sender, subject = subject, sendTo = sendTo, cc = cc, htmlBody = htmlBody, file = file)

        return templetName
    }



    @RequestMapping("/faq")
    fun faq(model: Model, request: HttpServletRequest):String {
        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        model["lang"] = language.resolveLocale(request).language

        val user = session.getAttribute("loginInfo")
        model["user"] = user
        return "faq1"
    }


    @RequestMapping("/benefit")
    fun benefitTable(model: Model, request: HttpServletRequest):String{
        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        model["lang"] = language.resolveLocale(request).language
        val customer = session.getAttribute("customer") as CustomerInfo
        model["customer"] = customer
        val benefits = session.getAttribute("benfit-list")
        val user = session.getAttribute("loginInfo")
        model["user"] = user
            model["benefit_data"] = benefits

        return "benefits"
    }

    @RequestMapping("/providers")
    fun providerTable(model: Model, request: HttpServletRequest):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        model["lang"] = language.resolveLocale(request).language

        val benefit = session.getAttribute("benfit-list") as Benefits
        model["benefit"] = benefit

        val providers = session.getAttribute("provider-list") as ArrayList<Provider>
        val user = session.getAttribute("loginInfo")
        model["user"] = user
        model["providers"] = providers

        return "provider_table"
    }


    @RequestMapping("/certificate")
    fun certificateTable(model: Model, request: HttpServletRequest):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }

        val customer = session.getAttribute("customer") as CustomerInfo
        val benefit = session.getAttribute("benfit-list") as Benefits
        model["lang"] = language.resolveLocale(request).language

        val certificate = createCertificate(customer, benefit)
        session.setAttribute("certificate", certificate)

        val user = session.getAttribute("loginInfo")
        model["user"] = user
        model["certificate"] = certificate

        return "certificate"
    }

    @RequestMapping("/approval")
    fun approvalTable(model: Model, request: HttpServletRequest):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        val customer = session.getAttribute("customer") as CustomerInfo
        model["customer"] = customer
        model["lang"] = language.resolveLocale(request).language
        val user = session.getAttribute("loginInfo")
        model["user"] = user

        val apiName = "medical-approval"
        callAPI(apiName, customer)
        if (session.getAttribute(apiName) is MutableList<*>) {
            val approvals = session.getAttribute(apiName)
            model["approvals"] = approvals
        }

        return "approval"
    }


    @RequestMapping("/claim")
    fun claimTable(model: Model, request: HttpServletRequest):String{

        if (session.isNew) {
            session.setAttribute("title", messageSource.getMessage("error.session", null, LocaleContextHolder.getLocale()))
            session.setAttribute("message", messageSource.getMessage("error.sessionmsg", null, LocaleContextHolder.getLocale()))
            return "redirect:/message"
        }
        val customer = session.getAttribute("customer") as CustomerInfo
        model["customer"] = customer
        model["lang"] = language.resolveLocale(request).language
        val user = session.getAttribute("loginInfo")
        model["user"] = user
//        val claims = client.get()
//                .uri("/medical-claim?id={id}", customer.ID)
//                .retrieve()
//                .bodyToFlux(Claim::class.java).collectList().block()
//
//        if (claims != null && claims.size!=0) {
//
//            model["claims"] = claims
//            session.setAttribute("claims",claims)
//        }else{
//            session.setAttribute("claims",ArrayList<Claim>())
//            model["claims"] = ArrayList<Claim>()
//        }


        val apiName = "medical-claim"
        callAPI(apiName, customer)
        if (session.getAttribute(apiName) is MutableList<*>) {
            val claims = session.getAttribute(apiName)
            model["claims"] = claims
        }
        return "claim"
    }

    @RequestMapping("/limit-d", produces = [MediaType.APPLICATION_PDF_VALUE])
    @ResponseBody
    fun downloadLimit(response: HttpServletResponse):ResponseEntity<InputStreamResource>
    {

        val file: InputStream = ClassPathResource("limit.pdf").inputStream
        val headers = HttpHeaders()
        val resource = InputStreamResource(file)
        headers["content-Type"] = "application/pdf"
        headers.add("Content-Disposition", "attachment; filename=CCHI Policy Standard Exclusions.pdf")
        return ResponseEntity.ok()
                .headers(headers)
               // .contentLength(file.available())
                .body(resource)

    }

    @RequestMapping("/claim-doc")
    @ResponseBody
    fun downloadClaimForm(response: HttpServletResponse):ResponseEntity<InputStreamResource>
    {

        val file: InputStream = ClassPathResource("ClaimForm.docx").inputStream


        val headers = HttpHeaders()
        val resource = InputStreamResource(file)
//        headers["content-Type"] = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        headers.add("Content-Disposition", "attachment; filename=ClaimForm.docx")
        return ResponseEntity.ok()
                .headers(headers)
                // .contentLength(file.available())
                .body(resource)
    }

//    @RequestMapping("/downloadPDF", produces = [MediaType.APPLICATION_PDF_VALUE])
//    @ResponseBody
//    fun downloadBenefit(response: HttpServletResponse,@RequestParam("name")templetName:String)/*: ResponseEntity<InputStreamResource>*/ {
//        val customer = session.getAttribute("customer") as CustomerInfo
//        val benefit = session.getAttribute("benfit-list") as Benefits
//        val headers = HttpHeaders()
//        val maps:MutableMap<String,Any> = mutableMapOf()
//        maps["customer"] = customer
//        maps["benefit_data"] = benefit
//
//        headers["content-Type"] = "application/pdf"
//        headers.add("Content-Disposition", "attachment; filename=citiesreport.pdf")
//
//        val bis: ByteArrayOutputStream? = loadFtlHtml("benefitspdf.ftlh",maps)
//        response.contentType = "application/pdf"
//        response.characterEncoding = "UTF-8"
//        val fileName: String = URLEncoder.encode("Monthly report.pdf", "UTF-8")
//        response.addHeader("Content-Disposition","attachment; filename=$fileName")
//        val out = response.outputStream
//        bis?.writeTo(out)
//        bis?.close()
//
//    }


    fun callAPI(apiName: String, customer: CustomerInfo){
        val call = client.get()
                .uri("/$apiName?id={id}", customer.ID)
                .retrieve()

       val response = when(apiName){

           "provider-list" -> {
               call.bodyToFlux(Provider::class.java).collectList().block()
           }
           "medical-claim" -> {
               call.bodyToFlux(Claim::class.java).collectList().block()
           }
           "medical-approval" -> {
               call.bodyToFlux(Approval::class.java).collectList().block()
           }
           "benfit-list" -> {
               call.bodyToFlux(BenefitCode::class.java).collectList().block()
           }

           else ->null
        }

        if (response != null && response.size!=0) {
            session.setAttribute(apiName, response)
        }else{
            session.setAttribute(apiName, ArrayList<Any>())

        }
    }

}

@ControllerAdvice
class FileUploadExceptionAdvice : ResponseEntityExceptionHandler() {
    @ExceptionHandler(MaxUploadSizeExceededException::class)
    fun handleMaxSizeException(model: Model,exc: MaxUploadSizeExceededException?): String {
        model["message"] = "One or more files are too large!"
        model["title"] = "file limit"
        return "message"
//        return ResponseEntity
//                .status(HttpStatus.EXPECTATION_FAILED)
//                .body("One or more files are too large!")
    }
}