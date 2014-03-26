
<%@ page import="com.hizon.UserAdmin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAdmin.label', default: 'UserAdmin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<g:render template="../dashboard/navigation" />
		
		<div id="list-userAdmin" class="content scaffold-list" role="main">
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
				<g:each in="${userAdminInstanceList}" status="i" var="userAdminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${userAdminInstance.id}">${fieldValue(bean: userAdminInstance.user, field: "username")}</g:link></td>
						<td>${fieldValue(bean: userAdminInstance.user, field: "firstName")}</td>
						<td>${fieldValue(bean: userAdminInstance.user, field: "lastName")}</td>
						<td>${fieldValue(bean: userAdminInstance.user, field: "email")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userAdminInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
