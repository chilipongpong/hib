<%@ page import="com.hizon.Level" %>



<div class="fieldcontain ${hasErrors(bean: levelInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="level.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${levelInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: levelInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="level.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" maxlength="250" value="${levelInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: levelInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="level.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values().name}" keys="${com.hizon.Status.values()*.name()}" required="" value="${levelInstance?.status?.name()}"/>
</div>

