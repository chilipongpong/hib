package com.hizon

class Client {
	User user
	Profile profile
	Planner planner
	
    static constraints = {
		planner nullable:true
    }
	
	static mapping = {
		user cascade: 'all'
		profile cascade: 'all'
	}
}
