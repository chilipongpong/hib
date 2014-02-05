package com.hizon

class Role {

	String name
	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString() {
		return name
	}
}
