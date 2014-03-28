package com.hizon

class Theme {

	String name
	String description
	Level level
	Status status
	String primaryImage
	
	static hasMany = [colors: Color]
	
    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		description blank:true, nullable:true, size: 0..250
		status blank:false
		primaryImage blank:false, nullable: false
    }	
	
	static searchable = {
		colors component: true
	}
	
	String toString() {
		return name
	}
}
