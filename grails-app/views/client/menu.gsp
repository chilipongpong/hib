
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
		
		<div id="list-menuCategory" class="content scaffold-list" role="main">
			<h1><img src="../images/head-menu.png" alt="Menu">Menu</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:each in="${activeMenuCategories}" var="activeMenuCategory">
				<div>
				<h3>${activeMenuCategory.name}</h3>
				<g:link controller="client" action="viewMenuCategory" id="${activeMenuCategory.id}"><g:img dir="/uploaded-files" file="${activeMenuCategory.image}" width="280px" /></g:link>
				</div>
			</g:each>
			<div class="pagination">
				<g:paginate total="${activeMenuCategoriesTotal}" action="menu" controller="client" next="Forward" prev="Back"/>
			</div>
		</div>
	</body>
</html>
