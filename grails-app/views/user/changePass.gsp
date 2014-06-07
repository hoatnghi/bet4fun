<%--
  Created by IntelliJ IDEA.
  User: haiquach
  Date: 5/30/14
  Time: 7:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Change Password</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Change Password</h1>
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
                Change Password
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-4">
                        <g:form controller="user" action="credential" method="POST" class="aui">
                            <fieldset>
                                <div class="form-group">
                                    <label for="currPass">Current Password<span class="icon-required">(required)</span></label>
                                    <input type="password" class="form-control" placeholder="Current Password"
                                           id="currPass" name="currPass" autofocus>

                                </div>
                                <div class="form-group">
                                    <label for="password">Password <span class="icon-required">(required)</span></label>
                                    <input type="password" class="form-control" placeholder="New Password"
                                           name="newPass" id="password"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">Confirm Password <span class="icon-required">(required)</span></label>
                                    <input type="password" class="form-control" placeholder="Confirm Password"
                                           name="confirmPass" id="confirmPass"/>
                                </div>

                                <div class="form-group">
                                    <div class="buttons">
                                        <button type="submit" class="btn btn-primary">Reset</button>
                                        <g:link class="btn btn-default">Cancel</g:link>
                                    </div>
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