package com.hizon

class Admin {
	User user

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
}
