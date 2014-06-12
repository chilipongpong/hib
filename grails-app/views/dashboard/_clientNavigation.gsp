<div class="container-fluid text-center ed-menu">
	<div class="container" style="height: 15px">
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<ul id="nav">
					<li><a class="home" href="${createLink(uri: '/')}"><g:message
								code="default.home.label" /></a></li>
					<li><g:link action="show" id="${session.loggedInClientId}"
							controller="client">Profile</g:link></li>
					<li><g:link action="themesGallery" controller="client">Themes</g:link></li>
					<li><g:link action="menu" controller="client">Menu</g:link></li>
					<li><g:link action="myPlanner" controller="client">My Planner</g:link></li>
					<li><g:link controller="inspirationBook">Inspiration Book</g:link></li>
					<li><g:link action="myPackage" controller="client">My Package</g:link></li>
				</ul>
			</div>
		</div>
	</div>
</div>






