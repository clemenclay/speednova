<!DOCTYPE html>
<html lang="en" ng-app="materialism" ng-class="{literal}{'full-page-map': isFullPageMap}{/literal}">
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endidf]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
<head>
    <base href="{$template_dir}/#" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Materialism Angular Admin Theme">
    <meta name="author" content="Theme Guys - The Netherlands">

    <meta name="msapplication-TileColor" content="#9f00a7">
    <meta name="msapplication-TileImage" content="assets/img/favicon/mstile-144x144.png">
    <meta name="msapplication-config" content="{$template_dir}assets/img/favicon/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <link rel="apple-touch-icon" sizes="57x57" href="{$template_dir}assets/img/favicon/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="{$template_dir}assets/img/favicon/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="{$template_dir}assets/img/favicon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="{$template_dir}assets/img/favicon/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="{$template_dir}assets/img/favicon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="{$template_dir}assets/img/favicon/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="{$template_dir}assets/img/favicon/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="{$template_dir}assets/img/favicon/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="{$template_dir}assets/img/favicon/apple-touch-icon-180x180.png">

    <link rel="icon" type="image/png" href="{$template_dir}assets/img/favicon/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="{$template_dir}assets/img/favicon/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="{$template_dir}assets/img/favicon/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="{$template_dir}assets/img/favicon/favicon-16x16.png" sizes="16x16">

    <link rel="manifest" href="{$template_dir}assets/img/favicon/manifest.json">
    <link rel="shortcut icon" href="{$template_dir}assets/img/favicon/favicon.ico">

    <title ng-bind="pageTitle + ' - Materialism'">Loading... - Materialism</title>

    <link rel="stylesheet" href="{$template_dir}assets/css/vendors.min.6bd42a2130671ed8d487.css">
    <link rel="stylesheet" href="{$template_dir}assets/css/styles.min.e2bcd92f679082a0082f.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>










      <!--[if !IE]><!-->{literal}<script>if(!!window.MSStream){document.documentElement.className+=' ie10';}</script>{/literal}<!--<![endif]-->
    <meta charset="utf-8">
    <base href="{$system_url}" />
    <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>

    {if $enableFeatures.chat!='off'}<script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>{/if}
    {userheader}
</head>

<body ng-controller="MainController" scroll-spy id="top" ng-class="[theme.template, theme.color]">
<main>
    <div ng-include src="'{$template_dir}assets/tpl/partials/sidebar.html'"></div>
    <div class="main-container">
        <div ng-include src="'{$template_dir}assets/tpl/partials/topnav.html'"></div>
        <div class="main-content" autoscroll="true" ng-cloak ng-view bs-affix-target></div>
    </div>
