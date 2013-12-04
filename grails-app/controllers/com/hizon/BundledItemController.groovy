package com.hizon

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException

class BundledItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static String WILDCARD = "*"
	def searchableService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bundledItemInstanceList: BundledItem.list(params), bundledItemInstanceTotal: BundledItem.count()]
    }

    def create() {
        [bundledItemInstance: new BundledItem(params)]
    }

    def save() {
        def bundledItemInstance = new BundledItem(params)
        if (!bundledItemInstance.save(flush: true)) {
            render(view: "create", model: [bundledItemInstance: bundledItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), bundledItemInstance.id])
        redirect(action: "show", id: bundledItemInstance.id)
    }

    def show(Long id) {
        def bundledItemInstance = BundledItem.get(id)
        if (!bundledItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "list")
            return
        }

        [bundledItemInstance: bundledItemInstance]
    }

    def edit(Long id) {
        def bundledItemInstance = BundledItem.get(id)
        if (!bundledItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "list")
            return
        }

        [bundledItemInstance: bundledItemInstance]
    }

    def update(Long id, Long version) {
        def bundledItemInstance = BundledItem.get(id)
        if (!bundledItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bundledItemInstance.version > version) {
                bundledItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bundledItem.label', default: 'BundledItem')] as Object[],
                          "Another user has updated this BundledItem while you were editing")
                render(view: "edit", model: [bundledItemInstance: bundledItemInstance])
                return
            }
        }

        bundledItemInstance.properties = params

        if (!bundledItemInstance.save(flush: true)) {
            render(view: "edit", model: [bundledItemInstance: bundledItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), bundledItemInstance.id])
        redirect(action: "show", id: bundledItemInstance.id)
    }

    def delete(Long id) {
        def bundledItemInstance = BundledItem.get(id)
        if (!bundledItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "list")
            return
        }

        try {
            bundledItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bundledItem.label', default: 'BundledItem'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search(){
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+params.q+WILDCARD
			return [bundledItemInstanceList: BundledItem.search(searchTerm, params)]
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
