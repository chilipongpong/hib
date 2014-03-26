package com.hizon

class InspirationBookController {
	def springSecurityService
	def clientService
	def themeService
	
    def index() { 
		redirect(action: "chooseColors", params: params)
	}
	
	def chooseColors() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
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
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.colors = new HashSet<Color>();

		def colors = [params.color1, params.color2, params.color3]		
		for (String color: colors) {
			if (color.isLong()) {
				inspirationBookInstance.colors.add(Color.get(color))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseColors", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen colors saved"
		redirect(action: "chooseTheme")
	}
	
	def chooseTheme() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		
		[inspirationBookInstance: inspirationBookInstance, themes: themeService.getThemesForInspirationBook(inspirationBookInstance)]
	}
	
	def saveTheme() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.theme = Theme.get(params.theme)
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseTheme", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen theme saved"
		redirect(action: "indicateGuests")
	}
	
	def indicateGuests() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveGuests() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.numberOfGuests = Integer.parseInt(params.numberOfGuests)
		if (params."sponsorRange" == null) {
			inspirationBookInstance.sponsorRange = null
		}
		inspirationBookInstance.sponsorRange = ValueRange.get(params."sponsorRange")
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "indicateGuests", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Number of guests and sponsors saved"
		redirect(action: "indicateSuppliers")
	}
	
	private Client getClient() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		Client client = clientService.getClient(loggedInUser);
		return client
	}
	
	def indicateSuppliers() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveSuppliers() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.hasFlowers = params.hasFlowers == null ? false : true
		inspirationBookInstance.hasBridalCar = params.hasBridalCar == null ? false : true
		inspirationBookInstance.hasEmcee = params.hasEmcee == null ? false : true
		inspirationBookInstance.hasCake = params.hasCake == null ? false : true
		inspirationBookInstance.hasFlowersForEntourage = params.hasFlowersForEntourage == null ? false : true
		inspirationBookInstance.hasPhotoBooth = params.hasPhotoBooth == null ? false : true
		inspirationBookInstance.hasMobileBar = params.hasMobileBar == null ? false : true
		inspirationBookInstance.hasVenue = params.hasVenue == null ? false : true
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "indicateSuppliers", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Number of guests and sponsors saved"
		redirect(action: "indicateSuppliers")
	}
}
