<%@ page import="com.hizon.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<g:render template="../dashboard/heading" />

	<!-- MAIN CONTENT -->
	<div class="container-fluid text-center" style="">
		<div class="container" style=>
			<div class="row">
				<!-- Left Menu -->
				<div class="col-md-2 col-lg-2 ed-content-nav"></div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-10 col-lg-10 ed-main-content" style="">
					<div id="edit-client" class="content scaffold-edit" role="main">
						<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
							<h1>
								<g:message code="default.edit.label" args="[entityName]" />
							</h1>
						</sec:ifAnyGranted>
						<sec:ifAnyGranted roles="ROLE_CLIENT">
							<h1>
								<img src="../../images/head-profile.png" alt="My Profile">Edit
								My Profile
							</h1>
						</sec:ifAnyGranted>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:hasErrors bean="${clientInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${clientInstance}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<g:hasErrors bean="${clientInstance.user}">
							<ul class="errors" role="alert">
								<g:eachError bean="${clientInstance.user}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<g:form method="post">
							<g:hiddenField name="id" value="${clientInstance?.id}" />
							<g:hiddenField name="version" value="${clientInstance?.version}" />
							<fieldset class="form">
								<g:render template="form" />
							</fieldset>
							<!--Interaction buttons-->
							<div class="row">
								<div class="col-md-12 col-lg-12"
									style="border-top: 1px solid #fff;">
									<div class="row">
										<div class="col-md-12 col-lg-12 ed-action-btn">
											<g:actionSubmit class="btn ed-save" action="update"
												value="${message(code: 'default.button.update.label', default: 'Update')}" />
											<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
												<g:actionSubmit class="btn ed-delete" action="delete"
													value="${message(code: 'default.button.delete.label', default: 'Delete')}"
													formnovalidate=""
													onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
											</sec:ifAnyGranted>
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
