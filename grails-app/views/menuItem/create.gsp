<%@ page import="com.hizon.MenuItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuItem.label', default: 'MenuItem')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<r:require modules="uploadr"/>
	</head>
	<body>
		<a href="#create-menuItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-menuItem" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${menuItemInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${menuItemInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm action="save" >
				<fieldset class="form">
					<g:render template="form"/>
					<uploadr:add name="uploadrTemp" path="${imagesPath}" maxVisible="8" unsupported="/my/controller/action" allowedExtensions="gif,png,jpg,jpeg,GIF,PNG,JPG,JPEG" viewable="false" downloadable="false" maxSize="${imageMaxSize}" >
					<g:each in="${images}" var="image">
					    <uploadr:file name="${image.name}">
					        <uploadr:fileSize>${image.size()}</uploadr:fileSize>
					    </uploadr:file>
					</g:each>
				</uploadr:add>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
