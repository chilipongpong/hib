<%@ page import="com.hizon.BundledItem" %>



<div class="fieldcontain ${hasErrors(bean: bundledItemInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bundledItem.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${bundledItemInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bundledItemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="bundledItem.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" maxlength="250" value="${bundledItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bundledItemInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="bundledItem.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${bundledItemInstance.constraints.status.inList}" required="" value="${bundledItemInstance?.status}" valueMessagePrefix="bundledItem.status"/>
</div>

