
<%@ page import="com.hizon.Theme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theme.label', default: 'Theme')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-theme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<g:render template="../dashboard/navigation" />
		
		<div id="list-theme" class="content scaffold-list" role="main">
			<h1>Themes Gallery</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="search" method="get" class="search">
				<g:textField name="q" value="${params.q}" />
				<g:submitButton name="search" />
			</g:form>
			<g:each in="${activeThemes}" var="activeTheme">
				<div>
				<h3>${activeTheme.name}</h3>
				<g:link controller="client" action="viewTheme" id="${activeTheme.id}"><g:img dir="/uploaded-files" file="${activeTheme.primaryImage}" width="400px" /></g:link>
				</div>
			</g:each>
			<div class="pagination">
				<g:paginate total="${activeThemesTotal}" action="themesGallery" controller="client" next="Forward" prev="Back"/>
			</div>
		</div>
	</body>
</html>
