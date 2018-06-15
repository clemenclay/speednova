<link media="all" type="text/css" rel="stylesheet" href="includes/types/amazonec2type/clientarea/styles3.css" />
<script type="text/javascript" src="includes/types/amazonec2type/clientarea/scripts.js"></script>
<script type="text/javascript" src="includes/types/amazonec2type/js/scripts.js"></script>

{if $widget.appendtpl }
    {include file=$widget.appendtpl}
{/if}
<div id="nav-onapp">
    {if $vpsid}
        <h1 class="left os-logo ">{$vmhostnames.$vpsid}</h1>
        {if $provisioning_type!='single'}
            <a href="?cmd=clientarea&action=services&service={$service.id}" class="left apeded">&laquo; {$lang.allservers}</a>
        {/if}
        <ul class="level-1">
            <li class="{if $vmsection=='vmdetails'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vmdetails&vpsid={$vpsid}"><span class="list-servers">{$lang.Overview}</span></a></li>
          
        </ul>
    {else}
        <h1 class="left os-logo">{$service.name}</h1>
        <ul class="level-1">
            <li class="{if !$vpsdo}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}"><span class="list-servers">{$lang.ListServers}</span></a></li>
            <li class="{if $vpsdo=='billing'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=billing"><span class="billing">{$lang.Billing}</span></a></li>
            <li class="{if $vpsdo=='createvm'}current-menu-item{/if}"><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=createvm"><span class="addserver">{$lang.addservernote}</span></a></li>
        </ul>
    {/if}  <div class="clear"></div>
</div>
<div class="clear"></div>
<div id="content-cloud">
