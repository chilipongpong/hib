package com.hizon

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.RegistrationCode

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
	static defaultAction = 'index'

	def mailService
	def saltSource

	def index = {
		[command: new RegisterCommand()]
	}

	def register = { RegisterCommand command ->

		if (command.hasErrors()) {
			render view: 'index', model: [command: command]
			return
		}

		def user = lookupUserClass().newInstance(username: command.username, password: command.password, email: command.email, firstName: command.firstName, 
				lastName: command.lastName, mobile: command.mobile, phone: command.phone, accountLocked: true, enabled: true)
		def client = new Client(user: user)
		if (!client.validate() || !client.save()) {
			render view: 'index', model: [command: command]
			return
		}

		def registrationCode = new RegistrationCode(username: user.username).save()
		String url = generateLink('verifyRegistration', [t: registrationCode.token])

		def conf = SpringSecurityUtils.securityConfig
		def body = conf.ui.register.emailBody
		if (body.contains('$')) {
			body = evaluate(body, [user: user, url: url])
		}
		mailService.sendMail {
			to command.email
			from conf.ui.register.emailFrom
			subject conf.ui.register.emailSubject
			html body.toString()
		}

		render view: 'index', model: [emailSent: true]
	}
}

class RegisterCommand {

	String username
	String email
	String password
	String password2
	String firstName
	String lastName
	String mobile
	String phone

	def grailsApplication

	static constraints = {
		username blank: false, validator: { value, command ->
			if (value) {
				def User = command.grailsApplication.getDomainClass(
					SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
				if (User.findByUsername(value)) {
					return 'registerCommand.username.unique'
				}
			}
		}
		email blank: false, email: true
		password blank: false, validator: RegisterController.passwordValidator
		password2 validator: RegisterController.password2Validator
		firstName blank:false, nullable:false, size: 1..100
		lastName blank:false, nullable:false, size: 1..100
		mobile nullable:true, matches:"[0-9]*"
		phone nullable:true, matches:"[0-9]*"
	}
}
