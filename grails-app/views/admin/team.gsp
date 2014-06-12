<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Teams Management</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Teams Management</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <g:link controller="admin" action="buildTeam">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-plus-circle fa-fw"></i> Team
                    </button>
                </g:link>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>ISO Alpha 2</th>
                            <th>ISO Alpha 3</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${teams}" status="i" var="team">
                            <tr class="odd">
                                <td>${fieldValue(bean: team, field: "name")}</td>
                                <td>${fieldValue(bean: team, field: "isoCode2")}</td>
                                <td>${fieldValue(bean: team, field: "isoCode3")}</td>
                                <td>
                                    <g:link controller="admin" action="buildTeam" params="[teamId: team.id]"><i class="fa fa-edit fa-fw"></i></g:link>
                                    <g:link controller="admin" action="delTeam" params="[teamId: team.id]"><i class="fa fa-trash-o fa-fw"></i></g:link>
                                </td>
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
<script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable({"bLengthChange": false, "bPaginate": false});
    });
</script>
</body>
</html>