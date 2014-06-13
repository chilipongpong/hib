<%@ page import="com.hizon.Color" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'color.label', default: 'Color')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
						<div id="create-color" class="content scaffold-create" role="main">
							<h1><g:message code="default.create.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<g:hasErrors bean="${colorInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${colorInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
							</g:hasErrors>
							<g:form action="save" >
								<fieldset class="form">
									<g:render template="form"/>
								</fieldset>
								<!--Interaction buttons-->
								<div class="row">
									<div class="col-md-12 col-lg-12"
										style="border-top: 1px solid #fff;">
										<div class="row">
											<div class="col-md-12 col-lg-12 ed-action-btn">
												<g:submitButton name="create" class="btn ed-save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
											</div>
										</div>
									</div>
								</div>
								<!--/Interaction buttons-->
							</g:form>
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