<link media="all" type="text/css" rel="stylesheet" href="templates/common/cloudhosting/styles.css" />
<script type="text/javascript" src="templates/common/cloudhosting/js/scripts.js"></script>
<script type="text/javascript" src="{$moduledir_url}/scripts.js"></script>

{literal}
    <style>
        ul#vm-menu{
            height: auto;
            margin: 0;
        }
        ul#vm-menu::after{
            content: "";
            display: table;
            clear: both;
        }
        ul#vm-menu li{
            margin: 5px
        }
        ul#vm-menu li a {
            width: auto;
            height: 60px;
            min-width: 60px;
            padding: 5px;
        }

        ul#vm-menu li img {
            display: inline-block;
            height: 24px;
            line-height: 32px;
            margin: 8px;
            padding: 0;
            vertical-align: middle;
            width: 24px;
        }
    </style>
{/literal}

{if $widget.appendtpl }
    {include file=$widget.appendtpl}
{/if}
<div id="nav-onapp">
    {if $vpsid}
        <h1 class="left os-logo {if $VMDetails}{$VMDetails.distro}{elseif $vmdistro}{$vmdistro.$vpsid}{/if}">{$vmhostnames[$vpsid].hostname}</h1>
        {if $provisioning_type!='single'}
            <a href="{$service_url}" class="left apeded">&laquo; {$lang.allservers}</a>
        {/if}
        <ul class="level-1">
            <li class="{if $vmsection=='vmdetails'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=vmdetails&vpsid={$vpsid}"><span class="list-servers">{$lang.Overview}</span></a></li>
            {if $o_sections.o_network}
                <li class="{if $vmsection=='network'}current-menu-item{/if}"
                    ><a href="{$service_url}&vpsdo=interfaces&vpsid={$vpsid}"><span class="resources">{$lang.networkzone}</span></a>
                </li>
            {/if}
            {if $o_sections.o_storage}
                <li class="{if $vmsection=='storage'}current-menu-item{/if}">
                    <a href="{$service_url}&vpsdo=disks&vpsid={$vpsid}"><span class="billing">{$lang.storage}</span></a>
                </li>
            {/if}
            {if $o_sections.o_snapshots}
                <li class="{if $vmsection=='snapshots'}current-menu-item{/if}">
                    <a href="{$service_url}&vpsdo=snapshots&vpsid={$vpsid}"><span class="billing">{$lang.snapshots}</span></a>
                </li>
            {/if}
            {if $o_sections.o_logs}
                <li class="{if $vmsection=='logs'}current-menu-item{/if}">
                    <a href="{$service_url}&vpsdo=logs&vpsid={$vpsid}"><span class="billing">{$lang.logs}</span></a>
                </li>
            {/if}
            
            <li class="{if $vmsection=='usage'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=usage&vpsid={$vpsid}"><span class="addserver">{$lang.Usage}</span></a></li>
            {if $provisioning_type=='single'}<li class="{if $vmsection=='billing'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=billing&vpsid={$vpsid}"><span class="addserver">{$lang.Billing}</span></a></li>{/if}
        </ul>
    {else}
        <h1 class="left os-logo">{$service.name}</h1>
        <ul class="level-1">
            <li class="{if !$vpsdo}current-menu-item{/if}"><a href="{$service_url}"><span class="list-servers">{$lang.ListServers}</span></a></li>
            <li class="{if $vmsection=='resources'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=resources"><span class="resources">{$lang.reslabel}</span></a></li>
            <li class="{if $vpsdo=='billing'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=billing"><span class="billing">{$lang.Billing}</span></a></li>
            <li class="{if $vpsdo=='createvm'}current-menu-item{/if}"><a href="{$service_url}&vpsdo=createvm"><span class="addserver">{$lang.addservernote}</span></a></li>
        </ul>
    {/if}  <div class="clear"></div>
</div>
<div class="clear"></div>
<div id="content-cloud">
