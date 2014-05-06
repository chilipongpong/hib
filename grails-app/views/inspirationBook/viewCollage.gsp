<%@ page import="com.hizon.InspirationBook" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspirationBook.label', default: 'Inspiration Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:render template="nav"/>
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
			
			<div><label>Theme</label><g:img dir="/uploaded-files" file="${inspirationBookInstance.theme?.primaryImage}" width="400" alt=""/></div>
			<div><label>Number of Guests</label>${inspirationBookInstance.numberOfGuests}</div>
			<g:if test="${inspirationBookInstance.appetizers}">
				<div>
					<label>Appetizer</label>
					<g:each in="${inspirationBookInstance.appetizers}" status="i" var="appetizer">
						<g:img dir="/uploaded-files" file="${appetizer.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.soups}">
				<div>
					<label>Soup</label>
					<g:each in="${inspirationBookInstance.soups}" status="i" var="soup">
						<g:img dir="/uploaded-files" file="${soup.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.salads}">
				<div>
					<label>Salad</label>
					<g:each in="${inspirationBookInstance.salads}" status="i" var="salad">
						<g:img dir="/uploaded-files" file="${salad.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.pastas}">
				<div>
					<label>Pasta</label>
					<g:each in="${inspirationBookInstance.pastas}" status="i" var="pasta">
						<g:img dir="/uploaded-files" file="${pasta.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.beefs}">
				<div>
					<label>Beef</label>
					<g:each in="${inspirationBookInstance.beefs}" status="i" var="beef">
						<g:img dir="/uploaded-files" file="${beef.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.porks}">
				<div>
					<label>Pork</label>
					<g:each in="${inspirationBookInstance.porks}" status="i" var="pork">
						<g:img dir="/uploaded-files" file="${pork.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.chickens}">
				<div>
					<label>Chicken</label>
					<g:each in="${inspirationBookInstance.chickens}" status="i" var="chicken">
						<g:img dir="/uploaded-files" file="${chicken.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.seafoods}">
				<div>
					<label>Seafood</label>
					<g:each in="${inspirationBookInstance.seafoods}" status="i" var="seafood">
						<g:img dir="/uploaded-files" file="${seafood.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.vegetables}">
				<div>
					<label>Vegetable</label>
					<g:each in="${inspirationBookInstance.vegetables}" status="i" var="vegetable">
						<g:img dir="/uploaded-files" file="${vegetable.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
			<g:if test="${inspirationBookInstance.desserts}">
				<div>
					<label>Dessert</label>
					<g:each in="${inspirationBookInstance.desserts}" status="i" var="dessert">
						<g:img dir="/uploaded-files" file="${dessert.image}" width="400" alt=""/>
					</g:each>
				</div>
			</g:if>
		</div>
	</body>
</html>
