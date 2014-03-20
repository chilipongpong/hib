package com.hizon

class ThemeService {

	def getThemesForInspirationBook(InspirationBook book) {
		Set colors = new HashSet<Color>(book.colors.asList())
		return getThemesBasedOnColor(colors)
	}
	
    def getThemesBasedOnColor(Set<Color> colors) {
		def result = new HashSet<Theme>()
		def themes = Theme.findAll()
		for (Theme theme: themes) {
			for (Color color: colors) {
				if (theme.colors.contains(color)) {
					result.add(theme)
					break
				}
			}
		}
		return result
    }
}
