
<%@ page import="com.hizon.Theme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theme.label', default: 'Theme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-theme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-theme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list theme">
			
				<g:if test="${themeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="theme.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${themeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${themeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="theme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${themeInstance}" field="description"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${themeInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="theme.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:link controller="level" action="show" id="${themeInstance?.level?.id}">${themeInstance?.level?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${themeInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="theme.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${themeInstance}" field="status.name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${themeInstance?.colors}">
				<li class="fieldcontain">
					<span id="colors-label" class="property-label"><g:message code="theme.colors.label" default="Colors" /></span>
					
						<g:each in="${themeInstance.colors}" var="c">
						<span class="property-value" aria-labelledby="colors-label"><g:link controller="color" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${themeInstance?.id}" />
					<g:link class="edit" action="edit" id="${themeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
