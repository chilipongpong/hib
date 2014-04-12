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
			
			<g:form action="saveSuppliers">
				<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
				<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
				<label>Do you have a set of suppliers for the following?</label>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasFlowers', 'error')} ">
					<label>
						<g:message code="inspirationBook.flowers.label" default="Flowers" />
					</label>
					<g:checkBox name="hasFlowers" value="${inspirationBookInstance?.hasFlowers}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasBridalCar', 'error')} ">
					<label>
						<g:message code="inspirationBook.bridalCar.label" default="Bridal Car" />
					</label>
					<g:checkBox name="hasBridalCar" value="${inspirationBookInstance?.hasBridalCar}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasEmcee', 'error')} ">
					<label>
						<g:message code="inspirationBook.emcee.label" default="Emcee or Host" />
					</label>
					<g:checkBox name="hasEmcee" value="${inspirationBookInstance?.hasEmcee}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasCake', 'error')} ">
					<label>
						<g:message code="inspirationBook.cake.label" default="Cake" />
					</label>
					<g:checkBox name="hasCake" value="${inspirationBookInstance?.hasCake}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasFlowersForEntourage', 'error')} ">
					<label>
						<g:message code="inspirationBook.flowersForEntourage.label" default="Flowers for Entourage" />
					</label>
					<g:checkBox name="hasFlowersForEntourage" value="${inspirationBookInstance?.hasFlowersForEntourage}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasPhotoBooth', 'error')} ">
					<label>
						<g:message code="inspirationBook.photoBooth.label" default="Photo Booth" />
					</label>
					<g:checkBox name="hasPhotoBooth" value="${inspirationBookInstance?.hasPhotoBooth}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasMobileBar', 'error')} ">
					<label>
						<g:message code="inspirationBook.mobileBar.label" default="Mobile Bar" />
					</label>
					<g:checkBox name="hasMobileBar" value="${inspirationBookInstance?.hasMobileBar}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasVenue', 'error')} ">
					<label>
						<g:message code="inspirationBook.venue.label" default="Venue" />
					</label>
					<g:checkBox name="hasVenue" value="${inspirationBookInstance?.hasVenue}" />
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
