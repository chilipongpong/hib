
<%@ page import="com.hizon.ValueRange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valueRange.label', default: 'ValueRange')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../dashboard/navigation" />
		<g:render template="../dashboard/heading" />
	
		<!-- MAIN CONTENT -->
		<div class="container-fluid text-center" style="">
			<div class="container" style=>
				<div class="row">
					<!-- Left Menu -->
					<div class="col-md-2 col-lg-2 ed-content-nav">
						
					</div>
					<!-- End left menu -->
	
					<!-- main content area -->
					<div class="col-md-10 col-lg-10 ed-main-content" style="">
						<div id="show-valueRange" class="content scaffold-show" role="main">
							<h1><g:message code="default.show.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<ol class="property-list valueRange">
							
								<g:if test="${valueRangeInstance?.lowerLimit}">
								<li class="fieldcontain">
									<span id="lowerLimit-label" class="property-label"><g:message code="valueRange.lowerLimit.label" default="Lower Limit" /></span>
									
										<span class="property-value" aria-labelledby="lowerLimit-label"><g:fieldValue bean="${valueRangeInstance}" field="lowerLimit"/></span>
									
								</li>
								</g:if>
							
								<g:if test="${valueRangeInstance?.upperLimit}">
								<li class="fieldcontain">
									<span id="upperLimit-label" class="property-label"><g:message code="valueRange.upperLimit.label" default="Upper Limit" /></span>
									
										<span class="property-value" aria-labelledby="upperLimit-label"><g:fieldValue bean="${valueRangeInstance}" field="upperLimit"/></span>
									
								</li>
								</g:if>
							
							</ol>
							<g:form>
								<g:hiddenField name="id" value="${valueRangeInstance?.id}" />
								<!--Interaction buttons-->
								<div class="row">
									<div class="col-md-12 col-lg-12"
										style="border-top: 1px solid #fff;">
										<div class="row">
											<div class="col-md-12 col-lg-12 ed-action-btn">
												<g:link class="btn ed-save" action="edit" id="${valueRangeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
												<g:actionSubmit class="btn ed-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
											</div>
										</div>
									</div>
								</div>
								<!--/Interaction buttons-->
							</g:form>
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