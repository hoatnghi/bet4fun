<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Report</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Your Bets</h1>
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
                                <th>Your Bet</th>
                                <th>Payment</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${bets}" var="bet">
                                <g:if test="${bet.match.group.id = group.id}">
                                    <tr>
                                        <td><g:formatDate format="yyyy-MM-dd" date="${bet.match.date}"/></td>
                                        <td>
                                            <g:if test="${!bet.match.flagClosed && happybet.DateUtils.isFuture(bet.match.date)}">
                                                <g:link controller="bet" action="bet" params="[groupId: group.id, matchId: bet.match.id]">
                                                    <g:formatDate format="HH:mm" date="${bet.match.date}"/>
                                                </g:link>
                                            </g:if>
                                            <g:else><g:formatDate format="HH:mm" date="${bet.match.date}"/></g:else>
                                        </td>
                                        <td align="center">
                                            <span>
                                                ${bet.match.home.name}&nbsp;
                                                <span class="flag-icon flag-icon-${bet.match.home.isoCode2}"></span>&nbsp;&nbsp;vs&nbsp;&nbsp;<span class="flag-icon flag-icon-${bet.match.guess.isoCode2}"></span>
                                                &nbsp;${bet.match.guess.name}
                                            </span>
                                        </td>
                                        <td>
                                            <g:formatNumber number="${bet.match.hRate}" format="#.##"/>
                                            :<g:formatNumber number="${bet.match.gRate}" format="#.##"/>
                                        </td>
                                        <td>${bet.match.hScore}:${bet.match.gScore}</td>
                                        <td>
                                            <g:if test="${bet.choose == 1}">${bet.match.home.name}</g:if>
                                            <g:if test="${bet.choose == -1}">${bet.match.guess.name}</g:if>
                                            <g:if test="${bet.choose == 0}">N/A</g:if>
                                        </td>
                                        <td><g:formatNumber number="${bet.amount}" type="currency"/></td>
                                    </tr>
                                </g:if>
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