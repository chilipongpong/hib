
<%@ page import="com.hizon.Theme"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'Theme')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'hoverstyle.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'hoverstyle1.css')}"
	type="text/css">
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img style="height: 40px" src="../images/head-menu.png" alt="Menu"> Menu</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->
	<div id="list-menuCategory" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:each in="${activeMenuCategories}" var="activeMenuCategory">
			<div class="span4 view view-first" style="float:left">
				<div class="mask">
					<h2>
						${activeMenuCategory.name}
					</h2>
					<g:link controller="client" action="viewMenuCategory"
						id="${activeMenuCategory.id}">
						<g:img dir="/uploaded-files" file="${activeMenuCategory.image}"
							width="280px" />
					</g:link>
				</div>
			</div>
		</g:each>
		<!-- 	<div class="pagination">
				<g:paginate total="${activeMenuCategoriesTotal}" action="menu" controller="client" next="Forward" prev="Back"/>
			</div> -->
	</div>
</body>
</html>
