<link media="all" type="text/css" rel="stylesheet" href="includes/types/cloudstacktype/clientarea/styles3.css" />
<script type="text/javascript" src="includes/types/cloudstacktype/clientarea/scripts.js"></script>
<script type="text/javascript" src="includes/types/cloudstacktype/js/scripts.js"></script>

{if $widget.appendtpl }
    {include file=$widget.appendtpl}
{/if}
<div id="nav-onapp">
    {if $vpsid}
        <h1 class="left os-logo {if $VMDetails}{$VMDetails.distro}{elseif $vmdistro}{$vmdistro.$vpsid}{/if}">{$vmhostnames.$vpsid}</h1>
        {if $provisioning_type!='single'}
            <a href="?cmd=clientarea&action=services&service={$service.id}" class="left apeded">&laquo; {$lang.allservers}</a>
        {/if}
        <ul class="level-1">
            <li class="{if $vmsection=='vmdetails'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$vpsid}"><span class="list-servers">{$lang.Overview}</span></a></li>
                    {if $show_network && !$network_overview}
                <li class="{if $vmsection=='network'}current-menu-item{/if}">
                    <a href="?cmd=clientarea&action=services&service={$service.id}&vpsid={$vpsid}&vpsdo={$show_network}">
                        <span class="resources">{$lang.networkzone}</span>
                    </a>
                </li>
            {/if}
            {if $provisioning_type=='single'}
                <li class="{if $vmsection=='keys'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=keys&vpsid={$vpsid}"><span class="resources">Keys</span></a></li>
            {/if}
            <li class="{if $vmsection=='storage'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=disks&vpsid={$vpsid}"><span class="billing">{$lang.storage}</span></a></li>
                    {if $feature.vmsnapshot}
                <li class="{if $vmsection=='snapshots'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmsnapshot&vpsid={$vpsid}"><span class="billing">{$lang.snapshots}</span></a></li>
                    {/if}
                    {*<li class="{if $vmsection=='usage'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=networkusage&vpsid={$vpsid}"><span class="addserver">{$lang.Usage}</span></a></li> *}
                    {if $provisioning_type=='single'}
                <li class="{if $vmsection=='billing'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=billing&vpsid={$vpsid}"><span class="addserver">{$lang.Billing}</span></a></li>
                    {/if}
        </ul>
    {else}
        <h1 class="left os-logo">{$service.name}</h1>
        <ul class="level-1">
            <li class="{if !$vpsdo}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}"><span class="list-servers">{$lang.ListServers}</span></a></li>
                    {if $show_network && $network_overview}
                <li class="{if $vmsection=='network'}current-menu-item{/if}">
                    <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo={$show_network}">
                        <span class="resources">{$lang.networkzone}</span></a>
                </li>
            {/if}
            {if $provisioning_type!='single'}
                <li class="{if $vmsection=='keys'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=keys"><span class="resources">Keys</span></a></li>
                {/if}
            <li class="{if $vmsection=='resources'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=resources"><span class="resources">{$lang.reslabel}</span></a></li>
            <li class="{if $vpsdo=='billing'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=billing"><span class="billing">{$lang.Billing}</span></a></li>
            <li class="{if $vpsdo=='createvm'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=createvm"><span class="addserver">{$lang.addservernote}</span></a></li>
        </ul>
    {/if}  <div class="clear"></div>
</div>
<div class="clear"></div>
<div id="content-cloud">
