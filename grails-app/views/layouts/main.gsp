<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Core CSS - Include with every page -->
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'font-awesome/css', file: 'font-awesome.css')}" type="text/css">

        <!-- Flags Icon -->
        <link href="${resource(dir: 'flags/assets', file: 'docs.css')}" rel="stylesheet">
        <link href="${resource(dir: 'flags/css', file: 'flag-icon.css')}" rel="stylesheet">

        <!-- SB Admin CSS - Include with every page -->
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'sb-admin.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css/plugins/dataTables', file: 'dataTables.bootstrap.css')}" type="text/css">
        <script src="${resource(dir: 'js', file: 'jquery-1.10.2.js')}"></script>
        <script src="${resource(dir: 'js/plugins/dataTables', file: 'jquery.dataTables.js')}"></script>
        <script src="${resource(dir: 'js/plugins/dataTables', file: 'dataTables.bootstrap.js')}"></script>
        <script src="${resource(dir: 'flags/assets', file: 'docs.js')}"></script>
	</head>
	<body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                <g:render template="/common/header" />
                <sec:ifLoggedIn>
                    <g:render template="/common/menu" />
                </sec:ifLoggedIn>
            </nav>
            <div id="page-wrapper">
                <g:layoutBody/>
            </div>
        </div>
        <!-- Core Scripts - Include with every page -->
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
        <script src="${resource(dir: 'js/plugins/metisMenu', file: 'jquery.metisMenu.js')}"></script>

        <!-- SB Admin Scripts - Include with every page -->
        </script><script src="${resource(dir: 'js', file: 'sb-admin.js')}"></script>
	</body>
</html>
