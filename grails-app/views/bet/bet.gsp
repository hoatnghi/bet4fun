<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Bet for ${bet.match.home.name} vs ${bet.match.guess.name}</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <span>
                ${bet.match.home.name}
                <span class="flag-icon flag-icon-${bet.match.home.isoCode2}"></span>   VS   <span class="flag-icon flag-icon-${bet.match.guess.isoCode2}"></span>
                ${bet.match.guess.name}
            </span>
        </h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Betting
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-4">
                        <g:form action="takeBet" >
                            <g:hiddenField name="matchId" value="${bet.match.id}"/>
                            <fieldset>
                                <div class="form-group">
                                    <g:radioGroup values="[1, -1]" labels="[bet.match.home.name, bet.match.guess.name]" name="choose" value="${bet?.choose}">
                                        <p>${it.label} ${it.radio}</p>
                                    </g:radioGroup>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Your comment</label>
                                    <g:textArea name="comment" value="${bet?.comment}" class="form-control" rows="3"/>
                                </div>
                                <div class="buttons-container">
                                    <g:if test="${bet.match.date.after(Calendar.getInstance(new Locale('vi_VN')).getTime())}">
                                        <g:submitButton name="create" class="btn btn-primary" value="Bet" />
                                    </g:if>
                                    <g:link class="btn btn-default" action="index">Cancel</g:link>
                                </div>
                            </fieldset>
                        </g:form>
                    </div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Comments
                            </div>
                            <div class="panel-body">
                                <g:each in="${bets}" var="b">
                                    <h4>${fieldValue(bean: b, field: "owner")}</h4>
                                    <blockquote>
                                        <p>${fieldValue(bean: b, field: "comment")}</p>
                                        <small>
                                            <cite title="${fieldValue(bean: b, field: "owner")}">
                                                <g:if test="${b.choose == 1}">
                                                    <td>${bet.match.home.name}</td>
                                                </g:if>
                                                <g:elseif test="${b.choose == -1}">
                                                    <td>${bet.match.guess.name}</td>
                                                </g:elseif>
                                            </cite>
                                        </small>
                                    </blockquote>
                                </g:each>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
