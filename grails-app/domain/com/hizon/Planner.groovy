package com.hizon

class Planner {
	User user
	Profile profile
	
	static hasMany = [clients: Client]

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
		profile cascade: 'all'
	}
}
