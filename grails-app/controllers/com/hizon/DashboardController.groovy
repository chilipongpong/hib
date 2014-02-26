package com.hizon

import grails.plugin.springsecurity.SpringSecurityService;


class DashboardController {

	def springSecurityService
	
    def index() {
		
		def user = (User) springSecurityService.getCurrentUser()
		
		if(user.isPlanner()){
			redirect (action: "dashboard", controller: "planner")
		}
		 
		if (user.isClient()){
			redirect (action: "dashboard", controller: "client")
		}
		
		if (user.isPlannerSupervisor()){
			redirect (action: "dashboard", controller: "plannerSupervisor")
		}
		
	}
}
