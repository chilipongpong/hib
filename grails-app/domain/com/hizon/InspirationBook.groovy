package com.hizon

class InspirationBook {
	Client client;
	Theme theme;
	int numberOfGuests
	ValueRange sponsorRange
	boolean hasFlowers
	boolean hasBridalCar
	boolean hasEmcee
	boolean hasCake
	boolean hasFlowersForEntourage
	boolean hasPhotoBooth
	boolean hasMobileBar
	boolean hasVenue
	
	static hasMany = [
		colors: Color, 
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
		client blank:false
		theme nullable:true
		numberOfGuests nullable:true, matches:"[0-9]*"
		sponsorRange nullable:true
		hasFlowers nullable:true
		hasBridalCar nullable:true
		hasEmcee nullable:true
		hasCake nullable:true
		hasFlowersForEntourage nullable:true
		hasPhotoBooth nullable:true
		hasMobileBar nullable:true
		hasVenue nullable:true
    }
}
