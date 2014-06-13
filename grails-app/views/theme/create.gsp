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
		<g:render template="../dashboard/navigation" />
		<g:render template="../dashboard/heading" />
	
		<!-- MAIN CONTENT -->
		<div class="container-fluid text-center" style="">
			<div class="container" style=>
				<div class="row">
					<!-- Left Menu -->
					<div class="col-md-2 col-lg-2 ed-content-nav">
						
					</div>
					<!-- End left menu -->
	
					<!-- main content area -->
					<div class="col-md-10 col-lg-10 ed-main-content" style="">
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
							<g:uploadForm action="save" enctype="multipart/form-data" >
								<fieldset class="form">
									<g:render template="form"/>
									
									<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'images', 'error')}">
										<label for="status" style="margin-top: 1em">
											<g:message code="theme.images.label" default="Images" />
										</label>
										<div style="margin-left: 222px">
											<uploadr:add name="uploadrTemp" path="${imagesPath}" maxVisible="8" unsupported="/my/controller/action" allowedExtensions="gif,png,jpg,jpeg,GIF,PNG,JPG,JPEG" viewable="false" downloadable="false" maxSize="${imageMaxSize}">
												<g:each in="${images}" var="image">
												    <uploadr:file name="${image.name}">
												        <uploadr:fileSize>${image.size()}</uploadr:fileSize>
												    </uploadr:file>
												</g:each>
											</uploadr:add>
										</div>
									</div>
								</fieldset>
								<!--Interaction buttons-->
								<div class="row">
									<div class="col-md-12 col-lg-12"
										style="border-top: 1px solid #fff;">
										<div class="row">
											<div class="col-md-12 col-lg-12 ed-action-btn">
												<g:submitButton id="save" name="create" class="btn ed-save" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
											</div>
										</div>
									</div>
								</div>
								<!--/Interaction buttons-->
							</g:uploadForm>
						</div>
					</div>
					<!--  end main content area -->
				</div>
				<!--  end row -->
			</div>
			<!-- end container -->
		</div>
		<!--  end MAIN CONTENT -->
	
	</body>
</html>