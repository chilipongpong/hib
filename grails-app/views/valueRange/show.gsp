
<%@ page import="com.hizon.ValueRange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valueRange.label', default: 'ValueRange')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-valueRange" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="show-valueRange" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list valueRange">
			
				<g:if test="${valueRangeInstance?.lowerLimit}">
				<li class="fieldcontain">
					<span id="lowerLimit-label" class="property-label"><g:message code="valueRange.lowerLimit.label" default="Lower Limit" /></span>
					
						<span class="property-value" aria-labelledby="lowerLimit-label"><g:fieldValue bean="${valueRangeInstance}" field="lowerLimit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valueRangeInstance?.upperLimit}">
				<li class="fieldcontain">
					<span id="upperLimit-label" class="property-label"><g:message code="valueRange.upperLimit.label" default="Upper Limit" /></span>
					
						<span class="property-value" aria-labelledby="upperLimit-label"><g:fieldValue bean="${valueRangeInstance}" field="upperLimit"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${valueRangeInstance?.id}" />
					<g:link class="edit" action="edit" id="${valueRangeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
