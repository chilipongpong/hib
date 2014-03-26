
<%@ page import="com.hizon.SuperAdmin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'superAdmin.label', default: 'Super Admin')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-superAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<g:render template="../dashboard/navigation" />
		
		<div id="show-superAdmin" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list superAdmin">
				<g:if test="${superAdminInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="username"/></span>
				</li>
				</g:if>
			
				<g:if test="${superAdminInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="firstName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="lastName"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="email"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.mobile.label" default="Mobile" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="mobile"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.phone.label" default="Phone" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="phone"/></span>
				</li>
				</g:if>
				
				<g:if test="${superAdminInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="enabled"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="accountExpired"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="accountLocked"/></span>
				</li>
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${superAdminInstance?.user}" field="passwordExpired"/></span>
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${superAdminInstance?.id}" />
					<g:link class="edit" action="edit" id="${superAdminInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
