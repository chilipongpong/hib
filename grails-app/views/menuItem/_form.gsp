<%@ page import="com.hizon.MenuItem" %>



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
	<g:select name="status" from="${menuItemInstance.constraints.status.inList}" required="" value="${menuItemInstance?.status}" valueMessagePrefix="menuItem.status"/>
</div>

<div
	class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'image', 'error')} required">
	<g:if test="${menuItemInstance?.image == null }">
		<label for="image"> <g:message code="menuItem.image.label"
				default="Image" />
		</label>
		<input type="file" name="image" id="image"/>
	</g:if>
	<g:else>
		<label for="image"> <g:message code="menuItem.image.label"
				default="Image" />
		</label>
			<g:img file="${menuItemInstance.image}" dir="uploaded-files" width="200"/>
	</g:else>
	
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="menuItem.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="level" maxlength="50" required="" value="${menuItemInstance?.level}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'menuCategory', 'error')} required">
	<label for="menuCategory">
		<g:message code="menuItem.menuCategory.label" default="Menu Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="menuCategory" name="menuCategory.id" from="${com.hizon.MenuCategory.list()}" optionKey="id" required="" value="${menuItemInstance?.menuCategory?.id}" class="many-to-one"/>
</div>


