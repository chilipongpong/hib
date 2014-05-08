<%@ page import="com.hizon.PlannerSupervisor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plannerSupervisor.label', default: 'Planner Supervisor')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-plannerSupervisor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<h3>Clients Without Planners</h3>
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
				<g:each in="${clientsWithoutPlanners}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${clientInstance.id}" controller="Client">${fieldValue(bean: clientInstance.user, field: "username")}</g:link></td>
						<td>${fieldValue(bean: clientInstance.user, field: "firstName")}</td>
						<td>${fieldValue(bean: clientInstance.user, field: "lastName")}</td>
						<td>${fieldValue(bean: clientInstance.user, field: "email")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientsWithoutPlannersTotal}" controller="plannerSupervisor" action="dashboard" next="Forward" prev="Back" />
			</div>
	</body>
</html>
