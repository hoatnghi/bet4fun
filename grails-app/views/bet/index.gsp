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
                                    <th>Date</th>
                                    <th>Hour</th>
                                    <th>Match</th>
                                    <th>Rate</th>
                                    <th>Result</th>
                                    <th>Amount</th>
                                    <th>Your bet</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${group.matches}" var="match">
                                    <tr>
                                        <td><g:formatDate format="yyyy-MM-dd" date="${match.date}"/></td>
                                        <td>
                                            <g:if test="${match.date.after(new Date())}">
                                                <g:link controller="bet" action="bet" params="[groupId: group.id, matchId: match.id]">
                                                    <g:formatDate format="HH:mm" date="${match.date}"/>
                                                </g:link>
                                            </g:if>
                                            <g:else><g:formatDate format="HH:mm" date="${match.date}"/></g:else>
                                        </td>
                                        <td align="center">
                                            <span>
                                                ${match.home.name}&nbsp;&nbsp;
                                                <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                                &nbsp;&nbsp;vs&nbsp;&nbsp;
                                                <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                                ${match.guess.name}
                                            </span>
                                        </td>
                                        <td>
                                            <g:formatNumber number="${match.hRate}" format="#.##"/> : <g:formatNumber number="${match.gRate}" format="#.##"/>
                                        </td>
                                        <td>${match.hScore} : ${match.gScore}</td>
                                        <td>${match.amount}</td>
                                        <td>
                                            <g:each in="${bets}" var="bet">
                                                <g:if test="${bet.matchId == match.id}">
                                                    <g:if test="${bet.choose == 1}">${match.home.name}</g:if>
                                                    <g:elseif test="${bet.choose == -1}">${match.guess.name}</g:elseif>
                                                </g:if>
                                            </g:each>
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
    </g:each>
</div>
<script>
    $(document).ready(function() {
        <g:each in="${groups}" status="i" var="group">
        $('#dataTables-${group.id}').dataTable({
            "bLengthChange": false,
            "bPaginate": false,
            "order": [[ 1, "asc" ]]
        }).rowGrouping({bExpandableGrouping : true});
        </g:each>
    });
</script>
</body>
</html>