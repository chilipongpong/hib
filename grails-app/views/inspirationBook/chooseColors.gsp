<%@ page import="com.hizon.InspirationBook"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<script>
	$(document)
			.ready(
					function() {
						$(".ed-button")
								.click(
										function() {
											$("#errorRandom").html("")

											var id = $(this).attr('id')
											var num = id.substring(
													id.length - 1, id.length)
											var data = {
												color1 : $("#color1").val(),
												color2 : $("#color2").val(),
												color3 : $("#color3").val()
											};

											$
													.ajax({
														url : 'getRandomColor',
														data : data,
														success : function(data) {
															if (data.color == null) {
																$(
																		"#errorRandom")
																		.html(
																				"No available theme for selected colors.")
															}
															$("#color" + num)
																	.val(
																			data.color)
														},
														error : function(
																request,
																status, error) {
															$("#errorRandom")
																	.html(
																			"Getting random color encountered a problem. Pleast try again later.")
														}
													});
										});
					});
</script>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img style="height: 40px" src="../images/head-book.png" alt="book"> Inspiration Book</h1>
				</div>
			</div>

		</div>
	</div>
	<!-- End Heading -->

	<!-- MAIN CONTENT -->
	<div class="container-fluid text-center" style="">
		<div class="container" style=>
			<div class="row">
				<!-- Left Menu -->
				<div class="col-md-3 col-lg-3 ed-content-nav">
					<h3 class="active">Wedding Scheme</h3>
					<ul>
						<li class="active ${inspirationBookInstance.colors ? "finished" : ""}"><g:link uri="/inspirationBook/chooseColors">Choose Colors</g:link></li>
						<li class="${inspirationBookInstance.theme != null ? "finished" : ""}"><g:link uri="/inspirationBook/chooseTheme">Choose Theme</g:link></li>
					</ul>
					<h3>Guest List</h3>
					<ul>
						<li class="active ${inspirationBookInstance.numberOfGuests != 0 ? "finished" : ""}"><g:link uri="/inspirationBook/indicateGuests">Indicate Guests</g:link></li>
					</ul>
					<h3>Food</h3>
					<ul>
						<li class="${inspirationBookInstance.appetizers ? "finished" : ""}"><g:link uri="/inspirationBook/chooseAppetizer">Choose Appetizer</g:link></li>
						<li class="${inspirationBookInstance.soups ? "finished" : ""}"><g:link uri="/inspirationBook/chooseSoup">Choose Soup</g:link></li>
						<li class="${inspirationBookInstance.salads ? "finished" : ""}"><g:link uri="/inspirationBook/chooseSalad">Choose Salad</g:link></li>
						<li class="${inspirationBookInstance.pastas ? "finished" : ""}"><g:link uri="/inspirationBook/choosePasta">Choose Pasta</g:link></li>
						<li class="${inspirationBookInstance.beefs ? "finished" : ""}"><g:link uri="/inspirationBook/chooseBeef">Choose Beef</g:link></li>
						<li class="${inspirationBookInstance.porks ? "finished" : ""}"><g:link uri="/inspirationBook/choosePork">Choose Pork</g:link></li>
						<li class="${inspirationBookInstance.chickens ? "finished" : ""}"><g:link uri="/inspirationBook/chooseChicken">Choose Chicken</g:link></li>
						<li class="${inspirationBookInstance.seafoods ? "finished" : ""}"><g:link uri="/inspirationBook/chooseSeafood">Choose Seafood</g:link></li>
						<li class="${inspirationBookInstance.vegetables ? "finished" : ""}"><g:link uri="/inspirationBook/chooseVegetable">Choose Vegetable</g:link></li>
						<li class="${inspirationBookInstance.desserts ? "finished" : ""}"><g:link uri="/inspirationBook/chooseDessert">Choose Dessert</g:link></li>
					</ul>
					<h3>Supplier</h3>
					<ul>
						<li class="${(inspirationBookInstance.hasFlowers || inspirationBookInstance.hasBridalCar || inspirationBookInstance.hasEmcee || inspirationBookInstance.hasCake ||
							inspirationBookInstance.hasFlowersForEntourage || inspirationBookInstance.hasPhotoBooth || inspirationBookInstance.hasMobileBar || inspirationBookInstance.hasVenue) ? "finished" : ""}">
							<g:link uri="/inspirationBook/indicateSuppliers">Indicate Suppliers</g:link>
						</li>
					</ul>
					<h3>
						<g:link uri="/inspirationBook/viewCollage">View Collage</g:link>
					</h3>
				</div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<h2>Choose your wedding colors</h2>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${inspirationBookInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${inspirationBookInstance}" var="error">
								<li
									<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
										error="${error}" /></li>
							</g:eachError>
						</ul>
					</g:hasErrors>

					<g:form action="saveColors">
						<g:hiddenField name="client.id"
							value="${inspirationBookInstance?.client?.id}" />
						<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
						<g:hiddenField name="version"
							value="${inspirationBookInstance?.version}" />
						<div
							class="colorpicker fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'colors', 'error')} ">
							<div id="errorRandom" style="text-align: center; color: red;"></div>
							
							<span class="property-label">
								<g:message code="inspirationBook.color1.label" default="Color 1" />
							</span>
							<span class="property-value">
								<g:select name="color1" from="${com.hizon.Color.listAllActive()}"
									optionKey="id" value="${color1}"
									noSelection="['':'-Choose a color-']" />
								<input type="button" class="btn ed-button" id="random1"
								value="Randomize" />
							</span>							
							<br /><br />
							<span class="property-label">
								<g:message code="inspirationBook.color2.label" default="Color 2" />
							</span>
							<span class="property-value"> <g:select name="color2"
									from="${com.hizon.Color.listAllActive()}" optionKey="id"
									value="${color2}" noSelection="['':'-Choose a color-']" /> <input
								type="button" class="btn ed-button" id="random2" value="Randomize" /><br />
							</span>
							<br /><br />
							<span class="property-label">
								<g:message code="inspirationBook.color3.label" default="Color 3" />
							</span>
							<span class="property-value">
								<g:select name="color3" from="${com.hizon.Color.listAllActive()}"
									optionKey="id" value="${color3}"
									noSelection="['':'-Choose a color-']" />
								<input type="button" class="btn ed-button" id="random3"
									value="Randomize" />
							</span>
						</div>
						<br />
						<!--Interaction buttons-->
						<div class="row">
							<div class="col-md-12 col-lg-12"
								style="border-top: 1px solid #fff;">
								<div class="row">
									<div class="col-md-12 col-lg-12 ed-action-btn">
										<g:submitButton name="save" class="btn ed-save"
											value="${message(code: 'default.button.save.label', default: 'Save')}" />
									</div>
								</div>
							</div>
						</div>
						<!--/Interaction buttons-->
					</g:form>
				</div>
				<!--  end main content area -->
			</div>
			<!--  end row -->
		</div>
		<!-- end container -->
	</div>
	<!--  end MAIN CONTENT -->

</body>
</html>
