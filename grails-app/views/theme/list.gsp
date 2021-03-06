
<%@ page import="com.hizon.Theme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'theme.label', default: 'Theme')}" />
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
						<div id="list-theme" class="content scaffold-list" role="main">
							<h1><g:message code="default.list.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<g:form action="search" method="get" class="search">
								<g:textField name="q" value="${params.q}" />
								<g:submitButton name="search" />
							</g:form>
							<br />
							<table>
								<thead>
									<tr>
									
										<g:sortableColumn property="name" title="${message(code: 'theme.name.label', default: 'Name')}" />
									
										<g:sortableColumn property="description" title="${message(code: 'theme.description.label', default: 'Description')}" />
										
										<g:sortableColumn property="level" title="${message(code: 'theme.level.label', default: 'Level')}" />
										
										<g:sortableColumn property="level" title="${message(code: 'theme.status.label', default: 'Status')}" />
									
									</tr>
								</thead>
								<tbody>
								<g:each in="${themeInstanceList}" status="i" var="themeInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
										<td><g:link action="show" id="${themeInstance.id}">${fieldValue(bean: themeInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: themeInstance, field: "description")}</td>
										
										<td>${fieldValue(bean: themeInstance, field: "level")}</td>
										
										<td>${fieldValue(bean: themeInstance, field: "status.name")}</td>
									
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="${themeInstanceTotal}" />
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