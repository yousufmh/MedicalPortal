package com.gulfunion.medicalportal

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.web.context.annotation.SessionScope
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.servlet.LocaleResolver
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.i18n.CookieLocaleResolver
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession


@SpringBootApplication(exclude = [SecurityAutoConfiguration::class])
class MedicalClientPortalApplication : WebMvcConfigurer {

	@Bean
	fun webClient():WebClient{
		//for Testing Use 8086
		//for production use 8082
		return WebClient.create("")
	}

	@Bean
	@SessionScope
	fun session(request: HttpServletRequest):HttpSession{
		val session =request.session
		session.maxInactiveInterval = 5*60
		return session
	}

	@Bean
	fun localeResolver(): LocaleResolver? {
		val localeResolver = CookieLocaleResolver()
//		localeResolver.setDefaultLocale(Locale.forLanguageTag("ar"))
		return localeResolver
	}

	@Bean
	fun localeChangeInterceptor(): LocaleChangeInterceptor? {
		val localeChangeInterceptor = LocaleChangeInterceptor()
		localeChangeInterceptor.paramName = "lang"
		return localeChangeInterceptor
	}


	override fun addInterceptors(registry: InterceptorRegistry) {
		registry.addInterceptor(this.localeChangeInterceptor()!!);
	}
}

fun main(args: Array<String>) {
	runApplication<MedicalClientPortalApplication>(*args)
}
