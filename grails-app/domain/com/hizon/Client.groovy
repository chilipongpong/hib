package com.hizon

class Client {
	User user
	Planner planner
	
    static constraints = {
		planner nullable:true
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
	
	String toString() {
		return user.firstName + " " + user.lastName
	}
	
}