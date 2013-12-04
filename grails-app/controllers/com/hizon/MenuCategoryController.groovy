package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class MenuCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
}
