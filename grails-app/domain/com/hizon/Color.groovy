package com.hizon

class Color {

	String name
	String pantone
	String hex

    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		pantone blank:true, nullable:true, size: 0..100
		hex blank:false, unique:true, nullable:false, size: 1..7
    }
	
	static searchable = true
}
