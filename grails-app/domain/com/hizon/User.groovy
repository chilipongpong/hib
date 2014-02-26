package com.hizon

class User {

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String email
	String mobile
	String phone

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true, size: 1..100
		password blank: false, size: 8..100 
		email email: true, blank: false, size: 0..100
		firstName blank:false, nullable:false, size: 1..100
		lastName blank:false, nullable:false, size: 1..100
		mobile nullable:true, matches:"[0-9]*"
		phone nullable:true, matches:"[0-9]*"
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	String toString() {
		firstName + " " + lastName
	}

	boolean isClient() {
		this.authorities.contains(Role.findByAuthority('ROLE_CLIENT'))
	}
	
	boolean isPlanner() {
		this.authorities.contains(Role.findByAuthority('ROLE_PLANNER'))
	}
	
	boolean isPlannerSupervisor() {
		this.authorities.contains(Role.findByAuthority('ROLE_PLANNER_SUPERVISOR'))
	}
	
}
