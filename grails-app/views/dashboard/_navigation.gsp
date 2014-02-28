<sec:ifAllGranted roles="ROLE_CLIENT">
	<g:render template="../dashboard/clientNavigation" />
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_PLANNER">
	<g:render template="../dashboard/plannerNavigation" />
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_PLANNER_SUPERVISOR">
	<g:render template="../dashboard/plannerSupervisorNavigation" />
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_USER_ADMIN">
	<g:render template="../dashboard/userAdminNavigation" />
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_SUPER_ADMIN">
	<g:render template="../dashboard/superAdminNavigation" />
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_CONTENT_MANAGER">
	<g:render template="../dashboard/contentManagerNavigation" />
</sec:ifAllGranted>