package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class PlannerSupervisorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [plannerSupervisorInstanceList: PlannerSupervisor.list(params), plannerSupervisorInstanceTotal: PlannerSupervisor.count()]
    }

    def create() {
        [plannerSupervisorInstance: new PlannerSupervisor(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def plannerSupervisorInstance = new PlannerSupervisor(params)
		def valid = plannerSupervisorInstance.user.validate() & plannerSupervisorInstance.profile.validate()
        if (!valid || !plannerSupervisorInstance.save(flush: true)) {
            render(view: "create", model: [plannerSupervisorInstance: plannerSupervisorInstance])
            return
        }
		UserRole.create plannerSupervisorInstance.user, Role.findByAuthority('ROLE_PLANNER_SUPERVISOR')

        flash.message = message(code: 'default.created.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), plannerSupervisorInstance.id])
        redirect(action: "show", id: plannerSupervisorInstance.id)
    }

    def show(Long id) {
        def plannerSupervisorInstance = PlannerSupervisor.get(id)
        if (!plannerSupervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "list")
            return
        }

        [plannerSupervisorInstance: plannerSupervisorInstance]
    }

    def edit(Long id) {
        def plannerSupervisorInstance = PlannerSupervisor.get(id)
        if (!plannerSupervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "list")
            return
        }

        [plannerSupervisorInstance: plannerSupervisorInstance]
    }

    def update(Long id, Long version) {
        def plannerSupervisorInstance = PlannerSupervisor.get(id)
        if (!plannerSupervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (plannerSupervisorInstance.version > version) {
                plannerSupervisorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor')] as Object[],
                          "Another user has updated this PlannerSupervisor while you were editing")
                render(view: "edit", model: [plannerSupervisorInstance: plannerSupervisorInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        plannerSupervisorInstance.properties = params

		def valid = plannerSupervisorInstance.user.validate() & plannerSupervisorInstance.profile.validate()
        if (!valid || !plannerSupervisorInstance.save(flush: true)) {
            render(view: "edit", model: [plannerSupervisorInstance: plannerSupervisorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), plannerSupervisorInstance.id])
        redirect(action: "show", id: plannerSupervisorInstance.id)
    }

    def delete(Long id) {
        def plannerSupervisorInstance = PlannerSupervisor.get(id)
        if (!plannerSupervisorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "list")
            return
        }

        try {
			UserRole.findByUser(plannerSupervisorInstance.user).delete()
            plannerSupervisorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plannerSupervisor.label', default: 'PlannerSupervisor'), id])
            redirect(action: "show", id: id)
        }
    }
}
