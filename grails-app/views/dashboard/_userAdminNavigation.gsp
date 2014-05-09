<div class="navi">
	<ul class="sf-menu">
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		<li><a href="#">User</a>
			<ul>
				<li><g:link uri="/client">Client</g:link>
					<ul>
						<li><g:link class="create" action="create"
								controller="Client">
								<g:message code="default.new.label" args="['Client']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="Client">
								<g:message code="default.list.label" args="['Clients']" />
							</g:link></li>
					</ul></li>
				<li><g:link uri="/planner">Planner</g:link>
					<ul>
						<li><g:link class="create" action="create"
								controller="Planner">
								<g:message code="default.new.label" args="['Planner']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="Planner">
								<g:message code="default.list.label" args="['Planners']" />
							</g:link></li>
					</ul></li>
				<li><g:link uri="/plannerSupervisor">Planner Supervisor</g:link>
					<ul>
						<li><g:link class="create" action="create"
								controller="PlannerSupervisor">
								<g:message code="default.new.label"
									args="['Planner Supervisor']" />
							</g:link></li>
						<li><g:link class="list" action="list"
								controller="PlannerSupervisor">
								<g:message code="default.list.label"
									args="['Planner Supervisors']" />
							</g:link></li>
					</ul></li>
				<li><g:link uri="/contentManager">Content Manager</g:link>
					<ul>
						<li><g:link class="create" action="create"
								controller="ContentManager">
								<g:message code="default.new.label" args="['Content Manager']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="ContentManager">
								<g:message code="default.list.label" args="['Content Managers']" />
							</g:link></li>
					</ul></li>
			</ul>
		</li>
		<li><g:link action="show" id="${session.loggedInUserAdminId}" controller="userAdmin">My Profile</g:link></li>
	</ul>
</div>