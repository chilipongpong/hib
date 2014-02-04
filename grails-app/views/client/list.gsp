
<%@ page import="com.hizon.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="user.username.label" default="Username" /></th>
						<th><g:message code="profile.firstName.label" default="First Name" /></th>					
						<th><g:message code="profile.lastName.label" default="Last Name" /></th>
						<th><g:message code="profile.email.label" default="Email" /></th>
						<th><g:message code="client.planner.label" default="Planner" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance.user, field: "username")}</g:link></td>
						<td>${fieldValue(bean: clientInstance.profile, field: "firstName")}</td>
						<td>${fieldValue(bean: clientInstance.profile, field: "lastName")}</td>
						<td>${fieldValue(bean: clientInstance.profile, field: "email")}</td>
						<td>${fieldValue(bean: clientInstance, field: "planner")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
