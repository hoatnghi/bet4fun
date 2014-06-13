<%@ page import="happybet.BetMatch; happybet.Bet" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Report</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Show All by User</h1>
    </div>
</div>

<g:each in="${groups}" status="i" var="group">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    ${group.key.name} - ${group.key.description}
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="panel-group" id="accordion">
                    <g:each in="${group.value}" status="index" var="user">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse-${index}">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td class="col-lg-6">${user.getAt(0)}</td>
                                            <td class="col-lg-6"><g:formatNumber number="${user.getAt(1)}" type="currency"/></td>
                                        </tr>
                                    </table>
                                </a>
                            </div>
                            <div id="collapse-${index}" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-${user.getAt(0)}">
                                        <thead>
                                        <tr>
                                            <th>Match</th>
                                            <th>Date</th>
                                            <th>Rate</th>
                                            <th>Score</th>
                                            <th>Bet</th>
                                            <th>Payment</th>
                                            <th>Bet Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${happybet.Bet.findAllByOwner(user.getAt(0))}" var="bet">
                                            <tr>
                                                <td align="center" class="col-lg-5">
                                                    <span>
                                                        ${bet.match.home.name}&nbsp;&nbsp;
                                                        <span class="flag-icon flag-icon-${bet.match.home.isoCode2}"></span>
                                                        &nbsp;&nbsp;vs&nbsp;&nbsp;
                                                        <span class="flag-icon flag-icon-${bet.match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                                    ${bet.match.guess.name}
                                                    </span>
                                                </td>
                                                <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${bet.match.date}"/></td>
                                                <td><g:formatNumber number="${bet.match.hRate}" format="#.##"/> : <g:formatNumber number="${bet.match.gRate}" format="#.##"/></td>
                                                <td><g:formatNumber number="${bet.match.hScore}" format="#.##"/> : <g:formatNumber number="${bet.match.gScore}" format="#.##"/></td>
                                                <td>
                                                    <g:if test="${bet.choose == 1}">${bet.match.home.name}</g:if>
                                                    <g:elseif test="${bet.choose == -1}">${bet.match.guess.name}</g:elseif>
                                                    <g:else>N/A</g:else>
                                                </td>
                                                <td><g:formatNumber number="${bet.amount}" format="#.##"/></td>
                                                <td><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${bet.createDate}"/></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </g:each>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</g:each>

<script type="text/javascript">
    jQuery(document).ready(function () {
        $('#accordion').collapse();
        <g:each in="${groups}" status="i" var="group">
            <g:each in="${group.value}" status="index" var="u">
            $('#collapse-${index}').collapse('hide');
            </g:each>
        </g:each>
    });
</script>
</body>
</html>