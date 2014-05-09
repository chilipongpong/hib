<div id="clientnav" role="navigation">
	<ul>
		<li><g:link action="show" id="${session.loggedInClientId}" controller="client">Profile</g:link></li>
		<li><g:link action="themesGallery" controller="client">Themes</g:link></li>
		<li><g:link action="menu" controller="client">Menu</g:link></li>
		<li><g:link action="myPlanner"controller="client">My Planner</g:link></li>
		<li><g:link controller="inspirationBook">Inspiration Book</g:link></li>
		<li><a href="#">My Package</a></li>
	</ul>
</div>