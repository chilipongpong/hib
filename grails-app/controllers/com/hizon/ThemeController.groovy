package com.hizon

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException

class ThemeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static String WILDCARD = "*"
	def searchableService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [themeInstanceList: Theme.list(params), themeInstanceTotal: Theme.count()]
    }

    def create() {
        [themeInstance: new Theme(params)]
    }

    def save() {
        def themeInstance = new Theme(params)
		def colors = [] as Set
		def colorsId = params.colorsId.split(",")
		for(colorId in colorsId) {
			colors.add(Color.get(colorId))
		}
		themeInstance.colors = colors;
        if (!themeInstance.save(flush: true)) {
            render(view: "create", model: [themeInstance: themeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'theme.label', default: 'Theme'), themeInstance.id])
        redirect(action: "show", id: themeInstance.id)
    }

    def show(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        [themeInstance: themeInstance]
    }

    def edit(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        [themeInstance: themeInstance]
    }

    def update(Long id, Long version) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (themeInstance.version > version) {
                themeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'theme.label', default: 'Theme')] as Object[],
                          "Another user has updated this Theme while you were editing")
                render(view: "edit", model: [themeInstance: themeInstance])
                return
            }
        }

        themeInstance.properties = params
		def colors = [] as Set
		def colorsId = params.colorsId.split(",")
		for(colorId in colorsId) {
			colors.add(Color.get(colorId))
		}
		themeInstance.colors = colors;

        if (!themeInstance.save(flush: true)) {
            render(view: "edit", model: [themeInstance: themeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'theme.label', default: 'Theme'), themeInstance.id])
        redirect(action: "show", id: themeInstance.id)
    }

    def delete(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        try {
            themeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search(){
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+params.q+WILDCARD
			return [themeInstanceList: Theme.search(searchTerm, params)]
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
