<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Add Team To Group</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Team</h1>
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
                Team List
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <g:form class="aui" controller="admin" action="addTeam" >
                            <fieldset>
                                <div class="form-group">
                                    <label for="name">Name </label>
                                    <g:textField name="name" class="form-control" placeholder="Team Name" value="${team?.name}"/>
                                </div>
                                <div class="form-group">
                                    <label for="code">Country <span class="required-indicator">*</span></label>
                                    <g:countrySelect id="country" name="code" class="form-control" placeholder="Choose a Country" value="${team?.isoCode3}"/>
                                </div>
                                <div class="form-group">
                                    <g:submitButton name="add" class="btn btn-primary" value="${team?'Update':'Add'}" />
                                    <g:link class="btn btn-default" action="team">Cancel</g:link>
                                </div>
                            </fieldset>
                        </g:form>
                    </div>
                    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-6">
                        <div class="flag-wrapper">
                            <div id="thumbnail" class="img-thumbnail flag flag-icon-background flag-icon-${team?team.isoCode2:'af'}"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var currentCode = "${team?team.isoCode2:'af'}";
    var countryCodes = new Object();
    <g:each in="${map}" var="m">
        countryCodes["${m.key}"] = "${m.value}";
    </g:each>
    $(document).ready(function() {
        $('#country').change(function(){
            $('#thumbnail').removeClass("flag-icon-" + currentCode);
            $('#thumbnail').addClass("flag-icon-" + countryCodes[$(this).val()]);
            currentCode = countryCodes[$(this).val()];
        });
    });
</script>
</body>
</html>
