<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Add Member To Group</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Member</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Member List
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <g:form class="aui" controller="group" action="addUser" >
                            <g:hiddenField name="group" value="${groupId}"/>
                            <fieldset>
                                <div class="form-group">
                                    <label for="email">Email: <span class="required-indicator">*</span></label>
                                    <g:textField name="email" required="" class="form-control" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <g:submitButton name="add" class="btn btn-primary" value="Add" />
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
