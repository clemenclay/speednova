<!doctype html>
<html>
    <head>
<!--[if !IE]><!-->{literal}<script>if(!!window.MSStream){document.documentElement.className+=' ie10';}</script>{/literal}<!--<![endif]-->
        <base href="{$system_url}" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
		<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.min.css" />
		<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/font-awesome.min.css">
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/clientarea.css" />
        {*<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/jquery-ui-1.8.21.custom.css" />*}
        <!--[if lt IE 7]>
        <link media="all" type="text/css" href="css/font-awesome-ie7.min.css" rel="stylesheet">
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
        <script type="text/javascript" src="{$template_dir}js/script.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        {userheader}
    </head>
    <body>
    
    <div class="page-bg"></div>

    <div class="flat-ui-client">
        
        <div class="page clearfix">
        <!-- Menu -->
        {include file="mainmenu.tpl"}
        <!-- End of Menu -->
		
		<!-- Right Menu -->
		{if $logged=='1'}
        {include file="rightmenu.tpl"}
		{/if}
        <!-- End of Right Menu -->
		
        <div class="wrapper">

            <!-- Header -->
            <header>
                {if $logged=='1'}
				<ul class="nav nav-pills header-menu pull-left">
                    <li><a href="{$ca_url}tickets/" data-toggle="tooltip" title="Support Tickets"><i class="ico-envelope"></i> {clientstats tpl="<span>%d<span>"}</a></li>
					<li><div class="separator-line"></div></li>
                    <li><a href="{$ca_url}clientarea/invoices/" data-toggle="tooltip" title="Invoices"><i class="ico-file-text-alt"></i> {clientstats type="invoices" tpl="<span>%d<span>"}</a></li>
					<li><div class="separator-line"></div></li>
				</ul>
				{/if}
				<ul class="nav nav-pills header-menu pull-right">
                    {if $languages}
                    <li>
                        <div class="btn-group flat-ui-dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                {foreach from=$languages item=ling}
                                    {if  $language==$ling}
                                        {$ling|capitalize}{break}
                                    {/if}
                                {/foreach}
                            <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu header-dropdown-menu">
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
                    {if $logged!='1'}
                    	<li><div class="btn-group signs"><a href="{$ca_url}signup/">{$lang.createaccount}</a></div></li>
                    {/if}
                    
                    {if $logged=='1'}
                        <li><div class="btn-group signs"><a href="?action=logout"><i class="ico-sign"></i>{$lang.logout}</a></div></li>
                    {else}
                        <li><div class="btn-group signs"><a href="{$ca_url}clientarea/">{$lang.login} </a></div></li>  
                    {/if}
                </ul>
                
                <div class="search-bg pull-right">
                    <i class="icon-search icon-white"></i>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            {$lang.domains}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu flat-ui-dropdown">
                            <li>
                                <a href="{$ca_url}clientarea/domains/">{$lang.domains}</a>
                                <form class="form-inline" action="{$ca_url}clientarea/domains/" method="post" style="display: none">
                                    <input type="hidden" class="search-field" name="filter[name]" >
                                </form>
                            </li>
                            <li>
                                <a href="{$ca_url}tickets">{$lang.tickets}</a>
                                <form class="form-inline" action="{$ca_url}tickets" method="post" style="display: none">
                                    <input type="hidden" name="filter[subject]" class="search-field">
                                </form>
                            </li>
                            <li>
                                <a href="{$ca_url}knowledgebase/search/">{$lang.knowledgebase}</a>
                                <form class="form-inline" action="{$ca_url}knowledgebase/search/" method="post" style="display: none">
                                    <input type="hidden" name="query" class="search-field">
                                </form>
                            </li>
                        </ul>
                    </div>
                    <span class="search-block"><input type="text"></span>
                </div>
            </header>
            
            <!-- End of Header -->

            

            <div id="errors" {if $error}style="display:block"{/if}>
                <div class="alert alert-error no-mt">
                    <a class="close" >&times;</a>
                    {if $error}
                        {foreach from=$error item=blad}{$blad}<br/>
                        {/foreach}
                    {/if}                
                </div>
            </div>
            <div id="infos"  {if $info}style="display:block"{/if}>
                <div class="alert alert-info no-mt">
                    <a class="close" >&times;</a>
                    {if $info}
                        {foreach from=$info item=infos}{$infos}<br/>
                        {/foreach}
                    {/if}
                </div>
            </div>
            <!-- Main Container -->
            <section class="main-container {if $cmd=='root'}{$cmd}{else}cmd-{$cmd}{/if} clearfix" {if $cmd=='cart'}id="cart"{elseif $cmd=='clientarea'}id="clientarea"{/if}>
            {if $logged=='1'}
            	{include file="pageinfo.tpl"}
            {/if}
            <div class="padding">
                {include file="menus/menu.sub.loc.tpl"}
                {if $cmd=='cart' || $cmd=="upgrade"}<div id="cartWrapper">{include file="../orderpages/cart.sidemenu.tpl"}<div id="cont">{/if}
               