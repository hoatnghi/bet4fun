<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Create New Match</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Create a Group</h1>
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

            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <g:form controller="admin" action="createGroup" >
                            <fieldset>
                                <div class="form-group">
                                    <label for="name">Name<span class="required-indicator">*</span></label>
                                    <g:textField name="name" required="" value="${group?.name}" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description<span class="required-indicator">*</span></label>
                                    <g:textField name="description" required="" value="${group?.description}" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="owner">Owner Email<span class="required-indicator">*</span></label>
                                    <g:textField name="owner" required="" value="${group?.owner}" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="expiredDate">Expire Date<span class="required-indicator">*</span></label>
                                    <g:datePicker name="expiredDate" precision="day" value="${group?.expiredDate}"  />
                                </div>
                                <div class="form-group">
                                    <g:submitButton name="create" class="btn btn-primary" value="${group?'Update':'Create'}" />
                                    <g:link class="btn btn-default" action="group">Cancel</g:link>
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
