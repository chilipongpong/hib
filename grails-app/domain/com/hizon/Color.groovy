package com.hizon

class Color {

	String name
	String pantone
	String hex
	Status status

    static constraints = {
		name blank:false, unique:true, nullable:false, size: 1..100
		pantone blank:true, nullable:true, size: 0..100
		hex blank:false, unique:true, nullable:false, size: 1..7
		status blank: false
    }
	
	static searchable = true

	@Override
	public String toString() {
		return name;
	}
	
	public static List<Color> listAllActive() {
		return Color.findAllByStatus(Status.ACTIVE)
	}
}
