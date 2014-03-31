package com.hizon

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException
import org.springframework.web.multipart.commons.CommonsMultipartFile

class MenuCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static String WILDCARD = "*"
	def searchableService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [menuCategoryInstanceList: MenuCategory.list(params), menuCategoryInstanceTotal: MenuCategory.count()]
    }

    def create() {
        [menuCategoryInstance: new MenuCategory(params)]
    }

    def save() {
        def menuCategoryInstance = new MenuCategory(params)
		
		menuCategoryInstance.id = params.id
		//menuCategory Image saving
		def CommonsMultipartFile image = request.getFile("newImage")
		if(!image.isEmpty()){
			def webRootDir = servletContext.getRealPath("/")
			def directory = new File(webRootDir, "/uploaded-files")
			directory.mkdirs()
			image.transferTo(new File(directory, menuCategoryInstance.name + "-" + image.originalFilename))
			menuCategoryInstance.image = menuCategoryInstance.name + "-" + image.originalFilename
		}
        if (!menuCategoryInstance.save(flush: true)) {
            render(view: "create", model: [menuCategoryInstance: menuCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), menuCategoryInstance.id])
        redirect(action: "show", id: menuCategoryInstance.id)
    }

    def show(Long id) {
        def menuCategoryInstance = MenuCategory.get(id)
        if (!menuCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "list")
            return
        }

        [menuCategoryInstance: menuCategoryInstance]
    }

    def edit(Long id) {
        def menuCategoryInstance = MenuCategory.get(id)
        if (!menuCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "list")
            return
        }

        [menuCategoryInstance: menuCategoryInstance]
    }

    def update(Long id, Long version) {
        def menuCategoryInstance = MenuCategory.get(id)
        if (!menuCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (menuCategoryInstance.version > version) {
                menuCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'menuCategory.label', default: 'MenuCategory')] as Object[],
                          "Another user has updated this MenuCategory while you were editing")
                render(view: "edit", model: [menuCategoryInstance: menuCategoryInstance])
                return
            }
        }

        menuCategoryInstance.properties = params
		def CommonsMultipartFile image = request.getFile('newImage')
		if(!image.isEmpty()){
			def webRootDir = servletContext.getRealPath("/")
			def directory = new File(webRootDir, "/uploaded-files")
			directory.mkdirs()
			image.transferTo(new File(directory, menuCategoryInstance.name + "-" + image.originalFilename))
			menuCategoryInstance.image = menuCategoryInstance.name + "-" + image.originalFilename
		}

        if (!menuCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [menuCategoryInstance: menuCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), menuCategoryInstance.id])
        redirect(action: "show", id: menuCategoryInstance.id)
    }

    def delete(Long id) {
        def menuCategoryInstance = MenuCategory.get(id)
        if (!menuCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            menuCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'menuCategory.label', default: 'MenuCategory'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search(){
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+params.q+WILDCARD
			return [menuCategoryInstanceList: MenuCategory.search(searchTerm, params)]
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
