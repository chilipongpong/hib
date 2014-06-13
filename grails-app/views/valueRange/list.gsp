
<%@ page import="com.hizon.ValueRange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valueRange.label', default: 'ValueRange')}" />
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
						<div id="list-valueRange" class="content scaffold-list" role="main">
							<h1><g:message code="default.list.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<table>
								<thead>
									<tr>
									
										<g:sortableColumn property="lowerLimit" title="${message(code: 'valueRange.lowerLimit.label', default: 'Lower Limit')}" />
									
										<g:sortableColumn property="upperLimit" title="${message(code: 'valueRange.upperLimit.label', default: 'Upper Limit')}" />
									
									</tr>
								</thead>
								<tbody>
								<g:each in="${valueRangeInstanceList}" status="i" var="valueRangeInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
										<td><g:link action="show" id="${valueRangeInstance.id}">${fieldValue(bean: valueRangeInstance, field: "lowerLimit")}</g:link></td>
									
										<td>${fieldValue(bean: valueRangeInstance, field: "upperLimit")}</td>
									
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="${valueRangeInstanceTotal}" />
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