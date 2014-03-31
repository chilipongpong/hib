package com.hizon

class MenuCategory {

	String name
	String description
	Status status
	String image
	
	static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		description blank:true, nullable:true, size: 0..250
		status blank:false
		image blank:false, nullable: false
	}
    
	static searchable = true
	
	String toString() {
		return name
	}
}
