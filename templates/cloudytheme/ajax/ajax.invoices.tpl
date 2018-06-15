{if $invoices}
    {foreach from=$invoices item=invoice name=foo}
        <tr>
            {if $enableFeatures.bulkpayments!='off'}
                <td>
                    <input type="checkbox" value="{$invoice.id}" name="selected[]" {if $invoice.status != 'Unpaid' || $invoice.merge_id}disabled="disabled"{/if}>
                </td>
            {/if}
            <td>
                <span class="label flat-ui-label label-{$invoice.status}">{$lang[$invoice.status]}</span>
            </td>
            <td class="bold invoice-c">
                <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" class="roll-link">
                    <span data-title="#{$invoice|@invoice}">#{$invoice|@invoice}
                              </span>
                          </a>
                    </td>
                    <td>{$invoice.total|price:$invoice.currency_id}</td>
                    <td>{$invoice.date|dateformat:$date_format}</td>
                    <td>
                        {$invoice.duedate|dateformat:$date_format}
                    </td>
                    <td>
                        <a href="{$ca_url}clientarea/invoice/{$invoice.id}/">
                            <i class="icon-link"></i>
                        </a>
                    </td>
                </tr>
                {foreachelse}
                    <tr><td colspan="3">{$lang.nothing}</td></tr>
                    {/foreach}
                        {/if}