
<%@ page import="com.hizon.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="list-project" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="craNumber" title="${message(code: 'project.craNumber.label', default: 'Cra Number')}" />
					
						<th><g:message code="project.client.label" default="Client" /></th>
					
						<th><g:message code="project.planner.label" default="Planner" /></th>
					
						<g:sortableColumn property="venue" title="${message(code: 'project.venue.label', default: 'Venue')}" />
					
						<g:sortableColumn property="salesAgent" title="${message(code: 'project.salesAgent.label', default: 'Sales Agent')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: projectInstance, field: "craNumber")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "planner")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "venue")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "salesAgent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
