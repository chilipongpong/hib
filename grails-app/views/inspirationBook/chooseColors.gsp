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
			
			<g:form>
				<g:hiddenField name="client.id" value="${clientInstance?.id}" />
				<g:hiddenField name="id" value="${inspirationBookColorInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookColorInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: inspirationBookColorInstance, field: 'client', 'error')} ">
					<label for="client">
						<g:message code="inspirationBook.color.label" default="Color" />
					</label>
					<g:select name="colors" from="${com.hizon.Color.listAllActive()}" multiple="multiple" optionKey="id" size="5" value="${inspirationBookColorInstance?.colors*.id}" class="many-to-many"/>
				</div>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
					<g:link class="edit" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
