package com.hizon;

public enum Status {
	ACTIVE("Active"), INACTIVE("Inactive");
	
	private String name;
 
	private Status(String name) {
		this.name = name;
	}
 
	public String getName() {
		return this.name;
	}
}
