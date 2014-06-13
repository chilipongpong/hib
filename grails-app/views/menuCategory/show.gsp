
<%@ page import="com.hizon.MenuCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuCategory.label', default: 'MenuCategory')}" />
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
						<div id="show-menuCategory" class="content scaffold-show" role="main">
							<h1><g:message code="default.show.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<ol class="property-list menuCategory">
							
								<g:if test="${menuCategoryInstance?.name}">
								<li class="fieldcontain">
									<span id="name-label" class="property-label"><g:message code="menuCategory.name.label" default="Name" /></span>
									
										<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${menuCategoryInstance}" field="name"/></span>
									
								</li>
								</g:if>
							
								<g:if test="${menuCategoryInstance?.description}">
								<li class="fieldcontain">
									<span id="description-label" class="property-label"><g:message code="menuCategory.description.label" default="Description" /></span>
									
										<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${menuCategoryInstance}" field="description"/></span>
									
								</li>
								</g:if>
							
								<g:if test="${menuCategoryInstance?.status}">
								<li class="fieldcontain">
									<span id="status-label" class="property-label"><g:message code="menuCategory.status.label" default="Status" /></span>
									
										<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${menuCategoryInstance}" field="status.name"/></span>
									
								</li>
								</g:if>
								
								<g:if test="${menuCategoryInstance?.image}">
								<li class="fieldcontain">
									<span id="image-label" class="property-label"><g:message code="menuCategory.image.label" default="Image" /></span>
									
									<span class="property-value" aria-labelledby="image-label"><g:img dir="/uploaded-files" file="${menuCategoryInstance.image}" width="400" alt=""/></span>
									
								</li>
								</g:if>
							
							</ol>
							<sec:ifAnyGranted roles="ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN">
								<g:form>
									<g:hiddenField name="id" value="${menuCategoryInstance?.id}" />
									<!--Interaction buttons-->
									<div class="row">
										<div class="col-md-12 col-lg-12"
											style="border-top: 1px solid #fff;">
											<div class="row">
												<div class="col-md-12 col-lg-12 ed-action-btn">
													<g:link class="btn ed-save" action="edit" id="${menuCategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
													<g:actionSubmit class="btn ed-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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