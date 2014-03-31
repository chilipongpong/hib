package com.hizon

import grails.plugin.springsecurity.SpringSecurityService;


class DashboardController {

	def springSecurityService
	
    def index() {
		
		def user = (User) springSecurityService.getCurrentUser()
		
		if(user.isPlanner()){
			redirect (action: "dashboard", controller: "planner")
		}
		 
		else if (user.isClient()){
			redirect (action: "dashboard", controller: "client")
		}
		
		else if (user.isPlannerSupervisor()){
			redirect (action: "dashboard", controller: "plannerSupervisor")
		}
		
		else if (user.isUserAdmin()){
			redirect (action: "dashboard", controller: "userAdmin")
		}
		
		else if (user.isSuperAdmin()){
			redirect (action: "dashboard", controller: "superAdmin")
		}
		
		else if (user.isContentManager()){
			redirect (action: "dashboard", controller: "contentManager")
		}
		
	}
}
