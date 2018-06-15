{if $invoices}
    {foreach from=$invoices item=invoice name=foo}
        <tr class="empty-row">
        </tr>
        <tr>
            {if $enableFeatures.bulkpayments!='off'}
                <td align="center">
                    <input type="checkbox" value="{$invoice.id}" name="selected[]" {if $invoice.status != 'Unpaid' || $invoice.merge_id}disabled="disabled"{/if}>
                </td>
            {/if}
            <td><span class="{$invoice.status}-label">{$lang[$invoice.status]}</span></td>
            <td>
                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank">
                    {$invoice|@invoice}
                </a>
            </td>
            <td>{$invoice.total|price:$invoice.currency_id}</td>
            <td>{$invoice.date|dateformat:$date_format}</td>
            <td>
                {$invoice.duedate|dateformat:$date_format}
            </td>
        </tr>
    {foreachelse}
        <tr><td colspan="5">{$lang.nothing}</td></tr>
    {/foreach}
{/if}