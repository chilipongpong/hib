package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class FoodPackageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [foodPackageInstanceList: FoodPackage.list(params), foodPackageInstanceTotal: FoodPackage.count()]
    }

    def create() {
        [foodPackageInstance: new FoodPackage(params)]
    }

    def save() {
        def foodPackageInstance = new FoodPackage(params)
        if (!foodPackageInstance.save(flush: true)) {
            render(view: "create", model: [foodPackageInstance: foodPackageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), foodPackageInstance.id])
        redirect(action: "show", id: foodPackageInstance.id)
    }

    def show(Long id) {
        def foodPackageInstance = FoodPackage.get(id)
        if (!foodPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "list")
            return
        }

        [foodPackageInstance: foodPackageInstance]
    }

    def edit(Long id) {
        def foodPackageInstance = FoodPackage.get(id)
        if (!foodPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "list")
            return
        }

        [foodPackageInstance: foodPackageInstance]
    }

    def update(Long id, Long version) {
        def foodPackageInstance = FoodPackage.get(id)
        if (!foodPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (foodPackageInstance.version > version) {
                foodPackageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'foodPackage.label', default: 'FoodPackage')] as Object[],
                          "Another user has updated this FoodPackage while you were editing")
                render(view: "edit", model: [foodPackageInstance: foodPackageInstance])
                return
            }
        }

        foodPackageInstance.properties = params

        if (!foodPackageInstance.save(flush: true)) {
            render(view: "edit", model: [foodPackageInstance: foodPackageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), foodPackageInstance.id])
        redirect(action: "show", id: foodPackageInstance.id)
    }

    def delete(Long id) {
        def foodPackageInstance = FoodPackage.get(id)
        if (!foodPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "list")
            return
        }

        try {
            foodPackageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'foodPackage.label', default: 'FoodPackage'), id])
            redirect(action: "show", id: id)
        }
    }
}
