
<%@ page import="com.hizon.Planner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planner.label', default: 'Planner')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-planner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-planner" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list planner">
			
				<g:if test="${plannerInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="username"/></span>
				</li>
				</g:if>
			
				<g:if test="${plannerInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.firstName.label" default="First Name" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${plannerInstance?.profile}" field="firstName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.lastName.label" default="Last Name" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${plannerInstance?.profile}" field="lastName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.email.label" default="Email" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${plannerInstance?.profile}" field="email"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.mobile.label" default="Mobile" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${plannerInstance?.profile}" field="mobile"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.phone.label" default="Phone" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${plannerInstance?.profile}" field="phone"/></span>
				</li>
				</g:if>
				
				<g:if test="${plannerInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="enabled"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="accountExpired"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="accountLocked"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="passwordExpired"/></span>
				</li>
				</g:if>
				
				<g:if test="${plannerInstance?.clients}">
				<li class="fieldcontain">
					<span id="clients-label" class="property-label"><g:message code="planner.clients.label" default="Clients" /></span>
						<g:each in="${plannerInstance.clients}" var="c">
						<span class="property-value" aria-labelledby="clients-label"><g:link controller="client" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${plannerInstance?.id}" />
					<g:link class="edit" action="edit" id="${plannerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
