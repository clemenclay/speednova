<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    <head>
<!--[if !IE]><!-->{literal}<script>if(!!window.MSStream){document.documentElement.className+=' ie10';}</script>{/literal}<!--<![endif]-->
        <base href="{$system_url}" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.min.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/clientarea.css" />
        {*<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/jquery-ui-1.8.21.custom.css" />*}
        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/common.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery.cookie.js"></script>
        <script type="text/javascript" src="{$template_dir}js/script.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        {userheader}
    </head>
    <body class="{$language|capitalize} tpl_nextgen" >

        <!-- Menu -->
        <!-- End of Menu -->
        {include file="mainmenu.tpl"}
        <div class="wrapper">

            <!-- Header -->
            <header>
                <ul class="nav nav-pills header-menu">
                    {if $logged=='1'}
                        <li>
                            <a href="{$ca_url}tickets/"><i class="icon-h-ticket"></i> {$lang.tickets} {clientstats tpl="<span>%d<span>"}</a>
                        </li>
                        <li>
                            <a href="{$ca_url}clientarea/invoices/"><i class="icon-h-invoice"></i> {$lang.invoices} {clientstats type="invoices" tpl="<span>%d<span>"}</a>
                        </li>
                    {/if}
                    {include file="menus/menu.cart.tpl"}
                    {if $languages}
                        <li>
                            <div class="btn-group">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="icon-h-lang"></i> 
                                    {foreach from=$languages item=ling}
                                        {if  $language==$ling}
                                            {$ling|capitalize}{break}
                                        {/if}
                                    {/foreach}
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu c-dropdown-menu">
                                    {foreach from=$languages item=ling}
                                        <li id="lang_{$ling|capitalize}">
                                            <a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}">
                                                {$lang[$ling]|capitalize}
                                                <span></span>
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </li>
                    {/if}
                    <li>
                        <div class="btn-group">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="icon-h-account"></i> 
                                {if $logged=='1'}
                                    {$login.firstname} {$login.lastname}
                                {else}
                                    {$lang.login}    
                                {/if}
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu c-dropdown-menu">
                                {if $logged!='1'}
                                    <li>
                                        <a href="{$ca_url}signup/">{$lang.createaccount}</a><span></span>
                                    </li>
                                    <li>
                                        <a href="{$ca_url}clientarea/">{$lang.login}</a><span></span>
                                    </li>
                                {else}
                                    <li>
                                        <a href="{$ca_url}clientarea/details/">{$lang.manageaccount}</a><span></span>
                                    </li>
                                    <li>
                                        <a href="?action=logout">{$lang.logout}</a><span></span>
                                    </li>
                                {/if}
                                {if $adminlogged}
                                    <li>&nbsp;</li>
                                    <li>
                                        <a  href="{$admin_url}/index.php{if $login.id}?cmd=clients&amp;action=show&amp;id={$login.id}{/if}">{$lang.adminreturn}</a><span></span>
                                    </li>
                                {/if}
                            </ul>
                        </div>
                    </li>

                    <li>
                        {if $logged=='1'}
                            <a href="?action=logout" title="{$lang.logout}">
                                <i class="icon-h-logout"></i>
                            </a>
                        {else}
                            <a>
                                &nbsp;
                            </a>
                        {/if}
                    </li>

                </ul>

                <h1>{$business_name}</h1>
            </header>
            <!-- End of Header -->



            <div id="errors" {if $error}style="display:block"{/if}>
                <div class="alert alert-error">
                    <a class="close" >&times;</a>
                    {if $error}
                        {foreach from=$error item=blad}{$blad}<br/>
                        {/foreach}
                    {/if}                
                </div>
            </div>
            <div id="infos"  {if $info}style="display:block"{/if}>
                <div class="alert alert-info">
                    <a class="close" >&times;</a>
                    {if $info}
                        {foreach from=$info item=infos}{$infos}<br/>
                        {/foreach}
                    {/if}
                </div>
            </div>
            {include file="submenu.tpl"}
            <!-- Main Container -->
            <section class="main-container {if $cmd=='root'}{$cmd}{else}cmd-{$cmd}{/if} clearfix{if !in_array('fullpanel',$tpl_path) || $affiliate || $service || ($action == 'domains' && $details)} white-breadcrumb{/if}" {if $cmd=='cart'}id="cart"{elseif $cmd=='clientarea'}id="clientarea"{/if}>
                {include file="menus/menu.sub.loc.tpl"}
                {if $cmd=='cart' || $cmd=="upgrade" || $cmd=="checkdomain"}<div id="cartWrapper">{include file="../orderpages/cart.sidemenu.tpl"}<div id="cont">
                {elseif !in_array('fullpanel',$tpl_path)}     
                    <div class="white-container">
                        <div class="padding">
                {/if}
