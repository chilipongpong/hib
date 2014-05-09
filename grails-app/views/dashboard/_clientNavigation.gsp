<div class="navi" >
	<ul class="sf-menu">
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></li>
		<li><g:link action="show" id="${session.loggedInClientId}" controller="client">My Profile</g:link></li>
		<li><g:link action="themesGallery" controller="client">Themes Gallery</g:link></li>
		<li><g:link action="menu" controller="client">Menu</g:link></li>
		<li><g:link action="myPlanner" id="${plannerId}" controller="client">My Planner</g:link></li>
	</ul>
</div>