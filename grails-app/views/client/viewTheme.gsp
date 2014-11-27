
<%@ page import="com.hizon.Theme"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'Theme')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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
					<h1><img style="height: 40px" src="../../images/head-themes.png" alt="Themes"> ${themeInstance.name}</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->
	
	
	<p><strong>
		${themeInstance.description}
	</strong></p>
	<br />
	<div class="col-md-12 col-lg-12 ed-main-content" style="">
		<g:each in="${images}" var="img">
			<div class="col-sm-3 col-md-3">
				<div class="thumbnail">
					<img width="285" src='${createLink(controller: "client", action: "displayImage", params:[img: img.name, themeId: themeInstance?.id])}' />
				</div>
			</div>

		</g:each>
		<div align="right" class="ed-action-btn" style="margin-right: 20px">
		<g:form action="saveTheme">
			<g:hiddenField name="id" value="${themeInstance?.id}" />
			<g:submitButton name="save" class="btn ed-save" value="${message(code: 'default.button.save.label', default: 'Add to Inspiration Book')}" />
		</g:form>
	</div>

</body>
</html>
