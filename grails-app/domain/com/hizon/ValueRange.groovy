package com.hizon

class ValueRange {
	int lowerLimit
	int upperLimit
	
    static constraints = {
		lowerLimit nullable:false, matches:"[0-9]*"
		upperLimit nullable:false, matches:"[0-9]*"
    }
	
	public String toString() {
		return lowerLimit + " to " + upperLimit
	}
}
