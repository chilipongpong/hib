package com.hizon

import org.apache.tools.zip.ZipFile.OffsetEntry;
import org.springframework.dao.DataIntegrityViolationException


class PlannerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [plannerInstanceList: Planner.list(params), plannerInstanceTotal: Planner.count()]
    }

    def create() {
        [plannerInstance: new Planner(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def plannerInstance = new Planner(params)
        if (!plannerInstance.user.validate() || !plannerInstance.save(flush: true)) {
            render(view: "create", model: [plannerInstance: plannerInstance])
            return
        }
		UserRole.create plannerInstance.user, Role.findByAuthority('ROLE_PLANNER')

        flash.message = message(code: 'default.created.message', args: [message(code: 'planner.label', default: 'Planner'), plannerInstance.id])
        redirect(action: "show", id: plannerInstance.id)
    }

    def show(Long id) {
		def loggedInUser = Planner.findByUser(springSecurityService.getCurrentUser())
		
        def plannerInstance = Planner.get(id)
        if (!plannerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "list")
            return
        }

        [plannerInstance: plannerInstance, loggedInUser: loggedInUser]
    }

    def edit(Long id) {
        def plannerInstance = Planner.get(id)
        if (!plannerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "list")
            return
        }

        [plannerInstance: plannerInstance]
    }

    def update(Long id, Long version) {
        def plannerInstance = Planner.get(id)
        if (!plannerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (plannerInstance.version > version) {
                plannerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'planner.label', default: 'Planner')] as Object[],
                          "Another user has updated this Planner while you were editing")
                render(view: "edit", model: [plannerInstance: plannerInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        plannerInstance.properties = params

        if (!plannerInstance.user.validate() || !plannerInstance.save(flush: true)) {
            render(view: "edit", model: [plannerInstance: plannerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'planner.label', default: 'Planner'), plannerInstance.id])
        redirect(action: "show", id: plannerInstance.id)
    }

    def delete(Long id) {
        def plannerInstance = Planner.get(id)
        if (!plannerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "list")
            return
        }

        try {
			UserRole.findByUser(plannerInstance.user).delete()
            plannerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'planner.label', default: 'Planner'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def dashboard(long id){
		def user = (User) springSecurityService.getCurrentUser()
		def loggedInPlanner = Planner.findByUser(user)
		
		def projectsAssignedToMeCriteria = Project.createCriteria()
		def projectsAssignedToMe = projectsAssignedToMeCriteria.list {
			eq("planner", loggedInPlanner)
			eq("status", Status.ACTIVE)
		} 
		[plannerId: loggedInPlanner.id, projectsAssignedToMe: projectsAssignedToMe, projectsAssignedToMeCount: projectsAssignedToMe.size()]
		
	}
}
