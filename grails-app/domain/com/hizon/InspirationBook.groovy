package com.hizon

class InspirationBook {
	Client client;
	Theme theme;
	int numberOfGuests
	ValueRange sponsorRange
	
	static hasMany = [colors: Color]
	
    static constraints = {
		client blank:false
		theme nullable:true
		numberOfGuests nullable:true, matches:"[0-9]*"
		sponsorRange nullable:true
		colors minSize: 1
    }
}
