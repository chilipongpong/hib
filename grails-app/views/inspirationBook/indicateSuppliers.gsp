<%@ page import="com.hizon.InspirationBook" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:render template="../dashboard/navigation" />
	<!-- Heading -->
	<div class="container-fluid text-center ed-title-head">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1><img class="clientIcon" src="../images/head-book.png" alt="book"> Inspiration Book</h1>
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
						<h3>Wedding Scheme</h3>
						<ul>
							<li><g:link
								uri="/inspirationBook/chooseColors">Choose Colors</g:link></li>
							<li><g:link uri="/inspirationBook/chooseTheme">Choose Theme</g:link></li>
						</ul>
						<h3>Guest List</h3>
						<ul><li><g:link uri="/inspirationBook/indicateGuests">Indicate Guests</g:link></li></ul>
						<h3>Food</h3>
							<ul>
								<li><g:link uri="/inspirationBook/chooseAppetizer">Choose Appetizer</g:link></li>
								<li><g:link uri="/inspirationBook/chooseSoup">Choose Soup</g:link></li>
								<li><g:link uri="/inspirationBook/chooseSalad">Choose Salad</g:link></li>
								<li><g:link uri="/inspirationBook/choosePasta">Choose Pasta</g:link></li>
								<li><g:link uri="/inspirationBook/chooseBeef">Choose Beef</g:link></li>
								<li><g:link uri="/inspirationBook/choosePork">Choose Pork</g:link></li>
								<li><g:link uri="/inspirationBook/chooseChicken">Choose Chicken</g:link></li>
								<li><g:link uri="/inspirationBook/chooseSeafood">Choose Seafood</g:link></li>
								<li><g:link uri="/inspirationBook/chooseVegetable">Choose Vegetable</g:link></li>
								<li><g:link uri="/inspirationBook/chooseDessert">Choose Dessert</g:link></li>
							</ul>
						<h3 class="active">Supplier</h3>
						<ul><li class="active"><g:link uri="/inspirationBook/indicateSuppliers">Indicate Suppliers</g:link></li></ul>
						<h3><g:link uri="/inspirationBook/viewCollage">View Collage</g:link></h3>

				</div>
				<!-- End left menu -->

				<!-- main content area -->
				<div class="col-md-9 col-lg-9 ed-main-content" style="">
					<h2>Choose your wedding colors</h2>
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
			
			<g:form action="saveSuppliers">
				<g:hiddenField name="client.id" value="${inspirationBookInstance?.client?.id}" />
				<g:hiddenField name="id" value="${inspirationBookInstance?.id}" />
				<g:hiddenField name="version" value="${inspirationBookInstance?.version}" />
				<label>Do you have a set of suppliers for the following?</label>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasFlowers', 'error')} ">
					<label>
						<g:message code="inspirationBook.flowers.label" default="Flowers" />
					</label>
					<g:checkBox name="hasFlowers" value="${inspirationBookInstance?.hasFlowers}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasBridalCar', 'error')} ">
					<label>
						<g:message code="inspirationBook.bridalCar.label" default="Bridal Car" />
					</label>
					<g:checkBox name="hasBridalCar" value="${inspirationBookInstance?.hasBridalCar}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasEmcee', 'error')} ">
					<label>
						<g:message code="inspirationBook.emcee.label" default="Emcee or Host" />
					</label>
					<g:checkBox name="hasEmcee" value="${inspirationBookInstance?.hasEmcee}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasCake', 'error')} ">
					<label>
						<g:message code="inspirationBook.cake.label" default="Cake" />
					</label>
					<g:checkBox name="hasCake" value="${inspirationBookInstance?.hasCake}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasFlowersForEntourage', 'error')} ">
					<label>
						<g:message code="inspirationBook.flowersForEntourage.label" default="Flowers for Entourage" />
					</label>
					<g:checkBox name="hasFlowersForEntourage" value="${inspirationBookInstance?.hasFlowersForEntourage}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasPhotoBooth', 'error')} ">
					<label>
						<g:message code="inspirationBook.photoBooth.label" default="Photo Booth" />
					</label>
					<g:checkBox name="hasPhotoBooth" value="${inspirationBookInstance?.hasPhotoBooth}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasMobileBar', 'error')} ">
					<label>
						<g:message code="inspirationBook.mobileBar.label" default="Mobile Bar" />
					</label>
					<g:checkBox name="hasMobileBar" value="${inspirationBookInstance?.hasMobileBar}" />
				</div>
				<div class="fieldcontain ${hasErrors(bean: inspirationBookInstance, field: 'hasVenue', 'error')} ">
					<label>
						<g:message code="inspirationBook.venue.label" default="Venue" />
					</label>
					<g:checkBox name="hasVenue" value="${inspirationBookInstance?.hasVenue}" />
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