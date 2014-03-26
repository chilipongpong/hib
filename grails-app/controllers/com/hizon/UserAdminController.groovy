package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class UserAdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userAdminInstanceList: UserAdmin.list(params), userAdminInstanceTotal: UserAdmin.count()]
    }

    def create() {
        [userAdminInstance: new UserAdmin(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def userAdminInstance = new UserAdmin(params)
        if (!userAdminInstance.save(flush: true)) {
            render(view: "create", model: [userAdminInstance: userAdminInstance])
            return
        }
		UserRole.create userAdminInstance.user, Role.findByAuthority('ROLE_USER_ADMIN')

        flash.message = message(code: 'default.created.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), userAdminInstance.id])
        redirect(action: "show", id: userAdminInstance.id)
    }

    def show(Long id) {
        def userAdminInstance = UserAdmin.get(id)
        if (!userAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "list")
            return
        }

        [userAdminInstance: userAdminInstance]
    }

    def edit(Long id) {
        def userAdminInstance = UserAdmin.get(id)
        if (!userAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "list")
            return
        }

        [userAdminInstance: userAdminInstance]
    }

    def update(Long id, Long version) {
        def userAdminInstance = UserAdmin.get(id)
        if (!userAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userAdminInstance.version > version) {
                userAdminInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userAdmin.label', default: 'UserAdmin')] as Object[],
                          "Another user has updated this UserAdmin while you were editing")
                render(view: "edit", model: [userAdminInstance: userAdminInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        userAdminInstance.properties = params

        if (!userAdminInstance.save(flush: true)) {
            render(view: "edit", model: [userAdminInstance: userAdminInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), userAdminInstance.id])
        redirect(action: "show", id: userAdminInstance.id)
    }

    def delete(Long id) {
        def userAdminInstance = UserAdmin.get(id)
        if (!userAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "list")
            return
        }

        try {
            userAdminInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userAdmin.label', default: 'UserAdmin'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def dashboard(long id){
		def user = (User) springSecurityService.getCurrentUser()
		def loggedInUserAdmin = UserAdmin.findByUser(user)
		
		[userAdminId: loggedInUserAdmin.id]
		
	}
}
