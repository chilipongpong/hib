<%@ page import="com.hizon.InspirationBook"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inspirationBook.label', default: 'My Package')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:javascript src="imageSelector.js" />
	<g:javascript src="colorRandomizer.js" />
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img style="height: 40px" src="../images/head-book.png" alt="book">My Package</h1>
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
					<ul>
						<li><g:link uri="/inspirationBook/welcome">Welcome</g:link></li>
					</ul>
					<h3 class="active">Wedding Scheme</h3>
					<ul>
						<li class="${inspirationBookInstance.colors ? "finished" : ""}"><g:link uri="/inspirationBook/chooseColors">Choose Colors</g:link></li>
						<li class="active ${inspirationBookInstance.themes ? "finished" : ""}"><g:link uri="/inspirationBook/chooseTheme">Choose Theme</g:link></li>
					</ul>
					<h3>Guest List</h3>
					<ul>
						<li class="${inspirationBookInstance.numberOfGuests != 0 ? "finished" : ""}"><g:link uri="/inspirationBook/indicateGuests">Indicate Guests</g:link></li>
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
					<h3 class="ed-progress">Step 2 of 15</h3>
					<h2>Choose your wedding theme</h2>
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

					<g:form action="saveColors" id="color-form" >
						<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
						<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
						<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
						<div
							class="colorpicker fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'colors', 'error')} ">
							<div id="errorRandom" style="text-align: center; color: red;"></div>
							
							<span class="property-label">
								<g:message code="inspirationBook.color1.label" default="Color 1" />
							</span>
							<span class="property-value">
								<select class="colorSelect" name="color1" id="color1" style="background-color: ${color1 ? color1.hex : ""}">
									<option value style="background-color: white">-Choose a color-</option>
									<g:each in="${com.hizon.Color.listAllActive()}" var="color">
										<option class="colorOption" value="${color.id}" ${color1 && color1.id == color.id ? 'selected="selected"' : ""} style="background-color: ${color.hex}">${color.name}</option>
									</g:each>
								</select>
								<input type="button" class="btn ed-button" id="random1"
								value="Randomize" />
							</span>							
							<br /><br />
							<span class="property-label">
								<g:message code="inspirationBook.color2.label" default="Color 2" />
							</span>
							<span class="property-value"> 
								<select class="colorSelect" name="color2" id="color2" style="background-color: ${color2 ? color2.hex : ""}">
									<option value style="background-color: white">-Choose a color-</option>
									<g:each in="${com.hizon.Color.listAllActive()}" var="color">
										<option value="${color.id}" ${color2 && color2.id == color.id ? 'selected="selected"' : ""} style="background-color: ${color.hex}">${color.name}</option>
									</g:each>
								</select>
								<input type="button" class="btn ed-button" id="random2" value="Randomize" /><br />
							</span>
							<br /><br />
							<span class="property-label">
								<g:message code="inspirationBook.color3.label" default="Color 3" />
							</span>
							<span class="property-value">
								<select class="colorSelect" name="color3" id="color3" style="background-color: ${color3 ? color3.hex : ""}">
									<option value style="background-color: white">-Choose a color-</option>
									<g:each in="${com.hizon.Color.listAllActive()}" var="color">
										<option value="${color.id}" ${color3 && color3.id == color.id ? 'selected="selected"' : ""} style="background-color: ${color.hex}">${color.name}</option>
									</g:each>
								</select>
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
										<g:submitButton name="save-colors" class="btn ed-save" value="${message(code: 'default.button.save.label', default: 'Save Colors')}" />
									</div>
								</div>
							</div>
						</div>
						<!--/Interaction buttons-->
					</g:form>
					
					<g:form action="saveTheme" id="theme-form">
						<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
						<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
						<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
						<g:hiddenField name="selectedItems" value="${inspirationBookInstance?.themes?.id}" />
						<div
							class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'theme', 'error')} ">
							<span class="property-label"> <g:message
									code="inspirationBook.theme.label" default="Theme" />
							</span>
							<span class="property-value"> 
							<g:each in="${themes}" var="theme">
								<div class="image">
									<g:hiddenField name="image-id" value="${theme.id}"/>
									<h3>
										${theme.name}
									</h3>
									<h4>
										${theme.description}
									</h4>
									<span>
										<g:img dir="/uploaded-files" file="${theme.primaryImage}" width="280px" />
									</span>
								</div>
							</g:each>
							</span>
						</div>
						<br />
						<!--Interaction buttons-->
						<div class="row">
							<div class="col-md-12 col-lg-12"
								style="border-top: 1px solid #fff;">
								<div class="row">
									<div class="col-md-12 col-lg-12 ed-action-btn">
										<input type="button" value="Back" class="btn ed-back" onclick="window.history.back()" />
										<g:submitButton name="save" class="btn ed-save" value="${message(code: 'default.button.save.label', default: 'Save and Continue')}" disabled="false" />
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
