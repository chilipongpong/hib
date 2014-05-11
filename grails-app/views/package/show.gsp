
<%@ page import="com.hizon.Package" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'package.label', default: 'Package')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-package" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="../dashboard/navigation" />
		<div id="show-package" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list package">
			
				<g:if test="${packageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="package.name.label" default="Name" /></span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${packageInstance}" field="name"/></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.themeLevel}">
				<li class="fieldcontain">
					<span id="themeLevel-label" class="property-label"><g:message code="package.themeLevel.label" default="Theme Level" /></span>
						<span class="property-value" aria-labelledby="themeLevel-label"><g:link controller="level" action="show" id="${packageInstance?.themeLevel?.id}">${packageInstance?.themeLevel?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.numberOfGuests}">
				<li class="fieldcontain">
					<span id="numberOfGuests-label" class="property-label"><g:message code="package.numberOfGuests.label" default="Number Of Guests" /></span>
						<span class="property-value" aria-labelledby="numberOfGuests-label"><g:fieldValue bean="${packageInstance}" field="numberOfGuests"/></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="package.price.label" default="Price" /></span>
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${packageInstance}" field="price"/></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.appetizer}">
				<li class="fieldcontain">
					<span id="appetizer-label" class="property-label"><g:message code="package.appetizer.label" default="Appetizer" /></span>
						<span class="property-value" aria-labelledby="appetizer-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.appetizer?.id}">${packageInstance?.appetizer?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
			
				<g:if test="${packageInstance?.soup}">
				<li class="fieldcontain">
					<span id="soup-label" class="property-label"><g:message code="package.soup.label" default="Soup" /></span>
						<span class="property-value" aria-labelledby="soup-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.soup?.id}">${packageInstance?.soup?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.salad}">
				<li class="fieldcontain">
					<span id="salad-label" class="property-label"><g:message code="package.salad.label" default="Salad" /></span>
						<span class="property-value" aria-labelledby="salad-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.salad?.id}">${packageInstance?.salad?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.pasta}">
				<li class="fieldcontain">
					<span id="pasta-label" class="property-label"><g:message code="package.pasta.label" default="Pasta" /></span>
						<span class="property-value" aria-labelledby="pasta-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.pasta?.id}">${packageInstance?.pasta?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.beef}">
				<li class="fieldcontain">
					<span id="beef-label" class="property-label"><g:message code="package.beef.label" default="Beef" /></span>
						<span class="property-value" aria-labelledby="beef-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.beef?.id}">${packageInstance?.beef?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.pork}">
				<li class="fieldcontain">
					<span id="pork-label" class="property-label"><g:message code="package.pork.label" default="Pork" /></span>
						<span class="property-value" aria-labelledby="pork-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.pork?.id}">${packageInstance?.pork?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.chicken}">
				<li class="fieldcontain">
					<span id="chicken-label" class="property-label"><g:message code="package.chicken.label" default="Chicken" /></span>
						<span class="property-value" aria-labelledby="chicken-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.chicken?.id}">${packageInstance?.chicken?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.seafood}">
				<li class="fieldcontain">
					<span id="seafood-label" class="property-label"><g:message code="package.seafood.label" default="Seafood" /></span>
						<span class="property-value" aria-labelledby="seafood-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.seafood?.id}">${packageInstance?.seafood?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.vegetable}">
				<li class="fieldcontain">
					<span id="vegetable-label" class="property-label"><g:message code="package.vegetable.label" default="Vegetable" /></span>
						<span class="property-value" aria-labelledby="vegetable-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.vegetable?.id}">${packageInstance?.vegetable?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.dessert}">
				<li class="fieldcontain">
					<span id="dessert-label" class="property-label"><g:message code="package.dessert.label" default="Dessert" /></span>
						<span class="property-value" aria-labelledby="dessert-label"><g:link controller="foodPackage" action="show" id="${packageInstance?.dessert?.id}">${packageInstance?.dessert?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.serviceStyle}">
				<li class="fieldcontain">
					<span id="serviceStyle-label" class="property-label"><g:message code="package.serviceStyle.label" default="Service Style" /></span>
						<span class="property-value" aria-labelledby="serviceStyle-label"><g:fieldValue bean="${packageInstance}" field="serviceStyle"/></span>
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.freebies}">
				<li class="fieldcontain">
					<span id="freebies-label" class="property-label"><g:message code="package.freebies.label" default="Freebies" /></span>
						<g:each in="${packageInstance.freebies}" var="f">
						<span class="property-value" aria-labelledby="freebies-label"><g:link controller="bundledItem" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${packageInstance?.client}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="package.client.label" default="Client" /></span>
						<span class="property-value" aria-labelledby="client-label"><g:fieldValue bean="${packageInstance}" field="client"/></span>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${packageInstance?.id}" />
					<g:link class="edit" action="edit" id="${packageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
