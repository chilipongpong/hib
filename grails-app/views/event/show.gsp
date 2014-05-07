
<%@ page import="com.hizon.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list event">
			
				<g:if test="${eventInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="event.name.label" default="Name" /></span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}" field="name"/></span>
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="event.date.label" default="Date" /></span>
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${eventInstance?.date}" /></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.craNumber}">
				<li class="fieldcontain">
					<span id="craNumber-label" class="property-label"><g:message code="event.craNumber.label" default="Cra Number" /></span>
						<span class="property-value" aria-labelledby="craNumber-label"><g:fieldValue bean="${eventInstance}" field="craNumber"/></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="event.client.label" default="Client" /></span>
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${eventInstance?.client?.id}">${eventInstance?.client?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.planner}">
				<li class="fieldcontain">
					<span id="planner-label" class="property-label"><g:message code="event.planner.label" default="Planner" /></span>
						<span class="property-value" aria-labelledby="planner-label"><g:link controller="planner" action="show" id="${eventInstance?.planner?.id}">${eventInstance?.planner?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.pack}">
				<li class="fieldcontain">
					<span id="pack-label" class="property-label"><g:message code="event.pack.label" default="Package" /></span>
						<span class="property-value" aria-labelledby="pack-label"><g:link controller="package" action="show" id="${eventInstance?.pack?.id}">${eventInstance?.pack?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="event.venue.label" default="Venue" /></span>
						<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${eventInstance}" field="venue"/></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.salesAgent}">
				<li class="fieldcontain">
					<span id="salesAgent-label" class="property-label"><g:message code="event.salesAgent.label" default="Sales Agent" /></span>
						<span class="property-value" aria-labelledby="salesAgent-label"><g:fieldValue bean="${eventInstance}" field="salesAgent"/></span>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="event.status.label" default="Status" /></span>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${eventInstance}" field="status"/></span>
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.appetizers}">
				<li class="fieldcontain">
					<span id="appetizers-label" class="property-label"><g:message code="event.appetizers.label" default="Appetizers" /></span>
						<g:each in="${eventInstance.appetizers}" var="a">
						<span class="property-value" aria-labelledby="appetizers-label"><g:link controller="menuItem" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.soups}">
				<li class="fieldcontain">
					<span id="soups-label" class="property-label"><g:message code="event.soups.label" default="Soups" /></span>
						<g:each in="${eventInstance.soups}" var="s">
						<span class="property-value" aria-labelledby="soups-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.salads}">
				<li class="fieldcontain">
					<span id="salads-label" class="property-label"><g:message code="event.salads.label" default="Salads" /></span>
						<g:each in="${eventInstance.salads}" var="s">
						<span class="property-value" aria-labelledby="salads-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.pastas}">
				<li class="fieldcontain">
					<span id="pastas-label" class="property-label"><g:message code="event.pastas.label" default="Pastas" /></span>
						<g:each in="${eventInstance.pastas}" var="p">
						<span class="property-value" aria-labelledby="pastas-label"><g:link controller="menuItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.beefs}">
				<li class="fieldcontain">
					<span id="beefs-label" class="property-label"><g:message code="event.beefs.label" default="Beefs" /></span>
						<g:each in="${eventInstance.beefs}" var="b">
						<span class="property-value" aria-labelledby="beefs-label"><g:link controller="menuItem" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.porks}">
				<li class="fieldcontain">
					<span id="porks-label" class="property-label"><g:message code="event.porks.label" default="Porks" /></span>
						<g:each in="${eventInstance.porks}" var="p">
						<span class="property-value" aria-labelledby="porks-label"><g:link controller="menuItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.chickens}">
				<li class="fieldcontain">
					<span id="chickens-label" class="property-label"><g:message code="event.chickens.label" default="Chickens" /></span>
						<g:each in="${eventInstance.chickens}" var="c">
						<span class="property-value" aria-labelledby="chickens-label"><g:link controller="menuItem" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.seafoods}">
				<li class="fieldcontain">
					<span id="seafoods-label" class="property-label"><g:message code="event.seafoods.label" default="Seafoods" /></span>
						<g:each in="${eventInstance.seafoods}" var="s">
						<span class="property-value" aria-labelledby="seafoods-label"><g:link controller="menuItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.vegetables}">
				<li class="fieldcontain">
					<span id="vegetables-label" class="property-label"><g:message code="event.vegetables.label" default="Vegetables" /></span>
						<g:each in="${eventInstance.vegetables}" var="v">
						<span class="property-value" aria-labelledby="vegetables-label"><g:link controller="menuItem" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<g:if test="${eventInstance?.desserts}">
				<li class="fieldcontain">
					<span id="desserts-label" class="property-label"><g:message code="event.desserts.label" default="Desserts" /></span>
						<g:each in="${eventInstance.desserts}" var="d">
						<span class="property-value" aria-labelledby="desserts-label"><g:link controller="menuItem" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${eventInstance?.id}" />
					<g:link class="edit" action="edit" id="${eventInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
