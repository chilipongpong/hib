package com.hizon

class ContentManager {
	User user
	Profile profile

    static constraints = {
    }

	static mapping = {
		user cascade: 'all'
		profile cascade: 'all'
	}
	
	static searchable = true
}
