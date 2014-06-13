
<%@ page import="com.hizon.Color" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'color.label', default: 'Color')}" />
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
						<div id="show-color" class="content scaffold-show" role="main">

							<h1><g:message code="default.show.label" args="[entityName]" /></h1>
							<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
							</g:if>
							<ol class="property-list color">
							
								<g:if test="${colorInstance?.name}">
								<li class="fieldcontain">
									<span id="name-label" class="property-label"><g:message code="color.name.label" default="Name" /></span>
									
										<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${colorInstance}" field="name"/></span>
									
								</li>
								</g:if>
							
								<g:if test="${colorInstance?.pantone}">
								<li class="fieldcontain">
									<span id="pantone-label" class="property-label"><g:message code="color.pantone.label" default="Pantone" /></span>
									
										<span class="property-value" aria-labelledby="pantone-label"><g:fieldValue bean="${colorInstance}" field="pantone"/></span>
									
								</li>
								</g:if>
							
								<g:if test="${colorInstance?.hex}">
								<li class="fieldcontain">
									<span id="hex-label" class="property-label"><g:message code="color.hex.label" default="Hex" /></span>
										<span class="property-value" aria-labelledby="hex-label"><g:fieldValue bean="${colorInstance}" field="hex"/></span><br>
										<div class="property-value color-box" style="background-color: <g:fieldValue bean='${colorInstance}' field='hex'/>"> </div>
								</li>
								</g:if>
							
								<g:if test="${colorInstance?.status}">
								<li class="fieldcontain">
									<span id="status-label" class="property-label"><g:message code="color.status.label" default="Status" /></span>
									
										<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${colorInstance}" field="status.name"/></span>
									
								</li>
								</g:if>
							
							</ol>
							<sec:ifAnyGranted roles="ROLE_CONTENT_MANAGER, ROLE_SUPER_ADMIN">
								<g:form>
									<g:hiddenField name="id" value="${colorInstance?.id}" />
									<!--Interaction buttons-->
									<div class="row">
										<div class="col-md-12 col-lg-12"
											style="border-top: 1px solid #fff;">
											<div class="row">
												<div class="col-md-12 col-lg-12 ed-action-btn">
													<g:link class="btn ed-save" action="edit" id="${colorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
