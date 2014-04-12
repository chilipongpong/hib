<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'adminstyle.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'spectrum.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'superfish.css')}" type="text/css">		
		<link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
		<g:javascript src="jquery-2.0.3.min.js" />
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<section>
			<div role="banner"><a class="hizonsLogo" href="/hib"> </a></div>
			<div id="navi">
				<ul class="sf-menu">
					<li><a href="#">Food Menu</a>
						<ul>
							<li><g:link uri="/menuCategory">Menu Categories</g:link></li>
							<li><g:link uri="/menuItem">Food Items</g:link></li>					
						</ul>
					</li>
					<li><g:link uri="/color">Colors</g:link></li>
					<li><g:link uri="/theme">Themes</g:link></li>
					<li><g:link uri="/bundledItem">Bundled Items</g:link></li>
					<li><g:link uri="/level">Levels</g:link></li>
					<li><g:link uri="/valueRange">Value Range</g:link></li>
					<li><g:link uri="/inspirationBook">Inspiration Book</g:link></li>
					<li><a href="#">User</a>
						<ul>
							<li><g:link uri="/client">Client</g:link></li>
							<li><g:link uri="/planner">Planner</g:link></li>
							<li><g:link uri="/plannerSupervisor">Planner Supervisor</g:link></li>
							<li><g:link uri="/userAdmin">User Admin</g:link></li>
							<li><g:link uri="/superAdmin">Super Admin</g:link></li>				
						</ul>
					</li>
					
				</ul>
			</div>
			<div style="clear:both"></div>
		</section>
		<g:layoutBody/>
		<div class="footer" role="contentinfo">
		<g:form controller="logout">
				<fieldset class="buttons">
					<g:submitButton name="logout" class="logout" value="${message(code: 'default.button.logout.label', default: 'Logout')}" />
				</fieldset>
			</g:form>
		</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
