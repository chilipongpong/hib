<%@ page import="com.hizon.UserAdmin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAdmin.label', default: 'User Admin')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="loggedInUserAdminId" value="${clientId}" scope="session"></g:set>
		<a href="#create-userAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
	</body>
</html>
