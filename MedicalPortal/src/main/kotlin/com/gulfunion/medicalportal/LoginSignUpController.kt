package com.gulfunion.medicalportal

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.http.HttpMethod
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Mono
import java.security.SecureRandom
import java.util.*
import javax.servlet.http.HttpSession


@Controller

class LoginSignUpController {


    @Autowired
    lateinit var client:WebClient

    @Autowired
    lateinit var session:HttpSession

    @Autowired
    lateinit var sender: JavaMailSender

    @Autowired
    lateinit var messageSource: MessageSource



    @RequestMapping("/",method = [RequestMethod.GET,RequestMethod.POST])
    fun home(model:Model ,
             method:HttpMethod):String{

        model["errorSignup"] = session.getAttribute("errorSignup") ?: ""
        model["errorLogin"] = session.getAttribute("errorSignin") ?: ""
        model["alertType"] = session.getAttribute("alertType") ?: ""
        session.invalidate()
        return "home"

    }



    @RequestMapping("/signup", method = [RequestMethod.POST])
    fun signup(@RequestParam body:MutableMap<String, Any>,
               model:Model,header:HttpMethod):String{
            var error = ""
            val singupVerifier = body["id"] == "" && body["dob"] == "" && body["email"] == ""
                    && body["password"] == "" && body["confirm_password"] ==""
            if (singupVerifier) {
                error = messageSource.getMessage("home.infoNotFull",null, LocaleContextHolder.getLocale())
                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","E")
                return "redirect:/"
            }

            val email =   body["email"] as String
            if (email.contains(" ")){
                error = messageSource.getMessage("home.invalidEmail",null, LocaleContextHolder.getLocale())
                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","E")
                return "redirect:/"
            }

            val id = body["id"] as String
            val dob = body["dob"] as String
            model["method"] = header.name
            val customer = client.get()
                    .uri("/validateuser?id={id}&dob={dob}", id, dob)
                    .retrieve()
                    .bodyToMono(ResponseStatus::class.java)
                    .block()

        val user = User()
        user.nationalID = id
//        user.username = body["username"] as String
        user.email = email

        if(body["password"]?.equals(body["confirm_password"])!!){
            val strength: Int = 10 // work factor of bcrypt

            val bCryptPasswordEncoder = BCryptPasswordEncoder(strength, SecureRandom())
            val encodedPassword: String = bCryptPasswordEncoder.encode(body["password"].toString())
            user.password =encodedPassword
        }
        else{
            error =messageSource.getMessage("home.passwordNotMatch",null, LocaleContextHolder.getLocale())
            session.setAttribute("errorSignin", error)
            session.setAttribute("alertType","E")
            return "redirect:/"


        }

        return when (customer?.status) {
                200 -> {

                    val dependentsResponse = client.get()
                            .uri("/checkDependents?id={id}", id)
                            .retrieve()
                            .bodyToMono(ResponseStatus::class.java)
                            .block()

                    if (dependentsResponse?.status == 200){
                        user.hasDependents = "T"
                    }
                    else {
                        user.hasDependents = "F"
                    }

                    val response = client.post()
                            .uri("/createuser")
                            .body(Mono.just(user), User::class.java)
                            .retrieve()
                            .bodyToMono(ResponseStatus::class.java)
                            .block()
                    when (response?.status) {

                        200 ->{
                            error =messageSource.getMessage("home.emailVerifySent",null, LocaleContextHolder.getLocale())
                            session.setAttribute("errorSignin", error)
                            session.setAttribute("verification", user)
                            session.setAttribute("alertType","I")
                            sendWelcomeEmail(user)
                            "redirect:/emailverification?eop=E"
                        }
                        500 ->{
                            error =messageSource.getMessage("home.userFound",null, LocaleContextHolder.getLocale())
                            session.setAttribute("errorSignin", error)
                            session.setAttribute("alertType","E")
                            "redirect:/"


                        }
                        else ->{

                            error =messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                            session.setAttribute("errorSignin", error)
                            session.setAttribute("alertType","E")
                            "redirect:/"


                        }
                }

                }
                404 -> {
                    error = messageSource.getMessage("home.userNotFound",null, LocaleContextHolder.getLocale())
                    session.setAttribute("errorSignin", error)
                    session.setAttribute("alertType","E")
                    "redirect:/"


                }
            else -> {
                error = messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())

                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","E")

                "redirect:/"

            }

        }

    }



    @RequestMapping("/login", method = [RequestMethod.POST])
    fun login(@RequestParam("username") id:String,
              @RequestParam("password") password:String,
              model:Model):String{

        var error = ""
        val loginVerifier = id =="" && password == ""
        if (loginVerifier){
            error = messageSource.getMessage("home.infoNotFull",null, LocaleContextHolder.getLocale())
            session.setAttribute("errorSignin",error)
            session.setAttribute("alertType","E")

            return "redirect:/"
        }

        val strength: Int = 10
        val bCryptPasswordEncoder = BCryptPasswordEncoder(strength, SecureRandom())
        val encodedPassword: String = bCryptPasswordEncoder.encode(password)

        val user = User(nationalID =id )


            val login= client.post().
            uri("/login").
            body(Mono.just(user),User::class.java)
                    .retrieve()
                    .bodyToMono(Login::class.java)
                    .block()
            return when (login?.status) {
                200 -> {
                    if (bCryptPasswordEncoder.matches(password, login.loginInfo.password) ) {
                        if (login.user.startDate.after(Date())){
                            error = "${messageSource.getMessage("home.policyNotStarted1",null, LocaleContextHolder.getLocale())} ${login.user.startDate}${messageSource.getMessage("home.policyNotStarted2",null, LocaleContextHolder.getLocale())} ${login.user.startDate} ${messageSource.getMessage("home.policyNotStarted3",null, LocaleContextHolder.getLocale())}"
                            session.setAttribute("errorSignin", error)
                            session.setAttribute("alertType","E")

                            return "redirect:/"
                        }
                        val temp = login.user
                        temp.ID = login.loginInfo.nationalID
                        val loginInfo = login.loginInfo
                        session.setAttribute("customer",temp)
                        session.setAttribute("loginInfo",loginInfo)

                        if (loginInfo.hasDependents == "T"){
                            val dependents = client.get()
                                    .uri("/getDependents?id={id}",temp.ID)
                                    .retrieve()
                                    .bodyToFlux(Dependents::class.java).collectList().block()
                            println(dependents)
                            session.setAttribute("dependents",dependents)
                        }
                        val cchiStatus = client.get()
                                .uri("/getcchi?id={id}", id)
                                .retrieve().bodyToMono(CCHIStatus::class.java).block()

                        println(cchiStatus)
                        session.setAttribute("cchi", cchiStatus)

                        val provider = client.get()
                                .uri("/provider-list?id={id}", temp.ID)
                                .retrieve()
                                .bodyToFlux(Provider::class.java).collectList().block()
                        session.setAttribute("provider-list",provider)
                        "redirect:/main"
                    }else{
                        error = messageSource.getMessage("home.UserPassError",null, LocaleContextHolder.getLocale())
                        session.setAttribute("errorSignin", error)
                        session.setAttribute("alertType","E")

                        "redirect:/"
                    }
                }
                402 ->{
                    error = messageSource.getMessage("home.emailNotVerify",null, LocaleContextHolder.getLocale())
                    session.setAttribute("errorSignin", error)
                    session.setAttribute("verification", login.loginInfo)
                    session.setAttribute("alertType","V")
                    "redirect:/"

                }
                404 -> {
                    error = messageSource.getMessage("home.userDisabled",null, LocaleContextHolder.getLocale())
                    session.setAttribute("errorSignin", error)
                    session.setAttribute("alertType","E")

                    "redirect:/"
                }
                401 -> {
                    error = messageSource.getMessage("home.UserPassError",null, LocaleContextHolder.getLocale())
                    session.setAttribute("errorSignin", error)
                    session.setAttribute("alertType","E")

                    "redirect:/"
                }
                else -> {
                    error = messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                    session.setAttribute("errorSignin", error)
                    session.setAttribute("alertType","E")

                    "redirect:/"
                }
            }

    }

    @RequestMapping("/emailverification")
    fun sendverificationEmail(@RequestParam eop:String):String{
        val user =  session.getAttribute("verification") as User
        val verificationToken = VerificationToken()
        verificationToken.userID = user.nationalID
        verificationToken.token = UUID.randomUUID().toString()
        verificationToken.emailOrPassword = eop

        val response = client.post()
                .uri("/emailtoken")
                .body(Mono.just(verificationToken), VerificationToken::class.java)
                .retrieve()
                .bodyToMono(ResponseStatus::class.java)
                .block()


        when (response?.status) {

            200 -> {
                sendVerfifcationEmail(verificationToken, user)
                val error = messageSource.getMessage("home.emailVerifySent",null, LocaleContextHolder.getLocale())
                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","I")

            }
            500 -> {
                val error =messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","E")

            }
            else -> {
                val error =messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                session.setAttribute("errorSignin", error)
                session.setAttribute("alertType","E")


            }
        }
            return "redirect:/"
    }

    private fun sendVerfifcationEmail(verificationToken: VerificationToken, user: User) {
        var subject =""
        var body = ""
        val url = "https://medical.gulfunion-saudi.com/confirmToken?token=${verificationToken.token}&eop=${verificationToken.emailOrPassword}"
        if(verificationToken.emailOrPassword == "E"){
            body ="<p> Kindly Confirm your Email by Click on the below Link</p>"
            subject ="Gulf Union Medical Portal Email Confirmation"
        }
        else{
            body = "<p> To reset your Password Kindly click on the below Link</p>"
            subject ="Gulf Union Medical Portal Reset Password"
        }

//        val html = """
//            <html lang="en">
//            <body>
//            <p>Dear ${user.username}, </p>
//            $body
//            <p> http://192.168.1.96:8083/$url</p>
//            </body>
//            </html>
//        """.trimIndent()
//        val msg = sender.createMimeMessage()
//        val helper = MimeMessageHelper(msg,true)
//        helper.setFrom("no-reply@gulfunion-saudi.com")
//        helper.setTo(user.email)
//        helper.setSubject(subject)
//        helper.setText(html,true)
//
//        sender.send(msg)

        val sendTo = user.email
//        val cc="$email"
//        val subject = "Welcome To GulfUnion Medical Portal."
        val htmlBody = """
           <p>Dear Customer, </p> 
            $body
            <a > $url</a>
            <p> Gulf Union Cooperative Insurance Company </p>
       """.trimIndent()

        sendEmail(sender = sender, subject =subject, sendTo =sendTo, htmlBody = htmlBody)




    }


    private fun sendWelcomeEmail(user: User) {

//      val html = """
//            <html lang="en">
//            <body>
//            <p>Dear ${user.username}, </p>
//            <p>
//                We thank you for choosing GULFUNION to serve you in your medical insurance needs.
//                This website is made for your as a leaflet to show you your Table of Benefits, Network of providers that you can access
//                and also to allow you print a medical insurance certificate whenever needed.
//            </p>
//            <br>
//            <p>
//            We wish you happy and healthy life, Please contact us at the Toll Free Number ( 920029926 ) if you need any further assistance.
//            </p>
//            <p> Gulf Union Cooperative Insurance Company </p>
//            </body>
//            </html>
//        """.trimIndent()
//        val msg = sender.createMimeMessage()
//        val helper = MimeMessageHelper(msg,true)
//        helper.setFrom("no-reply@gulfunion-saudi.com")
//        helper.setTo(user.email)
//        helper.setSubject("Welcome To GulfUnion Medical Portal.")
//        helper.setText(html,true)
//
//        sender.send(msg)

        val sendTo = user.email
//        val cc="$email"
        val subject = "Welcome To GulfUnion Medical Portal."
        val htmlBody = """
           <p>Dear Customer, </p>
            <p> 
                We thank you for choosing GULFUNION to serve you in your medical insurance needs. 
                This website is made for your as a leaflet to show you the following services:
                Table of Benefits,Medical Approval, Medical Claims, you book a Medical Complaint , Network of providers, medical insurance certificate.
            </p>
            <br>
            <p>
            We wish you happy and healthy life, Please contact us at the Toll Free Number ( 920029926 ) if you need any further assistance.
            </p>
            <p> Gulf Union Cooperative Insurance Company </p>
       """.trimIndent()

        sendEmail(sender = sender, subject =subject, sendTo =sendTo, htmlBody = htmlBody)


    }

    @RequestMapping("/confirmToken")
    fun confirmToken(@RequestParam("token") token:String, @RequestParam("eop")eop:String,model: Model):String{

        val verificationToken = VerificationToken(token = token,emailOrPassword = eop)
        val response= client.post().
                          uri("/verifyToken").
                          body(Mono.just(verificationToken),VerificationToken::class.java)
                          .retrieve()
                          .bodyToMono(Login::class.java)
                          .block()
        model["title"] =messageSource.getMessage("token.titleEmail",null, LocaleContextHolder.getLocale())
         when(response?.status){
            200 ->{

               val userinfo = response.loginInfo
                if (verificationToken.emailOrPassword == "P"){
                    session.setAttribute("user", userinfo)
                    return "redirect:/resetpassword?bf=F"
                }

                println(userinfo)

                userinfo.verified = "T"
                val updateResponse= client.post().
                uri("/updateUser").
                body(Mono.just(userinfo),User::class.java)
                        .retrieve()
                        .bodyToMono(ResponseStatus::class.java)
                        .block()
                if(updateResponse?.status == 500){
                    model["message"] =messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                    return "message"
                }

                model["message"] =messageSource.getMessage("token.verified",null, LocaleContextHolder.getLocale())
                return "message"
            }

            400-> {

                model["message"] =messageSource.getMessage("token.expired",null, LocaleContextHolder.getLocale())
                return "message"

            }

            404 ->{
                model["message"] =messageSource.getMessage("token.invaild",null, LocaleContextHolder.getLocale())
                return "message"
            }

             else ->{
                 model["message"] =messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                 return "message"
             }
        }
    }

    @RequestMapping("prepare", method = [RequestMethod.POST,RequestMethod.GET])
    fun prepare(model: Model, method: HttpMethod,@RequestParam("eop",required = false) eop:String?,
                            @RequestParam(required = false) body:MutableMap<String, Any>?):String{



        var eopTemp =""
        if (session.getAttribute("eop") == null) {
            session.setAttribute("eop", eop)
        }else{
            eopTemp  =  session.getAttribute("eop") as String
        }

        if(eopTemp=="P")
            model["title"] =messageSource.getMessage("token.titleEmail",null, LocaleContextHolder.getLocale())
        else{
            model["title"] =messageSource.getMessage("resetPassword",null, LocaleContextHolder.getLocale())

        }


        if(method.name == "GET"){
            return "prepare_reset"
        }

        val singupVerifier =  body?.get("username") == ""
        if (singupVerifier) {
            model["username"] =messageSource.getMessage("home.infoNotFull",null, LocaleContextHolder.getLocale())
            return "prepare_reset"
        }

        val nationalID = body?.get("username") as String
       val user = User(nationalID = nationalID)
       val userinfo= client.post().
                         uri("/getUser").
                         body(Mono.just(user),User::class.java)
                        .retrieve()
                        .bodyToMono(Login::class.java)
                        .block()
        return if (userinfo?.status == 200){
            session.setAttribute("verification", userinfo.loginInfo)
            "redirect:/emailverification?eop=$eopTemp"
        }else{
            model["username"] =messageSource.getMessage("home.userNotFound",null, LocaleContextHolder.getLocale())
            "prepare_reset"
        }
    }

    @RequestMapping("resetpassword", method = [RequestMethod.POST,RequestMethod.GET])
    fun resetPassword(model: Model,
                      method: HttpMethod,
                      @RequestParam(required = false) body:MutableMap<String, Any>?):String{


        if(method.name == "GET" ){
            return "password_reset"
        }

        val singupVerifier =  body?.get("password") == "" && body["confirm_password"] ==""
        if (singupVerifier) {
            model["passError"] =messageSource.getMessage("home.infoNotFull",null, LocaleContextHolder.getLocale())
            return "password_reset"
        }

        val user = session.getAttribute("user") as User

        if(body?.get("password")?.equals(body["confirm_password"])!!){
            val strength: Int = 10 // work factor of bcrypt

            val bCryptPasswordEncoder = BCryptPasswordEncoder(strength, SecureRandom())
            val encodedPassword: String = bCryptPasswordEncoder.encode(body["password"].toString())
            user.password =encodedPassword
        }
        else{
            model["passError"] =messageSource.getMessage("home.passwordNotMatch",null, LocaleContextHolder.getLocale())
            return "password_reset"
        }

        val updateResponse= client.post().
        uri("/updateUser").
        body(Mono.just(user),User::class.java)
                .retrieve()
                .bodyToMono(ResponseStatus::class.java)
                .block()

        return if(updateResponse?.status==500){
            model["passError"] = messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
            "password_reset"
        }else{
            val error = messageSource.getMessage("passreset.success",null, LocaleContextHolder.getLocale())
            session.setAttribute("errorSignin", error)
            "redirect:/"
        }

    }

}