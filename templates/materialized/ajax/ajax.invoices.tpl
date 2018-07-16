{if $invoices}
    {foreach from=$invoices item=invoice name=foo}
         <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
              {if $enableFeatures.bulkpayments!='off'}
                <td align="left">
                    <input type="checkbox" value="{$invoice.id}" name="selected[]" {if $invoice.status != 'Unpaid' || $invoice.merge_id}disabled="disabled"{/if}>
                </td>
              {/if}
              
              <td><a href="{$system_url}clientarea/invoice/{$invoice.id}/" target="_blank">{$invoice|@invoice}</a></td>
              <td align="left">
                  <h5><span class="badge badge-{$invoice.status}">{$lang[$invoice.status]}</span></h5>
              </td>
              <td >{$invoice.total|price:$invoice.currency_id}</td>
   <!--           <td align="center">{$invoice.date|dateformat:$date_format}</td>  -->
              <td class="d-none d-lg-block" align="left">{$invoice.duedate|dateformat:$date_format}</td>
              <td align="center"><a href="{$system_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="btn-floating btn-sm waves-effect waves-light"><!--{$lang.view}--><i class="mdi-image-remove-red-eye"></i></a></td>
              <td class="" width="20"/>
        </tr>
    {/foreach}
{/if}