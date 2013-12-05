package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ColorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [colorInstanceList: Color.list(params), colorInstanceTotal: Color.count()]
    }

    def create() {
        [colorInstance: new Color(params)]
    }

    def save() {
        def colorInstance = new Color(params)
        if (!colorInstance.save(flush: true)) {
            render(view: "create", model: [colorInstance: colorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'color.label', default: 'Color'), colorInstance.id])
        redirect(action: "show", id: colorInstance.id)
    }

    def show(Long id) {
        def colorInstance = Color.get(id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "list")
            return
        }

        [colorInstance: colorInstance]
    }

    def edit(Long id) {
        def colorInstance = Color.get(id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "list")
            return
        }

        [colorInstance: colorInstance]
    }

    def update(Long id, Long version) {
        def colorInstance = Color.get(id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (colorInstance.version > version) {
                colorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'color.label', default: 'Color')] as Object[],
                          "Another user has updated this Color while you were editing")
                render(view: "edit", model: [colorInstance: colorInstance])
                return
            }
        }

        colorInstance.properties = params

        if (!colorInstance.save(flush: true)) {
            render(view: "edit", model: [colorInstance: colorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'color.label', default: 'Color'), colorInstance.id])
        redirect(action: "show", id: colorInstance.id)
    }

    def delete(Long id) {
        def colorInstance = Color.get(id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "list")
            return
        }

        try {
            colorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'color.label', default: 'Color'), id])
            redirect(action: "show", id: id)
        }
    }
}
