<%@ page import="com.hizon.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="500" required="" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'craNumber', 'error')} required">
	<label for="craNumber">
		<g:message code="project.craNumber.label" default="Cra Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="craNumber" maxlength="100" required="" value="${projectInstance?.craNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="project.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.hizon.Client.list()}" optionKey="id" required="" value="${projectInstance?.client?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'planner', 'error')} required">
	<label for="planner">
		<g:message code="project.planner.label" default="Planner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planner" name="planner.id" from="${com.hizon.Planner.list()}" optionKey="id" required="" value="${projectInstance?.planner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'venue', 'error')} required">
	<label for="venue">
		<g:message code="project.venue.label" default="Venue" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="venue" cols="40" rows="5" maxlength="500" required="" value="${projectInstance?.venue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'salesAgent', 'error')} required">
	<label for="salesAgent">
		<g:message code="project.salesAgent.label" default="Sales Agent" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="salesAgent" maxlength="100" required="" value="${projectInstance?.salesAgent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'numberOfGuests', 'error')} required">
	<label for="numberOfGuests">
		<g:message code="project.numberOfGuests.label" default="Number Of Guests" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfGuests" type="number" min="0" value="${projectInstance.numberOfGuests}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'bundledItem', 'error')} ">
	<label for="bundledItem">
		<g:message code="project.bundledItem.label" default="Bundled Item" />
	</label>
	<g:select id="bundledItem" name="bundledItem.id" from="${com.hizon.BundledItem.list()}" optionKey="id" value="${projectInstance?.bundledItem?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="project.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${projectInstance?.eventDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'freebies', 'error')} ">
	<label for="freebies">
		<g:message code="project.freebies.label" default="Freebies" />
		
	</label>
	<g:textArea name="freebies" cols="40" rows="5" maxlength="500" value="${projectInstance?.freebies}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'pricePerHead', 'error')} required">
	<label for="pricePerHead">
		<g:message code="project.pricePerHead.label" default="Price Per Head" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerHead" value="${fieldValue(bean: projectInstance, field: 'pricePerHead')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'serviceStyle', 'error')} ">
	<label for="serviceStyle">
		<g:message code="project.serviceStyle.label" default="Service Style" />
		
	</label>
	<g:textField name="serviceStyle" value="${projectInstance?.serviceStyle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values()}" keys="${com.hizon.Status.values()*.name()}" required="" value="${projectInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'theme', 'error')} ">
	<label for="theme">
		<g:message code="project.theme.label" default="Theme" />
	</label>
	<g:select id="theme" name="theme.id" from="${com.hizon.Theme.list()}" optionKey="id" value="${projectInstance?.theme?.id}" class="many-to-one"/>
</div>

