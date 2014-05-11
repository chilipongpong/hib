<%@ page import="com.hizon.Package" %>


<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="package.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${packageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'themeLevel', 'error')} required">
	<label for="themeLevel">
		<g:message code="package.themeLevel.label" default="Theme Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="themeLevel" name="themeLevel.id" from="${com.hizon.Level.list()}" optionKey="id" required="" value="${packageInstance?.themeLevel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'numberOfGuests', 'error')} required">
	<label for="numberOfGuests">
		<g:message code="package.numberOfGuests.label" default="Number Of Guests" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfGuests" type="number" value="${packageInstance.numberOfGuests}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="package.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${fieldValue(bean: packageInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'appetizer', 'error')}">
	<label for="appetizer">
		<g:message code="package.appetizer.label" default="Appetizer" />
	</label>
	<g:hiddenField name="appetizer.name" value="Appetizer" />
	Level
	<g:select id="appetizer.level" name="appetizer.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.appetizer?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="appetizer.number" type="number" value="${packageInstance?.appetizer?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'soup', 'error')}">
	<label for="soup">
		<g:message code="package.soup.label" default="Soup" />
	</label>
	<g:hiddenField name="soup.name" value="Soup" />
	Level
	<g:select id="soup.level" name="soup.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.soup?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="soup.number" type="number" value="${packageInstance?.soup?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'salad', 'error')}">
	<label for="salad">
		<g:message code="package.salad.label" default="Salad" />
	</label>
	<g:hiddenField name="salad.name" value="Salad" />
	Level
	<g:select id="salad.level" name="salad.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.salad?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="salad.number" type="number" value="${packageInstance?.salad?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'pasta', 'error')}">
	<label for="pasta">
		<g:message code="package.pasta.label" default="Pasta" />
	</label>
	<g:hiddenField name="pasta.name" value="Pasta" />
	Level
	<g:select id="pasta.level" name="pasta.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.pasta?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="pasta.number" type="number" value="${packageInstance?.pasta?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'beef', 'error')}">
	<label for="beef">
		<g:message code="package.beef.label" default="Beef" />
	</label>
	<g:hiddenField name="beef.name" value="Beef" />
	Level
	<g:select id="beef.level" name="beef.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.beef?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="beef.number" type="number" value="${packageInstance?.beef?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'pork', 'error')}">
	<label for="pork">
		<g:message code="package.pork.label" default="Pork" />
	</label>
	<g:hiddenField name="pork.name" value="Pork" />
	Level
	<g:select id="pork.level" name="pork.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.pork?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="pork.number" type="number" value="${packageInstance?.pork?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'chicken', 'error')}">
	<label for="chicken">
		<g:message code="package.chicken.label" default="Chicken" />
	</label>
	<g:hiddenField name="chicken.name" value="Chicken" />
	Level
	<g:select id="chicken.level" name="chicken.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.chicken?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="chicken.number" type="number" value="${packageInstance?.chicken?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'seafood', 'error')}">
	<label for="seafood">
		<g:message code="package.seafood.label" default="Seafood" />
	</label>
	<g:hiddenField name="seafood.name" value="Seafood" />
	Level
	<g:select id="seafood.level" name="seafood.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.seafood?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="seafood.number" type="number" value="${packageInstance?.seafood?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'vegetable', 'error')}">
	<label for="vegetable">
		<g:message code="package.vegetable.label" default="Vegetable" />
	</label>
	<g:hiddenField name="vegetable.name" value="Vegetable" />
	Level
	<g:select id="vegetable.level" name="vegetable.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.vegetable?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="vegetable.number" type="number" value="${packageInstance?.vegetable?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'dessert', 'error')}">
	<label for="dessert">
		<g:message code="package.dessert.label" default="Dessert" />
	</label>
	<g:hiddenField name="dessert.name" value="Dessert" />
	Level
	<g:select id="dessert.level" name="dessert.level.id" from="${com.hizon.Level.list()}" optionKey="id" value="${packageInstance?.dessert?.level?.id}" class="many-to-one"/>
	Number
	<g:field name="dessert.number" type="number" value="${packageInstance?.dessert?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'serviceStyle', 'error')} ">
	<label for="serviceStyle">
		<g:message code="package.serviceStyle.label" default="Service Style" />
		
	</label>
	<g:textField name="serviceStyle" value="${packageInstance?.serviceStyle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'freebies', 'error')} ">
	<label for="freebies">
		<g:message code="package.freebies.label" default="Freebies" />
		
	</label>
	<g:select name="freebies" from="${com.hizon.BundledItem.list()}" multiple="multiple" optionKey="id" size="5" value="${packageInstance?.freebies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: packageInstance, field: 'client', 'error')} ">
	<label for="client">
		<g:message code="package.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.hizon.Client.list()}" optionKey="id" value="${packageInstance?.client?.id}" class="one-to-one" noSelection="['null': '']"/>
</div>
