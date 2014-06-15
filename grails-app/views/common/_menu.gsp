<div class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </li>
            <li>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <a href="#"><i class="fa fa-table fa-fw"></i> Administration<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="${createLink(controller: 'admin', action: 'team')}">Teams Management</a></li>
                    <li><a href="${createLink(controller: 'admin', action: 'group')}">Groups Management</a></li>
                    <li><a href="${createLink(controller: 'systemSchedule')}">System Schedule</a></li>
                </ul>
            </sec:ifAnyGranted>
            </li>
            <li>
            <sec:ifAnyGranted roles="ROLE_GROUP">
                <a href="#"><i class="fa fa-table fa-fw"></i> Group Owner<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="${createLink(controller: 'group')}">Groups Management</a></li>
                    <li><a href="${createLink(controller: 'group', action: 'report')}">Report</a></li>
                    <li><a href="${createLink(controller: 'group', action: 'forget')}">Reset Password</a></li>
                </ul>
            </sec:ifAnyGranted>
            </li>
            <sec:ifAnyGranted roles="ROLE_USER">
                <li><a href="${createLink(controller: 'bet', action: 'index')}"><i class="fa fa-dollar fa-fw"></i> Bets</a></li>
                <li><a href="${createLink(controller: 'bet', action: 'result')}"><i class="fa fa-list-alt fa-fw"></i> Result</a></li>
                <li><a href="#"><i class="fa fa-beer fa-fw"></i> Show All</a>
                    <ul class="nav nav-second-level">
                        <li><a href="${createLink(controller: 'bet', action: 'showByMatch')}">By Match</a></li>
                        <li><a href="${createLink(controller: 'bet', action: 'showByUser')}">By User</a></li>
                    </ul>
                </li>
            </sec:ifAnyGranted>
        </ul>
        <!-- /#side-menu -->
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->