package com.hizon

class MenuItem {

	String name
	String description
	String image
	String imageFileName
	String status
	Level level

	static belongsTo = [menuCategory: MenuCategory]
	static constraints = {
		name unique:true, blank:false, nullable: false, size: 1..100
		description blank:true, nullable: true, size: 0..250
		status inList: ["Active", "Inactive"], blank:false
		imageFileName blank:true, nullable: true
		image blank:true, nullable: true
	}
	
	static searchable = [except:'image*']
	
	String toString() {
		return name
	}
	
}
