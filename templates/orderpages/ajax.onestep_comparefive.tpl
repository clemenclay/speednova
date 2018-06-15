<div class="span8">
    <form id="cartforms" action="" method="post">
        <input type="hidden" name="subproducts[0]" value="0" />
        <input type="hidden" name="addon[0]" value="0" />

        {if $product.paytype!='Free' && $product.paytype!='Once'}

            <div class="configuration-box billing-cycle">
                <div class="configuration-header">
                    <h4>{$lang.changebillingcycle}:</h4>
                </div>
                <div class="configuration-body">
                    {include file="common/price.tpl" allprices='cycle'}
                </div>
            </div>
        {/if}
        {* Custom Forms *}

        {if $custom}
            <div class="configuration-box">

                <div class="configuration-header">
                    <h4>{$lang.configuration}</h4>
                </div>
                <div class="configuration-body">
                    {foreach from=$custom item=cf}
                        {if $cf.items}
                            <p>{$cf.name} {if $cf.options &1}*{/if}</p>
                            <div class="option-val cf-{$cf.type}">
                                {include file=$cf.configtemplates.cart}
                                <span class="prod-desc">{$cf.description}</span>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
        {/if}

        {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}

            <div class="configuration-box">
                <div class="configuration-header">
                    <h4>{$lang.domains}</h4>
                </div>

                <ul class="nav nav-tabs domain-nav" id="domainTab">
                    <li class="active"><a href="#host">{$lang.hostname}</a></li>
                </ul>
                <div class="configuration-body">
                    <div class="domain-tab">

                        <div class="tab-content">
                            <div class="tab-pane active" id="host">
                                <div class="padding clearfix">
                                    <p>{$lang.hostname} *</p>
                                    <input type="text" name="domain" value="{$cart_contents[0].domain}" class="styled" size="50" onchange="if (typeof simulateCart == 'function')
                                                simulateCart();"/>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        {/if}

        {if $addons}

            <div class="configuration-box">

                <div class="configuration-header">
                    <h4>{$lang.addons_single}</h4>
                </div>
                <div class="configuration-body">
                    {foreach from=$addons item=a key=k}
                        <p class="no-opacity checkbox-fix"><input name="addon[{$k}]" onchange="if (typeof (simulateCart) == 'function')
                                    simulateCart();"  type="checkbox" value="1" {if $contents[3].$k}checked="checked"{/if}/> <span> {$a.name}</span></p>

                        {price product=$a}
                        {if $a.paytype=='Free'}
                            <span class="product-cycle cycle-free">{$lang.free}</span>
                            <input type="hidden" name="addon_cycles[{$k}]" value="free"/>
                        {elseif $a.paytype=='Once'}
                            <span class="product-price cycle-once">@@price</span>
                            <span class="product-cycle cycle-once">{$lang.once}</span>
                            {if $a.m_setup!=0}<span class="product-setup cycle-once">@@setupline</span>
                            {/if}
                            <input type="hidden" name="addon_cycles[{$k}]" value="once"/>
                        {else}
                            <select name="addon_cycles[{$k}]" >
                                <option value="@@cycle" @@selected>@@line</option>
                            </select>
                        {/if}
                        {/price}
                        <span class="prod-desc">{$a.description}</span>
                    {/foreach}

                </div>
            </div>
        {/if}

        {if $subproducts}
            <div class="configuration-box">

                <div class="configuration-header">
                    <h4>{$lang.subproduct}</h4>
                </div>
                <div class="configuration-body">
                    {foreach from=$subproducts item=a key=k}
                        <p class="no-opacity checkbox-fix"><input name="subproducts[{$k}]" onchange="if (typeof (simulateCart) == 'function')
                                    simulateCart('#cart0');"  type="checkbox" value="1" {if $contents[4].$k}checked="checked"{/if}/> <span>{$a.category_name} - {$a.name}</span>
                        </p>
                        {price product=$a}
                        {if $a.paytype=='Free'}
                            <span class="product-cycle cycle-free">{$lang.free}</span>
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                        {elseif $a.paytype=='Once'}
                            <span class="product-price cycle-once">@@price</span>
                            <span class="product-cycle cycle-once">{$lang.once}</span>
                            {if $a.m_setup!=0}<span class="product-setup cycle-once">@@setupline</span>
                            {/if}
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                        {else}
                            <select name="subproducts_cycles[{$k}]" >
                                <option value="@@cycle" @@selected>@@line</option>
                            </select>
                        {/if}
                        {/price}
                        <span class="prod-desc">{$a.description}</span>
                    {/foreach}

                </div>
            </div>
        {/if}
    </form>
    {* Domains *}
    {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
        <div class="configuration-box" id="domain-section">
            <div class="configuration-header">
                <h4>{$lang.domains}</h4>
            </div>

            <ul class="nav nav-tabs domain-nav" id="domainTab">
                {if $allowregister}
                    <li {if !$cart_contents[2] || !$cart_contents[2][0] || $cart_contents[2][0].action == 'register'}class="active"{/if}><a data-toggle="tab" href="#illregister" onclick="setAction(this);">{$lang.register}</a></li>
                    {/if}
                    {if $allowtransfer}
                    <li {if $cart_contents[2][0] && $cart_contents[2][0].action == 'transfer'}class="active"{/if}><a data-toggle="tab" href="#transfer" onclick="setAction(this);">{$lang.transfer}</a></li>
                    {/if}
                    {if $allowown}
                    <li {if (!$allowregister && !$allowtransfer) || $cart_contents[2][0].action == 'own'}class="active"{/if}><a data-toggle="tab" href="#own" onclick="setAction(this);">{$lang.alreadyhave}</a></li>
                    {/if}
                    {if $subdomain}
                    <li><a data-toggle="tab" href="#subdomain" onclick="setAction(this);">{$lang.subdomain}</a></li>
                    {/if}
            </ul>
            <div class="configuration-body">
                <div id="domoptions11" class="domain-tab">

                    <div class="tab-content">
                        {if $contents[2]}
                            <div id="domoptions22">
                                {foreach from=$contents[2] item=domenka key=kk}
                                    {if $domenka.action!='own' && $domenka.action!='hostname'}
                                        <strong>{if $domenka.action=='register'}{$lang.domainregister}{elseif $domenka.action=='transfer'}{$lang.domaintransfer}{/if}</strong> - {$domenka.name} - {$domenka.period} {$lang.years}
                                        {$domenka.price|price:$currency}<br />
                                    {else}
                                        {$domenka.name}<br />
                                    {/if}
                                    {if $domenka.custom}
                                        <form class="cartD" action="" method="post">
                                            <table class="styled" width="100%" cellspacing="" cellpadding="6" border="0">
                                                {foreach from=$domenka.custom item=cf}
                                                    {if $cf.items}
                                                        <tr>
                                                            <td class="configtd" >
                                                                <label for="custom[{$cf.id}]" class="styled">{$cf.name}{if $cf.options & 1}*{/if}</label>
                                                                {if $cf.description!=''}<div class="fs11 descr" style="">{$cf.description}</div>
                                                                {/if}
                                                                {include file=$cf.configtemplates.cart cf_opt_formId=".cartD" cf_opt_name="custom_domain"}
                                                            </td>
                                                        </tr>
                                                    {/if}
                                                {/foreach}
                                            </table>
                                        </form>
                                    {/if}
                                {/foreach}
                                <br>
                                <a href="#" class="btn btn-plan-1" onclick="$('#domoptions22').hide();
                                            $($('#domainTab li.active a').click());
                                            return false;">{$lang.change}</a>
                            </div>
                        {/if}
                        <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                        <input type="hidden" name="make" value="checkdomain" />
                        {if $allowregister}
                            <div id="illregister" {if $contents[2]}style="display: none"{/if} class="tab-pane active t1 slidme">
                                <input type="radio" name="domain" value="illregister" style="display: none;" checked="checked"/>
                                <div class="domain-input-bulk domain-input left" id="multisearch">
                                    <textarea name="sld_register" id="sld_register" style="resize: none"></textarea>
                                </div>

                                <div class="domain-tld-bulk domain-tld" style="margin-left:10px;width:260px;float:left">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="" class="fs11">
                                        {foreach from=$tld_reg item=tldname name=ttld}
                                            {if !$smarty.foreach.ttld.first && $smarty.foreach.ttld.index % 3 == 0}</tr>
                                            {/if}
                                            {if !$smarty.foreach.ttld.last && $smarty.foreach.ttld.index % 3 == 0}<tr>
                                                {/if}
                                                <td width="33%"><input type="checkbox" name="tld[]" value="{$tldname}" {if $smarty.foreach.ttld.first}checked="checked"{/if} class="tld_register"/>
                                                    {$tldname}
                                                </td>
                                                {if $smarty.foreach.ttld.last}</tr>
                                                {/if}
                                            {/foreach}
                                        <tr></tr>
                                    </table>
                                </div>
                                <div class="clear"></div>
                                <p class="align-right domain-check-bulk">
                                    <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck();
                                                return false;"/>
                                </p>
                            </div>
                        {/if}


                        <!-- Transfer -->
                        {if $allowtransfer}
                            <div class="tab-pane" {if $contents[2]}style="display: none"{/if} id="transfer">
                                <div id="illtransfer" class="t2 slidme align-center form-horizontal">
                                    <input type="radio" style="display: none;" value="illtransfer" name="domain" {if !$allowregister}checked="checked"{/if}/>
                                    www.
                                    <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled domain-input"/>
                                    <select name="tld_transfer" id="tld_transfer" class="span2 domain-tld">
                                        {foreach from=$tld_tran item=tldname}
                                            <option>{$tldname}</option>
                                        {/foreach}
                                    </select>
                                    <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck();
                                                return false;"/>
                                </div>
                                <div id="transfer-updater" class="updater2">{include file="ajax.checkdomain.tpl"} </div>
                            </div>
                        {/if}


                        <!-- Own -->
                        {if $allowown}
                            <div class="tab-pane {if !$allowregister && !$allowtransfer} active {/if}" {if $contents[2]}style="display: none"{/if}  id="own">
                                <div id="illupdate" class="t3 slidme align-center form-horizontal">
                                    <input type="radio" style="display: none;" value="illupdate" name="domain" {if !$allowregister && !$allowtransfer}checked="checked"{/if}/>
                                    www.
                                    <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled domain-input"/>
                                    .
                                    <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2 domain-tld"/>  
                                    <input type="submit" value="{$lang.check}" class="btn domain-check  btn-plan-1" onclick="domainCheck();
                                                return false;"/>
                                </div>
                            </div>
                        {/if}

                        <!-- Subdomain -->
                        {if $subdomain}
                            <div class="tab-pane" {if $contents[2]}style="display: none"{/if}  id="subdomain">
                                <div id="illsub"  class="t4 slidme align-center form-horizontal">
                                    <input type="radio" style="display: none;" value="illsub" name="domain"  {if !($allowregister || $allowtransfer || $allowown)}checked="checked"{/if}/>
                                    www.
                                    <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled domain-input"/>
                                    {$subdomain}
                                    <div style="margin-top: 10px">
                                        <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck();
                                                    return false;"/>
                                    </div>
                                </div>
                            </div>
                        {/if}


                        <div id="updater2">{include file="ajax.checkdomain.tpl"} </div>
                    </div>
                </div>

            </div>
        </div>
    {/if}
    

    <script type="text/javascript">bindSimulateCart();</script>
</div>

<!-- Order Summary -->
<div class="span4">
    <div class="configuration-box" id="orderSummary">
        <div class="configuration-header">
            <h4>{$lang.ordersummary}</h4>
        </div>
        <div class="configuration-body summary-bg">
            <div class="padding">
                <table class="table">
                    <tr>
                        <th>{$lang.Description}</th>
                        <th>{$lang.price}</th>
                    </tr>


                    {counter name=alter print=false start=1 assign=alter}
                    {if $product}
                        <tr>
                            <td class="desc-col"><strong>{$contents[0].name} {if $contents[0].domain}({$contents[0].domain}){/if}</strong></td>
                            <td class="price-col">
                                {if $contents[0].price==0}{$lang.Free}
                                {elseif $contents[0].prorata_amount}{$contents[0].prorata_amount|price:$currency} ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                                {else}{$contents[0].price|price:$currency}
                                {/if}
                                {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                                {/if}
                            </td>
                        </tr>
                    {/if}

                    {* FORMS *}
                    {if $cart_contents[1]}
                        {foreach from=$cart_contents[1] item=cstom2}
                            {foreach from=$cstom2 item=cstom}
                                <tr>
                                    <td class="desc-col">
                                        {if $cstom.type == 'slider' || $cstom.type == 'qty'}
                                            <strong>{$cstom.fullname}</strong> {if $cstom.qty>1} <span class="green-val"> {$cstom.qty}</span>{/if}
                                        {elseif $cstom.type == 'select' || $cstom.type == 'radio'}
                                            {$cstom.name}
                                            <strong>{$cstom.sname}</strong>
                                        {else}
                                            <strong>{$cstom.name}</strong>
                                        {/if}
                                    </td>
                                    <td class="price-col">
                                        {if $cstom.price==0}{$lang.Free}
                                        {elseif $cstom.prorata_amount}{$cstom.prorata_amount|price:$currency}
                                        {else}{$cstom.price|price:$currency}
                                        {/if}

                                        {if $cstom.recurring == 'once' && $cstom.price > 0}{$lang.once}
                                        {/if}

                                        {if $cstom.setup!=0} + {$cstom.setup|price:$currency} {$lang.setupfee}
                                        {/if}
                                    </td>
                                </tr>
                                {counter name=alter}
                            {/foreach}
                        {/foreach}
                    {/if}


                    {* ADDONS *}
                    {if $contents[3]}
                        {foreach from=$contents[3] item=addon}
                            <tr>
                                <td class="desc-col">{$lang.addon} <strong>{$addon.name}</strong></td>
                                <td class="price-col">
                                    {if $addon.price==0}{$lang.Free}
                                    {elseif $addon.prorata_amount}{$addon.prorata_amount|price:$currency} ({$lang.prorata} {$addon.prorata_date|dateformat:$date_format})
                                    {else}{$addon.price|price:$currency}
                                    {/if}
                                    {if $addon.setup!=0} + {$addon.setup|price:$currency} {$lang.setupfee}
                                    {/if}
                                    <span class="font-normal">
                                        {if $addon.recurring}{assign value=$addon.recurring var=recurring}{$lang[$recurring]}
                                        {elseif $addon.price > 0}{$lang.once}
                                        {/if}
                                    </span>
                                </td>
                            </tr>
                            {counter name=alter}
                        {/foreach}
                    {/if}

                    {* SUBPRODUCTS *}
                    {if $contents[4]}
                        {foreach from=$contents[4] item=subprod}
                            <tr>
                                <td class="desc-col">{$subprod.category_name} <strong>{$subprod.name}</strong></td>
                                <td class="price-col">
                                    {if $subprod.price==0}{$lang.Free}
                                    {elseif $subprod.prorata_amount}{$subprod.prorata_amount|price:$currency} ({$lang.prorata} {$subprod.prorata_date|dateformat:$date_format})
                                    {else}{$subprod.price|price:$currency}
                                    {/if}

                                    {if $subprod.setup!=0} + {$subprod.setup|price:$currency} {$lang.setupfee}
                                    {/if}
                                    <span class="font-normal">
                                        {if $subprod.recurring}{assign value=$subprod.recurring var=recurring}{$lang[$recurring]}
                                        {elseif $subprod.price > 0}{$lang.once}
                                        {/if}
                                    </span>
                                </td>
                            </tr>
                            {counter name=alter}
                        {/foreach}
                    {/if}

                    {* DOMAINS *}
                    {if $contents[2] && $contents[2][0].action!='own'}
                        {foreach from=$contents[2] item=domenka key=kk}
                            <tr>
                                <td class="desc-col">

                                    {if $domenka.action=='register'}{$lang.domainregister}
                                    {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                    {/if}

                                    <strong>
                                        {$domenka.name}
                                    </strong>
                                </td>
                                <td class="price-col">
                                    {$domenka.price|price:$currency} {$domenka.period}&nbsp;{$lang.years}
                                    {if $domenka.dns}&raquo; {$lang.dnsmanage} (+ {$domenka.dns|price:$currency})<br/>
                                    {/if}
                                    {if $domenka.idp}&raquo; {$lang.idprotect}(+ {$domenka.idp|price:$currency})<br/>
                                    {/if}
                                    {if $domenka.email}&raquo; {$lang.emailfwd} (+ {$domenka.email|price:$currency})<br/>
                                    {/if}
                                </td>
                            </tr>
                            {counter name=alter}
                        {/foreach}
                    {/if}
                    {if $tax}
                        {if $subtotal.coupon}
                            <tr>
                                <td class="desc-col">{$lang.discount}</td>
                                <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax1 && $tax.taxed1!=0}
                            <tr>
                                <td class="desc-col">{$tax.tax1name} @ {$tax.tax1}%  </td>
                                <td class="price-col">{$tax.taxed1|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax2  && $tax.taxed2!=0}
                            <tr>
                                <td class="desc-col">{$tax.tax2name} @ {$tax.tax2}%  </td>
                                <td class="price-col">{$tax.taxed2|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.credit!=0}
                            <tr>
                                <td class="desc-col"><strong>{$lang.credit}</strong> </td>
                                <td class="price-col">{$tax.credit|price:$currency}</td>
                            </tr>
                        {/if}
                    {elseif $credit}
                        {if  $credit.credit!=0}
                            <tr>
                                <td class="desc-col"><strong>{$lang.credit}</strong> </td>
                                <td class="price-col">{$credit.credit|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $subtotal.coupon}
                            <tr>
                                <td class="desc-col">{$lang.discount}</td>
                                <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {else}
                        {if $subtotal.coupon}
                            <tr>
                                <td class="desc-col">{$lang.discount}</td>
                                <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {/if}
                    {if !empty($tax.recurring) || !empty($subtotal.recurring)}
                        <tr>
                            <td class="desc-col">{$lang.total_recurring}</td>
                            <td class="price-col">
                                {if !empty($tax.recurring)}
                                    {foreach from=$tax.recurring item=rec key=k}
                                        <div class="recurring">{$rec|price:$currency} <span class="font-normal">{$lang.$k}</span></div>
                                        {/foreach}
                                    {elseif !empty($subtotal.recurring)}
                                        {foreach from=$subtotal.recurring item=rec key=k}
                                        <div class="recurring">{$rec|price:$currency} <span class="font-normal">{$lang.$k}</span></div>
                                        {/foreach}
                                    {/if}
                            </td>
                            {counter name=alter}
                        </tr>
                    {/if}
                </table>

                <div class="total-summary">
                    <p class="total-text">{$lang.total_today}:</p>
                    <p class="total-price">
                        {if $tax}
                            {$tax.total|price:$currency}
                        {elseif $credit}
                            {$credit.total|price:$currency}
                        {else}
                            {$subtotal.total|price:$currency}
                        {/if}</p>
                </div>
                {if count($currencies)>1}
                    <div class="currency-box">
                        <form action="" method="post" id="currform"><p align="right">
                                <input name="action" type="hidden" value="changecurr">
                                {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                                    {foreach from=$currencies item=crx}
                                        <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                                    {/foreach}
                                </select>
                            </p></form>
                    </div>
                {/if}
                <div class="promo-code">
                    {if !$subtotal.coupon}
                        <p>{$lang.usecoupon}</p>
                        <div class="input-append">
                            <input class="span3" type="text" name="promocode" onchange="applyCoupon()">
                        </div>
                    {else}
                        <div class="promo-input">
                            <a href="#"onclick="removeCoupon();
                                    return false" title="{$lang.remove_coupon}">{$lang.remove_coupon}: {$subtotal.coupon}</a>
                        </div>
                    {/if}
                    <div style="clear:both"></div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- End of Order Summary -->