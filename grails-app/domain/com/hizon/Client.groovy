package com.hizon

class Client {
	User user
	Planner planner
	Event event
	
    static constraints = {
		event nullable:true
    }
	
	static transients = ['planner']
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
	
	String toString() {
		return user.firstName + " " + user.lastName
	}
	
	Planner getPlanner() {
		return event?.planner
	}
}