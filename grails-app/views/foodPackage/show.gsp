
<%@ page import="com.hizon.FoodPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foodPackage.label', default: 'FoodPackage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-foodPackage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="show-foodPackage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list foodPackage">
			
				<g:if test="${foodPackageInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="foodPackage.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:link controller="level" action="show" id="${foodPackageInstance?.level?.id}">${foodPackageInstance?.level?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodPackageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="foodPackage.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${foodPackageInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodPackageInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="foodPackage.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${foodPackageInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${foodPackageInstance?.id}" />
					<g:link class="edit" action="edit" id="${foodPackageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
