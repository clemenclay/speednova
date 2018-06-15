{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        {if $vpsdo=='backups'}{$lang.backups}
        {elseif $vpsdo=='backupschedule'}{$lang.backupschedule}
        {elseif $vpsdo=='templates'}{$lang.templates}
        {else}{$lang.disks}
        {/if}
    </h3>
    <ul class="sub-ul">
        <li>
            <a href="{$service_url}&vpsdo=disks&vpsid={$vpsid}" 
               class="{if $vpsdo=='disks'}active{/if}" ><span>{$lang.disks}</span></a>
        </li>
        <li>
            <a href="{$service_url}&vpsdo=backups&vpsid={$vpsid}" 
               class="{if $vpsdo=='backups'}active{/if}" ><span>{$lang.backups}</span></a>
        </li>
        <li>
            <a href="{$service_url}&vpsdo=backupschedule&vpsid={$vpsid}" 
               class="{if $vpsdo=='backupschedule'}active{/if}" ><span> {$lang.backupschedule}</span></a>
        </li>
    </ul>
    <div class="clear"></div>
</div>
<div class="content-bar">
    {include file="`$onappdir``$vpsdo`.tpl"}
</div>
{include file="`$onappdir`footer.cloud.tpl"}