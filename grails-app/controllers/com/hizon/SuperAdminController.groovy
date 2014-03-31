package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class SuperAdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [superAdminInstanceList: SuperAdmin.list(params), superAdminInstanceTotal: SuperAdmin.count()]
    }

    def create() {
        [superAdminInstance: new SuperAdmin(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def superAdminInstance = new SuperAdmin(params)
        if (!superAdminInstance.user.validate() || !superAdminInstance.save(flush: true)) {
            render(view: "create", model: [superAdminInstance: superAdminInstance])
            return
        }
		UserRole.create superAdminInstance.user, Role.findByAuthority('ROLE_SUPER_ADMIN')

        flash.message = message(code: 'default.created.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), superAdminInstance.id])
        redirect(action: "show", id: superAdminInstance.id)
    }

    def show(Long id) {
        def superAdminInstance = SuperAdmin.get(id)
        if (!superAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "list")
            return
        }

        [superAdminInstance: superAdminInstance]
    }

    def edit(Long id) {
        def superAdminInstance = SuperAdmin.get(id)
        if (!superAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "list")
            return
        }

        [superAdminInstance: superAdminInstance]
    }

    def update(Long id, Long version) {
        def superAdminInstance = SuperAdmin.get(id)
        if (!superAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (superAdminInstance.version > version) {
                superAdminInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'superAdmin.label', default: 'Super Admin')] as Object[],
                          "Another user has updated this Super Admin while you were editing")
                render(view: "edit", model: [superAdminInstance: superAdminInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        superAdminInstance.properties = params

        if (!superAdminInstance.user.validate() || !superAdminInstance.save(flush: true)) {
            render(view: "edit", model: [superAdminInstance: superAdminInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), superAdminInstance.id])
        redirect(action: "show", id: superAdminInstance.id)
    }

    def delete(Long id) {
        def superAdminInstance = SuperAdmin.get(id)
        if (!superAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "list")
            return
        }

        try {
			UserRole.findByUser(superAdminInstance.user).delete()
            superAdminInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'superAdmin.label', default: 'Super Admin'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def dashboard(long id){
		return
		
	}
}
