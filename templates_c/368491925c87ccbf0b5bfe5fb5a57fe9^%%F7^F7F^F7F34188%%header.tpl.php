<?php /* Smarty version 2.6.26, created on 2018-06-20 20:16:33
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'userheader', 'header.tpl', 65, false),)), $this); ?>
<!DOCTYPE html>
<html lang="en" ng-app="materialism" ng-class="<?php echo '{\'full-page-map\': isFullPageMap}'; ?>
">
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endidf]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
<head>
    <base href="<?php echo $this->_tpl_vars['template_dir']; ?>
/#" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Materialism Angular Admin Theme">
    <meta name="author" content="Theme Guys - The Netherlands">

    <meta name="msapplication-TileColor" content="#9f00a7">
    <meta name="msapplication-TileImage" content="assets/img/favicon/mstile-144x144.png">
    <meta name="msapplication-config" content="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <link rel="apple-touch-icon" sizes="57x57" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/apple-touch-icon-180x180.png">

    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/favicon-16x16.png" sizes="16x16">

    <link rel="manifest" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/manifest.json">
    <link rel="shortcut icon" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon/favicon.ico">

    <title ng-bind="pageTitle + ' - Materialism'">Loading... - Materialism</title>

    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/vendors.min.6bd42a2130671ed8d487.css">
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/styles.min.e2bcd92f679082a0082f.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>










      <!--[if !IE]><!--><?php echo '<script>if(!!window.MSStream){document.documentElement.className+=\' ie10\';}</script>'; ?>
<!--<![endif]-->
    <meta charset="utf-8">
    <base href="<?php echo $this->_tpl_vars['system_url']; ?>
" />
    <title><?php echo $this->_tpl_vars['hb']; ?>
<?php if ($this->_tpl_vars['pagetitle']): ?><?php echo $this->_tpl_vars['pagetitle']; ?>
 -<?php endif; ?> <?php echo $this->_tpl_vars['business_name']; ?>
</title>

    <?php if ($this->_tpl_vars['enableFeatures']['chat'] != 'off'): ?><script type="text/javascript" src="<?php echo $this->_tpl_vars['system_url']; ?>
?cmd=hbchat&amp;action=embed"></script><?php endif; ?>
    <?php echo smarty_function_userheader(array(), $this);?>

</head>

<body ng-controller="MainController" scroll-spy id="top" ng-class="[theme.template, theme.color]">
<main>
 <!--   <div ng-include src="'<?php echo $this->_tpl_vars['template_dir']; ?>
assets/tpl/partials/sidebar.html'"></div> -->
    <div class="main-container">
        <div ng-include src="'<?php echo $this->_tpl_vars['template_dir']; ?>
assets/tpl/partials/topnav.html'"></div>
        <div class="main-content" autoscroll="true" ng-cloak ng-view bs-affix-target></div>
    </div>