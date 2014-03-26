package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ValueRangeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [valueRangeInstanceList: ValueRange.list(params), valueRangeInstanceTotal: ValueRange.count()]
    }

    def create() {
        [valueRangeInstance: new ValueRange(params)]
    }

    def save() {
        def valueRangeInstance = new ValueRange(params)
        if (!valueRangeInstance.save(flush: true)) {
            render(view: "create", model: [valueRangeInstance: valueRangeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), valueRangeInstance.id])
        redirect(action: "show", id: valueRangeInstance.id)
    }

    def show(Long id) {
        def valueRangeInstance = ValueRange.get(id)
        if (!valueRangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "list")
            return
        }

        [valueRangeInstance: valueRangeInstance]
    }

    def edit(Long id) {
        def valueRangeInstance = ValueRange.get(id)
        if (!valueRangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "list")
            return
        }

        [valueRangeInstance: valueRangeInstance]
    }

    def update(Long id, Long version) {
        def valueRangeInstance = ValueRange.get(id)
        if (!valueRangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (valueRangeInstance.version > version) {
                valueRangeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'valueRange.label', default: 'ValueRange')] as Object[],
                          "Another user has updated this ValueRange while you were editing")
                render(view: "edit", model: [valueRangeInstance: valueRangeInstance])
                return
            }
        }

        valueRangeInstance.properties = params

        if (!valueRangeInstance.save(flush: true)) {
            render(view: "edit", model: [valueRangeInstance: valueRangeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), valueRangeInstance.id])
        redirect(action: "show", id: valueRangeInstance.id)
    }

    def delete(Long id) {
        def valueRangeInstance = ValueRange.get(id)
        if (!valueRangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "list")
            return
        }

        try {
            valueRangeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'valueRange.label', default: 'ValueRange'), id])
            redirect(action: "show", id: id)
        }
    }
}
