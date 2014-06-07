
<%@ page import="happybet.SystemMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'systemMatch.label', default: 'SystemMatch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row" role="navigation">
            <ol class="breadcrumb">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ol>
		</div>
		<div id="show-systemMatch" class="row" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list systemMatch">
			
				<g:if test="${systemMatchInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="systemMatch.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${systemMatchInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.gRate}">
				<li class="fieldcontain">
					<span id="gRate-label" class="property-label"><g:message code="systemMatch.gRate.label" default="G Rate" /></span>
					
						<span class="property-value" aria-labelledby="gRate-label"><g:fieldValue bean="${systemMatchInstance}" field="gRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.gScore}">
				<li class="fieldcontain">
					<span id="gScore-label" class="property-label"><g:message code="systemMatch.gScore.label" default="G Score" /></span>
					
						<span class="property-value" aria-labelledby="gScore-label"><g:fieldValue bean="${systemMatchInstance}" field="gScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.guess}">
				<li class="fieldcontain">
					<span id="guess-label" class="property-label"><g:message code="systemMatch.guess.label" default="Guess" /></span>
					
						<span class="property-value" aria-labelledby="guess-label"><g:fieldValue bean="${systemMatchInstance}" field="guess"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.hRate}">
				<li class="fieldcontain">
					<span id="hRate-label" class="property-label"><g:message code="systemMatch.hRate.label" default="H Rate" /></span>
					
						<span class="property-value" aria-labelledby="hRate-label"><g:fieldValue bean="${systemMatchInstance}" field="hRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.hScore}">
				<li class="fieldcontain">
					<span id="hScore-label" class="property-label"><g:message code="systemMatch.hScore.label" default="H Score" /></span>
					
						<span class="property-value" aria-labelledby="hScore-label"><g:fieldValue bean="${systemMatchInstance}" field="hScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.home}">
				<li class="fieldcontain">
					<span id="home-label" class="property-label"><g:message code="systemMatch.home.label" default="Home" /></span>
					
						<span class="property-value" aria-labelledby="home-label"><g:fieldValue bean="${systemMatchInstance}" field="home"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${systemMatchInstance?.schedule}">
				<li class="fieldcontain">
					<span id="schedule-label" class="property-label"><g:message code="systemMatch.schedule.label" default="Schedule" /></span>
					
						<span class="property-value" aria-labelledby="schedule-label"><g:link controller="systemSchedule" action="show" id="${systemMatchInstance?.schedule?.id}">${systemMatchInstance?.schedule?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:systemMatchInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${systemMatchInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
