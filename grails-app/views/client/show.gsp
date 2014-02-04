
<%@ page import="com.hizon.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				
				<g:if test="${clientInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="username"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="enabled"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="accountExpired"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="accountLocked"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="passwordExpired"/></span>
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.firstName.label" default="First Name" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${clientInstance?.profile}" field="firstName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.lastName.label" default="Last Name" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${clientInstance?.profile}" field="lastName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.email.label" default="Email" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${clientInstance?.profile}" field="email"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.mobile.label" default="Mobile" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${clientInstance?.profile}" field="mobile"/></span>
				</li>
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="profile.phone.label" default="Phone" /></span>
					<span class="property-value" aria-labelledby="profile-label"><g:fieldValue bean="${clientInstance?.profile}" field="phone"/></span>
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.planner}">
				<li class="fieldcontain">
					<span id="planner-label" class="property-label"><g:message code="client.planner.label" default="Planner" /></span>
					<span class="property-value" aria-labelledby="planner-label"><g:link controller="planner" action="show" id="${clientInstance?.planner?.id}">${clientInstance?.planner?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
					<g:link class="edit" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
