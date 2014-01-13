
<%@ page import="com.hizon.Color" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'color.label', default: 'Color')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-color" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-color" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list color">
			
				<g:if test="${colorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="color.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${colorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colorInstance?.pantone}">
				<li class="fieldcontain">
					<span id="pantone-label" class="property-label"><g:message code="color.pantone.label" default="Pantone" /></span>
					
						<span class="property-value" aria-labelledby="pantone-label"><g:fieldValue bean="${colorInstance}" field="pantone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colorInstance?.hex}">
				<li class="fieldcontain">
					<span id="hex-label" class="property-label"><g:message code="color.hex.label" default="Hex" /></span>
						<span class="property-value" aria-labelledby="hex-label"><g:fieldValue bean="${colorInstance}" field="hex"/></span><br>
						<div class="property-value color-box" style="background-color: <g:fieldValue bean='${colorInstance}' field='hex'/>"></div>
				</li>
				</g:if>
			
				<g:if test="${colorInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="color.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${colorInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${colorInstance?.id}" />
					<g:link class="edit" action="edit" id="${colorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
