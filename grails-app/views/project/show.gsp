
<%@ page import="com.hizon.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<g:if test="${projectInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="project.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.craNumber}">
				<li class="fieldcontain">
					<span id="craNumber-label" class="property-label"><g:message code="project.craNumber.label" default="Cra Number" /></span>
					
						<span class="property-value" aria-labelledby="craNumber-label"><g:fieldValue bean="${projectInstance}" field="craNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="project.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${projectInstance?.client?.id}">${projectInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.planner}">
				<li class="fieldcontain">
					<span id="planner-label" class="property-label"><g:message code="project.planner.label" default="Planner" /></span>
					
						<span class="property-value" aria-labelledby="planner-label"><g:link controller="planner" action="show" id="${projectInstance?.planner?.id}">${projectInstance?.planner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="project.venue.label" default="Venue" /></span>
					
						<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${projectInstance}" field="venue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.salesAgent}">
				<li class="fieldcontain">
					<span id="salesAgent-label" class="property-label"><g:message code="project.salesAgent.label" default="Sales Agent" /></span>
					
						<span class="property-value" aria-labelledby="salesAgent-label"><g:fieldValue bean="${projectInstance}" field="salesAgent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.numberOfGuests}">
				<li class="fieldcontain">
					<span id="numberOfGuests-label" class="property-label"><g:message code="project.numberOfGuests.label" default="Number Of Guests" /></span>
					
						<span class="property-value" aria-labelledby="numberOfGuests-label"><g:fieldValue bean="${projectInstance}" field="numberOfGuests"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.bundledItem}">
				<li class="fieldcontain">
					<span id="bundledItem-label" class="property-label"><g:message code="project.bundledItem.label" default="Bundled Item" /></span>
					
						<span class="property-value" aria-labelledby="bundledItem-label"><g:link controller="bundledItem" action="show" id="${projectInstance?.bundledItem?.id}">${projectInstance?.bundledItem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.eventDate}">
				<li class="fieldcontain">
					<span id="eventDate-label" class="property-label"><g:message code="project.eventDate.label" default="Event Date" /></span>
					
						<span class="property-value" aria-labelledby="eventDate-label"><g:formatDate date="${projectInstance?.eventDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.freebies}">
				<li class="fieldcontain">
					<span id="freebies-label" class="property-label"><g:message code="project.freebies.label" default="Freebies" /></span>
					
						<span class="property-value" aria-labelledby="freebies-label"><g:fieldValue bean="${projectInstance}" field="freebies"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.pricePerHead}">
				<li class="fieldcontain">
					<span id="pricePerHead-label" class="property-label"><g:message code="project.pricePerHead.label" default="Price Per Head" /></span>
					
						<span class="property-value" aria-labelledby="pricePerHead-label"><g:fieldValue bean="${projectInstance}" field="pricePerHead"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.serviceStyle}">
				<li class="fieldcontain">
					<span id="serviceStyle-label" class="property-label"><g:message code="project.serviceStyle.label" default="Service Style" /></span>
					
						<span class="property-value" aria-labelledby="serviceStyle-label"><g:fieldValue bean="${projectInstance}" field="serviceStyle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${projectInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.theme}">
				<li class="fieldcontain">
					<span id="theme-label" class="property-label"><g:message code="project.theme.label" default="Theme" /></span>
					
						<span class="property-value" aria-labelledby="theme-label"><g:link controller="theme" action="show" id="${projectInstance?.theme?.id}">${projectInstance?.theme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.colors}">
				<li class="fieldcontain">
					<span id="colors-label" class="property-label"><g:message code="project.colors.label" default="Colors" /></span>
					
						<g:each in="${projectInstance.colors}" var="c">
						<span class="property-value" aria-labelledby="colors-label"><g:link controller="color" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.menuItems}">
				<li class="fieldcontain">
					<span id="menuItems-label" class="property-label"><g:message code="project.menuItems.label" default="MenuItems" /></span>
					
						<g:each in="${projectInstance.menuItems}" var="c">
						<span class="property-value" aria-labelledby="menuItems-label"><g:link controller="menuItem" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
