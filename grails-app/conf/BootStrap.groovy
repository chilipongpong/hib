import com.hizon.User
import com.hizon.Role
import com.hizon.UserRole
import com.hizon.RequestMap

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
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
		new RequestMap(url: '/admin/**', configAttribute: 'ROLE_ADMIN').save(flush:true)
		new RequestMap(url: '/', configAttribute: 'ROLE_ADMIN, ROLE_USER').save(flush:true)
		new RequestMap(url: '/*/**', configAttribute: 'ROLE_ADMIN, ROLE_USER').save(flush:true)
    }
    def destroy = {
    }
}
