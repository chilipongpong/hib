package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ClientController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def fileService
	def springSecurityService
	def securityService
	def mailService
	def clientService
	def inspirationBookService

    def index() {
        redirect(action: "list", params: params)
    }

	def validateUser() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		if (loggedInUser.isClient()) {
			def clientInstance = Client.findByUser(User.findById(loggedInUser.id))
			def params = [:]
			params.id = clientInstance.id
		    redirect(action: "show", params: params)
		    return
		}

	}

    def list(Integer max) {
		validateUser()
        params.max = Math.min(max ?: 10, 100)
        [clientInstanceList: Client.list(params), clientInstanceTotal: Client.count()]
    }

    def create() {
		validateUser()
        [clientInstance: new Client(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def clientInstance = new Client(params)
        if (!clientInstance.user.validate() || !clientInstance.save(flush: true)) {
            render(view: "create", model: [clientInstance: clientInstance])
            return
        }
		UserRole.create clientInstance.user, Role.findByAuthority('ROLE_CLIENT')
		
		// send email notification to planner supervisor whenever a client is created
		// current emailing system assumes that there is only 1 planner supervisor (business rules)
		def plannerSupervisor = PlannerSupervisor.get(1)
		
		try {
			mailService.sendMail {
				to plannerSupervisor.getUser().getEmail()
				subject "New Client Alert: " + clientInstance.getUser()
				body(view: "/emailNotification/newClientCreated",
				plugin: "email-confirmation",
				model: [clientInstance: clientInstance])
			}
		} catch (Exception e){
			flash.error = "Sorry. Email Notification could not be sent. Please check your internet connection."
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def show(Long id) {
        def clientInstance = Client.get(id)

        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

		User loggedInUser = User.get(springSecurityService.principal.id)
		if (loggedInUser.isClient() && !securityService.loggedInUserOwnsProfile(clientInstance.user)) {
			flash.message = "You can't see the profile of other users"
			redirect(action: "list")
			return
		}
		 
 


        [clientInstance: clientInstance]
    }

    def edit(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        [clientInstance: clientInstance]
    }

    def update(Long id, Long version) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clientInstance.version > version) {
                clientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'client.label', default: 'Client')] as Object[],
                          "Another user has updated this Client while you were editing")
                render(view: "edit", model: [clientInstance: clientInstance])
                return
            }
        }

        params."user.enabled" = ('on' == params.user.enabled)
        clientInstance.properties = params

        if (!clientInstance.user.validate() || !clientInstance.save(flush: true)) {
            render(view: "edit", model: [clientInstance: clientInstance])
            return
        }
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def delete(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        try {
        	UserRole.findByUser(clientInstance.user).delete()
            clientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def dashboard(long id){
		def user = (User) springSecurityService.getCurrentUser()
		def loggedInClient = Client.findByUser(user)
		
		if (loggedInClient.planner != null){
			[clientId: loggedInClient.id, firstName: loggedInClient.getUser().getFirstName(), myPlannerId: loggedInClient.planner.id]
		}
		else {
			[clientId: loggedInClient.id, firstName: loggedInClient.getUser().getFirstName()]
		}
		
		
	}
	
	def myPlanner(long id){
		def user = (User) springSecurityService.getCurrentUser()
		def loggedInClient = Client.findByUser(user)
		
		if (id != null){
			[plannerInstance: loggedInClient.planner]
		} 
		
	}
	
	def themesGallery (){
		def activeThemesCriteria = Theme.createCriteria()
		def activeThemes = activeThemesCriteria.list {
			eq("status", Status.ACTIVE)
		}
		[activeThemes: activeThemes, activeThemesTotal: activeThemes.size()]
				
	}
	
	def displayImage() {
		File image = new File(fileService.imagesRootPath + File.separator + 'theme' + File.separator + params.themeId + File.separator + params.img)
		if(!image.exists()) {
			response.status = 404
		} else {
			response.setContentType("image/jpeg")
			OutputStream out = response.getOutputStream();
			out.write(image.bytes);
			out.close();
		}
	}
	
	def viewTheme (long id){
		def themeInstance = Theme.get(id)
		if (!themeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
			redirect(action: "list")
		}
		
		Client client = getClient()
		if (client == null) {
			flash.message = "Only clients can view theme gallery"
			redirect(action: "index", controller: "client")
			return
		}
		
		def imagesDirectory = new File(fileService.imagesRootPath + File.separator + 'theme' + File.separator + themeInstance.id)
		[themeInstance: themeInstance, images: imagesDirectory.listFiles()]
	}
	
	def saveTheme() {
		def inspirationBookInstance = InspirationBook.findByClient(getClient())
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook(params)
		}
		
		def themeInstance = Theme.get(params.id);
		if (!themeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
			redirect(action: "themesGallery")
		}
		
		if (inspirationBookInstance.themes) {
			def alreadyInThemes = false
			for (def theme: inspirationBookInstance.themes) {
				if (themeInstance.id == theme.id) {
					alreadyInThemes = true
				} 
			}
			if (!alreadyInThemes) {
				inspirationBookInstance.themes.add(themeInstance)
			}
		}

		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "viewTheme", model: [themeInstance: themeInstance], params: params)
			return
		}
		flash.message = "Theme " + themeInstance.name + " added to inspiration book"
		redirect(action: "themesGallery")
	}
	
	def menu(){
		def activeMenuCategoriesCriteria = MenuCategory.createCriteria()
		def activeMenuCategories = activeMenuCategoriesCriteria.list {
			eq("status", Status.ACTIVE)
		}
		[activeMenuCategories: activeMenuCategories, activeMenuCategoriesTotal: activeMenuCategories.size()]
	}
	
	def viewMenuCategory(long id){
		def menuCategoryInstance = MenuCategory.get(id)
		
		List<MenuItem> menuItems = MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, menuCategoryInstance)
		
		def inspirationBookInstance = InspirationBook.findByClient(getClient())
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook()
		}
		def inspirationBookItems = inspirationBookService.listMenuItems(inspirationBookInstance, menuCategoryInstance)
		
		[menuCategory: menuCategoryInstance, menuItems: menuItems, menuItemsSize: menuItems.size(), inspirationBookItems: inspirationBookItems]
	}
	
	def saveMenuCategories() {
		def menuCategoryInstance = MenuCategory.get(params.id)
		
		def inspirationBookInstance = InspirationBook.findByClient(getClient())
		if (!inspirationBookInstance) {
			inspirationBookInstance = new InspirationBook()
		}
		
		def inspirationBookItems = new HashSet<MenuItem>()
		def selectedItems = params.selectedItems.split(",")
		for (String item: selectedItems) {
			if (item.isLong()) {
				inspirationBookItems.add(MenuItem.get(item))
			}
		}
		
		switch (menuCategoryInstance.name) {
			case ("Appetizer"):
				inspirationBookInstance.appetizers = inspirationBookItems
				break
			case ("Soup"):
				return inspirationBookInstance.soups = inspirationBookItems
				break
			case ("Salad"):
				return inspirationBookInstance.salads = inspirationBookItems
				break
			case ("Pasta"):
				return inspirationBookInstance.pastas = inspirationBookItems
				break
			case ("Beef"):
				return inspirationBookInstance.beefs = inspirationBookItems
				break
			case ("Pork"):
				return inspirationBookInstance.porks = inspirationBookItems
				break
			case ("Chicken"):
				return inspirationBookInstance.chickens = inspirationBookItems
				break
			case ("Seafood"):
				return inspirationBookInstance.seafoods = inspirationBookItems
				break
			case ("Vegetable"):
				return inspirationBookInstance.vegetables = inspirationBookItems
				break
			case ("Dessert"):
				return inspirationBookInstance.desserts = inspirationBookItems
				break
		}
		
		if (!inspirationBookInstance.save(flush: true)) {
			render(view: "viewMenuCategory", model: [inspirationBookInstance: inspirationBookInstance], params: params, id: menuCategoryInstance.id)
			return
		}
		flash.message = "Chosen menu items saved"
		redirect(action: "viewMenuCategory", id: menuCategoryInstance.id)
	}
	
	def myPackage(long id){
		def user = (User) springSecurityService.getCurrentUser()
		def loggedInClient = Client.findByUser(user)
		def event = Event.findByClient(loggedInClient)
		def clientPackage = event.getPack()
		
		[packageInstance: clientPackage]
	}
	
	private Client getClient() {
		User loggedInUser = User.get(springSecurityService.principal.id)
		Client client = clientService.getClient(loggedInUser);
		return client
	}
}
