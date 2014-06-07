<%--
  Created by IntelliJ IDEA.
  User: hquach2
  Date: 5/27/2014
  Time: 10:42 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forgot Password</title>
    <meta name="layout" content="main">
</head>

<body>
<div class="row">
    <div class="col-lg-6">
        <h1 class="page-header">Register</h1>
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
    <div class="col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                Sign Up
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <g:form controller="user" action="reset" method="POST" class="aui">
                            <fieldset>
                                <div class="form-group">
                                    <label for="email">Email<span class="aui-icon icon-required">(required)</span></label>
                                    <input type="text" class="form-control" placeholder="you@example.com"
                                           id="email" name="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <div class="buttons">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <a class="btn btn-default" name="cancel" accesskey="c" href="${createLink(uri: '/')}">Cancel</a>
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