
<%@ page import="com.hizon.MenuCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuCategory.label', default: 'MenuCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-menuCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="show-menuCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list menuCategory">
			
				<g:if test="${menuCategoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="menuCategory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${menuCategoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuCategoryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="menuCategory.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${menuCategoryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuCategoryInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="menuCategory.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${menuCategoryInstance}" field="status.name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${menuCategoryInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="menuCategory.image.label" default="Image" /></span>
					
					<span class="property-value" aria-labelledby="image-label"><g:img dir="/uploaded-files" file="${menuCategoryInstance.image}" width="400" alt=""/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${menuCategoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${menuCategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
