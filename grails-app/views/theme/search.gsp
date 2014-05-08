<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'theme.label', default: 'theme')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-theme" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<g:render template="../dashboard/navigation" />
	<div id="list-Color" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form action="search" method="get">
			<g:textField name="q" value="${params.q}" />
			<g:submitButton name="search" />
		</g:form>
		
		<g:set var="haveResults" value="${themeInstanceList?.results}" />
		
		<g:if test="${haveResults}">
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="name"
							title="${message(code: 'theme.name.label', default: 'Name')}" />

						<g:sortableColumn property="pantone"
							title="${message(code: 'theme.description.label', default: 'Description')}" />
						
						<g:sortableColumn property="pantone"
							title="${message(code: 'theme.level.label', default: 'Level')}" />
							
						<g:sortableColumn property="status"
							title="${message(code: 'theme.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:set var="totalPages" value="${Math.ceil(themeInstanceList.total / themeInstanceList.max)}" />
					<g:each in="${themeInstanceList.results}" status="i"
						var="themeInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
								<g:link action="show" id="${themeInstance.id}">
									${fieldValue(bean: themeInstance, field: "name")}
								</g:link>
							</td>

							<td>
								${fieldValue(bean: themeInstance, field: "description")}
							</td>

							<td>
								${fieldValue(bean: themeInstance, field: "level")}
							</td>

							<td>
								${fieldValue(bean: themeInstance, field: "status.name")}
							</td>
														
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
			<g:paginate params="[q: params.q]" total="${themeInstanceList.total}"/>

            </div>
		</g:if>
		<g:else>
			<br />
			<h3>Sorry, no Themes found</h3>
		</g:else>
	</div>
</body>
</html>
