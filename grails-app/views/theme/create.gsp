<%@ page import="com.hizon.Theme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theme.label', default: 'Theme')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<r:require modules="uploadr"/>
	</head>
	<body>
		<a href="#create-theme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-theme" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${themeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${themeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" enctype="multipart/form-data" >
				<fieldset class="form">
					<g:render template="form"/>
					<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'primaryImage', 'error')}">
						<label for="status" style="margin-top: 1em">
							<g:message code="theme.primaryImage.label" default="Primary Image" />
						</label>
						<uploadr:add name="uploadrTemp1" path="${primaryImagePath}" maxVisible="8" unsupported="/my/controller/action" allowedExtensions="gif,png,jpg,jpeg,GIF,PNG,JPG,JPEG" viewable="false" downloadable="false" maxSize="${imageMaxSize}" >
							<g:each in="${primaryImages}" var="primaryImage">
							    <uploadr:file name="${primaryImage.name}">
							        <uploadr:fileSize>${primaryImage.size()}</uploadr:fileSize>
							    </uploadr:file>
							</g:each>
						</uploadr:add>
					</div>
					<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'images', 'error')}">
						<label for="status" style="margin-top: 1em">
							<g:message code="theme.images.label" default="Images" />
						</label>
						<uploadr:add name="uploadrTemp2" path="${imagesPath}" maxVisible="8" unsupported="/my/controller/action" allowedExtensions="gif,png,jpg,jpeg,GIF,PNG,JPG,JPEG" viewable="false" downloadable="false" maxSize="${imageMaxSize}" >
							<g:each in="${images}" var="image">
							    <uploadr:file name="${image.name}">
							        <uploadr:fileSize>${image.size()}</uploadr:fileSize>
							    </uploadr:file>
							</g:each>
						</uploadr:add>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton id="save" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
