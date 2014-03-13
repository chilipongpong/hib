package com.hizon

class ThemeService {

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
