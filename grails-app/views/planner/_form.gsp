<%@ page import="com.hizon.Planner" %>



<div class="fieldcontain ${hasErrors(bean: plannerInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="planner.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${com.hizon.Profile.list()}" optionKey="id" required="" value="${plannerInstance?.profile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plannerInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="planner.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.hizon.User.list()}" optionKey="id" required="" value="${plannerInstance?.user?.id}" class="many-to-one"/>
</div>

