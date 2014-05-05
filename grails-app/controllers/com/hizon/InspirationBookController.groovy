package com.hizon

class InspirationBookController {
	def springSecurityService
	def clientService
	def themeService
	def colorService
	
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
		def colors = [:]
		if (inspirationBookInstance) {
			for (int i = 0; i < inspirationBookInstance.colors.size(); i++) {
				colors.((i + 1) + "") = inspirationBookInstance.colors.asList().get(i).id
			}
		} else {
			inspirationBookInstance = new InspirationBook(params)
		}
		[inspirationBookInstance: inspirationBookInstance, color1: colors."1", color2: colors."2", color3: colors."3"]
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
		if (!inspirationBookInstance) {
 			flash.message = "Choose colors first before choosing a theme."
            redirect(action: "chooseColors")
			return
		}
		
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
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
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
		redirect(action: "chooseAppetizers")
	}
	
	def chooseAppetizers() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveAppetizers() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.appetizers = new HashSet<MenuItem>();

		def appetizers = [params.appetizer1, params.appetizer2]
		for (String appetizer: appetizers) {
			if (appetizer.isLong()) {
				inspirationBookInstance.appetizers.add(MenuItem.get(appetizer))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseAppetizers", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen appetizers saved"
		redirect(action: "choosePastas")
	}
	
	def chooseSoups() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveSoups() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.soups = new HashSet<MenuItem>();

		def soups = [params.soup1, params.soup2]
		for (String soup: soups) {
			if (soup.isLong()) {
				inspirationBookInstance.soups.add(MenuItem.get(soup))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseSoups", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen soups saved"
		redirect(action: "chooseSalads")
	}
	
	def chooseSalads() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveSalads() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.salads = new HashSet<MenuItem>();

		def salads = [params.salad1, params.salad2]
		for (String salad: salads) {
			if (salad.isLong()) {
				inspirationBookInstance.salads.add(MenuItem.get(salad))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseAppetizers", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen salads saved"
		redirect(action: "choosePastas")
	}
	
	def choosePastas() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def savePastas() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.pastas = new HashSet<MenuItem>();

		def pastas = [params.pasta1, params.pasta2]
		for (String pasta: pastas) {
			if (pasta.isLong()) {
				inspirationBookInstance.pastas.add(MenuItem.get(pasta))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "choosePastas", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen pastas saved"
		redirect(action: "chooseBeefs")
	}
	
	def chooseBeefs() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveBeefs() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.beefs = new HashSet<MenuItem>();

		def beefs = [params.beef1, params.beef2]
		for (String beef: beefs) {
			if (beef.isLong()) {
				inspirationBookInstance.beefs.add(MenuItem.get(beef))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseBeefs", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen beefs saved"
		redirect(action: "choosePorks")
	}
	
	def choosePorks() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def savePorks() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.porks = new HashSet<MenuItem>();

		def porks = [params.pork1, params.pork2]
		for (String pork: porks) {
			if (pork.isLong()) {
				inspirationBookInstance.porks.add(MenuItem.get(pork))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "choosePorks", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen porks saved"
		redirect(action: "chooseChickens")
	}
	
	def chooseChickens() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveChickens() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.chickens = new HashSet<MenuItem>();

		def chickens = [params.chicken1, params.chicken2]
		for (String chicken: chickens) {
			if (chicken.isLong()) {
				inspirationBookInstance.chickens.add(MenuItem.get(chicken))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseChickens", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen chickens saved"
		redirect(action: "chooseSeafoods")
	}
	
	def chooseSeafoods() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveSeafoods() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.seafoods = new HashSet<MenuItem>();

		def seafoods = [params.seafood1, params.seafood2]
		for (String seafood: seafoods) {
			if (seafood.isLong()) {
				inspirationBookInstance.seafoods.add(MenuItem.get(seafood))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseSeafoods", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen seafoods saved"
		redirect(action: "chooseVegetables")
	}
	
	def chooseVegetables() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveVegetables() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.vegetables = new HashSet<MenuItem>();

		def vegetables = [params.vegetable1, params.vegetable2]
		for (String vegetable: vegetables) {
			if (vegetable.isLong()) {
				inspirationBookInstance.vegetables.add(MenuItem.get(vegetable))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseVegetables", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen vegetables saved"
		redirect(action: "chooseDesserts")
	}
	
	def chooseDesserts() {
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can create their inspiartion book"
			redirect(action: "index", controller: "client")
			return
		}
		params."client.id" = client.id
		InspirationBook inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		[inspirationBookInstance: inspirationBookInstance]
	}
	
	def saveDesserts() {
		def inspirationBookInstance = InspirationBook.findByClient(Client.get(params."client.id"))
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		inspirationBookInstance.desserts = new HashSet<MenuItem>();

		def desserts = [params.dessert1, params.dessert2]
		for (String dessert: desserts) {
			if (dessert.isLong()) {
				inspirationBookInstance.desserts.add(MenuItem.get(dessert))
			}
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "chooseDesserts", model: [inspirationBookInstance: inspirationBookInstance], params: params)
			return
		}
		flash.message = "Chosen desserts saved"
		redirect(action: "indicateSuppliers")
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
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
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
	
	def getRandomColor(params) {
		def colors = []
		for (int i=1; i<=3; i++) {
			if(params.("color" + i)) {
				Color color = Color.get(params.("color" + i))
				if (color != null) {
					colors.add(color)
				}
			}
		}
		Color randomColor = colorService.getRandomColorFromThemesContainingColors(colors)
		render(contentType: 'text/json') {[
			'color': randomColor?.id
		]}
	}
	
	private Client getClient() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		Client client = clientService.getClient(loggedInUser);
		return client
	}
}
