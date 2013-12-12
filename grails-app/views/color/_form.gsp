<%@ page import="com.hizon.Color" %>
<g:javascript src="spectrum.js" />

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="color.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="6" required="" value="${colorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="color.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="250" value="${colorInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'hex', 'error')} ">
	<label for="hex">
		<g:message code="color.hex.label" default="Hex" />
		
	</label>
	<input type='text' id="custom" />
	<script>
		$("#custom").spectrum({
			color: "#f00",
			change: function(color) {
				$("#hex").val(color.toHexString());
			}
		});
	</script>
	<g:textField name="hex" value="${colorInstance?.hex}"/>
</div>

