<div class="navi">
	<ul class="sf-menu">
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		<li><a href="#">Menu</a>
			<ul>
				<li><g:link uri="/menuCategory">Menu Categories</g:link>
					<ul>
						<li><g:link class="create" action="create" controller="MenuCategory">
								<g:message code="default.new.label" args="['Menu Category']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="MenuCategory">
								<g:message code="default.list.label" args="['Menu Categories']" />
							</g:link></li>
					</ul>
				</li>
				<li><g:link uri="/menuItem">Menu Items</g:link>
					<ul>
						<li><g:link class="create" action="create" controller="MenuItem">
								<g:message code="default.new.label" args="['Menu Item']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="MenuItem">
								<g:message code="default.list.label" args="['Menu Items']" />
							</g:link></li>
					</ul>
				</li>
				<li><g:link uri="/foodPackage">Food Packages</g:link>
					<ul>
						<li><g:link class="create" action="create" controller="FoodPackage">
								<g:message code="default.new.label" args="['Food Package']" />
							</g:link></li>
						<li><g:link class="list" action="list" controller="FoodPackage">
								<g:message code="default.list.label" args="['Food Packages']" />
							</g:link></li>
					</ul>
				</li>
			</ul></li>
		<li><g:link uri="/color">Colors</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="Color">
						<g:message code="default.new.label" args="['Color']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="Color">
						<g:message code="default.list.label" args="['Colors']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/theme">Themes</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="Theme">
						<g:message code="default.new.label" args="['Theme']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="Theme">
						<g:message code="default.list.label" args="['Themes']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/package">Packages</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="Package">
						<g:message code="default.new.label" args="['Package']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="Package">
						<g:message code="default.list.label" args="['Packages']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/bundledItem">Bundled Items</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="BundledItem">
						<g:message code="default.new.label" args="['Bundled Item']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="BundledItem">
						<g:message code="default.list.label" args="['Bundled Items']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/level">Levels</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="Level">
						<g:message code="default.new.label" args="['Level']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="Level">
						<g:message code="default.list.label" args="['Levels']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/valueRange">Value Range</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="ValueRange">
						<g:message code="default.new.label" args="['Value Range']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="ValueRange">
						<g:message code="default.list.label" args="['Value Ranges']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/event">Events</g:link>
			<ul>
				<li><g:link class="create" action="create" controller="Event">
						<g:message code="default.new.label" args="['Event']" />
					</g:link></li>
				<li><g:link class="list" action="list" controller="Event">
						<g:message code="default.list.label" args="['Events']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link action="show" id="${contentManagerId}">My Profile</g:link></li>
	</ul>
</div>