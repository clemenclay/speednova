<!DOCTYPE html>
<html>
    <head data-gwd-animation-mode="quickMode">
        <!--[if !IE]><!-->{literal}<script>if (!!window.MSStream) {
                document.documentElement.className += ' ie10';
            }</script>{/literal}<!--<![endif]-->
        <base href="{$system_url}" />
        <meta charset="utf-8">
        {ieforce}
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>

        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.min.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/font-awesome.min.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/clientarea.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/jquery.pnotify.default.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/progress-buttons.css" />
        <!--[if lt IE 7]>
        <link media="all" type="text/css" href="{$template_dir}css/font-awesome-ie7.min.css" rel="stylesheet">
        <![endif]-->

        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/common.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.cookie.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.nicescroll.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.pnotify.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/progress-button.js"></script>
        <script type="text/javascript" src="{$template_dir}js/script.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        {userheader}

    </head>

    <body>
        <div id="background"></div>
        <header id="main-header" class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a href="#" class="brand">{$business_name}</a>
                    <div class="nav-collapse collapse navbar-responsive-collapse">
                        <ul class="nav pull-right">

                            {if $languages}
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                        <i class="icon-globe"></i>
                                        {foreach from=$languages item=ling}
                                            {if  $language==$ling}
                                                {$ling|capitalize}{break}
                                            {/if}
                                        {/foreach}
                                        <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        {foreach from=$languages item=ling}
                                            <li id="lang_{$ling|capitalize}">
                                                <a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}">
                                                    {$lang[$ling]|capitalize}
                                                    <span></span>
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                                <li class="divider-vertical"></li>
                            {/if}
                            {if $logged=='1'}
                                <li>
                                    <a href="?action=logout"><i class="icon-power-off"></i> {$lang.logout}</a>
                                </li>
                            {else}
                                <li>
                                    <a href="{$ca_url}clientarea/" class="login-widget"><i class="icon-user"></i>&nbsp; {$lang.login} </a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </div>
            </div>
        </header>
                                
        <div id="page" class="{if $cmd!=cart}{unfold}{else}force-fold{/if}">
            {include file="mainmenu.tpl"}
            <header id="sub-header">
                {if $logged=='1'}
                    <div class="pull-right">
                        <strong>{$login.firstname} {$login.lastname}</strong>
                    </div>
                {/if}
                <div class="circle-full pull-right login-widget">
                    <a href="{$ca_url}clientarea{if $logged=='1'}/details/{/if}">
                    <span class="icon-stack">
                        <i class="icon-circle icon-stack-base"></i>
                        <i class="icon-user icon-light"></i>
                    </span>
                    </a>
                </div>
                {include file="search_field.tpl"}

                {if $logged=='1'}
                    <a href="{$ca_url}tickets/" data-toggle="tooltip" title="Support Tickets" class="color-green">
                        <i class="icon-inbox icon-2x"></i> <span class="badge badge-top">{clientstats type="ticketNew" }</span>
                    </a>
                    <span  class="separator-vertical"></span>
                    <a href="{$ca_url}clientarea/invoices/" data-toggle="tooltip" title="Invoices" class="color-green">
                        <i class="icon-file-text-alt icon-2x"></i>  <span class="badge badge-top">{clientstats type="invoices"}</span>
                    </a>
                {/if}
            </header>

            {include file="notifications.tpl"}
            <section id="main-section" class="{if $cmd!=cart}not-cart{/if} cmd-{$cmd}" >
                {include file="menus/menu.sub.loc.tpl"}
                {footer}
            {if $cmd=='cart' || $cmd=="upgrade"}<div id="cart" class="cart-wrapper">{include file="../orderpages/cart.sidemenu.tpl"}<div id="cont">
            {elseif !in_array('cloudytheme',$tpl_path)}     
                <div class="content-wrapper" ><div  class="spacing">
            {/if}
