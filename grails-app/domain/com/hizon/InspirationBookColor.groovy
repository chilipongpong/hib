package com.hizon

class InspirationBookColor {
	Client client;
	
	static hasMany = [colors: Color]
	
    static constraints = {
		client blank:false
		colors minSize: 1
    }
}
