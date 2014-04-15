package com.hizon

class Package {

	String name
	
    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
    }
}
