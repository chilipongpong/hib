package com.hizon

class InspirationBookController {
	def springSecurityService
	def clientService
	def themeService
	
    def index() { 
		redirect(action: "chooseColors", params: params)
	}
	
	def chooseColors() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		def client = clientService.getClient(loggedInUser);
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id".toLong()))
		List<Color> colors = []
		if (inspirationBookInstance) {
			for (int i = 0; i < inspirationBookInstance.colors.size(); i++) {
				colors.add(inspirationBookInstance.colors.asList().get(i))
			}
		} else {
			inspirationBookInstance = new InspirationBook(params)
		}
		[inspirationBookInstance: inspirationBookInstance, colors: colors]
	}
	
	def saveColors() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id".toLong()))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.colors = new HashSet<Color>();

		def colors = [params.color1, params.color2, params.color3]		
		for (String color: colors) {
			if (color.isLong()) {
				inspirationBookInstance.colors.add(Color.get(color.toLong()))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseColors", model: [inspirationBookColorInstance: inspirationBookInstance], params)
			return
		}
		flash.message = "Chosen colors saved"
		redirect(action: "chooseTheme")
	}
	
	def chooseTheme() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		def client = clientService.getClient(loggedInUser);
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id".toLong()))
		
		[inspirationBookInstance: inspirationBookInstance, themes: themeService.getThemesForInspirationBook(inspirationBookInstance)]
	}
	
	def saveTheme() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id".toLong()))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.theme = Theme.get(params.theme.toLong())
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseTheme", model: [inspirationBookColorInstance: inspirationBookInstance], params)
			return
		}
		flash.message = "Chosen theme saved"
		redirect(action: "chooseTheme")
	}
}
