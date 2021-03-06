
<%@ page import="com.hizon.BundledItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bundledItem.label', default: 'BundledItem')}" />
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
						<div id="list-bundledItem" class="content scaffold-list" role="main">
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
									
										<g:sortableColumn property="name" title="${message(code: 'bundledItem.name.label', default: 'Name')}" />
									
										<g:sortableColumn property="description" title="${message(code: 'bundledItem.description.label', default: 'Description')}" />
									
										<g:sortableColumn property="status" title="${message(code: 'bundledItem.status.label', default: 'Status')}" />
									
									</tr>
								</thead>
								<tbody>
								<g:each in="${bundledItemInstanceList}" status="i" var="bundledItemInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
										<td><g:link action="show" id="${bundledItemInstance.id}">${fieldValue(bean: bundledItemInstance, field: "name")}</g:link></td>
									
										<td>${fieldValue(bean: bundledItemInstance, field: "description")}</td>
									
										<td>${fieldValue(bean: bundledItemInstance, field: "status.name")}</td>
									
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="${bundledItemInstanceTotal}" />
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