{foreach from=$tickets item=ticket}
    <tr {if $ticket.escalated == 1}class="sla_level_one"{elseif $ticket.escalated > 1}class="sla_level_two"{/if}>
        {if $tview}
            {include file="ajax.ticketviews.tpl" display=trow}
        {else}
            <td width="20"><input type="checkbox" class="check" value="{$ticket.id}" name="selected[]"/></td>
            <td class="col_name">{if $ticket.client_id!='0'}<a href="?cmd=clients&action=show&id={$ticket.client_id}">{/if}{$ticket.name}{if $ticket.client_id!='0'}</a>{/if}</td>
            <td class="subjectline">
                <div class="df1">
                    <div class="df2">
                        <div class="df3">
                            <a href="?cmd=tickets&action=view{if $backredirect}&brc={$backredirect}{/if}{if $currentdept && $currentdept!='all'}&dept={$currentdept}{/if}{if $currentlist && $currentlist!='all'}&list={$currentlist}{/if}&num={$ticket.ticket_number}" 
                               data-pjax class="{if $ticket.admin_read=='0'}unread{/if}" rel="{$ticket.ticket_number}">{$ticket.tsubject|wordwrap:80:"\n":true|escape}</a>
                        </div>
                    </div>
                </div>
            </td>
            <td class="tagnotes">
                {if $ticket.flags & 1}
                    <strong class="fa fa-sticky-note-o right ticketflag" aria-hidden="true"  title="Ticket with admin notes" ></strong>
                {/if}
                {if $ticket.flags & 2}
                    <strong class="fa fa-dollar right ticketflag" aria-hidden="true"  title="Ticket with additional support fees" ></strong>
                {/if}
                {if $ticket.flags & 4}
                    <strong class="fa a-pencil-square-o right ticketflag" aria-hidden="true"  title="Another staff member started to write a response to this ticket" ></strong>
                {/if}
                {if $ticket.parent_id}
                    <strong class="fa fa-code-fork right ticketflag" aria-hidden="true"  title="This ticket has a parent thread" ></strong>
                {/if}
                {if $ticket.tags}
                    <div class="right inlineTags">
                        {foreach from=$ticket.tags item=tag name=tagloop}
                            {if $smarty.foreach.tagloop.index < 3} 
                                <span>{$tag.tag}</span>
                            {/if}
                        {/foreach}
                    </div>
                {/if}
            </td>
            <td class="col_status"><span {if $ticket.status_color && $ticket.status_color != '000000'}style="color:#{$ticket.status_color}"{/if} class="{$ticket.status}">{if $ticket.status == 'Open'}{$lang.Open}{elseif $ticket.status == 'Answered'}{$lang.Answered}{elseif $ticket.status == 'Closed'}{$lang.Closed}{elseif $ticket.status == 'Client-Reply'}{$lang.Clientreply}{elseif $ticket.status == 'In-Progress'}{$lang.Inprogress}{else}{$ticket.status}{/if} </span></td>
            <td class="subjectline col_rp_name">{$ticket.rpname}</td>
            <td class="border_{$ticket.priority} col_lastreply" title="{$ticket.lastreply_date|dateformat:$date_format}">{$ticket.lastreply}</td>
        {/if}
    </tr>
{/foreach}