
<%@ page import="com.hizon.Admin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'superAdmin.label', default: 'Super Admin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-superAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-superAdmin" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="user.username" title="${message(code: 'user.username.label', default: 'Username')}" />
						<g:sortableColumn property="user.firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
						<g:sortableColumn property="user.lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="user.email" title="${message(code: 'user.email.label', default: 'Email')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${superAdminInstanceList}" status="i" var="superAdminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${superAdminInstance.id}">${fieldValue(bean: superAdminInstance.user, field: "username")}</g:link></td>
						<td>${fieldValue(bean: superAdminInstance.user, field: "firstName")}</td>
						<td>${fieldValue(bean: superAdminInstance.user, field: "lastName")}</td>
						<td>${fieldValue(bean: superAdminInstance.user, field: "email")}</td>					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${superAdminInstanceTotal}" />
			</div>
		</div>
	</body>
</html>