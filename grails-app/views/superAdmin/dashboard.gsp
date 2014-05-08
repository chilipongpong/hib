<%@ page import="com.hizon.SuperAdmin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'superAdmin.label', default: 'Super Admin')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-planner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
	</body>
</html>
