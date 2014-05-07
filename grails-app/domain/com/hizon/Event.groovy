package com.hizon

class Event {

	String name
	Date date
	String craNumber
	Client client
	Planner planner
	Package pack
	String venue
	String salesAgent
	Status status
	
	static hasMany = [
		appetizers: MenuItem,
		soups: MenuItem,
		salads: MenuItem,
		pastas: MenuItem,
		beefs: MenuItem,
		porks: MenuItem,
		chickens: MenuItem,
		seafoods: MenuItem,
		vegetables: MenuItem,
		desserts: MenuItem]
	
    static constraints = {
		name blank:false, nullable:false, size: 1..100
		status blank:false
    }
}
