package com.hizon

class ThemeService {

	def getThemesForInspirationBook(InspirationBook book) {
		Set colors = new HashSet<Color>(book.colors.asList())
		return getThemesBasedOnColor(colors)
	}
	
    def getThemesBasedOnColor(Set<Color> colors) {
		Map result = new LinkedHashMap<Theme, Integer>()
		List prioritizedResult = new ArrayList<Theme>()
		def themes = Theme.findAll()
		for (Theme theme: themes) {
			result.put(theme, 0)
			for (Color color: colors) {
				if (theme.colors.contains(color)) {
					Integer count = result.get(theme)
					count += 1
					result.put(theme, count)
				}
			}
		}
		
		Map sortedResult = sortByComparatorDescending(result)
		for (Map.Entry entry : sortedResult.entrySet()) {
			if (entry.getValue() > 0) {
				prioritizedResult.add(entry.getKey())
			}
		}
		
		return prioritizedResult
    }
	
	private static Map sortByComparatorDescending(Map unsortMap) {
		List list = new LinkedList(unsortMap.entrySet())
	
		// sort list based on comparator
		Collections.sort(list, new Comparator() {
			public int compare(Object o1, Object o2) {
				return ((Comparable) ((Map.Entry) (o2)).getValue()).compareTo(((Map.Entry) (o1)).getValue())
			}
		})
	
		// put sorted list into map again
		//LinkedHashMap make sure order in which keys were inserted
		Map sortedMap = new LinkedHashMap()
		for (Iterator it = list.iterator(); it.hasNext();) {
			Map.Entry entry = (Map.Entry) it.next()
			sortedMap.put(entry.getKey(), entry.getValue())
		}
		return sortedMap
	}
}
