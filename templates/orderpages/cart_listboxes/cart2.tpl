<!-- Orderpage -->
<div class="orderpage" xmlns="http://www.w3.org/1999/html">


{include file='cart_listboxes/header.tpl'}


    <div class="row">
        <div class="span8">
            <form action="" method="post" id="cart3">
                <input type="hidden" name="make" value="domainconfig" />
            <h3>{$lang.mydomains}</h3>

            <div class="domain-choose">
                <div class="domain-option">
                    <p>{$lang.productconfig2}:</p>
                    <table style="width:96%;margin-left:9px;" class="form-horizontal">
                        {foreach from=$domain item=doms key=kk name=domainsloop}
                            <tr class="domain-row domain-row-{$kk}">
                                <td class="openSansSemiBold">
                                    {$doms.name}
                                    <input type="hidden" value="{$kk}" name="domkey[]" />
                                    <a href="#" class="openSansSemiBold" onclick="return remove_domain('{$kk}', '{$lang.itemremoveconfirm}')" >[{$lang.delete}]</a>
                                </td>
                                <td class="openSansSemiBold" style="text-align: right">
                                    <select name="period[{$kk}]" id="domain-period-{$kk}" class="dom-period" onchange="if(typeof (simulateCart)=='function') simulateCart('#cart3')" >
                                        {foreach from=$doms.product.periods item=period key=p}
                                            <option value="{$p}" {if $p==$doms.period}selected="selected"{/if}>{$p} {$lang.years}</option>
                                        {/foreach}
                                    </select>
                                </td>

                            </tr>
                            {if !$renewalorder && $doms.custom}
                                {foreach from=$doms.custom item=cf}
                                    {if $cf.items}
                                        <tr  class="domain-row-{$kk}  domain-row  {if $smarty.foreach.domainsloop.index%2==0}even{/if}">
                                            <td colspan="3" class="configtd" >
                                                <div class="cf-domain"><strong>{$cf.name} {if $cf.options & 1}*{/if}</strong></div>
                                                {if $cf.description!=''}<div class="fs11 descr" style="">{$cf.description}</div>
                                                {/if}
                                                {include file=$cf.configtemplates.cart}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/if}
                            {if $doms.action=='transfer'}
                                {if $doms.product.epp=='1'}
                                    <tr  class="domain-row-{$kk}  domain-row  {if $smarty.foreach.domainsloop.index%2==0}even{/if}" >
                                        <td colspan="3"  style="border:none" class="configtd">
                                            <label for="epp{$kk}" class="styled"> {$lang.eppcode}*</label>
                                            <input name="epp[{$kk}]"  id="epp{$kk}" value="{$doms.epp}" class="styled" />
                                        </td>
                                    </tr>
                                {else}
                                    <tr style="display:none;" >
                                        <td>
                                            <input name="epp[{$kk}]" type="hidden" value="not-required" />
                                        </td>
                                    </tr>
                                {/if}
                            {/if}
                        {/foreach}
                    </table>
                </div>
                {if !$renewalorder}
                    <input type="hidden" name="usens" value="{if $usens=='1'}1{else}0{/if}" id="usens" />

                    <div class="domain-option" {if $usens && $product && !$periods}style="display:none"{/if}>
                        <p>{$lang.edit_config}</p>
                        <p>
                            <span class="question-mark vtip_description" title="{$lang.cart2_desc3} " ></span>
                            <span class="edit-domain">{$lang.cart2_desc4}</span>
                            <a href="#" class="edit-nameservers right" {if $usens=='1'}style="display:none"{/if} onclick="$(this).hide().next().show();$('#usens').val(1);$('#nameservers').slideDown();return false">{$lang.iwantminens}</a>
                            <a href="#" class="edit-nameservers right" {if !$usens}style="display:none"{/if} onclick="$(this).hide().prev().show();$('#nameservers').slideUp();$('#setnservers').show();$('#usens').val(0);return false">{$lang.useourdefaultns}</a>
                        </p>
                        {if $periods}
                            <p>
                                <span class="question-mark vtip_description" title="{$lang.cart2_desc2} " ></span>
                                <span class="edit-domain openSansSemiBold">{$lang.cart2_desc5}</span>
                                <select onchange="bulk_periods(this)" class="right">
                                    {foreach from=$periods item=period key=p}
                                        <option value="{$p}">{$p} {$lang.years}</option>
                                    {/foreach}
                                </select>

                            </p>
                        {/if}
                        {if !$product}
                            <p>
                                <span class="question-mark vtip_description" title="{$lang.cart2_desc1}" ></span>
                                <span class="edit-domain openSansSemiBold">{$lang.nohosting}</span>
                                <a class="edit-nameservers openSansBold right" href="{$ca_url}cart&step=0&addhosting=1">{$lang.clickhere1}</a>
                            </p>
                        {/if}
                    </div>
                    <div id="nameservers" class="domain-option" {if !$usens}style="display:none"{/if}>
                        <p>{$lang.nameservers}</p>
                        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="styled" style="margin-left:8px;">
                            <colgroup class="firstcol"></colgroup>
                            <colgroup class="alternatecol"></colgroup>
                            <tr><td width="20%" class="openSansSemiBold">{$lang.nameserver} 1</td><td><input name="ns1" style="width:60%" value="{$domain[0].ns1}" class="styled"/></td></tr>
                            {if $domain[0].nsips}<tr><td width="20%" class="openSansSemiBold">{$lang.nameserver} IP 1</td><td><input name="nsip1" style="width:60%" value="{$domain[0].nsip1}" class="styled"/></td></tr>
                            {/if}
                            <tr><td class="openSansSemiBold">{$lang.nameserver} 2</td><td> <input name="ns2" style="width:60%" value="{$domain[0].ns2}"  class="styled"/></td></tr>
                            {if $domain[0].nsips}<tr><td width="20%" class="openSansSemiBold">{$lang.nameserver} IP 2</td><td><input name="nsip2" style="width:60%" value="{$domain[0].nsip2}" class="styled"/></td></tr>
                            {/if}
                            <tr><td class="openSansSemiBold">{$lang.nameserver} 3</td><td><input name="ns3" style="width:60%" value="{$domain[0].ns3}"  class="styled"/></td></tr>
                            {if $domain[0].nsips}<tr><td width="20%" class="openSansSemiBold">{$lang.nameserver} IP 3</td><td><input name="nsip3" style="width:60%" value="{$domain[0].nsip3}" class="styled"/></td></tr>
                            {/if}
                            <tr><td class="openSansSemiBold">{$lang.nameserver} 4</td><td><input name="ns4" style="width:60%" value="{$domain[0].ns4}" class="styled" /></td></tr>
                            {if $domain[0].nsips}<tr><td width="20%" class="openSansSemiBold">{$lang.nameserver} IP 4</td><td><input name="nsip4" style="width:60%" value="{$domain[0].nsip4}" class="styled"/></td></tr>
                            {/if}
                        </table>
                    </div>
                    <div class="domain-option">
                        <p class="openSansBold">{$lang.domcontacts}</p>
                        <div class="contacts">
                            {include file="common/contacts.tpl"}
                        </div>
                    </div>
                {/if}
            </div>
        </div>


        <div class="span4" id="cartSummary">
            {include file='cart_listboxes/cart_summary.tpl'}
        </div>
    </div>


{include file='cart_listboxes/pagination.tpl'}



</div>
<!-- End of Orderpage -->