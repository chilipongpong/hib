<%@ page import="com.hizon.InspirationBook" %>

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
			<g:render template="nav"/>			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${inspirationBookInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${inspirationBookInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="saveAppetizers">
				<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
				<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'appetizers', 'error')} ">
					<div id="errorRandom"></div>
					<label>
						<g:message code="inspirationBook.appertizer.label" default="Appetizer" />
					</label>
					<g:select name="appetizer1" from="${com.hizon.MenuItem.listAppetizers()}" optionKey="id" value="${appetizer1}" noSelection="['':'-Choose an appetizer-']"/>
					<g:select name="appetizer2" from="${com.hizon.MenuItem.listAppetizers()}" optionKey="id" value="${appetizer2}" noSelection="['':'-Choose an appetizer-']"/>
				</div>
				<fieldset class="buttons">
					<fieldset class="buttons">
						<g:submitButton name="save" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
					</fieldset>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
