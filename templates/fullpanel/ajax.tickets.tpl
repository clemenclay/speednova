
{if $ticket}
    {include file='support/viewticket.tpl'}
{elseif $tickets}
    {foreach from=$tickets item=ticket name=foo}
        <tr class="empty-row">
        </tr>
        <tr>
            <td><span class="{$ticket.status}-label">{$lang[$ticket.status]}</span></td>
            <td><a {if $ticket.client_read=='0'}class="bold"{/if} href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject|escape:'html':'utf-8'}</a></td>
            <td class="fold-td">{$ticket.deptname}</td>
            <td class="fold-td">{$ticket.date|dateformat:$date_format}</td>
        </tr>
    {/foreach}
{elseif $action=='kbhint'}
    {if $replies}
        {foreach from=$replies item=reply}
            <li>
                <a href="{$ca_url}knowledgebase/article/{$reply.id}/{$reply.slug}" title="{$lang.match} {$reply.fits|escape:'html':'utf-8'} %" >{$reply.title|escape:'html':'utf-8'}</a>
            </li>
        {/foreach}
    {else}
        <li>
            <a>{$lang.nothing}</a>
        </li>
    {/if}
{else}
    <tr class="empty-row">
    </tr>
    <tr>
        <td colspan="4">{$lang.nothing}</td>
    </tr>   
{/if}