package com.hizon

class SuperAdmin {
	User user

    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
}
