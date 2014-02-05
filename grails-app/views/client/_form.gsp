<%@ page import="com.hizon.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" required="" value="${clientInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" required="" value="${clientInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.profile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.firstName" maxlength="100" required="" value="${clientInstance?.profile?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.profile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profile.lastName" maxlength="100" required="" value="${clientInstance?.profile?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.profile, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="profile.email" maxlength="100" required="" value="${clientInstance?.profile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.profile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="profile.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="profile.mobile" pattern="${clientInstance?.profile?.constraints?.mobile?.matches}" value="${clientInstance?.profile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.profile, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="profile.phone" pattern="${clientInstance?.profile?.constraints?.phone?.matches}" value="${clientInstance?.profile?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'planner', 'error')} ">
	<label for="planner">
		<g:message code="client.planner.label" default="Planner" />
		
	</label>
	<g:select id="planner" name="planner.id" from="${com.hizon.Planner.list()}" optionKey="id" value="${clientInstance?.planner?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>