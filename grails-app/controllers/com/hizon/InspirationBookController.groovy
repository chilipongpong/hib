package com.hizon

class InspirationBookController {
	def springSecurityService
	def clientService
	
    def index() { 
		redirect(action: "chooseColors", params: params)
	}
	
	def chooseColors() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		def client = clientService.getClient(loggedInUser);
		[inspirationBookColorInstance: new InspirationBookColor(params), clientInstance: client]
	}
}
