import com.hizon.SuperAdmin
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

		def superAdmin = SuperAdmin.findByUser(superAdminUser) ?: new SuperAdmin(
			user: superAdminUser).save(failOnError: true)
			
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
		new RequestMap(url: '/inspirationBook/**', configAttribute: 'ROLE_CLIENT, ROLE_SUPER_ADMIN, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR').save(flush:true)
//		new RequestMap(url: '/userAdmin/**', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
//		new RequestMap(url: '/client/**', configAttribute: 'ROLE_CLIENT, ROLE_SUPER_ADMIN').save(flush:true)
//		new RequestMap(url: '/planner/**', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
//		new RequestMap(url: '/plannerSupervisor/**', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
//		new RequestMap(url: '/contentManager/**', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
//		new RequestMap(url: '/userAdmin/**', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/superAdmin/**', configAttribute: 'ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/*/**', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/dashboard/**', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		
		
		//user admin
		new RequestMap(url: '/useradmin/create', configAttribute: 'ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin/edit/*', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin/save', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin/show/*', configAttribute: 'ROLE_USER_ADMIN, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin/list', configAttribute: 'ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin', configAttribute: 'ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/useradmin/dashboard', configAttribute: 'ROLE_USER_ADMIN').save(flush:true)
		
		//planner supervisor
		new RequestMap(url: '/plannerSupervisor/create', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/edit/*', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/save', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/show/*', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/search*', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/list', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/plannerSupervisor/dashboard', configAttribute: 'ROLE_PLANNER_SUPERVISOR').save(flush:true)
				
		//planner
		new RequestMap(url: '/planner/create', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/edit/*', configAttribute: 'ROLE_PLANNER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/save', configAttribute: 'ROLE_PLANNER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/show/*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/search*', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/list', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/planner/dashboard', configAttribute: 'ROLE_PLANNER').save(flush:true)
		
		//content manager
		new RequestMap(url: '/contentManager/create', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/show/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/list', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/contentManager/dashboard', configAttribute: 'ROLE_CONTENT_MANAGER').save(flush:true)
		
		//client
		new RequestMap(url: '/client/create', configAttribute: 'ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/edit/*', configAttribute: 'ROLE_CLIENT, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/save', configAttribute: 'ROLE_CLIENT, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/list', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/client/myPlanner/*', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/myPackage', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/themesGallery', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/viewMenuCategory/*', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/saveMenuCategories', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/viewTheme/*', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/saveTheme', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/displayImage*', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/menu', configAttribute: 'ROLE_CLIENT').save(flush:true)
		new RequestMap(url: '/client/dashboard', configAttribute: 'ROLE_CLIENT').save(flush:true)
		
		//level
		new RequestMap(url: '/level/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/level', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//colors
		new RequestMap(url: '/color/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/color', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//bundled items
		new RequestMap(url: '/bundledItem/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/bundledItem', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//value range
		new RequestMap(url: '/valueRange/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/valueRange', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		
		//themes
		new RequestMap(url: '/theme/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/theme/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/theme/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/theme/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/theme/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/theme', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//food package
		new RequestMap(url: '/foodPackage/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/foodPackage', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//menu item
		new RequestMap(url: '/menuItem/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuItem', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//menu category
		new RequestMap(url: '/menuCategory/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory/create', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory/edit/*', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory/save', configAttribute: 'ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/menuCategory', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN').save(flush:true)
		
		//project
		new RequestMap(url: '/project/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project/create', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project/edit/*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project/save', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/project', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		
		//event
		new RequestMap(url: '/event/show/*', configAttribute: 'ROLE_CLIENT, ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event/create', configAttribute: 'ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event/edit/*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event/save', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event/search*', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event/list', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
		new RequestMap(url: '/event', configAttribute: 'ROLE_PLANNER, ROLE_PLANNER_SUPERVISOR, ROLE_SUPER_ADMIN').save(flush:true)
    }
    def destroy = {
    }
}
