
<%@ page import="com.hizon.MenuCategory"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'Theme')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img class="clientIcon" src="../../images/head-menu.png" alt="Menu"> ${menuCategory.name}</h1>
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
			<div>
				<h3>
					${menuItem.name}
				</h3>
				<h4>
					${menuItem.description}
				</h4>
				<g:img dir="/uploaded-files" file="${menuItem.image}" width="280px" />
			</div>
		</g:each>
	</div>

</body>
</html>
