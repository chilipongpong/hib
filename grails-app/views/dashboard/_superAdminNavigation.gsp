<div class="container-fluid text-center ed-menu">
	<div class="container" style="height: 15px">
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<ul id="nav">
					<li><a class="home" href="${createLink(uri: '/')}"><g:message
								code="default.home.label" /></a></li>
					<li><a href="#">Menu</a>
						<ul>
							<li><a href="#">Menu Categories</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="MenuCategory">
											<g:message code="default.new.label" args="['Menu Category']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="MenuCategory">
											<g:message code="default.list.label"
												args="['Menu Categories']" />
										</g:link></li>
								</ul></li>
							<li><a href="#">Menu Items</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="MenuItem">
											<g:message code="default.new.label" args="['Menu Item']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="MenuItem">
											<g:message code="default.list.label" args="['Menu Items']" />
										</g:link></li>
								</ul></li>
							<li><a href="#">Food Packages</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="FoodPackage">
											<g:message code="default.new.label" args="['Food Package']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="FoodPackage">
											<g:message code="default.list.label" args="['Food Packages']" />
										</g:link></li>
								</ul></li>
						</ul></li>
					<li><a href="#">Colors</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="Color">
									<g:message code="default.new.label" args="['Color']" />
								</g:link></li>
							<li><g:link class="list" action="list" controller="Color">
									<g:message code="default.list.label" args="['Colors']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Themes</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="Theme">
									<g:message code="default.new.label" args="['Theme']" />
								</g:link></li>
							<li><g:link class="list" action="list" controller="Theme">
									<g:message code="default.list.label" args="['Themes']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Packages</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="Package">
									<g:message code="default.new.label" args="['Package']" />
								</g:link></li>
							<li><g:link class="list" action="list" controller="Package">
									<g:message code="default.list.label" args="['Packages']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Bundled Items</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="BundledItem">
									<g:message code="default.new.label" args="['Bundled Item']" />
								</g:link></li>
							<li><g:link class="list" action="list"
									controller="BundledItem">
									<g:message code="default.list.label" args="['Bundled Items']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Levels</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="Level">
									<g:message code="default.new.label" args="['Level']" />
								</g:link></li>
							<li><g:link class="list" action="list" controller="Level">
									<g:message code="default.list.label" args="['Levels']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Value Range</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="ValueRange">
									<g:message code="default.new.label" args="['Value Range']" />
								</g:link></li>
							<li><g:link class="list" action="list"
									controller="ValueRange">
									<g:message code="default.list.label" args="['Value Ranges']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">Events</a>
						<ul>
							<li><g:link class="create" action="create"
									controller="Event">
									<g:message code="default.new.label" args="['Event']" />
								</g:link></li>
							<li><g:link class="list" action="list" controller="Event">
									<g:message code="default.list.label" args="['Events']" />
								</g:link></li>
						</ul></li>
					<li><a href="#">User</a>
						<ul>
							<li><a href="#">Clients</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="Client">
											<g:message code="default.new.label" args="['Client']" />
										</g:link></li>
									<li><g:link class="list" action="list" controller="Client">
											<g:message code="default.list.label" args="['Clients']" />
										</g:link></li>
								</ul></li>
							<li><a href="#">Planners</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="Planner">
											<g:message code="default.new.label" args="['Planner']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="Planner">
											<g:message code="default.list.label" args="['Planners']" />
										</g:link></li>
								</ul></li>
							<li><a href="#">Planner Supervisors</a>
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
							<li><a href="#">User Admins</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="UserAdmin">
											<g:message code="default.new.label" args="['User Admin']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="UserAdmin">
											<g:message code="default.list.label" args="['User Admins']" />
										</g:link></li>
								</ul></li>
							<li><a href="#">Content Managers</a>
								<ul>
									<li><g:link class="create" action="create"
											controller="ContentManager">
											<g:message code="default.new.label"
												args="['Content Manager']" />
										</g:link></li>
									<li><g:link class="list" action="list"
											controller="ContentManager">
											<g:message code="default.list.label"
												args="['Content Managers']" />
										</g:link></li>
								</ul></li>
						</ul></li>
					<li><g:link action="show" id="${session.loggedInSuperAdminId}"
							controller="superAdmin">My Profile</g:link></li>

				</ul>
			</div> <!-- end column -->
		</div> <!-- end row -->
	</div> <!-- end container  -->
</div> <!-- end container-fluid -->