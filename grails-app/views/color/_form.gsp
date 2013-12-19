<%@ page import="com.hizon.Color" %>
<g:javascript src="spectrum.js" />

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="color.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="6" required="" value="${colorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'pantone', 'error')} ">
	<label for="pantone">
		<g:message code="color.pantone.label" default="Pantone" />
		
	</label>
	<g:textField name="pantone" maxlength="100" value="${colorInstance?.pantone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colorInstance, field: 'hex', 'error')} ">
	<label for="hex">
		<g:message code="color.hex.label" default="Hex" />
		
	</label>
	<input type='text' id="custom" />
	<g:textField name="hex" value="${colorInstance?.hex}"/>
	<script>
		$("#custom").spectrum({
			color: "#f00",
			change: function(color) {
				$("#hex").val(color.toHexString());
			}
		});

		$("#hex").change(function() {
			$("#custom").spectrum({
				color: $(this).val(),
				change: function(color) {
					$("#hex").val(color.toHexString());
				}
			});	
		});
	</script>
</div>

