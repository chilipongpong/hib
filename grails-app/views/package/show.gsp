
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
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
			
				<g:if test="${packageInstance?.appetizers}">
				<li class="fieldcontain">
					<span id="appetizers-label" class="property-label"><g:message code="package.appetizers.label" default="Appetizers" /></span>
					
						<g:each in="${packageInstance.appetizers}" var="a">
						<span class="property-value" aria-labelledby="appetizers-label"><g:link controller="menuItem" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.beefs}">
				<li class="fieldcontain">
					<span id="beefs-label" class="property-label"><g:message code="package.beefs.label" default="Beefs" /></span>
					
						<g:each in="${packageInstance.beefs}" var="b">
						<span class="property-value" aria-labelledby="beefs-label"><g:link controller="menuItem" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.chickens}">
				<li class="fieldcontain">
					<span id="chickens-label" class="property-label"><g:message code="package.chickens.label" default="Chickens" /></span>
					
						<g:each in="${packageInstance.chickens}" var="c">
						<span class="property-value" aria-labelledby="chickens-label"><g:link controller="menuItem" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.desserts}">
				<li class="fieldcontain">
					<span id="desserts-label" class="property-label"><g:message code="package.desserts.label" default="Desserts" /></span>
					
						<g:each in="${packageInstance.desserts}" var="d">
						<span class="property-value" aria-labelledby="desserts-label"><g:link controller="menuItem" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.freebies}">
				<li class="fieldcontain">
					<span id="freebies-label" class="property-label"><g:message code="package.freebies.label" default="Freebies" /></span>
					
						<span class="property-value" aria-labelledby="freebies-label"><g:fieldValue bean="${packageInstance}" field="freebies"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="package.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:link controller="level" action="show" id="${packageInstance?.level?.id}">${packageInstance?.level?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.numberOfGuests}">
				<li class="fieldcontain">
					<span id="numberOfGuests-label" class="property-label"><g:message code="package.numberOfGuests.label" default="Number Of Guests" /></span>
					
						<span class="property-value" aria-labelledby="numberOfGuests-label"><g:fieldValue bean="${packageInstance}" field="numberOfGuests"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.pastas}">
				<li class="fieldcontain">
					<span id="pastas-label" class="property-label"><g:message code="package.pastas.label" default="Pastas" /></span>
					
						<g:each in="${packageInstance.pastas}" var="p">
						<span class="property-value" aria-labelledby="pastas-label"><g:link controller="menuItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.porks}">
				<li class="fieldcontain">
					<span id="porks-label" class="property-label"><g:message code="package.porks.label" default="Porks" /></span>
					
						<g:each in="${packageInstance.porks}" var="p">
						<span class="property-value" aria-labelledby="porks-label"><g:link controller="menuItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="package.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${packageInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.salads}">
				<li class="fieldcontain">
					<span id="salads-label" class="property-label"><g:message code="package.salads.label" default="Salads" /></span>
					
						<g:each in="${packageInstance.salads}" var="s">
						<span class="property-value" aria-labelledby="salads-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.seafoods}">
				<li class="fieldcontain">
					<span id="seafoods-label" class="property-label"><g:message code="package.seafoods.label" default="Seafoods" /></span>
					
						<g:each in="${packageInstance.seafoods}" var="s">
						<span class="property-value" aria-labelledby="seafoods-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.serviceStyle}">
				<li class="fieldcontain">
					<span id="serviceStyle-label" class="property-label"><g:message code="package.serviceStyle.label" default="Service Style" /></span>
					
						<span class="property-value" aria-labelledby="serviceStyle-label"><g:fieldValue bean="${packageInstance}" field="serviceStyle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.soups}">
				<li class="fieldcontain">
					<span id="soups-label" class="property-label"><g:message code="package.soups.label" default="Soups" /></span>
					
						<g:each in="${packageInstance.soups}" var="s">
						<span class="property-value" aria-labelledby="soups-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${packageInstance?.vegetables}">
				<li class="fieldcontain">
					<span id="vegetables-label" class="property-label"><g:message code="package.vegetables.label" default="Vegetables" /></span>
					
						<g:each in="${packageInstance.vegetables}" var="v">
						<span class="property-value" aria-labelledby="vegetables-label"><g:link controller="menuItem" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
