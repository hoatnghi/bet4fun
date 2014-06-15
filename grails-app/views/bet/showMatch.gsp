<%@ page import="happybet.DateUtils; happybet.Bet" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Report</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Show All by Match</h1>
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
                                                <td><g:formatDate date="${user.getAt(0).date}" format="yyyy-MM-dd HH:mm"/></td>
                                                <td align="center">
                                                    <span>
                                                        ${user.getAt(0).home.name}&nbsp;&nbsp;
                                                        <span class="flag-icon flag-icon-${user.getAt(0).home.isoCode2}"></span>
                                                        &nbsp;&nbsp;vs&nbsp;&nbsp;
                                                        <span class="flag-icon flag-icon-${user.getAt(0).guess.isoCode2}"></span>&nbsp;&nbsp;
                                                        ${user.getAt(0).guess.name}
                                                    </span>
                                                </td>
                                                <td><g:formatNumber number="${user.getAt(0).hRate}" format="#.##"/> : <g:formatNumber number="${user.getAt(0).gRate}" format="#.##"/></td>
                                                <td><g:formatNumber number="${user.getAt(0).hScore}" format="#.##"/> : <g:formatNumber number="${user.getAt(0).gScore}" format="#.##"/></td>
                                                <td>Total Fund: <g:formatNumber number="${user.getAt(1)}" type="currency"/></td>
                                                <td>${user.getAt(0).home.name}: ${happybet.Bet.countByMatchAndChoose(user.getAt(0), 1)}</td>
                                                <td>${user.getAt(0).guess.name}: ${happybet.Bet.countByMatchAndChoose(user.getAt(0), -1)}</td>
                                            </tr>
                                        </table>
                                    </a>
                                </div>
                                <div id="collapse-${index}" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-${user.getAt(0)}">
                                            <thead>
                                            <tr>
                                                <th>Owner</th>
                                                <th>Bet</th>
                                                <th>Payment</th>
                                                <th>Bet Date</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${user.getAt(0).bets}" var="bet">
                                                <tr>
                                                    <td>${bet.owner}</td>
                                                    <td>
                                                        <g:if test="${bet.choose == 1}">${bet.match.home.name}</g:if>
                                                        <g:elseif test="${bet.choose == -1}">${bet.match.guess.name}</g:elseif>
                                                        <g:else>N/A</g:else>
                                                    </td>
                                                    <td><g:formatNumber number="${bet.amount}" type="currency"/></td>
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