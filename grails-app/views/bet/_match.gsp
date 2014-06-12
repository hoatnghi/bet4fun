<g:each in="${groups}" status="i" var="group">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <p>${group.name} - ${group.description}</p>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-match-${group.id}">
                        <thead>
                        <tr>
                            <th>Match</th>
                            <th>Owner</th>
                            <th>Bet</th>
                            <th>Payment</th>
                            <th>Bet Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${group.matches}" var="match">
                            <g:each in="${match.bets}" var="bet">
                                <tr id="${match.id}">
                                    <td align="center">
                                        <div class="col-lg-3"><g:formatDate format="yyyy-MM-dd HH:mm" date="${match.date}"/></div>
                                        <div class="col-lg-6">
                                            ${match.home.name}&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                            &nbsp;&nbsp;vs &nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>
                                            &nbsp;&nbsp;${match.guess.name}
                                        </div>
                                        <div class="col-lg-3">Total Amount: <g:formatNumber number="${match.total}" format="#.##"/></div>
                                    </td>
                                    <td>${bet.owner}</td>
                                    <td>
                                        <g:if test="${bet.choose == 1}">${match.home.name}</g:if>
                                        <g:elseif test="${bet.choose == -1}">${match.guess.name}</g:elseif>
                                        <g:else>N/A</g:else>
                                    </td>
                                    <td><g:formatNumber number="${bet.amount}" format="#.##"/></td>
                                    <td><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${bet.createDate}"/></td>
                                </tr>
                            </g:each>
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