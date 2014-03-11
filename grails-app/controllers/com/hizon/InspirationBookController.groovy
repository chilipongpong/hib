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
		params."client.id" = client.id
		[inspirationBookColorInstance: new InspirationBookColor(params)]
	}
	
	def saveColors() {
		def inspirationBookColorInstance = InspirationBookColor.findByClient(Client.get(params."client.id".toLong()))
		if (!inspirationBookColorInstance) {
			inspirationBookColorInstance = new InspirationBookColor(params)
		}
		inspirationBookColorInstance.colors = new HashSet<Color>();

		def colors = [params.color1, params.color2, params.color3]		
		for (String color: colors) {
			if (color.isLong()) {
				inspirationBookColorInstance.colors.add(Color.get(color.toLong()))
			}
		}
		
		if (!inspirationBookColorInstance.save(flush: true)) {
			render(view: "chooseColors", model: [inspirationBookColorInstance: inspirationBookColorInstance], params)
			return
		}
		flash.message = "Chosen colors saved"
		redirect(action: "chooseColors")
	}
}
