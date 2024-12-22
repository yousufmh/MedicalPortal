package com.gulfunion.medicalportal

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Mono
import javax.servlet.http.HttpSession

@Controller
@RequestMapping("/internal")
class InternalController {
    @Autowired
    lateinit var client: WebClient

    @Autowired
    lateinit var session: HttpSession

    @Autowired
    lateinit var sender: JavaMailSender

    @Autowired
    lateinit var messageSource: MessageSource

    @RequestMapping("/display-email")
    fun showEmails():String{

        return "internal_show_email"

    }

    @RequestMapping("/update-email",method = [RequestMethod.POST,RequestMethod.GET])
    fun updateEmails(@RequestParam("username",required = false) id:String?,
                     @RequestParam("email",required = false) email:String?,
                     model: Model):String{



        if (id != null){
            val user = User(nationalID = id)
            val userinfo= client.post().
            uri("/getUser").
            body(Mono.just(user),User::class.java)
                    .retrieve()
                    .bodyToMono(Login::class.java)
                    .block()
            println("Inside the id part $userinfo")

            return if (userinfo?.status == 200){
                session.setAttribute("userFound", userinfo)
                session.setAttribute("verification", userinfo.loginInfo)
                model["id"] = userinfo.loginInfo.nationalID
                model["name"] = userinfo.user.englishName
                model["email"] = userinfo.loginInfo.email

                model["verfied"]= userinfo.loginInfo.verified
                "internal_update_email"
            }else{
                model["error"] =messageSource.getMessage("home.userNotFound",null, LocaleContextHolder.getLocale())
                "internal_update_email"
            }
        }

        if ( email != null){

            val user = session.getAttribute("userFound") as Login
            println("Inside the email part ${user.loginInfo}")


            val customer = user.loginInfo
            customer.email = email
            val updateResponse= client.post().
            uri("/updateUser").
            body(Mono.just(customer),User::class.java)
                    .retrieve()
                    .bodyToMono(ResponseStatus::class.java)
                    .block()

            return if(updateResponse?.status==500){
                model["error"] = messageSource.getMessage("home.serverError",null, LocaleContextHolder.getLocale())
                "internal_update_email"
            }else {
                model["id"] = user.loginInfo.nationalID
                model["name"] = user.user.englishName
                model["email"] = user.loginInfo.email

                model["verfied"]= user.loginInfo.verified
                model["error"] = messageSource.getMessage("passreset.success", null, LocaleContextHolder.getLocale())
                "internal_update_email"
            }
        }

        println("outside the id part")
        return "internal_update_email"

    }

}