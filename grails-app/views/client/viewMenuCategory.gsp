
<%@ page import="com.hizon.MenuCategory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'Theme')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<g:javascript src="imageSelector.js" />
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
		<div>
				<h2>
					${menuCategory.description}
				</h2>
		</div>

		<g:each in="${menuItems}" var="menuItem">
			<div class="image">
				<g:hiddenField name="image-id" value="${menuItem.id}"/>
				<h3>
					${menuItem.name}
				</h3>
				<h4>
					${menuItem.description}
				</h4>
				<span>
					<g:img dir="/uploaded-files" file="${menuItem.image}" width="280px" />
				</span>
			</div>
		</g:each>
	</div>
	<div>
		<g:form action="saveMenuCategories">
			<g:hiddenField name="id" value="${menuCategory.id}" />
			<g:hiddenField name="selectedItems" value="${inspirationBookItems.id}" />
			<g:submitButton name="save" class="btn ed-save"
											value="${message(code: 'default.button.save.label', default: 'Choose Menu Items')}" disabled="true" />
		</g:form>
	</div>

</body>
</html>
