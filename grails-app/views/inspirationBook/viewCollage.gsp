<%@ page import="com.hizon.InspirationBook"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<script type="text/javascript">
	// All images need to be loaded for this plugin to work so
	// we end up waiting for the whole window to load in this example
	$(window).load(function() {
		$(document).ready(function() {
			collage();
			$('.Collage').collageCaption();
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
						<li class="${inspirationBookInstance.colors ? "finished" : ""}"><g:link uri="/inspirationBook/chooseColors">Choose Colors</g:link></li>
						<li class="${inspirationBookInstance.theme != null ? "finished" : ""}"><g:link uri="/inspirationBook/chooseTheme">Choose Theme</g:link></li>
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
					<h1>Step 15 of 15</h1>
					<h2>My Wedding Collage</h2>
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


					<div class="Collage">
						<div>
							<label>Theme</label><br>
							<g:img dir="/uploaded-files"
								file="${inspirationBookInstance.theme?.primaryImage}"
								width="300" alt="" />
						</div>
						<div>
							<label>Number of Guests</label><br>
							${inspirationBookInstance.numberOfGuests}
						</div>
						<g:if test="${inspirationBookInstance.appetizers}">
							<div>
								<label>Appetizer</label>
								<g:each in="${inspirationBookInstance.appetizers}" status="i"
									var="appetizer">
									<g:img dir="/uploaded-files" file="${appetizer.image}"
										width="300" alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.soups}">
							<div>
								<label>Soup</label>
								<g:each in="${inspirationBookInstance.soups}" status="i"
									var="soup">
									<g:img dir="/uploaded-files" file="${soup.image}" width="300"
										alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.salads}">
							<div>
								<label>Salad</label>
								<g:each in="${inspirationBookInstance.salads}" status="i"
									var="salad">
									<g:img dir="/uploaded-files" file="${salad.image}" width="300"
										alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.pastas}">
							<div>
								<label>Pasta</label>
								<g:each in="${inspirationBookInstance.pastas}" status="i"
									var="pasta">
									<g:img dir="/uploaded-files" file="${pasta.image}" width="300"
										alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.beefs}">
							<div>
								<label>Beef</label>
								<g:each in="${inspirationBookInstance.beefs}" status="i"
									var="beef">
									<g:img dir="/uploaded-files" file="${beef.image}" width="300"
										alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.porks}">
							<div>
								<label>Pork</label>
								<g:each in="${inspirationBookInstance.porks}" status="i"
									var="pork">
									<g:img dir="/uploaded-files" file="${pork.image}" width="300"
										alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.chickens}">
							<div>
								<label>Chicken</label>
								<g:each in="${inspirationBookInstance.chickens}" status="i"
									var="chicken">
									<g:img dir="/uploaded-files" file="${chicken.image}"
										width="300" alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.seafoods}">
							<div>
								<label>Seafood</label>
								<g:each in="${inspirationBookInstance.seafoods}" status="i"
									var="seafood">
									<g:img dir="/uploaded-files" file="${seafood.image}"
										width="300" alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.vegetables}">
							<div>
								<label>Vegetable</label>
								<g:each in="${inspirationBookInstance.vegetables}" status="i"
									var="vegetable">
									<g:img dir="/uploaded-files" file="${vegetable.image}"
										width="300" alt="" />
								</g:each>
							</div>
						</g:if>
						<g:if test="${inspirationBookInstance.desserts}">
							<div>
								<label>Dessert</label>
								<g:each in="${inspirationBookInstance.desserts}" status="i"
									var="dessert">
									<g:img dir="/uploaded-files" file="${dessert.image}"
										width="300" alt="" />
								</g:each>
							</div>
						</g:if>
					</div>

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


