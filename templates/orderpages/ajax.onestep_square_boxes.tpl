<div class="clearfix">
<!-- Product Configuration -->
<div class="orderpage-configuration pull-left">
    <h4><i class="icon-product-config"></i> {$lang.productconfig}</h4>
    <form id="domainforms" action="" method="post">

    {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
    <div class="hostname">
        <ul class="nav nav-tabs" id="billing">
            <li class="active"><a data-toggle="tab" href="#hostname">{$lang.hostname}</a></li>
        </ul>

        <div class="tab-content">
            <!-- Hostname -->
            <div class="tab-pane active" id="hostname">
                <input name="domain" value="{$item.domain}" placeholder="{$lang.hostname}" class="styled" size="50" onchange="if(typeof addHostname == 'function') addHostname();"/>
            </div>

        </div>
    </div>
    {/if}

    {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
        <div class="hostname">
            <ul class="nav nav-tabs">
                {if $allowregister}
                <li class="{if $contents[2].action=='register' || $contents[2]}active{/if}"><a data-toggle="tab" href="#register" onclick="setAction(this);">{$lang.register}</a></li>
                {/if}
                {if $allowtransfer}
                    <li class="{if $contents[2].action=='transfer'}active{/if}"><a data-toggle="tab" href="#transfer" onclick="setAction(this);">{$lang.transfer}</a></li>
                {/if}
                {if $allowown}
                    <li class="{if $contents[2].action=='own' && !$subdomain}active{/if}"><a data-toggle="tab" href="#own" onclick="setAction(this);">{$lang.alreadyhave}</a></li>
                {/if}
                {if $subdomain}
                    <li class="{if $contents[2].action=='own' && $subdomain}active{/if}"><a data-toggle="tab" href="#subdomain" onclick="setAction(this);">{$lang.subdomain}</a></li>
                {/if}
            </ul>

            <div class="tab-content">
                <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                <input type="hidden" name="make" value="checkdomain" />

                <!-- Register -->
                <div class="tab-pane" id="register">
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
                            <a href="#" class="btn btn-plan-1" onclick="$('#domoptions22').hide();$('#illregister').show();return false;">{$lang.change}</a>
                        </div>
                    {/if}
                    {if $allowregister}
                        <div id="illregister" {if $contents[2]}style="display: none"{/if} class="t1 slidme">
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
                                <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck(); return false;"/>
                            </p>
                        </div>

                        <div id="register-updater" class="updater2">{include file="ajax.checkdomain.tpl"} </div>
                    {/if}
                </div>

                <!-- Transfer -->
                {if $allowtransfer}
                <div class="tab-pane " id="transfer">
                        <div id="illtransfer"  class="t2 slidme align-center form-horizontal">
                            <input type="radio" style="display: none;" value="illtransfer" name="domain" {if !$allowregister}checked="checked"{/if}/>
                            www.
                            <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled domain-input"/>
                            <select name="tld_transfer" id="tld_transfer" class="span2 domain-tld">
                                {foreach from=$tld_tran item=tldname}
                                    <option>{$tldname}</option>
                                {/foreach}
                            </select>
                            <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck(); return false;"/>
                        </div>
                    <div id="transfer-updater" class="updater2">{include file="ajax.checkdomain.tpl"} </div>
                </div>
                {/if}


                <!-- Own -->
                {if $allowown}
                <div class="tab-pane" id="own">
                        <div id="illupdate"  class="t3 slidme align-center form-horizontal">
                            <input type="radio" style="display: none;" value="illupdate" name="domain" {if !$allowregister && !$allowtransfer}checked="checked"{/if}/>
                            www.
                            <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled domain-input"/>
                            .
                            <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2 domain-tld"/>  <input type="submit" value="{$lang.check}" class="btn domain-check  btn-plan-1" onclick="domainCheck(); return false;"/>
                        </div>
                </div>
                {/if}

                <!-- Subdomain -->
                {if $subdomain}
                <div class="tab-pane" id="subdomain">
                        <div id="illsub"  class="t4 slidme align-center form-horizontal">
                            <input type="radio" style="display: none;" value="illsub" name="domain"  {if !($allowregister || $allowtransfer || $allowown)}checked="checked"{/if}/>
                            www.
                            <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled domain-input"/>
                            {$subdomain}
                            <div style="margin-top: 10px">
                                <input type="submit" value="{$lang.check}" class="btn domain-check btn-plan-1" onclick="domainCheck(); return false;"/>
                            </div>
                        </div>
                </div>
                {/if}

            </div>
        </div>

    {/if}
    </form>

    <form id="cartforms" action="" method="post">
        <input type="hidden" name="subproducts[0]" value="0" />
        <input type="hidden" name="addon[0]" value="0" />

    <!-- Billing Cycle -->

    {if ($product.paytype!='Free' && $product.paytype!='Once')
    || ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain) }
        <div class="billing-cycle">
            <h4><i class="icon-billing-cycle"></i> {$lang.pickcycle}</h4>
            {if ($product.paytype!='Free' && $product.paytype!='Once')}
                {include file="common/price.tpl" allprices='cycle'}
            {/if}
        </div>
    {/if}
    <!-- End of Billing Cycle -->


    {if $addons}
        {foreach from=$addons item=a key=k}
            <div class="config">
                <p><input name="addon[{$k}]" onchange="if (typeof(simulateCart)=='function')simulateCart();"  type="checkbox" value="1" {if $contents[3].$k}checked="checked"{/if}/> <span> {$a.name}</span></p>

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
            </div>
        {/foreach}
    {/if}





    {* Subproduct *}

    {if $subproducts}
        {foreach from=$subproducts item=a key=k}
            <div class="config">
                <p><input name="subproducts[{$k}]" onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"  type="checkbox" value="1" {if $contents[4].$k}checked="checked"{/if}/> <span>{$a.category_name} - {$a.name}</span></p>
                {price product=$a}
                {if $a.paytype=='Free'}
                    <span class="product-cycle cycle-free">{$lang.free}</span>
                    <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                {elseif $a.paytype=='Once'}
                    <span class="product-price cycle-once">@@price</span>
                    <span class="product-cycle cycle-once">{$lang.once}</span>
                    {if $a.m_setup!=0}<span class="product-setup cycle-once">@@setupline<<' + '@</span>
                    {/if}
                    <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                {else}
                    <select name="subproducts_cycles[{$k}]" >
                        <option value="@@cycle" @@selected>@@line</option>
                    </select>
                {/if}
                {/price}
                <span class="prod-desc">{$a.description}</span>
            </div>
        {/foreach}
    {/if}



    {* Custom Forms *}

    {if $custom}
        {foreach from=$custom item=cf}
        <div class="config">
            {if $cf.items}
                <p>{$cf.name} {if $cf.options &1}*{/if}</p>
                <div class="option-val cf-{$cf.type}">
                    {if $cf.type == 'radio'}
                        {include file='onestep_square_boxes/radio.tpl'}
                    {elseif $cf.type == 'checkbox'}
                        {include file='onestep_square_boxes/checkbox.tpl'}
                    {else}
                        {include file=$cf.configtemplates.cart}
                    {/if}
                    <span class="prod-desc"><p>{$cf.description}</p></span>
                </div>

            {/if}
        </div>
        {/foreach}
    {/if}


</div>

<!-- End of Product Configuration -->

<!-- Order Summary -->
<div class="orderpage-summary pull-left">
    <h4><i class="icon-order-summary"></i> {$lang.ordersummary}</h4>

    <div class="summary-table" id="orderSummary">
        <div class="header">
            <h5>{$lang.ordersummary}</h5>
        </div>
        <table class="table">
            <tr class="opacity-4">
                <th>Description</th>
                <th>Price</th>
            </tr>
            {counter name=alter print=false start=1 assign=alter}
            {if $product}
                <tr>
                    <td class="opacity-4"><strong>{$contents[0].name} {if $contents[0].domain}({$contents[0].domain}){/if}</strong></td>
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
                            <td class="opacity-4">
                                {if $cstom.type == 'slider' || $cstom.type == 'qty'}
                                    <strong>{$cstom.fullname}</strong> {if $cstom.qty>1} <span class="green-val"> {$cstom.qty}</span>{/if}
                                {elseif $cstom.type == 'select' || $cstom.type == 'radio' || $cstom.type == 'checkbox'}
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
                        <td class="opacity-4">{$lang.addon} <strong>{$addon.name}</strong></td>
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
                        <td class="opacity-4">{$subprod.category_name} <strong>{$subprod.name}</strong></td>
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
                        <td class="opacity-4">

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
                        <td class="opacity-4">{$lang.discount}</td>
                        <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                    </tr>
                {/if}
                {if $tax.tax1 && $tax.taxed1!=0}
                    <tr>
                        <td class="opacity-4">{$tax.tax1name} @ {$tax.tax1}%  </td>
                        <td class="price-col">{$tax.taxed1|price:$currency}</td>
                    </tr>
                {/if}
                {if $tax.tax2  && $tax.taxed2!=0}
                    <tr>
                        <td class="opacity-4">{$tax.tax2name} @ {$tax.tax2}%  </td>
                        <td class="price-col">{$tax.taxed2|price:$currency}</td>
                    </tr>
                {/if}
                {if $tax.credit!=0}
                    <tr>
                        <td class="opacity-4"><strong>{$lang.credit}</strong> </td>
                        <td class="price-col">{$tax.credit|price:$currency}</td>
                    </tr>
                {/if}
            {elseif $credit}
                {if  $credit.credit!=0}
                    <tr>
                        <td class="opacity-4"><strong>{$lang.credit}</strong> </td>
                        <td class="price-col">{$credit.credit|price:$currency}</td>
                    </tr>
                {/if}
                {if $subtotal.coupon}
                    <tr>
                        <td class="opacity-4">{$lang.discount}</td>
                        <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                    </tr>
                {/if}
            {else}
                {if $subtotal.coupon}
                    <tr>
                        <td class="opacity-4">{$lang.discount}</td>
                        <td class="price-col">- {$subtotal.discount|price:$currency}</td>
                    </tr>
                {/if}
            {/if}
            {if !empty($tax.recurring) || !empty($subtotal.recurring)}
                <tr>
                    <td class="opacity-4">{$lang.total_recurring}</td>
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
            <tr>
                <td>{$lang.total_today}:</td>
                <td class="price-col">                            {if $tax}
                        {$tax.total|price:$currency}
                    {elseif $credit}
                        {$credit.total|price:$currency}
                    {else}
                        {$subtotal.total|price:$currency}
                    {/if}</td>
            </tr>
        </table>
        {if !$subtotal.coupon}
        <div class="promotional-code">
            <a href="#">{$lang.usecoupon}</a>
            <i class="icon-ok icon-white"></i>
            <input type="text" name="promocode" onchange="applyCoupon(); return false;">
        </div>
        {else}
            <div class="promo-input">
                <a href="#"onclick="removeCoupon(); return false" title="{$lang.remove_coupon}">{$lang.remove_coupon}: {$subtotal.coupon}</a>
            </div>
        {/if}
    </div>

    </form>

    <!-- Payment Method -->
    {if $gateways}
    <div class="payment-method">
        <h4><i class="icon-payment-method"></i> {$lang.choose_payment}</h4>
        <div class="cf-radio">
            {foreach from=$gateways item=module key=mid name=payloop}
                <input onclick="setPayment($(this).val());" type="radio" name="gateway2" value="{$mid}" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> <span>{$module}</span>
            {/foreach}
        </div>
        {if $gateways}
            <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                {$gatewayhtml}
            </div>
        {/if}
    </div>
    {/if}
    <!-- End of Payment Method -->
    <script type="text/javascript">
        bindSimulateCart();
        customSelect();
        customRadio();
        customCheckbox();
        tabpane();
    </script>
</div>
<!-- End of Order Summary -->
</div>