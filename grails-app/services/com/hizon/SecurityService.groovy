package com.hizon

class SecurityService {
	def springSecurityService

    def loggedInUserOwnsProfile(user) {
		User logged = User.get(springSecurityService.principal.id)
		return user.id == logged.id
    }
}
