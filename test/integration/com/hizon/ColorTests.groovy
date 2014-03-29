package com.hizon

import org.junit.Before;

import static org.junit.Assert.*

import org.junit.*

class ColorTests {

	Color red
	Color green
	Color blue
	Color yellow
	Color orange
	
	@Before
	void setup() {
		red = new Color(name: "Red", hex: "R", status: Status.ACTIVE).save(failOnError: true)
		green = new Color(name: "Green", hex: "G", status: Status.ACTIVE).save(failOnError: true)
		blue = new Color(name: "Blue", hex: "B", status: Status.INACTIVE).save(failOnError: true)
		yellow = new Color(name: "Yellow", hex: "Y", status: Status.ACTIVE).save(failOnError: true)
		orange = new Color(name: "Orange", hex: "O", status: Status.INACTIVE).save(failOnError: true)
		assertEquals 5, Color.list().size()
	}
	
	@Test
    void listAllActive() {
       List<Color> colors = Color.listAllActive()
	   
	   assertEquals([red, green, yellow, orange], colors)
    }
}
