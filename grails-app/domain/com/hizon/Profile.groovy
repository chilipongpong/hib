package com.hizon

class Profile {

	String firstName
	String lastName
	String email
	String mobile
	String phone
	
    static constraints = {
		firstName blank:false, nullable:false, size: 1..100
		lastName blank:false, nullable:false, size: 1..100
		email email: true, blank: false, size: 0..100
		mobile nullable:true, matches:"[0-9]*"
		phone nullable:true, matches:"[0-9]*"
    }
	
	String toString() {
		firstName + " " + lastName
	}
}
