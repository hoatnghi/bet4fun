
<%@ page import="happybet.SystemMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'systemMatch.label', default: 'SystemMatch')}" />
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
                                <th>Date</th>
                                <th>Match</th>
                                <th>Bet Rate</th>
                                <th>Result</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${systemMatchInstanceList}" status="i" var="systemMatchInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><g:link action="show" id="${systemMatchInstance.id}">${fieldValue(bean: systemMatchInstance, field: "date")}</g:link></td>
                                    <td>${fieldValue(bean: systemMatchInstance, field: "home")} VS ${fieldValue(bean: systemMatchInstance, field: "guess")}</td>
                                    <td>${fieldValue(bean: systemMatchInstance, field: "hRate")} : ${fieldValue(bean: systemMatchInstance, field: "gRate")}</td>
                                    <td>${fieldValue(bean: systemMatchInstance, field: "hScore")} : ${fieldValue(bean: systemMatchInstance, field: "gScore")}</td>
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
