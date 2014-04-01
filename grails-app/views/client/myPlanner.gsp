
<%@ page import="com.hizon.Planner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planner.label', default: 'Planner')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-planner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<g:render template="../dashboard/navigation" />
		
		<div id="show-planner" class="content scaffold-show" role="main">
			<h1><img src="../images/head-planner.png" alt="Themes">My Planner</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list planner">
			
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
						<span id="user-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${plannerInstance?.user}" field="username"/></span>
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
			</ol>
		</div>
	</body>
</html>
