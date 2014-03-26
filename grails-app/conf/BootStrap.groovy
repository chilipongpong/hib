import com.hizon.User
import com.hizon.Role
import com.hizon.UserRole
import com.hizon.RequestMap

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		def clientRole = Role.findByAuthority('ROLE_CLIENT') ?: new Role(name: 'Client', authority: 'ROLE_CLIENT').save(failOnError: true)
		def plannerRole = Role.findByAuthority('ROLE_PLANNER') ?: new Role(name: 'Planner', authority: 'ROLE_PLANNER').save(failOnError: true)
		def plannerSupervisorRole = Role.findByAuthority('ROLE_PLANNER_SUPERVISOR') ?: new Role(name: 'Planner Supervisor', authority: 'ROLE_PLANNER_SUPERVISOR').save(failOnError: true)
		def contentManagerRole = Role.findByAuthority('ROLE_CONTENT_MANAGER') ?: new Role(name: 'Content Manager', authority: 'ROLE_CONTENT_MANAGER').save(failOnError: true)
		def userAdminRole = Role.findByAuthority('ROLE_USER_ADMIN') ?: new Role(name: 'USER_ADMIN', authority: 'ROLE_USER_ADMIN').save(failOnError: true)
		def superAdminRole = Role.findByAuthority('ROLE_SUPER_ADMIN') ?: new Role(name: 'Super Admin', authority: 'ROLE_SUPER_ADMIN').save(failOnError: true)
		
		def superAdminUser = User.findByUsername('admin') ?: new User(
			username: 'admin',
			password: 'admin123',
			email: 'email@default.com',
			firstName: 'super',
			lastName: 'admin',
			enabled: true).save(failOnError: true)

		if (!superAdminUser.authorities.contains(superAdminRole)) {
			UserRole.create superAdminUser, superAdminRole
		}

		new RequestMap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/register/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/favicon.ico', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/inspirationBook/**', configAttribute: 'ROLE_CLIENT, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/userAdmin/**', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/**', configAttribute: 'ROLE_CLIENT, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/**', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/**', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/**', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/userAdmin/**', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/superAdmin/**', configAttribute: 'ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/*/**', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/dashboard/**', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
    }
    def destroy = {
    }
}
