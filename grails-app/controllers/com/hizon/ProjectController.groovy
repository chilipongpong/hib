package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def mailService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
    }

    def create() {
        [projectInstance: new Project(params)]
    }

    def save() {
        def projectInstance = new Project(params)
		
		if (params.colorsId) {
			def colors = [] as Set
			def colorsId = params.colorsId.split(",")
			for(colorId in colorsId) {
				colors.add(Color.get(colorId))
			}
			projectInstance.colors = colors;
		} 
		
		if (params.menuItemsId) {
			def menuItems = [] as Set
			def menuItemsId = params.menuItemsId.split(",")
			for(menuItemId in menuItemsId) {
				menuItems.add(MenuItem.get(menuItemId))
			}
			projectInstance.menuItems = menuItems;
		}
		
		
        if (!projectInstance.save(flush: true)) {
            render(view: "create", model: [projectInstance: projectInstance])
            return
        }

		// send email notification to the planner if a project is assigned to him/her
		mailService.sendMail {
			to projectInstance.getPlanner().getUser().getEmail()
			bcc "lorence.delrosario@orangeandbronze.com"
			subject "New Project was assigned to you: " + projectInstance.getName()
			body(view: "/emailNotification/newProjectAssigned",
				plugin: "email-confirmation",
				model: [projectInstance: projectInstance])
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "show", id: projectInstance.id)
    }

    def show(Long id) {
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        [projectInstance: projectInstance]
    }

    def edit(Long id) {
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        [projectInstance: projectInstance]
    }

    def update(Long id, Long version) {
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectInstance.version > version) {
                projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'project.label', default: 'Project')] as Object[],
                          "Another user has updated this Project while you were editing")
                render(view: "edit", model: [projectInstance: projectInstance])
                return
            }
        }

        projectInstance.properties = params
		def colors = [] as Set
		if (params.colorsId) {
			def colorsId = params.colorsId.split(",")
					for(colorId in colorsId) {
						colors.add(Color.get(colorId))
					}
			projectInstance.colors = colors;
		} else {
			projectInstance.colors = null;
		}
		
		def menuItems = [] as Set
		if (params.menuItemsId) {
			def menuItemsId = params.menuItemsId.split(",")
					for(menuItemId in menuItemsId) {
						menuItems.add(MenuItem.get(menuItemId))
					}
			projectInstance.menuItems = menuItems;
		} else {
			projectInstance.menuItems = null;
		}
		
        if (!projectInstance.save(flush: true)) {
            render(view: "edit", model: [projectInstance: projectInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "show", id: projectInstance.id)
    }

    def delete(Long id) {
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        try {
            projectInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "show", id: id)
        }
    }
}
