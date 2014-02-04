package com.hizon

class Planner {
	User user
	Profile profile

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
		profile cascade: 'all'
	}
}
