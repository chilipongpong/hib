<%@ page import="com.hizon.Planner"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planner.label', default: 'Planner')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-client" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<h1>
		Hello, ${firstName}!
	</h1>
	<div>
		<div>
		<g:link action="show" id="${clientId}" controller="client"><img src="../images/btn-profile.png" alt="My Profile"></g:link>
		<g:link action="themesGallery" controller="client"><img src="../images/btn-themes.png" alt="Themes"></g:link>
		<g:link action="menu" controller="client"><img src="../images/btn-menu.png" alt="Menu"></g:link>
		<g:link action="myPlanner" params="${clientId}" controller="client"><img src="../images/btn-planner.png" alt="My Planner"></g:link>
		<g:link action="inspirationBook" controller="client"><img src="../images/btn-book.png" alt="My Inspiration Book"></g:link>
		<g:link action="myPackage" controller="client"><img src="../images/btn-package.png" alt="My Package"></g:link>
		</div>
	</div>
</body>
</html>
