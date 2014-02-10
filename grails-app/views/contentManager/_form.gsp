<%@ page import="com.hizon.ContentManager" %>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" maxlength="100" required="" value="${contentManagerInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" maxlength="100" required="" value="${contentManagerInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
	</label>
	<g:checkBox name="user.enabled" value="${contentManagerInstance?.user ? contentManagerInstance?.user?.enabled : true}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.profile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.firstName" maxlength="100" required="" value="${contentManagerInstance?.profile?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.profile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.lastName" maxlength="100" required="" value="${contentManagerInstance?.profile?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.profile, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="profile.email" maxlength="100" required="" value="${contentManagerInstance?.profile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.profile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="profile.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="profile.mobile" pattern="${contentManagerInstance?.profile?.constraints?.mobile?.matches}" value="${contentManagerInstance?.profile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.profile, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="profile.phone" pattern="${contentManagerInstance?.profile?.constraints?.phone?.matches}" value="${contentManagerInstance?.profile?.phone}"/>
</div>