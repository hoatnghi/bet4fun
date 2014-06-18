<html>
<head>
    <title>Login Page</title>
    <meta name="layout" content="main">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <g:if test='${flash.message}'>
                            <div class='alert alert-danger'>${flash.message}</div>
                        </g:if>
                        <form action='${postUrl}' method='POST' id='loginForm' role='form'>
                            <fieldset>
                                <div class="form-group">
                                    <input type='text' class="form-control"  placeholder="Email"
                                           name='j_username' id='username' autofocus/>
                                </div>
                                <div class="form-group">
                                    <input type='password' class="form-control"  placeholder="password"
                                           name='j_password' id='password'/>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="${rememberMeParameter}" id="remember_me"
                                           <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                    <label for="remember_me">Remember Me</label>
                                </div>
                                <!--
                                <div class="form-group">
                                    <label for="username">Don't have an account? <g:link controller="user" action="signup">Sign up for one</g:link></label>
                                </div>
                                -->
                                <div class="buttons-container">
                                    <div class="buttons">
                                        <button type="submit" class="btn btn-lg btn-success btn-block">
                                            ${message(code: "springSecurity.login.button")}
                                        </button>
                                        <!--
                                        <a name="cancel" accesskey="c" href="${createLink(controller: 'user', action: 'forget')}">Can't access your account?</a>
                                        -->
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
