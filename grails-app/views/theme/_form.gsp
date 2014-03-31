<%@ page import="com.hizon.Theme" %>
<%@ page import="com.hizon.Color" %>
<%@ page import="com.hizon.Level" %>
<%@ page import="com.hizon.Status" %>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="theme.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${themeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="theme.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" maxlength="250" value="${themeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="theme.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level" name="level.id" from="${Level.findAllByStatus(Status.ACTIVE)}" optionKey="id" required="" value="${themeInstance?.level?.id}" class="many-to-one"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="theme.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.hizon.Status?.values().name}" keys="${com.hizon.Status.values()*.name()}" required="" value="${themeInstance?.status?.name()}"/>
</div>

<div class="selectionMultiple fieldcontain ${hasErrors(bean: themeInstance, field: 'colors', 'error')} ">
	<label for="colors">
		<g:message code="theme.colors.label" default="Colors" />
		
	</label>

	<div class="selectionMultipleBox">
		<select id="colorSelectionFrom" size="8" multiple>
			<g:each var="color" in="${Color.findAllByStatus(Status.ACTIVE) - themeInstance?.colors}">
				<option value="${color.id}">${color.name}</option>
			</g:each>
		</select>
	</div>
	<div class="selectionMultipleArrows">
		<input type="button" id="colorMoveRight" value="&#62" />
		<input type="button" id="colorMoveLeft" value="&#60" />
	</div>
	<div class="selectionMultipleBox">
		<select id="colorSelectionTo" size="8" multiple>
			<g:each var="color" in="${themeInstance?.colors}">
				<option value="${color.id}">${color.name}</option>
			</g:each>
		</select>
	</div>
	<g:hiddenField id="colorsId" name="colorsId" value=""/>
</div>


<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'primaryImage', 'error')} required">
<label for="primaryImage">
		<g:message code="theme.primaryImage.label" default="Primary Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" name="newPrimaryImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'primaryImage', 'error')} ">
	<label for="description">
		<g:message code="theme.originalPrimaryImage.label" default="Original Primary Image" />
		
	</label>
	<span class="property-value" aria-labelledby="status-label"><g:img dir="/uploaded-files" file="${themeInstance.primaryImage}" width="400" /></span>
</div>

<script>
	$(document).ready(function() {
		$('#colorMoveRight').click(function() {
			$('#colorSelectionFrom option:selected').each(function() {
				$('#colorSelectionTo').append('<option value=' +  $(this).val() + '>' + $(this).text() + '</option>');
				$(this).remove();
			});
		});

		$('#colorMoveLeft').click(function() {
			$('#colorSelectionTo option:selected').each(function() {
				$('#colorSelectionFrom').append('<option value=' +  $(this).val() + '>' + $(this).text() + '</option>');
				$(this).remove();
			});
		});

		$('#save').click(function() {
			setColorsId();
		});

		var setColorsId = function() {
			var colorsId = "";
			$('#colorSelectionTo option').each(function() {
				if (colorsId !== "") {
					colorsId += ","
				}
				colorsId += $(this).val();
			});
			$('#colorsId').val(colorsId);
		};
	});

</script>

