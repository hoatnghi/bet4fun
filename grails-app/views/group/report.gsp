<%@ page import="happybet.DateUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Betting</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Report</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <g:form action="report">
            <div class="form-group">
                <g:select name="matches" from="${matches}" multiple="true" optionKey="id" optionValue="name"/>
            </div>
            <div class="form-group">
                <g:submitButton name="Search" class="btn btn-primary"/>
                <button name="Print" class="btn btn-primary" onclick="javascript:print();">Print</button>
            </div>
        </g:form>
    </div>
</div>
<g:if test="${bets}">

<div id="content" class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables">
                        <thead>
                        <tr>
                            <th>User</th>
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
                        <g:each in="${bets}" var="bet">
                            <g:if test="${bet.amount > 0}">
                            <tr>
                                <td>
                                    ${bet.owner}
                                    <g:each in="${sum}" var="user">
                                        <g:if test="${user.getAt(0) == bet.owner}">
                                            - <g:formatNumber number="${user.getAt(1)}" type="currency"/>
                                        </g:if>
                                    </g:each>
                                </td>
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
</div>
</g:if>
<script>
    $(document).ready(function() {
        $('#dataTables').dataTable({
            "bLengthChange": false,
            "bPaginate": false,
            "order": [[ 1, "asc" ]]
        }).rowGrouping({bExpandableGrouping : true});
    });
    function print() {
        //$("#content").printElement({printMode:'popup'});
        var w = window.open('', 'content');
        var content = $('#content').html();
        w.document.write(content);

        w.print();
        w.close();
    }
</script>
</body>
</html>