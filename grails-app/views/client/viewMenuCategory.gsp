
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
		<div>
				<h1>
					${menuCategory.name}
				</h1>
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
