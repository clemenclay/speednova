<h2 class="pink-text">{$lang.invoices|capitalize}</h2>
<div class="card">
    <div class="card-body">
        <div>

        {if ($acc_balance && $acc_balance>0) ||  $enableFeatures.deposit!='off' }
            <div class="ribbon form-horizontal">
                    <div class="control-group">
                        <label for="appendedPrependedInput" class="control-label left" style="width:auto">{$lang.curbalance}:  <b>{$acc_balance|price:$currency}</b></label>
                        {if $enableFeatures.deposit!='off' }
                        <div class="right" style="margin-left:10px">
                            <a href="{$ca_url}clientarea&action=addfunds" class="btn btn-info btn-large">{$lang.addfunds}</a>
                        </div>
                        {/if}
                        {if $acc_balance && $acc_balance>0 && $enableFeatures.bulkpayments!='off'}
                        <div class="right" style="margin-left:10px">
                            <form method="post" action="index.php" id="payall">
                            <input type="hidden" name="action" value="payall"/>
                            <input type="hidden" name="cmd" value="clientarea"/>
                            <button class="btn btn-success btn-large">
                                <i class="icon-ok-sign icon-white"></i> <b class="payall-all">{$lang.paynowdueinvoices}</b>
                                <b class="payall-selected">{$lang.payselectedinvoices}</b>
                            </button>
                            {securitytoken}</form>
                        </div>
                        {/if}


                    </div>
            </div>
        {/if}

        {if $invoices}


        <a href="{$ca_url}clientarea&amp;action=invoices" id="currentlist" style="display:none" updater="#updater"></a>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table">
        <colgroup class="firstcol"></colgroup>
        {if $enableFeatures.bulkpayments!='off'}<colgroup class="firstcol"></colgroup>{/if}
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>
        <tbody>
            <thead class="">
            
            <th><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=id|ASC" class="sortorder">#</a></th>
            <th width="30"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=status|ASC"  class="sortorder">{$lang.status}</a></th>
            <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=total|ASC"  class="sortorder">{$lang.total}</a></th>
       <!--     <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=date|ASC"  class="sortorder">{$lang.invoicedate}</a></th> -->
            <th width="120"><a href="{$ca_url}clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  class="sortorder d-none d-lg-block">{$lang.duedate}</a></th>
            <th class="" width="20"/>
            </thead>
        </tbody>
        <tbody id="updater">
            {include file='ajax/ajax.invoices.tpl'}
        </tbody>
        
        </table>

        <div class="clear"></div>



<!--Pagination-->


<ul class="pagination">
    <li class="{if $smarty.section.foo.iteration==1}active{/if}">
                {section name=foo loop=$totalpages}
                    <button class="btn waves-effect waves-light grey">{$smarty.section.foo.iteration}</button>
                {/section}
    </li>
</ul>





            <div class="clear"></div>
        {else}
        <h3 class="p19">{$lang.nothing}</h3>
        {/if}
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
    </div>
</div>



