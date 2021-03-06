
<%@ page import="com.hizon.MenuCategory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'menuCategory.label', default: 'MenuCategory')}" />
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
						<h3>Search Results</h3>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:form action="search" method="get" class="search">
							<g:textField name="q" value="${params.q}" />
							<g:submitButton name="search" />
						</g:form>
						<br />
						<g:set var="haveResults" value="${menuCategoryInstanceList?.results}" />
						
						<g:if test="${haveResults}">
							<table>
								<thead>
									<tr>
				
										<g:sortableColumn property="name"
											title="${message(code: 'menuCategory.name.label', default: 'Name')}" />
				
										<g:sortableColumn property="description"
											title="${message(code: 'menuCategory.description.label', default: 'Description')}" />
				
										<g:sortableColumn property="status"
											title="${message(code: 'menuCategory.status.label', default: 'Status')}" />
				
									</tr>
								</thead>
								<tbody>
								<g:set var="totalPages" value="${Math.ceil(menuCategoryInstanceList.total / menuCategoryInstanceList.max)}" />
									<g:each in="${menuCategoryInstanceList.results}" status="i"
										var="menuCategoryInstance">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
											<td><g:link action="show" id="${menuCategoryInstance.id}">
													${fieldValue(bean: menuCategoryInstance, field: "name")}
												</g:link></td>
				
											<td>
												${fieldValue(bean: menuCategoryInstance, field: "description")}
											</td>
				
											<td>
												${fieldValue(bean: menuCategoryInstance, field: "status.name")}
											</td>
				
										</tr>
									</g:each>
								</tbody>
							</table>
							<div class="paginateButtons">
							<g:paginate params="[q: params.q]" total="${menuCategoryInstanceList.total}"/>
				
				            </div>
						</g:if>
						<g:else>
							<br />
							<p>Sorry, no Menu Categories found</p>
						</g:else>
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