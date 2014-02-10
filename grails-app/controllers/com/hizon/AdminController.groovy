package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class AdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [adminInstanceList: Admin.list(params), adminInstanceTotal: Admin.count()]
    }

    def create() {
        [adminInstance: new Admin(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def adminInstance = new Admin(params)
        if (!adminInstance.user.validate() || !adminInstance.save(flush: true)) {
            render(view: "create", model: [adminInstance: adminInstance])
            return
        }
		UserRole.create adminInstance.user, Role.findByAuthority('ROLE_ADMIN')

        flash.message = message(code: 'default.created.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])
        redirect(action: "show", id: adminInstance.id)
    }

    def show(Long id) {
        def adminInstance = Admin.get(id)
        if (!adminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "list")
            return
        }

        [adminInstance: adminInstance]
    }

    def edit(Long id) {
        def adminInstance = Admin.get(id)
        if (!adminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "list")
            return
        }

        [adminInstance: adminInstance]
    }

    def update(Long id, Long version) {
        def adminInstance = Admin.get(id)
        if (!adminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (adminInstance.version > version) {
                adminInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'admin.label', default: 'Admin')] as Object[],
                          "Another user has updated this Admin while you were editing")
                render(view: "edit", model: [adminInstance: adminInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        adminInstance.properties = params

        if (!adminInstance.user.validate() || !adminInstance.save(flush: true)) {
            render(view: "edit", model: [adminInstance: adminInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])
        redirect(action: "show", id: adminInstance.id)
    }

    def delete(Long id) {
        def adminInstance = Admin.get(id)
        if (!adminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "list")
            return
        }

        try {
			UserRole.findByUser(adminInstance.user).delete()
            adminInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), id])
            redirect(action: "show", id: id)
        }
    }
}
