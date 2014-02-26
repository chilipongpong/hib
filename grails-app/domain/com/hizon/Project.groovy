package com.hizon

class Project {

	String name
	Date eventDate
	String craNumber
	Client client
	Planner planner
	String venue
	String salesAgent
	Status status
	Theme theme
	BundledItem bundledItem
	String serviceStyle
	BigDecimal pricePerHead = new BigDecimal("0.00")
	String freebies
	int numberOfGuests = 0

	static hasMany = [colors: Color, menuItems: MenuItem]
	
	static constraints = {
		name blank:false, nullable:false, size: 1..500
		craNumber blank: false, nullable: false, size: 1..100
		client nullable: false, blank: false
		planner nullable: false, blank: false
		venue blank: false, nullable: false, size: 1..500
		salesAgent blank: false, nullable: false, size: 1..100
		status: blank: false
		theme nullable:true, blank: true
		numberOfGuests min: 0
		bundledItem nullable: true, blank: true
		serviceStyle blank: true, nullable: true
		freebies blank: true, nullable: true, size: 0..500
	}
}
