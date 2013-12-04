package com.hizon

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.compass.core.engine.SearchEngineQueryParseException

class MenuItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static String WILDCARD = "*"
	def searchableService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [menuItemInstanceList: MenuItem.list(params), menuItemInstanceTotal: MenuItem.count()]
    }

    def create() {
        [menuItemInstance: new MenuItem(params)]
    }

    def save() {
        def menuItemInstance = new MenuItem(params)
        // will move this to a service in God's perfect time ;)
		CommonsMultipartFile uploadedFile = request.getFile('image')

		if(!uploadedFile.empty){
			println "Filename: ${uploadedFile.originalFilename}"

			def webRootDir = servletContext.getRealPath("/")
			def directory = new File(webRootDir, "/uploaded-files")
			directory.mkdirs()
			uploadedFile.transferTo(new File(directory, uploadedFile.originalFilename))
			menuItemInstance.image = uploadedFile.originalFilename
		}

		if (menuItemInstance.hasErrors()) {
			respond menuItemInstance.errors, view:'create'
			return
		}

		menuItemInstance.save flush:true


		if (!menuItemInstance.save(flush: true)) {
			render(view: "create", model: [menuItemInstance: menuItemInstance])
			return
		}
		
		redirect(action: "show", id: menuItemInstance.id)
    }

    def show(Long id) {
        def menuItemInstance = MenuItem.get(id)
        if (!menuItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "list")
            return
        }

        [menuItemInstance: menuItemInstance]
    }

    def edit(Long id) {
        def menuItemInstance = MenuItem.get(id)
        if (!menuItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "list")
            return
        }

        [menuItemInstance: menuItemInstance]
    }

    def update(Long id, Long version) {
        def menuItemInstance = MenuItem.get(id)
        if (!menuItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (menuItemInstance.version > version) {
                menuItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'menuItem.label', default: 'MenuItem')] as Object[],
                          "Another user has updated this MenuItem while you were editing")
                render(view: "edit", model: [menuItemInstance: menuItemInstance])
                return
            }
        }

        menuItemInstance.properties = params

        if (!menuItemInstance.save(flush: true)) {
            render(view: "edit", model: [menuItemInstance: menuItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), menuItemInstance.id])
        redirect(action: "show", id: menuItemInstance.id)
    }

    def delete(Long id) {
        def menuItemInstance = MenuItem.get(id)
        if (!menuItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "list")
            return
        }

        try {
            menuItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'menuItem.label', default: 'MenuItem'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search(){
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+params.q+WILDCARD
			return [menuItemInstanceList: MenuItem.search(searchTerm, params)]
		} catch (SearchEngineQueryParseException ex) {
			return [parseException: true]
		}
	}
	
	def indexAll = {
		Thread.start {
			searchableService.index()
		}
		render("bulk index started in a background thread")
	}

	/**
	 * Perform a bulk index of every searchable object in the database
	 */
	def unindexAll = {
		searchableService.unindex()
		render("unindexAll done")
	}
}
