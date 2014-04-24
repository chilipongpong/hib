package com.hizon

class Package {

	String name
	int numberOfGuests
	Level level
	BigDecimal price
	BigDecimal pricePerHead
	String serviceStyle
	String freebies
	
	static transients = ['pricePerHead']
	
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
		name blank:false, unique:true, nullable:false, size: 1..100
    }
}
