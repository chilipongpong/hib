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
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(name: 'Admin', authority: 'ROLE_ADMIN').save(failOnError: true)
		
		def adminUser = User.findByUsername('admin') ?: new User(
			username: 'admin',
			password: 'admin',
			enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(adminRole)) {
			UserRole.create adminUser, adminRole
		}

		new RequestMap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/favicon.ico', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save(flush:true)
		new RequestMap(url: '/', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/admin/**', configAttribute: 'ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/client/**', configAttribute: 'ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/**', configAttribute: 'ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/**', configAttribute: 'ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/*/**', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_ADMIN').save(flush:true)
    }
    def destroy = {
    }
}
