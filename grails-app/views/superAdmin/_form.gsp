<%@ page import="com.hizon.SuperAdmin" %>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" maxlength="100" required="" value="${superAdminInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" maxlength="100" required="" value="${superAdminInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
	</label>
	<g:checkBox name="user.enabled" value="${superAdminInstance?.user ? superAdminInstance?.user?.enabled : true}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.firstName" maxlength="100" required="" value="${superAdminInstance?.user?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.lastName" maxlength="100" required="" value="${superAdminInstance?.user?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="user.email" maxlength="100" required="" value="${superAdminInstance?.user?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="user.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="user.mobile" pattern="${superAdminInstance?.user?.constraints?.mobile?.matches}" value="${superAdminInstance?.user?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: superAdminInstance.user, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="user.phone" pattern="${superAdminInstance?.user?.constraints?.phone?.matches}" value="${superAdminInstance?.user?.phone}"/>
</div>

