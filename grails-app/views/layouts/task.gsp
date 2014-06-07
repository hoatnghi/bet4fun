<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'aui-all.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'aui-all.js')}"></script>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:layoutResources />
</head>
<body class="aui-layout aui-theme-default aui-page-focused aui-page-focused-small">
<div id="page">
    <header id="header" role="banner">
        <g:render template="/common/header" />
    </header>
    <section id="content" role="main">
        <g:layoutBody/>
    </section>
    <r:layoutResources />
</div>
</body>
</html>
