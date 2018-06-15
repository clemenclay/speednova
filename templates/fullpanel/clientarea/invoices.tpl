{*

Browse invoices history

*}
<div class="white-container white-bg">
    <div class="padding">
        <h2>{$lang.invoices|capitalize}</h2>
        {if $enableFeatures.bulkpayments!='off' ||  $enableFeatures.deposit!='off' }
            <div class="pull-right">
                {if $enableFeatures.deposit!='off' }
                    <a class="btn btn-white" href="{$ca_url}clientarea&action=addfunds"><i class="icon-plus"></i> {$lang.addfunds}</a>
                {/if}
                {if $enableFeatures.bulkpayments!='off'}
                    <form method="post" action="index.php" class="no-margin" style="display:inline-block; vertical-align:top" id="payall">
                        <input type="hidden" name="action" value="payall"/>
                        <input type="hidden" name="cmd" value="clientarea"/>
                        <button class="btn btn-green"><b class="payall-all">{$lang.paynowdueinvoices}</b>
                        <b class="payall-selected">Pay selected invoices</b></button>
                        {securitytoken}
                    </form>
                {/if}
            </div>
        {/if}

        <div class="invoives-balance">
            <div class="column">
                <span>invoices due</span>
                <p class="red-txt">- {$acc_balance|price:$currency}</p>
            </div>
            <div class="separator"></div>
            <div class="column">
                <span>your balance</span>
                <p class="green-txt">{$acc_credit|price:$currency}</p>
            </div>
        </div>
        <a href="{$ca_url}clientarea&amp;action=invoices" id="currentlist" style="display:none" updater="#updater"></a>
        <table class="table full-table table-round-rows">
            <tr class="header-row">
                {if $enableFeatures.bulkpayments!='off'}<th width="20"></th>{/if}
                <th class="w10"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=status|ASC"  class="sortorder">{$lang.status} <i class="icon-sort"></i></a></th>
                <th class="w25"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=id|ASC" class="sortorder">{$lang.invoicenum} <i class="icon-sort"></i></a></th>
                <th class="w15 cell-border"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=total|ASC"  class="sortorder">{$lang.total} <i class="icon-sort"></i></a></th>
                <th class="w15 cell-border"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=date|ASC"  class="sortorder">{$lang.invoicedate} <i class="icon-sort"></i></a></th>
                <th class="no-r-border w10"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  class="sortorder">{$lang.duedate} <i class="icon-sort"></i></a></th>
            </tr>
            <tbody id="updater">
                {include file='ajax/ajax.invoices.tpl'}
            </tbody>

        </table>
        <div class="bottom-options clearfix">
            {if $totalpages}
                <div class="pull-right">
                    <div class="pagination c-pagination">
                        <ul rel="{$totalpages}">
                            <li><a href="#{$lang.previous}">{$lang.previous}</a></li>
                            <li><a href="#{$lang.next}">{$lang.next}</a></li>
                        </ul>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>
{if $enableFeatures.bulkpayments!='off'}
    <script type="text/javascript">
        {literal}
            var checks = $('input[name="selected[]"]'),
                pay = $('#payall');
        
            checks.change(function(){
                if(checks.filter(':checked').length){
                    pay.find('.payall-selected').show();
                    pay.find('.payall-all').hide();
                }else{
                    pay.find('.payall-selected').hide();
                    pay.find('.payall-all').show();
                }
            }).change();
            pay.submit(function(){
                if(checks.filter(':checked').length){
                    var a = checks.serializeArray();
                    for(var i = 0; i < a.length; i++){
                        pay.append('<input type="hidden" name="selected[]" value="'+a[i].value+'" />');
                    }
                }
            });
        {/literal}
    </script>
{/if}