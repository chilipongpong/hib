
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
		
		<g:render template="../dashboard/navigation" />
		
		<div id="show-client" class="content scaffold-show" role="main">
			<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN, ROLE_PLANNER_SUPERVISOR">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles="ROLE_CLIENT">
				<h1><img src="../../images/head-profile.png" alt="My Profile">My Profile</h1>
			</sec:ifAnyGranted>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				
				<g:if test="${clientInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="username"/></span>
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="firstName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="lastName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="email"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.mobile.label" default="Mobile" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="mobile"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.phone.label" default="Phone" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${clientInstance?.user}" field="phone"/></span>
				</li>
				</g:if>
				
				<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
					<g:if test="${clientInstance?.user}">
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
				</sec:ifAnyGranted>
			
				
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
					<sec:ifAnyGranted roles="ROLE_CLIENT, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
						<g:link class="edit" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</sec:ifAnyGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
