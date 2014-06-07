<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Report</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Report</h1>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
    </div>
</div>
<div class="row">
    <div id="content">
        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active"><a href="#match" data-toggle="tab">Matches View</a></li>
            <li><a href="#user" data-toggle="tab">Users View</a></li>
        </ul>
        <div id="my-tab-content" class="tab-content">
            <div class="tab-pane active" id="match">
                <g:render template="match"/>
            </div>
            <div class="tab-pane" id="user">
                <g:render template="user"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('#tabs').tab();
        <g:each in="${groups}" status="i" var="group">
            $('#dataTables-match-${group.id}').dataTable({
                "order": [[ 1, "desc" ]]
            });
            $('#dataTables-user-${group.id}').dataTable().rowGrouping({
                iGroupingColumnIndex:0,
                bHideGroupingColumn: false
            });
        </g:each>
    });
</script>
</body>
</html>