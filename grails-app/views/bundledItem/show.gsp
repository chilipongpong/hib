
<%@ page import="com.hizon.BundledItem"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'bundledItem.label', default: 'Bundled Item')}" />
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
					<div id="show-bundledItem" class="content scaffold-show" role="main">
					<h3><g:message code="default.show.label" args="[entityName]" /></h3>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
					<ol class="property-list bundledItem">
			
						<g:if test="${bundledItemInstance?.name}">
							<li class="fieldcontain"><span id="name-label"
								class="property-label"><g:message
										code="bundledItem.name.label" default="Name" /></span> <span
								class="property-value" aria-labelledby="name-label"><g:fieldValue
										bean="${bundledItemInstance}" field="name" /></span></li>
						</g:if>
			
						<g:if test="${bundledItemInstance?.description}">
							<li class="fieldcontain"><span id="description-label"
								class="property-label"><g:message
										code="bundledItem.description.label" default="Description" /></span> <span
								class="property-value" aria-labelledby="description-label"><g:fieldValue
										bean="${bundledItemInstance}" field="description" /></span></li>
						</g:if>
			
						<g:if test="${bundledItemInstance?.status}">
							<li class="fieldcontain"><span id="status-label"
								class="property-label"><g:message
										code="bundledItem.status.label" default="Status" /></span> <span
								class="property-value" aria-labelledby="status-label"><g:fieldValue
										bean="${bundledItemInstance}" field="status.name" /></span></li>
						</g:if>
			
					</ol>
					<sec:ifAnyGranted roles="ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN">
						<g:form>
								<g:hiddenField name="id" value="${bundledItemInstance?.id}" />
								<!--Interaction buttons-->
								<div class="row">
									<div class="col-md-12 col-lg-12"
										style="border-top: 1px solid #fff;">
										<div class="row">
											<div class="col-md-12 col-lg-12 ed-action-btn">
												<g:link class="btn ed-edit" action="edit" id="${bundledItemInstance?.id}">
													<g:message code="default.button.edit.label" default="Edit" />
												</g:link>
												<g:actionSubmit class="btn ed-delete" action="delete"
													value="${message(code: 'default.button.delete.label', default: 'Delete')}"
													onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
											</div>
										</div>
									</div>
								</div>
								<!--/Interaction buttons-->
						</g:form>
					</sec:ifAnyGranted>
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