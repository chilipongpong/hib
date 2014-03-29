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
	
	public static List<MenuItem> listSoups() {
		MenuCategory soup = MenuCategory.findByName("Soup")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, soup)
	}
	
	public static List<MenuItem> listSalads() {
		MenuCategory salad = MenuCategory.findByName("Salad")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, salad)
	}
	
	public static List<MenuItem> listPastas() {
		MenuCategory pasta = MenuCategory.findByName("Pasta")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, pasta)
	}
	
	public static List<MenuItem> listBeefs() {
		MenuCategory beef = MenuCategory.findByName("Beef")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, beef)
	}
	
	public static List<MenuItem> listPorks() {
		MenuCategory pork = MenuCategory.findByName("Pork")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, pork)
	}
	
	public static List<MenuItem> listChickens() {
		MenuCategory chicken = MenuCategory.findByName("Chicken")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, chicken)
	}
	
	public static List<MenuItem> listSeafoods() {
		MenuCategory seafood = MenuCategory.findByName("Seafood")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, seafood)
	}
	
	public static List<MenuItem> listVegetables() {
		MenuCategory vegetable = MenuCategory.findByName("Vegetable")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, vegetable)
	}
	
	public static List<MenuItem> listDesserts() {
		MenuCategory dessert = MenuCategory.findByName("Dessert")
		return MenuItem.findAllByStatusAndMenuCategory(Status.ACTIVE, dessert)
	}
}
