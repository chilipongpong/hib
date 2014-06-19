
<%@ page import="com.hizon.Planner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planner.label', default: 'Planner')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<div id="show-planner" class="content scaffold-show" role="main">
							<h1><g:message code="default.show.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<ol class="property-list planner">
							
								<g:if test="${plannerInstance?.user}">
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="username"/></span>
								</li>
								</g:if>
							
								<g:if test="${plannerInstance?.user}">
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="firstName"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="lastName"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="email"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.mobile.label" default="Mobile" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="mobile"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.phone.label" default="Phone" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="phone"/></span>
								</li>
								</g:if>
								
								<g:if test="${plannerInstance?.user}">
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="enabled"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="accountExpired"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="accountLocked"/></span>
								</li>
								<li class="fieldcontain">
									<span id="user-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
									<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="passwordExpired"/></span>
								</li>
								</g:if>
								
							</ol>
							
							<g:form>
								<g:hiddenField name="id" value="${plannerInstance?.id}" />
								<!--Interaction buttons-->
								<div class="row">
									<div class="col-md-12 col-lg-12"
										style="border-top: 1px solid #fff;">
										<div class="row">
											<div class="col-md-12 col-lg-12 ed-action-btn">
												<sec:ifAnyGranted roles="ROLE_PLANNER, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
												<g:link class="btn ed-save" action="edit" id="${plannerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
												</sec:ifAnyGranted>
												<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
													<g:actionSubmit class="btn ed-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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