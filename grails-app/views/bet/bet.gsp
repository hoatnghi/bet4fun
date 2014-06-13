<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Bet for ${match.home.name} vs ${match.guess.name}</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <div class="col-md-1 col-sm-2 col-xs-3"><div class="flag-wrapper"><div class="img-thumbnail flag flag-icon-background flag-icon-${match.home.isoCode2}" title="${match.home.name}"></div></div></div>
            <div class="col-md-1 col-sm-2 col-xs-3"><div class="flag-wrapper"><div class="img-thumbnail flag flag-icon-background flag-icon-${match.guess.isoCode2}" title="${match.guess.name}"></div></div></div>
        </h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>
    </DIV>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <p><h4>${match.home.name} vs ${match.guess.name}</h4></p>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-4">
                        <g:form action="takeBet" >
                            <g:hiddenField name="matchId" value="${match.id}"/>
                            <fieldset>
                                <div class="form-group" align="center">
                                    <p><h2><g:formatNumber number="${match.hRate}" format="#.##"/> : <g:formatNumber number="${match.gRate}" format="#.##"/></h2></p>
                                </div>

                                <div class="form-group">
                                    <g:radioGroup values="[1, -1]" labels="[match.home.name, match.guess.name]" name="choose" value="${bet?.choose}">
                                        <p>${it.label} ${it.radio}</p>
                                    </g:radioGroup>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Your comment</label>
                                    <g:textArea name="comment" value="${bet?.comment}" class="form-control" rows="3"/>
                                </div>
                                <div class="buttons-container">
                                    <g:if test="${!match.flagClosed && match.date.after(java.util.Calendar.getInstance(request.getLocale()).getTime())}">
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
                                    <g:if test="${b.comment}">
                                    <h4>${fieldValue(bean: b, field: "owner")}</h4>
                                        <blockquote>
                                            <p>${fieldValue(bean: b, field: "comment")}</p>
                                            <small>
                                                <cite title="${fieldValue(bean: b, field: "owner")}">
                                                    <g:if test="${b.choose == 1}">
                                                        <td>${match.home.name}</td>
                                                    </g:if>
                                                    <g:elseif test="${b.choose == -1}">
                                                        <td>${match.guess.name}</td>
                                                    </g:elseif>
                                                </cite>
                                            </small>
                                            <small>
                                                <cite title="${fieldValue(bean: b, field: "owner")}">
                                                    <g:formatDate date="${b.createDate}" format="yyyy-MM-dd HH:MM:ss"/>
                                                </cite>
                                            </small>
                                        </blockquote>
                                    </g:if>
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
