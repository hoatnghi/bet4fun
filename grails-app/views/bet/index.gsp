<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Betting</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Betting</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
    </div>
</div>
<div class="row">
    <g:each in="${groups}" status="i" var="group">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    ${group.name} - ${group.description}
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-${group.id}">
                            <thead>
                                <tr>
                                    <th>Match</th>
                                    <th>Date</th>
                                    <th>Rate</th>
                                    <th>Result</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${group.matches}" var="match">
                                    <tr>
                                        <td>
                                            <g:link controller="bet" action="bet" params="[groupId: group.id, matchId: match.id]">
                                                <span>
                                                    ${match.home.name}&nbsp;&nbsp;
                                                    <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                                    &nbsp;&nbsp;vs&nbsp;&nbsp;
                                                    <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                                    ${match.guess.name}
                                                </span>
                                            </g:link>
                                        </td>
                                        <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${match.date}"/></td>
                                        <td>
                                            <g:formatNumber number="${match.hRate}" format="#.##"/>
                                            :<g:formatNumber number="${match.gRate}" format="#.##"/>
                                        </td>
                                        <td>${match.hScore}:${match.gScore}</td>
                                        <td>${match.amount}</td>
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
    </g:each>
</div>
<script>
    $(document).ready(function() {
        <g:each in="${groups}" status="i" var="group">
        $('#dataTables-${group.id}').dataTable({
            "order": [[ 1, "desc" ]]
        });
        </g:each>
    });
</script>
</body>
</html>