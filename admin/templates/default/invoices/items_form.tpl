<form action="" method="post" id="itemsform">
    {if $itemqueue && $invoice.status != 'Draft'}
        <div  id="invoice-queue"  class="p6 secondtd" style="text-align:center;margin-bottom:7px;padding:15px 0px;">
            This customer have some items in invoice queue, would you like to add them here?<br/>
            <a class="new_control greenbtn" href="#itemqueue" ><span>Add items from queue</span></a>
        </div>
    {/if}
    <table class="invoice-table text-center" width="100%" border="0" cellpadding="0" cellspacing="0">
        <thead >
            <tr>
                <th width="16" ></th>
                <th class="text-left">{$lang.Description}</th>
                <th width="8%" class="acenter">{$lang.qty}</th>
                <th width="7%" class="acenter">{$lang.Taxed}</th>
                <th width="9%" class="acenter">{$lang.Price}</th>
                <th width="13%" class="text-right">{$lang.Linetotal}</th>
                <th width="1%" class="acenter">&nbsp;</th>
            </tr>
        </thead>
        <tbody id="main-invoice">
            {include file="invoices/items.tpl"}
        </tbody>
        {if !$invoice.readonly}
            <tbody id="new-item-invoice">
                <tr id="addliners">
                    <td class="summary blu acenter" style="padding-right:0px;padding-left:5px">

                        <a id="lineaction" class="setStatus menuitm">
                            <span class="gear_small" style="padding-left:16px;">
                                <span class="morbtn" style="padding-right:10px;">&nbsp;</span>
                            </span>
                        </a>
                        <ul id="lineaction_m" class="ddmenu">
                            <li>
                                <a href="NewLine" data-line="getproduct">New line from product</a>
                            </li>
                            {*<li><a href="NewLine" data-line="services">New line from client service</a></li>*}
                            {if $invoice.status!='Draft' && $invoice.status!='Recurring'}
                                <li>
                                    <a href="SplitItems">Split selected into new invoice</a>
                                </li>
                            {/if}
                            {adminwidget module="invoice" section="lineaction"}
                        </ul>

                    </td>
                    <td class="summary blu">
                        <div class="newline-basic clearfix">
                            <input name="item[n][description]" id="nline" 
                                   class="foc invdescription" style="width:80%"
                                   placeholder="{$lang.newline}" />
                        </div>
                        <div class="newline-adv newline-adv-body clearfix">

                        </div>
                    </td>
                    <td class="summary blu acenter">
                        <input type="text" type="text" name="item[n][qty]" id="nline_qty" 
                               size="8" class="foc invqty" value="1.00"
                               style="text-align:center"/>
                    </td>
                    <td class="summary blu acenter">
                        <input name="item[n][taxed]" {if $invoice.taxexempt}disabled="disabled"{/if} 
                               type="checkbox" value="1" id="nline_tax" />
                    </td>
                    <td class="summary blu acenter">
                        <input type="text" name="item[n][amount]" id="nline_price" 
                               class="foc invamount _search" size="16" value="0"
                               style="text-align:right"/>
                    </td>
                    <td class="summary blu" colspan="2">
                        <div class="pull-right">
                            <button class="btn btn-primary btn-sm newline-add">{$lang.Add}</button>
                            <a class="btn btn-default btn-sm newline-adv newline-cancel">{$lang.Cancel}</a>
                        </div>
                    </td>
                </tr>

            </tbody>
        {/if}
        <tr>
            <td valign="top" colspan="2">
                <div class="invoice-notes">
                    <strong>Public Notes</strong>
                    <div>
                        <textarea class="notes_field invitem" style="width:90%;height:60px;" 
                                  name="{if $estimate}estimate{else}invoice{/if}[notes]" id="inv_notes"
                                  {if $invoice.readonly}readonly{/if}>{$invoice.notes}</textarea>
                    </div>
                </div>
            </td>
            <td colspan="5" valign="top" >
                <div id="updatetotals">
                    <table width="100%" class="invoice-summary">
                        <tr>
                            <td class="summary aright"  colspan="2"><strong data-invoice-total>{$lang.Subtotal}</strong></td>
                            <td class="summary aright" colspan="2"><strong data-invoice-subtotal>{$invoice.subtotal|price:$currency}</strong></td>
                            <td class="summary" width="2%"></td>
                        </tr>
                        {if $invoice.status!='Creditnote'} 
                            <tr>
                                <td class="summary aright"  colspan="2"><strong>{$lang.Credit}</strong></td>
                                <td class="summary aright" colspan="2"><strong>{$invoice.credit|price:$currency}</strong></td>
                                <td class="summary"></td>
                            </tr>
                        {/if}
                        {if $invoice.taxrate!=0}
                            <tr>
                                <td class="summary aright"  colspan="2"><strong>{$lang.Tax} ({$invoice.taxrate}%)</strong></td>
                                <td class="summary aright" colspan="2"><strong>{$invoice.tax|price:$currency}</strong></td>
                                <td class="summary"></td>
                            </tr>
                        {/if}
                        {if $invoice.taxrate2!=0}
                            <tr>
                                <td class="summary aright"  colspan="2"><strong>{$lang.Tax} ({$invoice.taxrate2}%)</strong></td>
                                <td class="summary aright" colspan="2"><strong>{$invoice.tax2|price:$currency}</strong></td>
                                <td class="summary"></td>
                            </tr>
                        {/if}
                        <tr>
                            <td class="summary aright" colspan="2" ><strong class="bigger">{$lang.Total}</strong> {if ($invoice.taxrate!=0 || $invoice.taxrate2!=0) && $invoice.taxexempt}<a href="#" class="vtip_description" title="Tax exemptiont is enabled for this invoice"></a>{/if}</td>
                            <td class="summary aright" colspan="2" ><strong class="bigger">{$invoice.total|price:$currency}</strong></td>
                            <td class="summary"></td>
                        </tr>
                    </table>
                    <input type="hidden" class="invoice-update-field" 
                           id="invoice-total" value="{$invoice.total}" 
                           data-formated="{$invoice.total|price:$currency}">
                    <input type="hidden" class="invoice-update-field" 
                           id="invoice-balance" value="{$balance}" 
                           data-formated="{$balance|price:$currency}">
                    <input type="hidden" class="invoice-update-field" 
                           id="invoice-appcredit" value="{$credit_available}" 
                           data-formated="{$credit_available|price:$currency}">
                </div>
            </td>
        </tr>
    </table>
    {securitytoken}
</form>
