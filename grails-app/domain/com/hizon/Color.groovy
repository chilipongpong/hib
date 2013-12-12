package com.hizon

class Color {

	String name
	String description
	String hex

    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		description blank:true, nullable:true, size: 0..250
		hex blank:false, unique:true, nullable:false, size: 1..7
    }
	
	static searchable = true
}
