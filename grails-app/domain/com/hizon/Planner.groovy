package com.hizon

class Planner {
	User user
	
	static belongsTo = [plannerSupervisor: PlannerSupervisor]
	static hasMany = [clients: Client]

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
	
	String toString() {
		return user.firstName + " " + user.lastName
	}
}
