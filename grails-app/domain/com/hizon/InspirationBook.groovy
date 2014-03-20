package com.hizon

class InspirationBook {
	Client client;
	Theme theme;
	
	static hasMany = [colors: Color]
	
    static constraints = {
		client blank:false
		colors minSize: 1
    }
}
