<%@ page import="com.hizon.Planner" %>



<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" required="" value="${plannerInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" required="" value="${plannerInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.profile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.firstName" maxlength="100" required="" value="${plannerInstance?.profile?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.profile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.lastName" maxlength="100" required="" value="${plannerInstance?.profile?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.profile, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="profile.email" maxlength="100" required="" value="${plannerInstance?.profile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.profile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="profile.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="profile.mobile" pattern="${plannerInstance?.profile?.constraints?.mobile?.matches}" value="${plannerInstance?.profile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.profile, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="profile.phone" pattern="${plannerInstance?.profile?.constraints?.phone?.matches}" value="${plannerInstance?.profile?.phone}"/>
</div>

