<%@ page import="com.hizon.UserAdmin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAdmin.label', default: 'User Admin')}" />
		<title><g:message code="default.dashboard.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="loggedInUserAdminId" value="${clientId}" scope="session"></g:set>
		<g:render template="../dashboard/navigation" />
		<!-- Heading -->
	    <div class="container-fluid text-center ed-title-head">
	        <div class="container" style="">
	            <div class="row">
	                <div class="col-md-12 col-lg-12"><h1>Dashboard</h1></div>
	            </div>
	
	        </div>
	    </div>
	    <!-- End Heading -->
	</body>
</html>
