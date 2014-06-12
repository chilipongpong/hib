
<%@ page import="com.hizon.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<sec:ifAnyGranted
						roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN, ROLE_PLANNER_SUPERVISOR">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_CLIENT">
						<!-- Heading -->
						<div class="container-fluid text-center ed-title-head">
							<div class="container" style="">
								<div class="row">
									<div class="col-md-12 col-lg-12">
										<h1><img style="height: 40px" src="../../images/head-profile.png" alt="My Profile">My Profile</h1>
									</div>
								</div>

							</div>
						</div>
						<!-- End Heading -->
					</sec:ifAnyGranted>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->

	<!-- MAIN CONTENT -->
	<div class="container-fluid text-center" style="">
		<div class="container" style=>
			<div class="row">
				<!-- Left Menu -->
				<div class="col-md-3 col-lg-3 ed-content-nav"></div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<div id="show-client" class="content scaffold-show" role="main">
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<ol class="property-list client">


							<g:if test="${clientInstance?.user}">
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.username.label" default="Username" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="username" /></span></li>
							</g:if>

							<g:if test="${clientInstance?.user}">
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.firstName.label" default="First Name" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="firstName" /></span></li>
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.lastName.label" default="Last Name" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="lastName" /></span></li>
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.email.label" default="Email" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="email" /></span></li>
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.mobile.label" default="Mobile" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="mobile" /></span></li>
								<li class="fieldcontain"><span id="user-label"
									class="property-label"><g:message
											code="user.phone.label" default="Phone" /></span> <span
									class="property-value" aria-labelledby="user-label"><g:fieldValue
											bean="${clientInstance?.user}" field="phone" /></span></li>
							</g:if>

							<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
								<g:if test="${clientInstance?.user}">
									<li class="fieldcontain"><span id="user-label"
										class="property-label"><g:message
												code="user.enabled.label" default="Enabled" /></span> <span
										class="property-value" aria-labelledby="user-label"><g:fieldValue
												bean="${clientInstance?.user}" field="enabled" /></span></li>
									<li class="fieldcontain"><span id="user-label"
										class="property-label"><g:message
												code="user.accountExpired.label" default="Account Expired" /></span>
										<span class="property-value" aria-labelledby="user-label"><g:fieldValue
												bean="${clientInstance?.user}" field="accountExpired" /></span></li>
									<li class="fieldcontain"><span id="user-label"
										class="property-label"><g:message
												code="user.accountLocked.label" default="Account Locked" /></span>
										<span class="property-value" aria-labelledby="user-label"><g:fieldValue
												bean="${clientInstance?.user}" field="accountLocked" /></span></li>
									<li class="fieldcontain"><span id="user-label"
										class="property-label"><g:message
												code="user.passwordExpired.label" default="Password Expired" /></span>
										<span class="property-value" aria-labelledby="user-label"><g:fieldValue
												bean="${clientInstance?.user}" field="passwordExpired" /></span></li>
								</g:if>
							</sec:ifAnyGranted>


							<g:if test="${clientInstance?.planner}">
								<li class="fieldcontain"><span id="planner-label"
									class="property-label"><g:message
											code="client.planner.label" default="Planner" /></span> 
									<span class="property-value" aria-labelledby="planner-label">
									<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN, ROLE_PLANNER_SUPERVISOR">
										<g:link controller="planner" action="show" id="${clientInstance?.planner?.id}">${clientInstance?.planner?.encodeAsHTML()}</g:link>
									</sec:ifAnyGranted>
									<sec:ifAnyGranted roles="ROLE_CLIENT">
										${clientInstance?.planner}
									</sec:ifAnyGranted>
									</span>
								</li>
							</g:if>

						</ol>
						<g:form>
							<!--Interaction buttons-->
							<div class="row">
								<div class="col-md-12 col-lg-12"
									style="border-top: 1px solid #fff;">
									<div class="row">
										<div class="col-md-12 col-lg-12 ed-action-btn">
											<g:hiddenField name="id" value="${clientInstance?.id}" />
											<sec:ifAnyGranted
												roles="ROLE_CLIENT, ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
												<g:link class="edit" action="edit"
													id="${clientInstance?.id}">
													<g:message code="default.button.edit.label" default="Edit" />
												</g:link>
											</sec:ifAnyGranted>
											<sec:ifAnyGranted roles="ROLE_USER_ADMIN, ROLE_SUPER_ADMIN">
												<g:actionSubmit class="delete" action="delete"
													value="${message(code: 'default.button.delete.label', default: 'Delete')}"
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