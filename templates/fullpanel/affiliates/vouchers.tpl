<div class="white-container white-bg">
    <div class="padding">

        <div class="affiliates-box">
            {include file="affiliates/affiliates.top.tpl"}
            <h2>{$lang.promocodes}</h2>
            <p>{$lang.voucherinfo}</p>

            
            <table class="table full-table table-round-rows">
                <tr class="header-row">
                    <th class="w5"><input type="checkbox"></th>
                    <th><a href="#">{$lang.vouchercode} <i class="icon-sort"></i> </a></th>
                    <th><a href="#">{$lang.discount} <i class="icon-sort"></i> </a></th>
                    <th><a href="#">{$lang.margin} <i class="icon-sort"></i> </a></th>
                    <th ><a href="#">{$lang.used} <i class="icon-sort"></i></a></th>
                            {if 'config:AffVAudience:1'|checkcondition}
                        <th><a href="#"><i class="icon-sort"></i></a>{$lang.audience}</th>
                            {/if}
                    <th><a href="#"><i class="icon-sort"></i></a>{$lang.expires}</th>
                    <th class="w5"></th>
                </tr>

                {foreach from=$vouchers item=voucher name=vouchers}
                    <tr class="empty-row">
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><a href="#">{$voucher.code}</a></td>
                        <td>
                            {if $voucher.type=='Percent'}{$voucher.value}%
                            {else}{$voucher.value|price:$affiliate.currency_id}
                            {/if}
                        </td>
                        <td>
                            {if $voucher.type=='Percent'}{$voucher.margin}%
                            {else}{$voucher.margin|price:$affiliate.currency_id}
                            {/if}
                        </td>
                        <td>
                            {$voucher.num_usage}
                        </td>
                        {if 'config:AffVAudience:1'|checkcondition}
                            <td>
                                {if $voucher.clients=='new'}
                                    {$lang.newcustommers}
                                {elseif $voucher.clients=='existing'}
                                    {$lang.existingcustommers}
                                {else}
                                    {$lang.allcustommers}
                                {/if}
                            </td>
                        {/if}
                        <td>
                            {if $voucher.expires|dateformat:$date_format}{$voucher.expires|dateformat:$date_format}
                            {else}-
                            {/if}
                        </td>
                        <td class="fix-p align-r"> 
                            <a href="{$ca_url}{$cmd}/{$action}/&make=delete&id={$voucher.id}&security_token={$security_token}" class="btn btn-white small-p">
                                <i class="icon-trash"></i>
                            </a>
                        </td>
                    </tr>
                {/foreach}
                {if !$vouchers}
                    <tr>
                        <td colspan="8">Nothing to display</td>
                    </tr>
                {/if}
            </table>
        </div>
    </div>
</div>