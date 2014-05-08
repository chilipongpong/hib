
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
		<g:render template="../dashboard/navigation" />
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
	
				<g:if test="${themeInstance?.primaryImage}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="theme.status.primaryImage" default="Primary Image" /></span>
					
					
					<span class="property-value" aria-labelledby="status-label"><g:img dir="/uploaded-files" file="${themeInstance.primaryImage}" width="400" alt=""/></span>
					
				</li>
				</g:if>
				
				<g:if test="${images.size() > 0}">
				<li class="fieldcontain">
					<span id="images-label" class="property-label"><g:message code="theme.images.label" default="Images" /></span>
					
						<g:each in="${images}" var="img">
							<span class="property-value" aria-labelledby="colors-label">
								${img.name}<br/>
								<img class="thumbnail" height="100" width="100" src='${createLink(controller: "theme", action: "displayImage", params:[img: img.name, themeId: themeInstance?.id])}' />
							</span>
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
