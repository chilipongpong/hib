package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class LevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [levelInstanceList: Level.list(params), levelInstanceTotal: Level.count()]
    }

    def create() {
        [levelInstance: new Level(params)]
    }

    def save() {
        def levelInstance = new Level(params)
        if (!levelInstance.save(flush: true)) {
            render(view: "create", model: [levelInstance: levelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'level.label', default: 'Level'), levelInstance.id])
        redirect(action: "show", id: levelInstance.id)
    }

    def show(Long id) {
        def levelInstance = Level.get(id)
        if (!levelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "list")
            return
        }

        [levelInstance: levelInstance]
    }

    def edit(Long id) {
        def levelInstance = Level.get(id)
        if (!levelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "list")
            return
        }

        [levelInstance: levelInstance]
    }

    def update(Long id, Long version) {
        def levelInstance = Level.get(id)
        if (!levelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (levelInstance.version > version) {
                levelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'level.label', default: 'Level')] as Object[],
                          "Another user has updated this Level while you were editing")
                render(view: "edit", model: [levelInstance: levelInstance])
                return
            }
        }

        levelInstance.properties = params

        if (!levelInstance.save(flush: true)) {
            render(view: "edit", model: [levelInstance: levelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'level.label', default: 'Level'), levelInstance.id])
        redirect(action: "show", id: levelInstance.id)
    }

    def delete(Long id) {
        def levelInstance = Level.get(id)
        if (!levelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "list")
            return
        }

        try {
            levelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'level.label', default: 'Level'), id])
            redirect(action: "show", id: id)
        }
    }
}
