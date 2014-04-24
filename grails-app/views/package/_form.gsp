<%@ page import="com.hizon.Package" %>



<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="package.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${packageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'appetizers', 'error')} ">
	<label for="appetizers">
		<g:message code="package.appetizers.label" default="Appetizers" />
		
	</label>
	<g:select name="appetizers" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.appetizers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'beefs', 'error')} ">
	<label for="beefs">
		<g:message code="package.beefs.label" default="Beefs" />
		
	</label>
	<g:select name="beefs" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.beefs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'chickens', 'error')} ">
	<label for="chickens">
		<g:message code="package.chickens.label" default="Chickens" />
		
	</label>
	<g:select name="chickens" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.chickens*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'desserts', 'error')} ">
	<label for="desserts">
		<g:message code="package.desserts.label" default="Desserts" />
		
	</label>
	<g:select name="desserts" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.desserts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'freebies', 'error')} ">
	<label for="freebies">
		<g:message code="package.freebies.label" default="Freebies" />
		
	</label>
	<g:textField name="freebies" value="${packageInstance?.freebies}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="package.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level" name="level.id" from="${com.hizon.Level.list()}" optionKey="id" required="" value="${packageInstance?.level?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'numberOfGuests', 'error')} required">
	<label for="numberOfGuests">
		<g:message code="package.numberOfGuests.label" default="Number Of Guests" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfGuests" type="number" value="${packageInstance.numberOfGuests}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'pastas', 'error')} ">
	<label for="pastas">
		<g:message code="package.pastas.label" default="Pastas" />
		
	</label>
	<g:select name="pastas" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.pastas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'porks', 'error')} ">
	<label for="porks">
		<g:message code="package.porks.label" default="Porks" />
		
	</label>
	<g:select name="porks" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.porks*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="package.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: packageInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'salads', 'error')} ">
	<label for="salads">
		<g:message code="package.salads.label" default="Salads" />
		
	</label>
	<g:select name="salads" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.salads*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'seafoods', 'error')} ">
	<label for="seafoods">
		<g:message code="package.seafoods.label" default="Seafoods" />
		
	</label>
	<g:select name="seafoods" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.seafoods*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'serviceStyle', 'error')} ">
	<label for="serviceStyle">
		<g:message code="package.serviceStyle.label" default="Service Style" />
		
	</label>
	<g:textField name="serviceStyle" value="${packageInstance?.serviceStyle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'soups', 'error')} ">
	<label for="soups">
		<g:message code="package.soups.label" default="Soups" />
		
	</label>
	<g:select name="soups" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.soups*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'vegetables', 'error')} ">
	<label for="vegetables">
		<g:message code="package.vegetables.label" default="Vegetables" />
		
	</label>
	<g:select name="vegetables" from="${com.hizon.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.vegetables*.id}" class="many-to-many"/>
</div>

