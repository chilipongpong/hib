<%@ page import="com.hizon.InspirationBook"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
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
<style type="text/css">
.thumbnail {
	padding: 3px;
	-webkit-box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	-moz-box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	box-shadow: 0px 0px 10px 0px rgba(196, 196, 196, 0.54);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.thumbnail p {
	color: #8e8e8e;
	font-size: 15px;
	line-height: 21px;
	font-weight: 300;
}

.thumbnail p a {
	color: #8e8e8e;
	text-decoration: none;
}

.thumbnail p a:hover {
	color: #333;
}

h2.ed-collage {
	margin-bottom: 11px;
}

.ed-collage_panel {
	background: #f8f8f8;
	margin-bottom: 15px;
}

.panel-heading {
	font-size: 16px;
}

.panel,.panel-heading,.panel-default {
	border: none;
}

.ed-collage_panel span {
	display: inline-block;
	margin-right: 5px;
}

.ed-collage_panel span img {
	vertical-align: 0;
}

.ed-collage_panel p {
	color: #37bc9b;
	display: inline;
}

.ed-collage_panel p strong {
	color: #37bc9b;
	font-size: 30px;
	line-height: 38px;
	font-weight: 300;
	padding-right: 6px;
}
</style>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1>
						<img style="height: 40px" src="../images/head-book.png" alt="book"> Inspiration Book
					</h1>
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
						<li class="${inspirationBookInstance.themes ? "finished" : ""}"><g:link uri="/inspirationBook/chooseTheme">Choose Theme</g:link></li>
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
						<li
							class="${(inspirationBookInstance.hasFlowers || inspirationBookInstance.hasBridalCar || inspirationBookInstance.hasEmcee || inspirationBookInstance.hasCake ||
							inspirationBookInstance.hasFlowersForEntourage || inspirationBookInstance.hasPhotoBooth || inspirationBookInstance.hasMobileBar || inspirationBookInstance.hasVenue) ? "finished" : ""}">
							<g:link uri="/inspirationBook/indicateSuppliers">Indicate Suppliers</g:link>
						</li>
					</ul>
					<h3>
						<g:link uri="/inspirationBook/viewCollage">View Collage</g:link>
					</h3>
				</div>
				<!-- End left menu -->

				<!-- main collage content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<h3 class="ed-progress">Step 15 of 15</h3>
					<h2>My wedding collage</h2>
					
					<!--THEME ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Theme</h2>
						</div>
						<g:each in="${inspirationBookInstance.themes}" status="i" var="theme">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${theme.primaryImage}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${theme.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end THEME ROW -->
					
					<div class="panel-heading ed-collage_panel">
						<span><g:img dir="images" file="guests-icon.png" /></span>
						<p>
							<strong> ${inspirationBookInstance.numberOfGuests}
							</strong> Number of guests
						</p>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">Has suppliers for the following:</div>
						<table class="table" style="border: none !important;">
							<tr style="background-color: white">
								<td>
									<table class="table table-responsive">
										<tr style="background-color: white">
											<td>Flowers</td>
											<td><g:if test="${inspirationBookInstance.hasFlowers}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
										<tr style="background: #f5f5f5;">
											<td>Cake</td>
											<td><g:if test="${inspirationBookInstance.hasCake}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
									</table>
								</td>
								<td>
									<table class="table table-responsive">
										<tr style="background-color: white">
											<td>Bridal car</td>
											<td><g:if test="${inspirationBookInstance.hasBridalCar}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
										<tr style="background: #f5f5f5;">
											<td>Flowers for entourage</td>
											<td><g:if test="${inspirationBookInstance.hasFlowersForEntourage}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
									</table>
								</td>
								<td>
									<table class="table table-responsive">
										<tr style="background-color: white">
											<td>Emcee</td>
											<td><g:if test="${inspirationBookInstance.hasEmcee}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
										<tr style="background: #f5f5f5;">
											<td>Photobooth</td>
											<td><g:if test="${inspirationBookInstance.hasPhotoBooth}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
									</table>
								</td>
								<td>
									<table class="table table-responsive">
										<tr style="background-color: white">
											<td>Mobile Bar</td>
											<td><g:if test="${inspirationBookInstance.hasMobileBar}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
										<tr style="background: #f5f5f5;">
											<td>Photobooth</td>
											<td><g:if test="${inspirationBookInstance.hasVenue}">
													<g:img dir="images" file="check-active.png" />
												</g:if></td>
										</tr>
									</table>
								</td>
							</tr>

						</table>
					</div>

					<!--APPETIZER ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Appetizer</h2>
						</div>
						<g:each in="${inspirationBookInstance.appetizers}" status="i" var="appetizer">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${appetizer.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${appetizer.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end APPETIZER ROW -->

					<!--SOUP ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Soup</h2>
						</div>
						<g:each in="${inspirationBookInstance.soups}" status="i" var="soup">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${soup.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${soup.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end SOUP ROW -->

					<!--SALAD ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Salad</h2>
						</div>
						<g:each in="${inspirationBookInstance.salads}" status="i" var="salad">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${salad.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${salad.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end SALAD ROW -->
					
					<!--PASTA ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Pasta</h2>
						</div>
						<g:each in="${inspirationBookInstance.pastas}" status="i" var="pasta">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${pasta.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${pasta.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end PASTA ROW -->
					
					<!--BEEF ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Beef</h2>
						</div>
						<g:each in="${inspirationBookInstance.beefs}" status="i" var="beef">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${beef.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${beef.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end BEEF ROW -->
					
					<!--PORK ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Pork</h2>
						</div>
						<g:each in="${inspirationBookInstance.beefs}" status="i" var="pork">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${pork.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${pork.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end PORK ROW -->
					
					<!--CHICKEN ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Chicken</h2>
						</div>
						<g:each in="${inspirationBookInstance.chickens}" status="i" var="chicken">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${chicken.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${chicken.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end CHICKEN ROW -->
					
					<!--SEAFOOD ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Seafood</h2>
						</div>
						<g:each in="${inspirationBookInstance.seafoods}" status="i" var="seafood">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${seafood.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${seafood.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end SEAFOOD ROW -->
					
					<!--VEGETABLE ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Vegetables</h2>
						</div>
						<g:each in="${inspirationBookInstance.vegetables}" status="i" var="vegetable">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${vegetable.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${vegetable.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end VEGETABLE ROW -->
					
					<!--DESSERT ROW-->
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<h2 class="ed-collage">Dessert</h2>
						</div>
						<g:each in="${inspirationBookInstance.desserts}" status="i" var="dessert">
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail">
									<g:img dir="/uploaded-files" file="${dessert.image}" class="img-responsive" />
									<div class="caption">
										<p>
											<a href="#"> ${dessert.name}
											</a>
										</p>
									</div>
								</div>
							</div>
						</g:each>
					</div>
					<!-- end DESSERT ROW -->

				</div>
				<!-- end Panel -->
			</div>
			<!-- end main collage panel -->
		</div>
		<!-- end row -->
	</div>
	<!--  end MAIN CONTENT -->
</body>
</html>


