
<%@ page import="com.hizon.Package" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-package" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-package" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'package.name.label', default: 'Name')}" />
					
						<th><g:message code="package.appetizer.label" default="Appetizer" /></th>
					
						<th><g:message code="package.beef.label" default="Beef" /></th>
					
						<th><g:message code="package.chicken.label" default="Chicken" /></th>
					
						<th><g:message code="package.dessert.label" default="Dessert" /></th>
					
						<g:sortableColumn property="numberOfGuests" title="${message(code: 'package.numberOfGuests.label', default: 'Number Of Guests')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${packageInstanceList}" status="i" var="packageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${packageInstance.id}">${fieldValue(bean: packageInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: packageInstance, field: "appetizer")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "beef")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "chicken")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "dessert")}</td>
					
						<td>${fieldValue(bean: packageInstance, field: "numberOfGuests")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${packageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
