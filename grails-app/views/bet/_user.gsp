<g:each in="${groups}" status="i" var="group">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                ${group.name} - ${group.description}
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-user-${group.id}">
                        <thead>
                        <tr>
                            <th>Match</th>
                            <th>User</th>
                            <th>Bet</th>
                            <th>Amount</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${group.matches}" var="match">
                            <g:each in="${match.bets}" var="bet">
                            <tr>
                                <td>
                                    <p>
                                        <span>
                                            ${match.home.name}&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                            ${match.guess.name}
                                        </span>
                                    </p>
                                </td>
                                <td>${bet.owner}</td>
                                <td>
                                    <g:if test="${bet.choose == 1}">${match.home.name}</g:if>
                                    <g:elseif test="${bet.choose == -1}">${match.guess.name}</g:elseif>
                                    <g:else>N/A</g:else>
                                </td>
                                <td>
                                    ${bet.amount}
                                </td>
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