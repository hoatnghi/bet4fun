
<%@ page import="happybet.SystemSchedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'systemSchedule.label', default: 'System Schedule')}" />
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
		<div id="show-systemSchedule" class="row" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list systemSchedule">
                <g:if test="${systemScheduleInstance?.name}">
                    <li class="form-control-static">
                        <span id="name-label" class="property-label"><g:message code="systemSchedule.name.label" default="Name: " /></span>
                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${systemScheduleInstance}" field="name"/></span>

                    </li>
                </g:if>

                <g:if test="${systemScheduleInstance?.startDate}">
                    <li class="form-control-static">
                        <span id="startDate-label" class="property-label"><g:message code="systemSchedule.startDate.label" default="Start Date: " /></span>
                        <span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${systemScheduleInstance?.startDate}" /></span>
                    </li>
                </g:if>

				<g:if test="${systemScheduleInstance?.endDate}">
				<li class="form-control-static">
					<span id="endDate-label" class="property-label"><g:message code="systemSchedule.endDate.label" default="End Date: " /></span>
                    <span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${systemScheduleInstance?.endDate}" /></span>
				</li>
				</g:if>
			
				<g:if test="${systemScheduleInstance?.matches}">
				<li class="fieldcontain">
					<span id="matches-label" class="property-label"><g:message code="systemSchedule.matches.label" default="Matches" /></span>
                    <g:if test="${systemScheduleInstance.matches.size() > 0}">
                        <ol>
                        <g:each in="${systemScheduleInstance.matches}" var="m">
                            <li><span class="property-value" aria-labelledby="matches-label"><g:link controller="systemMatch" action="show" id="${m.id}">${m?.home} vs ${m?.guess}</g:link></span></li>
                        </g:each>
                        </ol>
                    </g:if>
				</li>
				</g:if>
			</ol>
			<g:form url="[resource:systemScheduleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${systemScheduleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
