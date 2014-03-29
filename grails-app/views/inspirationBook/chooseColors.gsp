<%@ page import="com.hizon.InspirationBook" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script>
			$(document).ready(function() {
				$(".random").click(function() {
					$("#errorRandom").html("")
					
					var id = $(this).attr('id')
					var num = id.substring(id.length - 1, id.length)
					var data = {color1 : $("#color1").val(), color2 : $("#color2").val(), color3 : $("#color3").val()};

					$.ajax({
						url: 'getRandomColor',
						data: data,
						success: function(data) {
							if (data.color == null) {
								$("#errorRandom").html("No available theme for selected colors.")
							}
							$("#color" + num).val(data.color)
						},
						error: function(request, status, error) {
							$("#errorRandom").html("Getting random color encountered a problem. Pleast try again later.")
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="choose-colors" class="content scaffold-show" role="main">
			<g:render template="nav"/>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${inspirationBookInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${inspirationBookInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="saveColors">
				<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
				<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'colors', 'error')} ">
					<div id="errorRandom"></div>
					<label>
						<g:message code="inspirationBook.color.label" default="Color" />
					</label>
					<g:select name="color1" from="${com.hizon.Color.listAllActive()}" optionKey="id" value="${color1}" noSelection="['':'-Choose a color-']"/>
					<input type="button" class="random" id="random1" value="Randomize" />
					<g:select name="color2" from="${com.hizon.Color.listAllActive()}" optionKey="id" value="${color2}" noSelection="['':'-Choose a color-']"/>
					<input type="button" class="random" id="random2" value="Randomize" />
					<g:select name="color3" from="${com.hizon.Color.listAllActive()}" optionKey="id" value="${color3}" noSelection="['':'-Choose a color-']"/>
					<input type="button" class="random" id="random3" value="Randomize" />
				</div>
				<fieldset class="buttons">
					<fieldset class="buttons">
						<g:submitButton name="save" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
					</fieldset>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
