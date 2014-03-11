<%@ page import="com.hizon.InspirationBookColor" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="choose-colors" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="saveColors">
				<g:hiddenField name="client.id" value="${inspirationBookColorInstance?.client?.id}" />
				<g:hiddenField name="id" value="${inspirationBookColorInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookColorInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: inspirationBookColorInstance, field: 'client', 'error')} ">
					<label for="client">
						<g:message code="inspirationBook.color.label" default="Color" />
					</label>
					<g:select name="color1" from="${com.hizon.Color.listAllActive()}" optionKey="id" size="5" value="${color1}" />
					<g:select name="color2" from="${com.hizon.Color.listAllActive()}" optionKey="id" size="5" value="${color2}" />
					<g:select name="color3" from="${com.hizon.Color.listAllActive()}" optionKey="id" size="5" value="${color3}" />
				</div>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
					<fieldset class="buttons">
						<g:submitButton name="save" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
					</fieldset>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
