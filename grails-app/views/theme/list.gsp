
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-theme" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'theme.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'theme.description.label', default: 'Description')}" />
						
						<g:sortableColumn property="level" title="${message(code: 'theme.level.label', default: 'Level')}" />
						
						<g:sortableColumn property="level" title="${message(code: 'theme.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${themeInstanceList}" status="i" var="themeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${themeInstance.id}">${fieldValue(bean: themeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: themeInstance, field: "description")}</td>
						
						<td>${fieldValue(bean: themeInstance, field: "level")}</td>
						
						<td>${fieldValue(bean: themeInstance, field: "status.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${themeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
