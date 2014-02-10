package com.hizon

class PlannerSupervisor {
	User user
	
	static hasMany = [planners: Planner]
	
	static constraints = {
	}
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
}
