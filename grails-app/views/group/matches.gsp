<%@ page import="happybet.DateUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create New Match</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Match</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">
                <g:hasErrors bean="${betMatchInstance}">
                    <ul class="alert alert-danger" role="alert">
                        <g:eachError bean="${betMatchInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
            </div>
        </g:if>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">

            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <g:form class="aui" controller="group" action="save" >
                            <g:hiddenField name="group" value="${groupId}"/>
                            <g:hiddenField name="matchId" value="${matchId}"/>
                            <fieldset>
                                <div class="form-group">
                                    <label for="home">Home Team<span class="required-indicator">*</span></label>
                                    <g:select name="home" from="${teams}" class="form-control" optionKey="id" optionValue="name" value="${betMatchInstance?.home?.id}"/>
                                </div>
                                <div class="form-group">
                                    <label for="guess">Guess Team<span class="required-indicator">*</span></label>
                                    <g:select name="guess" from="${teams}" class="form-control" optionKey="id" optionValue="name" value="${betMatchInstance?.guess?.id}"/>
                                </div>
                                <div class="form-group">
                                    <label for="hScore">Home Team Score<span class="required-indicator">*</span></label>
                                    <g:field name="hScore" type="number" value="${betMatchInstance?.hScore}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="gScore">Guess Team Score<span class="required-indicator">*</span></label>
                                    <g:field name="gScore" type="number" value="${betMatchInstance?.gScore}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="date">Date<span class="required-indicator">*</span></label>
                                    <g:datePicker name="date" precision="hour"  value="${betMatchInstance?.date}"  />
                                </div>
                                <div class="form-group">
                                    <label for="hRate">Home Team Rate<span class="required-indicator">*</span></label>
                                    <g:field name="hRate" type="text" value="${betMatchInstance?.hRate}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="gRate">Guess Team Rate<span class="required-indicator">*</span></label>
                                    <g:field name="gRate" type="text" value="${betMatchInstance?.gRate}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="amount">Bet Amount<span class="required-indicator">*</span></label>
                                    <g:field name="amount" type="number" value="${betMatchInstance?.amount}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <g:submitButton name="create" class="btn btn-primary" value="Save" />
                                    <g:link class="btn btn-default" action="index">Cancel</g:link>
                                </div>
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
