
<%@ page import="com.hizon.Color"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'color.label', default: 'color')}" />
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
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<h3>Search Results</h3>
						<g:form action="search" method="get" class="search">
							<g:textField name="q" value="${params.q}" />
							<g:submitButton name="search" />
						</g:form>
						<br />
						<g:set var="haveResults" value="${colorInstanceList?.results}" />
						
						<g:if test="${haveResults}">
							<table>
								<thead>
									<tr>
				
										<g:sortableColumn property="name"
											title="${message(code: 'color.name.label', default: 'Name')}" />
				
										<g:sortableColumn property="pantone"
											title="${message(code: 'color.pantone.label', default: 'Pantone')}" />
										
										<g:sortableColumn property="hex"
											title="${message(code: 'color.hex.label', default: 'Hex')}" />
											
										<g:sortableColumn property="status"
											title="${message(code: 'color.status.label', default: 'Status')}" />
									
									</tr>
								</thead>
								<tbody>
								<g:set var="totalPages" value="${Math.ceil(colorInstanceList.total / colorInstanceList.max)}" />
									<g:each in="${colorInstanceList.results}" status="i"
										var="colorInstance">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
											<td>
												<g:link action="show" id="${colorInstance.id}">
													${fieldValue(bean: colorInstance, field: "name")}
												</g:link>
											</td>
				
											<td>
												${fieldValue(bean: colorInstance, field: "pantone")}
											</td>
				
											<td>
												${fieldValue(bean: colorInstance, field: "hex")}
											</td>
				
											<td>
												${fieldValue(bean: colorInstance, field: "status.name")}
											</td>
																		
										</tr>
									</g:each>
								</tbody>
							</table>
							<div class="paginateButtons">
							<g:paginate params="[q: params.q]" total="${colorInstanceList.total}"/>
				
				            </div>
						</g:if>
						<g:else>
							<br />
							<h3>Sorry, no Colors found</h3>
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