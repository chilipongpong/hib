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

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.firstName" maxlength="100" required="" value="${contentManagerInstance?.user?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.lastName" maxlength="100" required="" value="${contentManagerInstance?.user?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="user.email" maxlength="100" required="" value="${contentManagerInstance?.user?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="user.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="user.mobile" pattern="${contentManagerInstance?.user?.constraints?.mobile?.matches}" value="${contentManagerInstance?.user?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentManagerInstance.user, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="user.phone" pattern="${contentManagerInstance?.user?.constraints?.phone?.matches}" value="${contentManagerInstance?.user?.phone}"/>
</div>
