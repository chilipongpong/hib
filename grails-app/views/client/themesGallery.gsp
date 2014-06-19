
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
<body class=".clientDash">
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img style="height: 40px" src="../images/head-themes.png" alt="Themes">Themes Gallery</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->
	<div id="list-theme" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:each in="${activeThemes}" var="activeTheme">
			<div class="span4 view view-first" style="float:left">
				<div class="mask">
					<h3>
						${activeTheme.name}
					</h3>
					<h4>
						${activeTheme.description}
					</h4>
					<g:link controller="client" action="viewTheme"
						id="${activeTheme.id}">
						<g:img dir="/uploaded-files" file="${activeTheme.primaryImage}"
							width="280px" />
					</g:link>
				</div>
			</div>
		</g:each>
		<!--  	<div class="pagination">
				<g:paginate total="${activeThemesTotal}" action="themesGallery" controller="client" next="Forward" prev="Back"/>
			</div> -->
	</div>
</body>
</html>
