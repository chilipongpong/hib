
<%@ page import="com.hizon.FoodPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foodPackage.label', default: 'FoodPackage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-foodPackage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="list-foodPackage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="foodPackage.level.label" default="Level" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'foodPackage.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'foodPackage.number.label', default: 'Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${foodPackageInstanceList}" status="i" var="foodPackageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${foodPackageInstance.id}">${fieldValue(bean: foodPackageInstance, field: "level")}</g:link></td>
					
						<td>${fieldValue(bean: foodPackageInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: foodPackageInstance, field: "number")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${foodPackageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
