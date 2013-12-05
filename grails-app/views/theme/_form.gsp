<%@ page import="com.hizon.Theme" %>



<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="theme.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${themeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="theme.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="250" value="${themeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'colors', 'error')} ">
	<label for="colors">
		<g:message code="theme.colors.label" default="Colors" />
		
	</label>
	<g:select name="colors" from="${com.hizon.Color.list()}" multiple="multiple" optionKey="id" size="5" value="${themeInstance?.colors*.id}" class="many-to-many"/>
</div>

