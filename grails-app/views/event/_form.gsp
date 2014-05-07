<%@ page import="com.hizon.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${eventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="event.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${eventInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'craNumber', 'error')} ">
	<label for="craNumber">
		<g:message code="event.craNumber.label" default="Cra Number" />
		
	</label>
	<g:textField name="craNumber" value="${eventInstance?.craNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="event.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.hizon.Client.list()}" optionKey="id" required="" value="${eventInstance?.client?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'planner', 'error')} required">
	<label for="planner">
		<g:message code="event.planner.label" default="Planner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planner" name="planner.id" from="${com.hizon.Planner.list()}" optionKey="id" required="" value="${eventInstance?.planner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'pack', 'error')} required">
	<label for="pack">
		<g:message code="event.pack.label" default="Package" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pack" name="pack.id" from="${com.hizon.Package.list()}" optionKey="id" required="" value="${eventInstance?.pack?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'venue', 'error')} ">
	<label for="venue">
		<g:message code="event.venue.label" default="Venue" />
		
	</label>
	<g:textField name="venue" value="${eventInstance?.venue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'salesAgent', 'error')} ">
	<label for="salesAgent">
		<g:message code="event.salesAgent.label" default="Sales Agent" />
		
	</label>
	<g:textField name="salesAgent" value="${eventInstance?.salesAgent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="event.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values()}" keys="${com.hizon.Status.values()*.name()}" required="" value="${eventInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'appetizers', 'error')} ">
	<label for="appetizers">
		<g:message code="event.appetizers.label" default="Appetizers" />
		
	</label>
	<g:select name="appetizers" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.appetizers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'beefs', 'error')} ">
	<label for="beefs">
		<g:message code="event.beefs.label" default="Beefs" />
		
	</label>
	<g:select name="beefs" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.beefs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'chickens', 'error')} ">
	<label for="chickens">
		<g:message code="event.chickens.label" default="Chickens" />
		
	</label>
	<g:select name="chickens" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.chickens*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'desserts', 'error')} ">
	<label for="desserts">
		<g:message code="event.desserts.label" default="Desserts" />
		
	</label>
	<g:select name="desserts" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.desserts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'pastas', 'error')} ">
	<label for="pastas">
		<g:message code="event.pastas.label" default="Pastas" />
		
	</label>
	<g:select name="pastas" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.pastas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'porks', 'error')} ">
	<label for="porks">
		<g:message code="event.porks.label" default="Porks" />
		
	</label>
	<g:select name="porks" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.porks*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'salads', 'error')} ">
	<label for="salads">
		<g:message code="event.salads.label" default="Salads" />
		
	</label>
	<g:select name="salads" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.salads*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'seafoods', 'error')} ">
	<label for="seafoods">
		<g:message code="event.seafoods.label" default="Seafoods" />
		
	</label>
	<g:select name="seafoods" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.seafoods*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'soups', 'error')} ">
	<label for="soups">
		<g:message code="event.soups.label" default="Soups" />
		
	</label>
	<g:select name="soups" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.soups*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'vegetables', 'error')} ">
	<label for="vegetables">
		<g:message code="event.vegetables.label" default="Vegetables" />
		
	</label>
	<g:select name="vegetables" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.vegetables*.id}" class="many-to-many"/>
</div>
