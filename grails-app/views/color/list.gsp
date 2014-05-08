
<%@ page import="com.hizon.Color" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'color.label', default: 'Color')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-color" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="list-color" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="search" method="get" class="search">
				<g:textField name="q" value="${params.q}" />
				<g:submitButton name="search" />
			</g:form>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'color.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="pantone" title="${message(code: 'color.pantone.label', default: 'Pantone')}" />
					
						<g:sortableColumn property="hex" title="${message(code: 'color.hex.label', default: 'Hex')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'color.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${colorInstanceList}" status="i" var="colorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${colorInstance.id}">${fieldValue(bean: colorInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: colorInstance, field: "pantone")}</td>
					
						<td>${fieldValue(bean: colorInstance, field: "hex")}</td>
					
						<td>${fieldValue(bean: colorInstance, field: "status.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${colorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
