<%@ page import="com.hizon.MenuCategory" %>



<div class="fieldcontain ${hasErrors(bean: menuCategoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="menuCategory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${menuCategoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuCategoryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="menuCategory.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" maxlength="250" value="${menuCategoryInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuCategoryInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="menuCategory.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values().name}" keys="${com.hizon.Status.values()*.name()}" required="" value="${menuCategoryInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuCategoryInstance, field: 'image', 'error')} required">
<label for="image">
		<g:message code="menuCategory.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" name="newImage" style="margin-left: 222px"/>
</div>

<g:if test="${menuCategoryInstance?.image}">
<div class="fieldcontain ${hasErrors(bean: menuCategoryInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="menuCategory.originalImage.label" default="Original Image" />
		
	</label>
	<span class="property-value" aria-labelledby="image-label"><g:img dir="/uploaded-files" file="${menuCategoryInstance?.image}" width="400" /></span>
</div>
</g:if>