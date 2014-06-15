<%@ page import="happybet.DateUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Manage Your Groups</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Groups Management</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<g:each in="${groups}" status="i" var="group">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Group Information
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <tbody>
                                    <tr><td>${group.name}</td></tr>
                                    <tr><td>${group.description}</td></tr>
                                    <tr><td>${group.owner}</td></tr>
                                    <tr><td>${group.expiredDate}</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <g:link controller="group" action="member" params="[groupId: group.id]">
                            <button type="button" class="btn btn-primary">Add User</button>
                        </g:link>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-${group.id}">
                                <thead><tr><th>User</th></tr></thead>
                                <tbody>
                                    <g:each in="${group.users}" status="m" var="u">
                                        <tr>
                                            <td>${u.username}</td>
                                            <td>
                                                <g:link class="aui-button" controller="group" action="delUser" params="[groupId: group.id, userId: u.id]">
                                                    <i class="fa fa-trash-o fa-fw"></i>
                                                </g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <g:link controller="group" action="matches" params="[groupId: group.id]">
                        <button type="button" class="btn btn-primary"><i class="fa fa-plus-circle fa-fw"></i> Match</button>
                    </g:link>
                    <g:link controller="group" action="sysSchedules" params="[id: group.id]">
                        <button type="button" class="btn btn-primary">View System Schedules</button>
                    </g:link>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-match-${group.id}">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Match</th>
                                    <th>Rate</th>
                                    <th>Result</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${group.matches}" status="m" var="match">
                                <tr class="odd">
                                    <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${match.date}"/></td>
                                    <td>
                                        <span>
                                            ${match.home.name}&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                            ${match.guess.name}
                                        </span>
                                    </td>
                                    <td>${match.hRate}:${match.gRate}</td>
                                    <td>${match.hScore}:${match.gScore}</td>
                                    <td>${match.amount}</td>
                                    <td>
                                        <g:link controller="group" action="matches" params="[id: group.id, matchId: match.id]">
                                            <i class="fa fa-edit fa-fw"></i>
                                        </g:link>
                                        <g:link controller="group" action="remove" params="[groupId: group.id, matchId: match.id]">
                                            <i class="fa fa-trash-o fa-fw"></i>
                                        </g:link>
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
</g:each>
<script>
    $(document).ready(function() {
        <g:each in="${groups}" status="i" var="group">
            $('#dataTables-${group.id}').dataTable();
            $('#dataTables-match-${group.id}').dataTable();
        </g:each>
    });
</script>
</body>
</html>