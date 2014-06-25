<%@ page import="com.hizon.Planner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planner.label', default: 'Planner')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="loggedInPlannerId" value="${plannerId}" scope="session"></g:set>
		<g:render template="../dashboard/navigation" />
		<!-- Heading -->
	    <div class="container-fluid text-center ed-title-head">
	        <div class="container" style="">
	            <div class="row">
	                <div class="col-md-12 col-lg-12"><h1>Dashboard</h1></div>
	            </div>
	
	        </div>
	    </div>
	    <!-- End Heading -->
		<h3>Projects Assigned To Me</h3>
		<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'event.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="craNumber" title="${message(code: 'event.craNumber.label', default: 'Cra Number')}" />
					
						<th><g:message code="event.client.label" default="Client" /></th>
					
						<th><g:message code="event.planner.label" default="Planner" /></th>
					
						<g:sortableColumn property="venue" title="${message(code: 'event.venue.label', default: 'Venue')}" />
					
						<g:sortableColumn property="salesAgent" title="${message(code: 'event.salesAgent.label', default: 'Sales Agent')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventsAssignedToMe}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "craNumber")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "planner")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "venue")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "salesAgent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
			<g:paginate total="${eventsAssignedToMeCount}" controller="planner"
				action="dashboard" next="Forward" prev="Back" />
		</div>
	</body>
</html>
