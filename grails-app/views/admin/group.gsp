<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Groups Management</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Groups Management</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <g:link controller="admin" action="build">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-plus-circle fa-fw"></i> Group
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
                            <th>Description</th>
                            <th>Owner</th>
                            <th>Expire Date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${groups}" status="i" var="group">
                            <tr class="odd">
                                <td>${fieldValue(bean: group, field: "name")}</td>
                                <td>${fieldValue(bean: group, field: "description")}</td>
                                <td>${fieldValue(bean: group, field: "owner")}</td>
                                <td>${fieldValue(bean: group, field: "expiredDate")}</td>
                                <td>
                                    <i class="fa fa-edit fa-fw"></i>
                                    <i class="fa fa-trash-o fa-fw"></i>
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