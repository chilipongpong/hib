package com.hizon

class UserAdmin {
	User user
	
    static constraints = {
    }
	
	static mapping = {
		user cascade: 'all'
	}
	
	static searchable = true
	
	String toString() {
		return user.firstName + " " + user.lastName
	}
}
