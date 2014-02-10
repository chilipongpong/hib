package com.hizon

class Planner {
	User user
	
	static hasMany = [clients: Client]

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
}
