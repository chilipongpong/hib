package com.hizon

class MenuItem {

	String name
	String description
	Status status
	Level level

	static belongsTo = [menuCategory: MenuCategory]
	static constraints = {
		name unique:true, blank:false, nullable: false, size: 1..100
		description blank:true, nullable: true, size: 0..250
		status blank:false
		level nullable: true
	}
	
	static searchable = true
	
	String toString() {
		return name
	}
	
	public static List<MenuItem> listAppetizers() {
		MenuCategory appetizer = MenuCategory.findByName("Appetizer")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, appetizer)
	}
	
}
