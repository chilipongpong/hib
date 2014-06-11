
<%@ page import="com.hizon.Planner"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planner.label', default: 'Planner')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img class="clientIcon" src="../images/head-planner.png" alt="My Planner"> My Planner</h1>
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
				<div class="col-md-3 col-lg-3 ed-content-nav">
					
				</div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<div id="show-planner" class="content scaffold-show" role="main">
		
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list planner">

			<g:if test="${plannerInstance?.user}">
				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message
							code="user.firstName.label" default="First Name" /></span> <span
					class="property-value" aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="firstName" /></span></li>
				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="user.lastName.label"
							default="Last Name" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="lastName" /></span></li>
				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="user.email.label"
							default="Email" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="email" /></span></li>

				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="user.username.label"
							default="Username" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="username" /></span></li>

				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="user.mobile.label"
							default="Mobile" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="mobile" /></span></li>
				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="user.phone.label"
							default="Phone" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:fieldValue
							bean="${plannerInstance?.user}" field="phone" /></span></li>
			</g:if>
		</ol>
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



