package com.hizon

class ColorService {
	def themeService
	
    def getRandomColorFromThemesContainingColors(List<Color> colors) {
		Color result = null
		Theme theme = themeService.getRandomThemeContainingColors(colors)
		if (theme != null) {
			def themeColors = theme.colors
			for (Color color: colors) {
				themeColors.remove(color)
			}
			
			if (themeColors.size() > 0) {
				int randomNumber = new Random().nextInt(themeColors.size())
				result = themeColors.asList().get(randomNumber)
			}
		}
		return result
    }
}
