<%@ page import="com.hizon.ContentManager" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentManager.label', default: 'Content Manager')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="loggedInContentManager" value="${contentManagerId}" scope="session"></g:set>
		<a href="#create-contentManager" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
	</body>
</html>
