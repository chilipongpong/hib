<%@ page import="com.hizon.Client" %>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" maxlength="100" required="" value="${clientInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" maxlength="100" required="" value="${clientInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.firstName" maxlength="100" required="" value="${clientInstance?.user?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.lastName" maxlength="100" required="" value="${clientInstance?.user?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="user.email" maxlength="100" required="" value="${clientInstance?.user?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="user.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="user.mobile" pattern="${clientInstance?.user?.constraints?.mobile?.matches}" value="${clientInstance?.user?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="user.phone" pattern="${clientInstance?.user?.constraints?.phone?.matches}" value="${clientInstance?.user?.phone}"/>
</div>

<g:if test="${clientInstance?.planner}">
	<div class="fieldcontain">
		<span id="planner-label" class="property-label"><g:message
				code="client.planner.label" default="Planner" /></span> <span
			class="property-value" aria-labelledby="planner-label"><g:link
				controller="planner" action="show"
				id="${clientInstance?.planner?.id}">
				${clientInstance?.planner?.encodeAsHTML()}
			</g:link></span>
	</div>
</g:if>

<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'planner', 'error')} ">
	<label for="planner">
		<g:message code="client.planner.label" default="Planner" />
		
	</label>
	<g:select id="planner" name="planner.id" from="${com.hizon.Planner.list()}" optionKey="id" value="${clientInstance?.planner?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance.user, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
	</label>
	<g:checkBox name="user.enabled" value="${clientInstance?.user ? clientInstance?.user?.enabled : true}"/>
</div>
</sec:ifAnyGranted>