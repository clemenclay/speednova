{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.logs}</h3>

    <div class="clear"></div>
</div>
<div class="content-bar" >
    <table width="100%" cellspacing="0" class="data-table backups-list">
        <thead>
            <tr>
                <td style="width: 160px;">{$lang.date}</td>
                <td>Description</td>
                <td width="120">{$lang.status}</td>
            </tr>
        </thead>
        <tbody>
            {foreach from=$logs item=log}
                <tr>
                    <td>{$log.starttime|dateformat:$date_format}</td>
                    <td>{if $logdesc[$log.type]}{$logdesc[$log.type]}{else}{$log.type}{/if}</td>
                    <td>{if $log.status == 'OK'}<span class="label label-success">OK</span>{else}<span class="label label-warning">Error</span>{/if}</td>
                </tr>
            {foreachelse}
                <tr>
                    <td colspan="4">{$lang.nothing}</td>
                </tr>
            {/foreach}
        </tbody></table>
</div>
{include file="`$onappdir`footer.cloud.tpl"}