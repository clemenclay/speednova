{if $transactions}
    <strong>{$lang.relatedtransactions}:</strong><br />

    <form action="" method="post" id="transform">
        <input type="hidden" name="make" value="edittrans" />
        <table class="invoice-table-transaction" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th>{$lang.Date}</th>
                <th width="0"></th>
                <th class="acenter">{$lang.Gateway}</th>
                <th class="acenter">{$lang.Transactionid}</th>
                <th class="acenter" width="10%">{$lang.Amount}</th>
                <th class="acenter" width="10%">{$lang.fees}</th>
                <th width="1%" class="acenter"></th>
            </tr>

            {foreach from=$transactions item=tran}
                <tr>

                    <td ><input name="transaction[{$tran.id}][date]" value="{$tran.date|dateformat:$date_format}" class="haspicker transeditor"/></td>
                    <td>
                        {if $tran.invoice_id != $invoice.id && $tran.invoice_id != $invoice.invoice_id}
                            <a href="?cmd=invoices&action=edit&id={$tran.invoice_id}">Invoice #{$tran.invoice_id}</a>
                        {/if}
                    </td>
                    <td class="acenter">
                        <select name="transaction[{$tran.id}][paymentmodule]" class="transeditor">
                            {foreach from=$gateways key=gatewayid item=paymethod}
                                <option value="{$gatewayid}"{if $tran.module == $paymethod} selected="selected"{/if} >{$paymethod}</option>
                            {/foreach}
                        </select>
                    </td>
                    <td class="acenter"><input name="transaction[{$tran.id}][trans_id]" value="{$tran.trans_id}"  class="transeditor"/></td>
                    <td class="acenter"><input name="transaction[{$tran.id}][amount]" value="{$tran.amount}" size="7"  class="transeditor"/></td>
                    <td class="acenter"><input name="transaction[{$tran.id}][fee]" value="{$tran.fee}" size="7" class="transeditor"/></td>
                    <td class="acenter"><a href="?cmd=invoices&action=removetrans&id={$tran.id}" class="removeTrans"><img src="{$template_dir}img/trash.gif" alt="{$lang.Delete}"/></a></td>
                </tr>
            {/foreach}
        </table>
        {securitytoken}
    </form>
{/if}