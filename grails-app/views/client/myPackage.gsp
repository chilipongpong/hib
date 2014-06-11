
<%@ page import="com.hizon.Package"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'package.label', default: 'Package')}" />
<title>My Package</title>
</head>
<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img class="clientIcon" src="../images/head-pack.png" alt="My Planner"> My Package</h1>
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
				<div class="col-md-3 col-lg-3 ed-content-nav"></div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<div id="show-package" class="content scaffold-show" role="main">
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<ol class="property-list package">

							<g:if test="${packageInstance?.name}">
								<li class="fieldcontain"><span id="name-label"
									class="property-label"><g:message
											code="package.name.label" default="Name" /></span> <span
									class="property-value" aria-labelledby="name-label"><g:fieldValue
											bean="${packageInstance}" field="name" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.themeLevel}">
								<li class="fieldcontain"><span id="themeLevel-label"
									class="property-label"><g:message
											code="package.themeLevel.label" default="Theme Level" /></span> <span
									class="property-value" aria-labelledby="themeLevel-label"><g:fieldValue
											bean="${packageInstance}" field="themeLevel" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.numberOfGuests}">
								<li class="fieldcontain"><span id="numberOfGuests-label"
									class="property-label"><g:message
											code="package.numberOfGuests.label"
											default="Number Of Guests" /></span> <span class="property-value"
									aria-labelledby="numberOfGuests-label"><g:fieldValue
											bean="${packageInstance}" field="numberOfGuests" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.price}">
								<li class="fieldcontain"><span id="price-label"
									class="property-label"><g:message
											code="package.price.label" default="Price" /></span> <span
									class="property-value" aria-labelledby="price-label"><g:fieldValue
											bean="${packageInstance}" field="price" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.appetizer}">
								<li class="fieldcontain"><span id="appetizer-label"
									class="property-label"><g:message
											code="package.appetizer.label" default="Appetizer" /></span> <span
									class="property-value" aria-labelledby="appetizer-label"><g:fieldValue
											bean="${packageInstance}" field="appetizer" /></span></li>
							</g:if>


							<g:if test="${packageInstance?.soup}">
								<li class="fieldcontain"><span id="soup-label"
									class="property-label"><g:message
											code="package.soup.label" default="Soup" /></span> <span
									class="property-value" aria-labelledby="soup-label"><g:fieldValue
											bean="${packageInstance}" field="soup" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.salad}">
								<li class="fieldcontain"><span id="salad-label"
									class="property-label"><g:message
											code="package.salad.label" default="Salad" /></span> <span
									class="property-value" aria-labelledby="salad-label"><g:fieldValue
											bean="${packageInstance}" field="salad" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.pasta}">
								<li class="fieldcontain"><span id="pasta-label"
									class="property-label"><g:message
											code="package.pasta.label" default="Pasta" /></span> <span
									class="property-value" aria-labelledby="pasta-label"><g:fieldValue
											bean="${packageInstance}" field="pasta" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.beef}">
								<li class="fieldcontain"><span id="beef-label"
									class="property-label"><g:message
											code="package.beef.label" default="Beef" /></span> <span
									class="property-value" aria-labelledby="beef-label"><g:fieldValue
											bean="${packageInstance}" field="beef" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.pork}">
								<li class="fieldcontain"><span id="pork-label"
									class="property-label"><g:message
											code="package.pork.label" default="Pork" /></span> <span
									class="property-value" aria-labelledby="pork-label"><g:fieldValue
											bean="${packageInstance}" field="pork" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.chicken}">
								<li class="fieldcontain"><span id="chicken-label"
									class="property-label"><g:message
											code="package.chicken.label" default="Chicken" /></span> <span
									class="property-value" aria-labelledby="chicken-label"><g:fieldValue
											bean="${packageInstance}" field="chicken" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.seafood}">
								<li class="fieldcontain"><span id="seafood-label"
									class="property-label"><g:message
											code="package.seafood.label" default="Seafood" /></span> <span
									class="property-value" aria-labelledby="seafood-label"><g:fieldValue
											bean="${packageInstance}" field="seafood" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.vegetable}">
								<li class="fieldcontain"><span id="vegetable-label"
									class="property-label"><g:message
											code="package.vegetable.label" default="Vegetable" /></span> <span
									class="property-value" aria-labelledby="vegetable-label"><g:fieldValue
											bean="${packageInstance}" field="vegetable" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.dessert}">
								<li class="fieldcontain"><span id="dessert-label"
									class="property-label"><g:message
											code="package.dessert.label" default="Dessert" /></span> <span
									class="property-value" aria-labelledby="dessert-label"><g:fieldValue
											bean="${packageInstance}" field="dessert" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.serviceStyle}">
								<li class="fieldcontain"><span id="serviceStyle-label"
									class="property-label"><g:message
											code="package.serviceStyle.label" default="Service Style" /></span>
									<span class="property-value"
									aria-labelledby="serviceStyle-label"><g:fieldValue
											bean="${packageInstance}" field="serviceStyle" /></span></li>
							</g:if>

							<g:if test="${packageInstance?.freebies}">
								<li class="fieldcontain"><span id="freebies-label"
									class="property-label"><g:message
											code="package.freebies.label" default="Freebies" /></span> <g:each
										in="${packageInstance.freebies}" var="f">
										<span class="property-value" aria-labelledby="freebies-label">
											${f}
										</span>
									</g:each></li>
							</g:if>

						</ol>
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