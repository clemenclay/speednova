{if $action=='default'}
{if $logs}
{if $showall}
    <form action="" method="post" id="testform" ><input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
        <div class="blu">

            <div class="right"><div class="pagination"></div>
            </div>
            <div class="clear"></div>
        </div>
        <a href="?cmd=queue" id="currentlist" style="display:none" updater="#updater"></a>
        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table glike hover" style="table-layout: fixed;">
            <tbody>
            <tr>
                <th width="40"><a href="?cmd=queue&orderby=id|ASC" class="sortorder">Id</a></th>
                <th width="80"><a href="?cmd=queue&orderby=parent_id|ASC" class="sortorder">Parent</a></th>
                <th width="120"><a href="?cmd=queue&orderby=queue|ASC" class="sortorder">Queue</a></th>
                <th width="120">Target</th>
                <th ><a href="?cmd=queue&orderby=description|ASC" class="sortorder">Description</a></th>
                <th width="150"><a href="?cmd=queue&orderby=added|ASC" class="sortorder">Scheduled</a></th>
                <th width="150"><a href="?cmd=queue&orderby=changed|ASC" class="sortorder">Changed</a></th>
                <th width="60"><a href="?cmd=queue&orderby=status|ASC" class="sortorder">Status</a></th>
            </tr>
            </tbody>
            <tbody id="updater">
            {/if}
                {foreach from=$logs item=log}
                    <tr>
                        <td>{$log.id}</td>
                        <td>{$log.parent_id}</td>
                        <td>{if $queues[$log.queue]}{$queues[$log.queue].name}{else}{$log.queue}{/if}</td>
                        <td>{if $log.rel_id}
                                {if $log.rel_type=='Hosting'}
                                    Account: <a href="?cmd=accounts&action=edit&id={$log.rel_id}" target="_blank">{$log.rel_id}</a>
                                {elseif   $log.rel_type=='Domain'}
                                    Domain: <a href="?cmd=domains&action=edit&id={$log.rel_id}" target="_blank">{$log.rel_id}</a>
                                {elseif   $log.rel_type=='Order'}
                                    Order: <a href="?cmd=orders&action=edit&id={$log.rel_id}" target="_blank">{$log.rel_id}</a>
                                {/if}

                            {else}-{/if}</td>
                        <td>{if $log.human_description}{$log.human_description} - {/if}{$log.description}</td>
                        <td>{$log.added|dateformat:$date_format}</td>
                        <td>{$log.changed|dateformat:$date_format}</td>
                        <td>{$statuses[$log.status]}</td>
                    </tr>
                {/foreach}
            {if $showall}
            </tbody>
            <tbody id="psummary">
            <tr>
                <th></th>
                <th colspan="7">
                    {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                </th>
            </tr>
            </tbody>
        </table>
        <div class="blu">

            <div class="right"><div class="pagination"></div>
            </div>
            <div class="clear"></div>
        </div>
        {securitytoken}</form>

{/if}
{else}
    {if $showall}
        <p class="blu"> {$lang.nothingtodisplay} </p>
    {else}
        <tr>
            <td colspan="7"><p align="center" > {$lang.nothingtodisplay} </p></td>
        </tr>
    {/if}
{/if}


{/if}