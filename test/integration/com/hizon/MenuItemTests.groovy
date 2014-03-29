package com.hizon

import org.junit.Before;

import static org.junit.Assert.*

import org.junit.*

class MenuItemTests {
	MenuCategory appetizer
	
	MenuItem salad
	MenuItem onionRings
	MenuItem bakedTahong
	
	@Before
	void setup() {
		appetizer = new MenuCategory(name: "Appetizer", status: Status.ACTIVE).save(failOnError: true)
		assertEquals 1, MenuCategory.list().size()
		
		salad = new MenuItem(name: "Salad", status: Status.ACTIVE, menuCategory: appetizer).save(failOnError: true)
		onionRings = new MenuItem(name: "Onion Rings", status: Status.ACTIVE, menuCategory: appetizer).save(failOnError: true)
		bakedTahong = new MenuItem(name: "Baked Tahong", status: Status.INACTIVE, menuCategory: appetizer).save(failOnError: true)
	}
	
	@Test
	void listAllAppetizers() {
		List<MenuItem> appetizers = MenuItem.listAppetizers()
		
		assertEquals([salad, onionRings], appetizers)
	}
	
	@Test
	void listAllAppetizersNoAppetizerCategory() {
		appetizer.name = "NotAppetizer"
		
		List<MenuItem> appetizers = MenuItem.listAppetizers()
		
		assertEquals([], appetizers)
	}
}
