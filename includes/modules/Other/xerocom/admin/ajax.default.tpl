
{foreach from=$list item=entry}
    <tr class="havecontrols">
        <td>
            {if !$entry.req}
                <input type="checkbox" disabled value=""/>
            {else}
                <input type="checkbox" name="selected[]" value="{$entry.id}"/>
            {/if}
        </td>
        {if $action == 'invoices'}
            <td>
                <a href="?cmd=invoices&action=edit&id={$entry.id}" class="tload2"  rel="{$invoice.id}">
                    {if $proforma && ($entry.status=='Paid' || $entry.status=='Refunded' || $entry.status == 'Creditnote') && $entry.paid_id!=''}{$entry.paid_id}
                    {else}{$entry.date|invprefix:$prefix:$entry.client_id}{$entry.id}
                    {/if}
                </a>
            </td>
            <td>
                <a href="?cmd=clients&action=show&id={$entry.client_id}">
                    {$entry.firstname} {$entry.lastname}
                </a>
            </td>
            <td>{$entry.date|dateformat:$date_format}</td>
            <td>{$entry.duedate|dateformat:$date_format}</td>
            <td>{$entry.total|price:$entry.currency_id}</td>
            <td>
                <span class="{$entry.status}">{if $lang[$entry.status]}{$lang[$entry.status]}{else}{$entry.status}{/if}</span>
            </td>
        {elseif $action == 'transactions'}

            <td><a href="?cmd=transactions&action=edit&id={$entry.id}" data-pjax>{$entry.trans_id}</a></td>
            <td><a href="?cmd=clients&action=show&id={$entry.client_id}">{$entry.firstname} {$entry.lastname}</a></td>
            <td  class="acenter">{$entry.date|dateformat:$date_format}</td>
            <td>{$entry.module}</td>
            <td>{$entry.in|price:$transaction.currency_id}</td>
            <td>{$entry.out|price:$transaction.currency_id}</td>
        {else}
            <td><a href="?cmd=clients&action=show&id={$entry.id}">{$entry.id}</a></td>
            <td><a href="?cmd=clients&action=show&id={$entry.id}">{$entry.firstname}</a></td>
            <td><a href="?cmd=clients&action=show&id={$entry.id}">{$entry.lastname}</a></td>
            <td>{$entry.email}</td>
            <td>{$entry.companyname}</td>
            <td>{$entry.datecreated|dateformat:$date_format}</td>
        {/if}
        <td>
            {if !$entry.req}
                <small>
                    {if $action == 'invoices'}
                        Realted client not exported
                    {elseif $action == 'transactions'}
                        Realted Invoice not exported
                    {/if}
                </small>
            {else}
                <a href="?cmd={$modulename}&action={$action}&selected={$entry.id}&security_token={$security_token}">Export</a>
            {/if}
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="8">Nothing to display</td>
    </tr>
{/foreach}
