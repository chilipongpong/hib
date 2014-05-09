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
	<a href="#create-client" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<h1>
		Hello,
		${firstName}!
	</h1>
	<div id="clientdash">
		<div class="row">
			<div class="span4 shrink">
				<g:link action="show" id="${session.loggedInClientId}" controller="client">
					<img src="../images/btn-profile.png" alt="My Profile">
				</g:link>
			</div>
			<div class="span4 shrink">
				<g:link action="themesGallery" controller="client">
					<img src="../images/btn-themes.png" alt="Themes">
				</g:link>
			</div>
			<div class="span4 shrink">
				<g:link action="menu" controller="client">
					<img src="../images/btn-menu.png" alt="Menu">
				</g:link>
			</div>
		</div>
		<div class="row">
			<div class="span4 shrink">
				<g:link action="myPlanner" controller="client">
					<img src="../images/btn-planner.png" alt="My Planner">
				</g:link>
			</div>
			<div class="span4 shrink">
				<g:link controller="inspirationBook">
					<img src="../images/btn-book.png" alt="My Inspiration Book">
				</g:link>
			</div>
			<div class="span4 shrink">
				<g:link action="myPackage" controller="client">
					<img src="../images/btn-package.png" alt="My Package">
				</g:link>
			</div>
		</div>
	</div>
</body>
</html>
