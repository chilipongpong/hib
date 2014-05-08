<div class="navi">
	<ul class="sf-menu">
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		<li><a href="#">Menu</a>
			<ul>
				<li><g:link uri="/menuCategory">Menu Categories</g:link>
					<ul>
						<li><g:link class="list" action="list" controller="MenuCategory">
								<g:message code="default.list.label" args="['Menu Categories']" />
							</g:link></li>
					</ul>
				</li>
				<li><g:link uri="/menuItem">Menu Items</g:link>
					<ul>
						<li><g:link class="list" action="list" controller="MenuItem">
								<g:message code="default.list.label" args="['Menu Items']" />
							</g:link></li>
					</ul>
				</li>
			</ul></li>
		<li><g:link uri="/color">Colors</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Color">
						<g:message code="default.list.label" args="['Colors']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/theme">Themes</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Theme">
						<g:message code="default.list.label" args="['Themes']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/package">Packages</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Package">
						<g:message code="default.list.label" args="['Packages']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/bundledItem">Bundled Items</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="BundledItem">
						<g:message code="default.list.label" args="['Bundled Items']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/level">Levels</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Level">
						<g:message code="default.list.label" args="['Levels']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/valueRange">Value Range</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="ValueRange">
						<g:message code="default.list.label" args="['Value Ranges']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/event">Events</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Event">
						<g:message code="default.list.label" args="['Events']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link uri="/project">Projects</g:link>
			<ul>
				<li><g:link class="list" action="list" controller="Project">
						<g:message code="default.list.label" args="['Projects']" />
					</g:link></li>
			</ul>
		</li>
		<li><g:link action="show" id="${plannerId}">My Profile</g:link></li>
	</ul>
</div>