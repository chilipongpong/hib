
<%@ page import="com.hizon.Theme"%>
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
					<h1><img style="height: 40px" src="../../images/head-themes.png" alt="Themes"> ${themeInstance.name}</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->
	

	<h2>
		${themeInstance.description}
	</h2>
	<div>
		<g:each in="${images}" var="img">
			<img width="400"
				src='${createLink(controller: "client", action: "displayImage", params:[img: img.name, themeId: themeInstance?.id])}' />
		</g:each>
	</div>

</body>
</html>
