<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'theme')}" />
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
					<div id="list-Color" class="content scaffold-list" role="main">
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
							<g:set var="haveResults" value="${themeInstanceList?.results}" />
							
							<g:if test="${haveResults}">
								<table>
									<thead>
										<tr>
					
											<g:sortableColumn property="name"
												title="${message(code: 'theme.name.label', default: 'Name')}" />
					
											<g:sortableColumn property="pantone"
												title="${message(code: 'theme.description.label', default: 'Description')}" />
											
											<g:sortableColumn property="pantone"
												title="${message(code: 'theme.level.label', default: 'Level')}" />
												
											<g:sortableColumn property="status"
												title="${message(code: 'theme.status.label', default: 'Status')}" />
										
										</tr>
									</thead>
									<tbody>
									<g:set var="totalPages" value="${Math.ceil(themeInstanceList.total / themeInstanceList.max)}" />
										<g:each in="${themeInstanceList.results}" status="i"
											var="themeInstance">
											<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
												<td>
													<g:link action="show" id="${themeInstance.id}">
														${fieldValue(bean: themeInstance, field: "name")}
													</g:link>
												</td>
					
												<td>
													${fieldValue(bean: themeInstance, field: "description")}
												</td>
					
												<td>
													${fieldValue(bean: themeInstance, field: "level")}
												</td>
					
												<td>
													${fieldValue(bean: themeInstance, field: "status.name")}
												</td>
																			
											</tr>
										</g:each>
									</tbody>
								</table>
								<div class="paginateButtons">
								<g:paginate params="[q: params.q]" total="${themeInstanceList.total}"/>
					
					            </div>
							</g:if>
							<g:else>
								<br />
								<p>Sorry, no Themes found.</p>
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