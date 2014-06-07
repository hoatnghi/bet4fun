<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>System Schedule</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">System Schedules</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<g:each in="${schedules}" status="i" var="s">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <g:link controller="group" action="importMatches" params="[id: s.id]">
                        <button type="button" class="btn btn-primary">Import To Your Group</button>
                    </g:link>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-match-${s.id}">
                            <thead>
                            <tr>
                                <th>Date</th>
                                <th>Match</th>
                                <th>Rate</th>
                                <th>Result</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${s.matches}" status="m" var="match">
                                <tr class="odd">
                                    <td>${fieldValue(bean: match, field: "date")}</td>
                                    <td>${fieldValue(bean: match, field: "home")} vs ${fieldValue(bean: match, field: "guess")}</td>
                                    <td>${fieldValue(bean: match, field: "hRate")}:${fieldValue(bean: match, field: "gRate")}</td>
                                    <td>${fieldValue(bean: match, field: "hScore")}:${fieldValue(bean: match, field: "gScore")}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</g:each>
<script>
    $(document).ready(function() {
        <g:each in="${schedules}" status="i" var="s">
        $('#dataTables-match-${s.id}').dataTable();
        </g:each>
    });
</script>
</body>
</html>