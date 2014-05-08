<%@ page import="com.hizon.Planner" %>
<%@ page import="com.hizon.PlannerSupervisor" %>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.username" maxlength="100" required="" value="${plannerInstance?.user?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="user.password" maxlength="100" required="" value="${plannerInstance?.user?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
	</label>
	<g:checkBox name="user.enabled" value="${plannerInstance?.user ? plannerInstance?.user?.enabled : true}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.firstName" maxlength="100" required="" value="${plannerInstance?.user?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user.lastName" maxlength="100" required="" value="${plannerInstance?.user?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="user.email" maxlength="100" required="" value="${plannerInstance?.user?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="user.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="user.mobile" pattern="${plannerInstance?.user?.constraints?.mobile?.matches}" value="${plannerInstance?.user?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance.user, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="user.phone" pattern="${plannerInstance?.user?.constraints?.phone?.matches}" value="${plannerInstance?.user?.phone}"/>
</div>

<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: plannerInstance, field: 'plannerSupervisor', 'error')} required">
		<label for="Planner Supervisor">
			<g:message code="planner.plannerSupervisor.label" default="Planner Supervisor" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="plannerSupervisor" name="plannerSupervisor.id" from="${PlannerSupervisor.list()}" optionKey="id" required="" value="${plannerInstance?.plannerSupervisor?.id}" class="many-to-one"/>
	</div>
</sec:ifAnyGranted>