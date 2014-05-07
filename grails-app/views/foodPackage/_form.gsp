<%@ page import="com.hizon.FoodPackage" %>



<div class="fieldcontain ${hasErrors(bean: foodPackageInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="foodPackage.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level" name="level.id" from="${com.hizon.Level.list()}" optionKey="id" required="" value="${foodPackageInstance?.level?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodPackageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="foodPackage.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${foodPackageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodPackageInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="foodPackage.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${foodPackageInstance.number}" required=""/>
</div>

