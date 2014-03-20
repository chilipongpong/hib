package com.hizon

import static org.junit.Assert.*

import org.junit.*

class ThemeServiceTests {
	ThemeService themeService = new ThemeService()
	
	Color red
	Color green
	Color blue
	Color yellow
	Color orange
	Level level
	
	Set<Color> rgb
	Set<Color> rby
	Set<Color> ryo
	Set<Color> yo
	
	Theme rgbTheme
	Theme rbyTheme
	Theme ryoTheme
	Theme yoTheme
	
    @Before
    void setUp() {
        red = new Color(name: "Red", hex: "R", status: Status.ACTIVE).save(failOnError: true)
		green = new Color(name: "Green", hex: "G", status: Status.ACTIVE).save(failOnError: true)
		blue = new Color(name: "Blue", hex: "B", status: Status.ACTIVE).save(failOnError: true)
		yellow = new Color(name: "Yellow", hex: "Y", status: Status.ACTIVE).save(failOnError: true)
		orange = new Color(name: "Orange", hex: "O", status: Status.ACTIVE).save(failOnError: true)
		assertEquals 5, Color.list().size()
		
		level = new Level(name: "1", status: Status.ACTIVE).save(failOnError: true)
		
		rgb = [red, green, blue]
		rby = [red, blue, yellow]
		ryo = [red, yellow, orange]
		yo = [yellow, orange]
		
		rgbTheme = new Theme(name: "rgb", level: level, status: Status.ACTIVE, colors: rgb).save(failOnError: true)
		rbyTheme = new Theme(name: "rby", level: level, status: Status.ACTIVE, colors: rby).save(failOnError: true)
		ryoTheme = new Theme(name: "ryo", level: level, status: Status.ACTIVE, colors: ryo).save(failOnError: true)
		yoTheme = new Theme(name: "yo", level: level, status: Status.ACTIVE, colors: yo).save(failOnError: true)
		assertEquals 4, Theme.list().size()
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void getThemesBasedOnColor() {
		Set<Theme> themes = themeService.getThemesBasedOnColor(rgb)
        assertTrue(themes.contains(rgbTheme))
		assertTrue(themes.contains(rbyTheme))
		assertTrue(themes.contains(ryoTheme))
		assertFalse(themes.contains(yoTheme))
    }
	
	@Test
	void getThemesForInspirationBook() {
		InspirationBook book = new InspirationBook()
		book.colors = [red, green, blue]
		Set<Theme> themes = themeService.getThemesForInspirationBook(book)
		
		assertTrue(themes.contains(rgbTheme))
		assertTrue(themes.contains(rbyTheme))
		assertTrue(themes.contains(ryoTheme))
		assertFalse(themes.contains(yoTheme))
	}
}
