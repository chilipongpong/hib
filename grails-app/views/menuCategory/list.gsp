
<%@ page import="com.hizon.MenuCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuCategory.label', default: 'MenuCategory')}" />
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
						<div id="list-menuCategory" class="content scaffold-list" role="main">
							<h1><g:message code="default.list.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
						<g:form class="search" action="search" method="get">
							<g:textField name="q" value="${params.q}" />
							<g:submitButton name="search" />
						</g:form>
						<br />
						<table>
								<thead>
									<tr>
									
										<g:sortableColumn property="name" title="${message(code: 'menuCategory.name.label', default: 'Name')}" />
									
										<g:sortableColumn property="description" title="${message(code: 'menuCategory.description.label', default: 'Description')}" />
									
										<g:sortableColumn property="status" title="${message(code: 'menuCategory.status.label', default: 'Status')}" />
									
									</tr>
								</thead>
								<tbody>
								<g:each in="${menuCategoryInstanceList}" status="i" var="menuCategoryInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
										<td><g:link action="show" id="${menuCategoryInstance.id}">${fieldValue(bean: menuCategoryInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: menuCategoryInstance, field: "description")}</td>
									
										<td>${fieldValue(bean: menuCategoryInstance, field: "status.name")}</td>
									
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="${menuCategoryInstanceTotal}" />
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