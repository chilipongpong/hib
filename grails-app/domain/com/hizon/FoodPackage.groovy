package com.hizon

class FoodPackage {

	String name
	Level level
	int number
	
    static constraints = {
    }
	
	String toString() {
		return name + ", " + level + ", " + number
	}
}
