package com.hizon

class PlannerSupervisor {
	User user
	
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
