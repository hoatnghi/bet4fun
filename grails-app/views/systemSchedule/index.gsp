
<%@ page import="happybet.SystemSchedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'systemSchedule.label', default: 'SystemSchedule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <g:message code="default.list.label" args="[entityName]" />
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                    <tr>
                                        <g:sortableColumn property="name" title="${message(code: 'systemSchedule.name.label', default: 'Name')}" />
                                        <g:sortableColumn property="startDate" title="${message(code: 'systemSchedule.startDate.label', default: 'Start Date')}" />
                                        <g:sortableColumn property="endDate" title="${message(code: 'systemSchedule.endDate.label', default: 'End Date')}" />
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${systemScheduleInstanceList}" status="i" var="systemScheduleInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td><g:link action="show" id="${systemScheduleInstance.id}">${fieldValue(bean: systemScheduleInstance, field: "endDate")}</g:link></td>
                                            <td>${fieldValue(bean: systemScheduleInstance, field: "name")}</td>
                                            <td><g:formatDate date="${systemScheduleInstance.startDate}" /></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
		                </div>
                    </div>
                </div>
            </div>
        </div>
    <script>
        $(document).ready(function() {
            $('#dataTables').dataTable();
        });
    </script>
	</body>
</html>
