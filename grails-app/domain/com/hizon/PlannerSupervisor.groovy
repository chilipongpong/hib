package com.hizon

class PlannerSupervisor {
	User user
	Profile profile
	
	static hasMany = [planners: Planner]
	
	static constraints = {
	}
	
	static mapping = {
		user cascade: 'all'
		profile cascade: 'all'
	}
	
	static searchable = true
}
