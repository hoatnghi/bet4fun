<table class="table table-striped table-bordered table-hover" id="dataTables-${user.getAt(0)}">
    <thead>
    <tr>
        <th>Match</th>
        <th>Date</th>
        <th>Rate</th>
        <th>Details</th>
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
                    <span class="flag-icon flag-icon-$user.value.{match.guess.isoCode2}"></span>&nbsp;&nbsp;
                ${bet.match.guess.name}
                </span>
            </td>
            <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${bet.match.date}"/></td>
            <td><g:formatNumber number="${bet.match.hRate}" format="#.##"/> : <g:formatNumber number="${bet.match.gRate}" format="#.##"/></td>
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