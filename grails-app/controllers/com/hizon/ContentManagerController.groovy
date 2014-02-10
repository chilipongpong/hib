package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ContentManagerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentManagerInstanceList: ContentManager.list(params), contentManagerInstanceTotal: ContentManager.count()]
    }

    def create() {
        [contentManagerInstance: new ContentManager(params)]
    }

    def save() {
		params."user.enabled" = ('on' == params.user.enabled)
        def contentManagerInstance = new ContentManager(params)
        if (!contentManagerInstance.user.validate() || !contentManagerInstance.save(flush: true)) {
            render(view: "create", model: [contentManagerInstance: contentManagerInstance])
            return
        }
		UserRole.create contentManagerInstance.user, Role.findByAuthority('ROLE_CONTENT_MANAGER')

        flash.message = message(code: 'default.created.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), contentManagerInstance.id])
        redirect(action: "show", id: contentManagerInstance.id)
    }

    def show(Long id) {
        def contentManagerInstance = ContentManager.get(id)
        if (!contentManagerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "list")
            return
        }

        [contentManagerInstance: contentManagerInstance]
    }

    def edit(Long id) {
        def contentManagerInstance = ContentManager.get(id)
        if (!contentManagerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "list")
            return
        }

        [contentManagerInstance: contentManagerInstance]
    }

    def update(Long id, Long version) {
        def contentManagerInstance = ContentManager.get(id)
        if (!contentManagerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contentManagerInstance.version > version) {
                contentManagerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentManager.label', default: 'ContentManager')] as Object[],
                          "Another user has updated this ContentManager while you were editing")
                render(view: "edit", model: [contentManagerInstance: contentManagerInstance])
                return
            }
        }

		params."user.enabled" = ('on' == params.user.enabled)
        contentManagerInstance.properties = params

        if (!contentManagerInstance.user.validate() || !contentManagerInstance.save(flush: true)) {
            render(view: "edit", model: [contentManagerInstance: contentManagerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), contentManagerInstance.id])
        redirect(action: "show", id: contentManagerInstance.id)
    }

    def delete(Long id) {
        def contentManagerInstance = ContentManager.get(id)
        if (!contentManagerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "list")
            return
        }

        try {
        	UserRole.findByUser(contentManagerInstance.user).delete()
            contentManagerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentManager.label', default: 'ContentManager'), id])
            redirect(action: "show", id: id)
        }
    }
}
