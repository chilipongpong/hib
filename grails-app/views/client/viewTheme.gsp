
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
	<a href="#show-theme" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<g:render template="../dashboard/navigation" />

	<h2>
		${themeInstance.name}
	</h2>
	<div>
		<g:each in="${images}" var="img">
			<img width="400"
				src='${createLink(controller: "client", action: "displayImage", params:[img: img.name, themeId: themeInstance?.id])}' />
		</g:each>
	</div>

</body>
</html>
