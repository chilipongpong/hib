<%@ page import="com.hizon.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.dashboard.label"
		args="[entityName]" /></title>
</head>
<body>
	<g:set var="loggedInClientId" value="${clientId}" scope="session"></g:set>
	<g:set var="plannerId" value="${myPlannerId}" scope="session"></g:set>
	<div class="container-fluid text-center ed-menu">
		<div class="container" style="height: 15px"></div>
	</div>
	<!-- Heading -->
	    <div class="container-fluid text-center ed-title-head">
	        <div class="container" style="">
	            <div class="row">
	                <div class="col-md-12 col-lg-12"><h1>Dashboard</h1></div>
	            </div>
	
	        </div>
	    </div>
	    <!-- End Heading -->

	<!-- MAIN CONTENT -->
	<div class="container-fluid text-center" style="">
		<div class="container" style=>
			<div class="row">
				
					<!-- first row -->
							<g:link action="show" id="${session.loggedInClientId}" controller="client">
								<img src="../images/btn-profile.png" alt="My Profile">
							</g:link>
							<g:link action="themesGallery" controller="client">
								<img src="../images/btn-themes.png" alt="Themes">
							</g:link>
							<g:link action="menu" controller="client">
								<img src="../images/btn-menu.png" alt="Menu">
							</g:link>
							<g:link action="myPlanner" controller="client">
								<img src="../images/btn-planner.png" alt="My Planner">
							</g:link>
							<g:link controller="inspirationBook">
								<img src="../images/btn-book.png" alt="My Inspiration Book">
							</g:link>
							<g:link action="myPackage" controller="client">
								<img src="../images/btn-package.png" alt="My Package">
							</g:link>
						</div>
				
			</div>
			<!--  end row -->
		</div>
		<!-- end container -->
	</div>
	<!--  end MAIN CONTENT -->

</body>
</html>
