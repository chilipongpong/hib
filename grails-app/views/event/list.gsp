
<%@ page import="com.hizon.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'event.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'event.status.label', default: 'Status')}" />
					
						<th><g:message code="event.client.label" default="Client" /></th>
					
						<g:sortableColumn property="craNumber" title="${message(code: 'event.craNumber.label', default: 'Cra Number')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'event.date.label', default: 'Date')}" />
					
						<th><g:message code="event.pack.label" default="Pack" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "craNumber")}</td>
					
						<td><g:formatDate date="${eventInstance.date}" /></td>
					
						<td>${fieldValue(bean: eventInstance, field: "pack")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
