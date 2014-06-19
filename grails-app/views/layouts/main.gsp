<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">


<!-- from Edwin -->
<link rel="stylesheet"
	href="${resource(dir: 'css/ed', file: 'bootstrap.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css/ed', file: 'layout.css')}" type="text/css">

<link rel="stylesheet"
	href="${resource(dir: 'css/ed', file: 'messages-errors.css')}"
	type="text/css">

<link rel="stylesheet" href="${resource(dir: 'css', file: 'spectrum.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'uploader-override.css')}" type="text/css">

<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
	<g:javascript src="jquery-2.0.3.min.js" />
	<g:javascript src="jquery.collagePlus.min.js" />
	<g:javascript src="bootstrap.min.js" />

<g:layoutHead />
<r:layoutResources />
</head>
<body>

	<div class="container-fluid ed-logout" style="background: #ff8004;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 text-right">
                    <span style="color: #fff; padding: 10px 5px 10px 10px;font-size: 12px; display: inline-block;">
						<g:link controller="logout" style="color: #fff;text-decoration: none;font-weight: bold;">logout</g:link>
                    </span>
                </div>
            </div>
        </div>
    </div>
    
	<div class="container-fluid ed-header">
		<div class="container" style="height: 177px">
			<div class="row">
				<div class="col-md-12 col-lg-12 text-center">
					<g:img dir="images" file="hizons-logo.png" />
				</div>
			</div>
		</div>
	</div>
	<g:layoutBody />

	<!-- FOOTER -->
	<div class="container-fluid text-center ed-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<!-- insert future footer content -->
				</div>
			</div>
		</div>
	</div>
	<!-- END FOOTER -->
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<r:layoutResources />
</body>
</html>
