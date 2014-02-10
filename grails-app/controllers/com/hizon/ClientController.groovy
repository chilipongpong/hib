package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ClientController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	def securityService

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
		def valid = clientInstance.user.validate() & clientInstance.profile.validate()
        if (!valid || !clientInstance.save(flush: true)) {
            render(view: "create", model: [clientInstance: clientInstance])
            return
        }
		UserRole.create clientInstance.user, Role.findByAuthority('ROLE_CLIENT')
		
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

		def valid = clientInstance.user.validate() & clientInstance.profile.validate()
        if (!valid || !clientInstance.save(flush: true)) {
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
}
