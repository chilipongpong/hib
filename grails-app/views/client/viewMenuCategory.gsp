
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
	<a href="#show-menuCategory" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<g:render template="../dashboard/navigation" />

	<div>
		<g:each>
			<div>
				<h2>${menuItemInstance.name}</h2>
				
			</div>
		</g:each>
		<g:each in="${images}" var="img">
			<img width="400"
				src='${createLink(controller: "client", action: "displayImage", params:[img: img.name, themeId: themeInstance?.id])}' />
		</g:each>
	</div>

</body>
</html>
