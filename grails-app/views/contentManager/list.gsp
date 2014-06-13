
<%@ page import="com.hizon.ContentManager" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentManager.label', default: 'Content Manager')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../dashboard/navigation" />
		<g:render template="../dashboard/heading" />
	
		<!-- MAIN CONTENT -->
		<div class="container-fluid text-center" style="">
			<div class="container" style=>
				<div class="row">
					<!-- main content area -->
					<div class="col-md-12 col-lg-12 ed-main-content" style="">
						<div id="list-contentManager" class="content scaffold-list" role="main">
							<h1><g:message code="default.list.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<table>
								<thead>
									<tr>
										<g:sortableColumn property="user.username" title="${message(code: 'user.username.label', default: 'Username')}" />
										<g:sortableColumn property="user.firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
										<g:sortableColumn property="user.lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
										<g:sortableColumn property="user.email" title="${message(code: 'user.email.label', default: 'Email')}" />
									</tr>
								</thead>
								<tbody>
								<g:each in="${contentManagerInstanceList}" status="i" var="contentManagerInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td><g:link action="show" id="${contentManagerInstance.id}">${fieldValue(bean: contentManagerInstance.user, field: "username")}</g:link></td>
										<td>${fieldValue(bean: contentManagerInstance.user, field: "firstName")}</td>
										<td>${fieldValue(bean: contentManagerInstance.user, field: "lastName")}</td>
										<td>${fieldValue(bean: contentManagerInstance.user, field: "email")}</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="${contentManagerInstanceTotal}" />
							</div>
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