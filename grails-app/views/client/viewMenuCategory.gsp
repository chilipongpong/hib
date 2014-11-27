
<%@ page import="com.hizon.MenuCategory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'Theme')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<g:javascript src="imageSelector.js" />
<style type="text/css">
.thumbnail {
	padding: 3px;
	-webkit-box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	-moz-box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.thumbnail p {
	color: #8e8e8e;
	font-size: 15px;
	line-height: 21px;
	font-weight: 300;
}

.thumbnail p a {
	color: #8e8e8e;
	text-decoration: none;
}

.thumbnail p a:hover {
	color: #333;
}

p strong {
	color: #37bc9b;
	font-size: 30px;
	line-height: 38px;
	font-weight: 300;
	padding-right: 6px;
	padding-left: 20px;
	
}


</style>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img style="height: 40px" src="../../images/head-menu.png" alt="Menu"> ${menuCategory.name}</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->
	<div>
		<p><strong>
			${menuCategory.description}
		</strong></p>
		<br />
		<div class="col-md-12 col-lg-12 ed-main-content" style="">
			<g:each in="${menuItems}" var="menuItem">
				<div class="col-sm-3 col-md-3">
					<div class="thumbnail">
						<div class="image">
							<g:img dir="/uploaded-files" file="${menuItem.image}" width="285px" />
							<g:hiddenField name="image-id" value="${menuItem.id}" />
							<div class="caption">
								<a href="#" class="bold-name"> ${menuItem.name}
								</a><br /> <a href="#"> ${menuItem.description}
								</a>
							</div>
						</div>
					</div>
				</div>
			</g:each>
		</div>
	</div>
	<div align="right" class="ed-action-btn" style="margin-right: 20px">
		<g:form action="saveMenuCategories">
			<g:hiddenField name="id" value="${menuCategory.id}" />
			<g:hiddenField name="selectedItems" value="${inspirationBookItems.id}" />
			<g:submitButton name="save" class="btn ed-save"
											value="${message(code: 'default.button.save.label', default: 'Choose Menu Items')}" disabled="true" />
		</g:form>
	</div>

</body>
</html>
