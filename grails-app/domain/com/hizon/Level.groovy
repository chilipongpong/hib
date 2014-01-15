package com.hizon

class Level {

	String name
	String description
	String status

	static constraints = {
		name unique:true, blank:false, nullable: false, size: 1..100
		description blank:true, nullable: true, size: 0..250
		status inList:['Active', 'Inactive'], blank:false
	}

	static searchable = true
	
	String toString() {
		return name
	}
}
