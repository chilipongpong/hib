package com.hizon

class Package {

	String name
	int numberOfGuests
	Level themeLevel
	BigDecimal price
	BigDecimal pricePerHead
	String serviceStyle
	FoodPackage appetizer
	FoodPackage soup
	FoodPackage salad
	FoodPackage pasta
	FoodPackage beef
	FoodPackage pork
	FoodPackage chicken
	FoodPackage seafood
	FoodPackage vegetable
	FoodPackage dessert
	Client client
		
	static transients = ['pricePerHead']
	
	static hasMany = [freebies: BundledItem]
		
    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		appetizer nullable:true
		soup nullable:true
		salad nullable:true
		pasta nullable:true
		beef nullable:true
		pork nullable:true
		chicken nullable:true
		seafood nullable:true
		vegetable nullable:true
		dessert nullable:true
    }
	
	String toString() {
		return name
	}
}
