package com.hizon

import java.util.Set;

class InspirationBookService {

   	def Set<MenuItem> listMenuItems(inspirationBook, menuCategory) {
		switch (menuCategory) {
			case ("Appetizer"):
				return inspirationBook.appetizers
			case ("Soup"):
				return inspirationBook.soups
			case ("Salad"):
				return inspirationBook.salads
			case ("Pasta"):
				return inspirationBook.pastas
			case ("Beef"):
				return inspirationBook.beefs
			case ("Pork"):
				return inspirationBook.porks
			case ("Chicken"):
				return inspirationBook.chickens
			case ("Seafood"):
				return inspirationBook.seafoods
			case ("Vegetable"):
				return inspirationBook.vegetables
			case ("Dessert"):
				return inspirationBook.desserts
		}
		return new HashSet<MenuItem>()
	}
	   
}
