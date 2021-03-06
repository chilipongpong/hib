<%@ page import="com.hizon.MenuItem" %>
<%@ page import="com.hizon.Status" %>
<%@ page import="com.hizon.Level" %>
<%@ page import="com.hizon.MenuCategory" %>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="menuItem.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${menuItemInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="menuItem.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" maxlength="250" value="${menuItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="menuItem.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values().name}" keys="${com.hizon.Status.values()*.name()}" required="" value="${menuItemInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="menuItem.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level" name="level.id" from="${Level.findAllByStatus(Status.ACTIVE)}" optionKey="id" required="" value="${menuItemInstance?.level?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'menuCategory', 'error')} required">
	<label for="menuCategory">
		<g:message code="menuItem.menuCategory.label" default="Menu Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="menuCategory" name="menuCategory.id" from="${MenuCategory.findAllByStatus(Status.ACTIVE)}" optionKey="id" required="" value="${menuItemInstance?.menuCategory?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'image', 'error')} required">
<label for="image">
		<g:message code="menuItem.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" name="newImage" style="margin-left: 222px" />
</div>

<g:if test="${menuItemInstance?.image}">
<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="menuItem.originalImage.label" default="Original Image" />
		
	</label>
	<span class="property-value" aria-labelledby="originalImage-label"><g:img dir="/uploaded-files" file="${menuItemInstance.image}" width="400" /></span>
</div>
</g:if>
