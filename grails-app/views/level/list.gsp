
<%@ page import="com.hizon.Level" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'level.label', default: 'Level')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-level" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-level" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="name" title="${message(code: 'level.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'level.description.label', default: 'Description')}" />
						
						<g:sortableColumn property="status" title="${message(code: 'level.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${levelInstanceList}" status="i" var="levelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${levelInstance.id}">${fieldValue(bean: levelInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: levelInstance, field: "description")}</td>
						
						<td>${fieldValue(bean: levelInstance, field: "status.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${levelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
