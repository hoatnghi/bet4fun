<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${createLink(uri: '/')}">BET</a>
</div>
<ul class="nav navbar-top-links navbar-left">
    <sec:ifNotLoggedIn>
        <li><a class="aui-button aui-button-primary" href="${createLink(controller: 'user')}">Sign Up</a></li>
    </sec:ifNotLoggedIn>
</ul>
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
    <sec:ifNotLoggedIn>
        <li><a class="aui-button aui-button-primary" href="${createLink(controller: 'login')}">Login</a></li>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
                <li><a href="${createLink(controller: 'user', action: 'change')}"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
                <li class="divider"></li>
                <li><a href="${createLink(controller: 'logout')}"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
    </sec:ifLoggedIn>
<!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->
