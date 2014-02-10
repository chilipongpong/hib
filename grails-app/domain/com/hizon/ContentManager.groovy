package com.hizon

class ContentManager {
	User user

    static constraints = {
    }

	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
}
