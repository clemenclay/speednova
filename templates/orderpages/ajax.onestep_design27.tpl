<div class="span7">

    <form id="cartforms" action="" method="post">
        {if $product.paytype!='Free' && $product.paytype!='Once'}

            <div class="configuration-box billing-cycle">
                <div class="configuration-header">
                    <h2>{$lang.changebillingcycle}:</h2>
                </div>
                <div class="configuration-body">
                    {include file="common/price.tpl" allprices='cycle'}
                </div>
            </div>
        {/if}

        {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
            <div class="configuration-box ">
                <div class="configuration-header">
                    <h2>{$lang.hostname}*</h2>
                </div>
                <div class="configuration-body"><input name="domain" value="{$item.domain}" class="styled" size="50"  onchange="simulateCart('#cart3', true);"/></div>

            </div>
            {if $product.extra.enableos=='1' && !empty($product.extra.os)}
                <div class="configuration-box ">
                    <div class="configuration-header">
                        <h2>{$lang.ostemplate}*</h2></div>
                    <div class="configuration-body">
                        <select name="ostemplate" class="styled"   onchange="simulateCart('#cart3');">
                            {foreach from=$product.extra.os item=os}
                                <option value="{$os.id}"  {if $item.ostemplate==$os.id}selected="selected"{/if}>{$os.name}</option>
                            {/foreach}
                        </select>
                    </div>

                </div>
            {/if}
        {/if}

        {if $subproducts}
            <div class="configuration-box">

                <div class="configuration-header">
                    <h2>{$lang.subproduct}</h2>
                </div>
                <div class="configuration-body">
                    {foreach from=$subproducts item=a key=k}
                        <p class="no-opacity checkbox-fix"><input name="subproducts[{$k}]" onchange="if (typeof (simulateCart) == 'function')
                                    simulateCart('#cart0');"  type="checkbox" value="1" {if $contents[4].$k}checked="checked"{/if}/> <span>{$a.category_name} - {$a.name}</span></p>
                            {if $a.paytype=='Free'}
                            <span class="product-cycle cycle-free">{$lang.free}</span>
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                        {elseif $a.paytype=='Once'}
                            <span class="product-price cycle-once">{$a.m|price:$currency}</span>
                            <span class="product-cycle cycle-once">{$lang.once}</span>
                            {if $a.m_setup!=0}<span class="product-setup cycle-once">{$a.m_setup|price:$currency} {$lang.setupfee}</span>
                            {/if}
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                        {else}
                            <select name="subproducts_cycles[{$k}]" >
                                {foreach from=$a item=p_price key=p_cycle}
                                    {if $p_price > 0 && ($p_cycle == 'd' || $p_cycle == 'w' || $p_cycle == 'm' || $p_cycle == 'q' || $p_cycle == 's' || $p_cycle == 'a' || $p_cycle == 'b' || $p_cycle == 't' || $p_cycle == 'p4' || $p_cycle == 'p5') }
                                        <option value="{$p_cycle}" {if (!$contents[4][$k] && $cycle==$p_cycle) || $contents[3][$k].recurring==$p_cycle} selected="selected"{/if}>{$a.$p_cycle|price:$currency} {assign var=p_scycle value="`$p_cycle`_setup"}{$lang.$p_cycle}{if $a.$p_scycle!=0} + {$a.$p_scycle|price:$currency} {$lang.setupfee}{/if}</option>
                                    {/if}
                                {/foreach}
                            </select>
                            <span class="prod-desc">{$a.description}</span>
                        {/if}
                    {/foreach}

                </div>
            </div>
        {/if}
        {if $addons}

            <div class="configuration-box">

                <div class="configuration-header">
                    <h2>{$lang.addons_single}</h2>
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
        {if $custom}
            <div class="configuration-box">

                <div class="configuration-header">
                    <h2>{$lang.other}</h2>
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

    </form>
    {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
        <div class="configuration-box mt-40">
            <div class="configuration-header">
                <h2>{$lang.domains}</h2>
            </div>
            <div class="configuration-body tabme">


                <div class="btn-group">
                    {if $allowregister}
                        <button rel="t1" class="btn {if $contents[2].action=='register' || !$contents[2]}active{/if}" onclick="tabbme(this);
                                return false;">{$lang.register}</button>
                    {/if}
                    {if $allowtransfer}
                        <button rel="t2" class="btn {if $contents[2].action=='transfer'}active{/if}" onclick="tabbme(this);
                                return false;">{$lang.transfer}</button>
                    {/if}
                    {if $allowown}
                        <button rel="t3" class="btn {if $contents[2].action=='own' && !$subdomain}active{/if}" onclick="tabbme(this);
                                return false;">{$lang.alreadyhave}</button>
                    {/if}
                    {if $subdomain}
                        <button rel="t4" class="btn {if $contents[2].action=='own' && $subdomain}active{/if}" onclick="tabbme(this);
                                return false;">{$lang.subdomain}</button>
                    {/if}
                </div>

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
                        <a href="#" class="btn" onclick="$('#domoptions22').hide();
                                $('#domoptions11').show();
                                return false;">{$lang.change}</a>
                    </div>
                {/if}
                <div {if $contents[2]}style="display:none"{/if} id="domoptions11">
                    <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                    <input type="hidden" name="make" value="checkdomain" />
                    <div id="options">
                        {if $allowregister}
                            <div id="illregister" class="t1 slidme row-fluid">
                                <input type="radio" name="domain" value="illregister" style="display: none;" checked="checked"/>
                                <div class="domain-input-bulk domain-input span6" id="multisearch">
                                    <textarea name="sld_register" id="sld_register" style="resize: none; width: 90%; height: 100px;"></textarea>
                                </div>

                                <div class="domain-tld-bulk domain-tld span5">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="" class="fs11">
                                        {foreach from=$tld_reg item=tldname name=ttld}
                                            {if !$smarty.foreach.ttld.first && $smarty.foreach.ttld.index % 3 == 0}</tr>
                                            {/if}
                                            {if !$smarty.foreach.ttld.last && $smarty.foreach.ttld.index % 3 == 0}<tr>
                                                {/if}
                                                <td width="33%"><input type="checkbox" name="tld[]" value="{$tldname}" class="tld_register"/>
                                                    {$tldname}
                                                </td>
                                                {if $smarty.foreach.ttld.last}</tr>
                                                {/if}
                                            {/foreach}
                                        <tr></tr>
                                    </table>
                                </div>
                                <div class="clear"></div>
                                <p class="pull-right domain-check-bulk">
                                    <input type="submit" value="{$lang.check}" class="btn btn-success domain-check" onclick="domainCheck();
                                            return false;"/>
                                </p>
                            </div>
                        {/if}
                        {if $allowtransfer}
                            <div id="illtransfer" style="{if $allowregister}display: none;{/if}"  class="t2 slidme align-center form-horizontal">
                                <input type="radio" style="display: none;" value="illtransfer" name="domain" {if !$allowregister}checked="checked"{/if}/>
                                www.
                                <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled domain-input"/>
                                <select name="tld_transfer" id="tld_transfer" class="span2 domain-tld">
                                    {foreach from=$tld_tran item=tldname}
                                        <option>{$tldname}</option>
                                    {/foreach}
                                </select>
                                <input type="submit" value="{$lang.check}" class="btn btn-success domain-check" onclick="domainCheck();
                                        return false;"/>
                            </div>
                        {/if}
                        {if $allowown}
                            <div id="illupdate" style="{if $allowregister || $allowtransfer}display: none;{/if}"  class="t3 slidme align-center form-horizontal">
                                <input type="radio" style="display: none;" value="illupdate" name="domain" {if !$allowregister && !$allowtransfer}checked="checked"{/if}/>
                                www.
                                <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled domain-input"/>
                                .
                                <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2 domain-tld"/>
                                <input type="submit" value="{$lang.check}" class="btn btn-success domain-check" onclick="domainCheck();
                                        return false;"/>
                            </div>
                        {/if}
                        {if $subdomain}
                            <div id="illsub" style="{if $allowregister || $allowtransfer || $allowown}display: none;{/if}"  class="t4 slidme align-center form-horizontal">
                                <input type="radio" style="display: none;" value="illsub" name="domain"  {if !($allowregister || $allowtransfer || $allowown)}checked="checked"{/if}/>
                                www.
                                <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled domain-input"/>
                                {$subdomain} <input type="submit" value="{$lang.check}" class="btn btn-success domain-check" onclick="domainCheck();
                                        return false;"/>
                            </div>
                        {/if}
                        <div id="updater2">{include file="ajax.checkdomain.tpl"} </div>
                    </div>
                </div>

            </div>
        </div>
    {/if}
</div>

<div class="span5">
    <div class="order-summary configuration-box" id="summarybox">
        <div class="configuration-header">
            <h2>{$lang.ordersummary}</h2>
        </div>
        <div class="configuration-body">
            <div class="summary-table">
                <table>
                    <tr class="header-row">
                        <th class="description-cell">{$lang.Description}</th>
                        <th>{$lang.price}</th>
                    </tr>
                    {counter name=alter print=false start=1 assign=alter}
                    {if $product}
                        <tr class="th-margin">
                            <td class="description-col">{$contents[0].category_name} - {$contents[0].name} {if $contents[0].domain}({$contents[0].domain}){/if}</td>
                            <td >
                                <span class="bold">
                                    {if $contents[0].price==0}{$lang.Free}
                                    {elseif $contents[0].prorata_amount}{$contents[0].prorata_amount|price:$currency} ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                                    {else}{$contents[0].price|price:$currency}
                                    {/if}
                                </span>
                                {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                                {/if}
                                {if $contents[0].recurring && $contents[0].price > 0}{assign value=$contents[0].recurring var=recurring}{$lang[$recurring]}
                                {elseif $contents[0].price > 0}{$lang.once}
                                {/if}
                            </td>
                        </tr>
                    {/if}
                    {* FORMS *}
                    {if $cart_contents[1]}
                        {foreach from=$cart_contents[1] item=cstom2 key=ckey}
                            {foreach from=$cstom2 item=cstom}
                                {if $cstom.price!=0 || $custom[$ckey].config.dontchargedefault}
                                    <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}>
                                        <td class="description-col">
                                            {if $cstom.type == 'slider' || $cstom.type == 'qty'}
                                                {$cstom.fullname} {if $cstom.qty>1} <span class="green-val"> {$cstom.qty}</span>
                                                {/if}
                                            {elseif $cstom.type == 'select' || $cstom.type == 'radio'}
                                                {$cstom.name}
                                                {$cstom.sname}
                                            {else}
                                                {$cstom.name}
                                            {/if}
                                        </td>
                                        <td>
                                            <span class="bold">
                                                {if $cstom.price==0}{$lang.Free}
                                                {elseif $cstom.prorata_amount}{$cstom.prorata_amount|price:$currency}
                                                {else}{$cstom.price|price:$currency}
                                                {/if}
                                            </span>
                                            {if $cstom.recurring == 'once' && $cstom.price > 0}{$lang.once}
                                            {/if}

                                            {if $cstom.setup!=0} + {$cstom.setup|price:$currency} {$lang.setupfee}
                                            {/if}
                                        </td>
                                    </tr>
                                {/if}
                                {counter name=alter}
                            {/foreach}
                        {/foreach}
                    {/if}
                    {* ADDONS *}
                    {if $contents[3]}
                        {foreach from=$contents[3] item=addon}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}>
                                <td class="description-col">{$lang.addon} {$addon.name}</td>
                                <td >
                                    <span class="bold">
                                        {if $addon.price==0}{$lang.Free}
                                        {elseif $addon.prorata_amount}{$addon.prorata_amount|price:$currency} ({$lang.prorata} {$addon.prorata_date|dateformat:$date_format})
                                        {else}{$addon.price|price:$currency}
                                        {/if}
                                    </span>
                                    {if $addon.setup!=0} + {$addon.setup|price:$currency} {$lang.setupfee}
                                    {/if}

                                    {if $addon.recurring}{assign value=$addon.recurring var=recurring}{$lang[$recurring]}
                                    {elseif $addon.price > 0}{$lang.once}
                                    {/if}
                                </td>
                            </tr>
                            {counter name=alter}
                        {/foreach}
                    {/if}

                    {* SUBPRODUCTS *}
                    {if $contents[4]}
                        {foreach from=$contents[4] item=subprod}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}>
                                <td class="description-col">{$subprod.category_name} {$subprod.name}</td>
                                <td >
                                    <span class="bold">
                                        {if $subprod.price==0}{$lang.Free}
                                        {elseif $subprod.prorata_amount}{$subprod.prorata_amount|price:$currency} ({$lang.prorata} {$subprod.prorata_date|dateformat:$date_format})
                                        {else}{$subprod.price|price:$currency}
                                        {/if}
                                    </span>
                                    {if $subprod.setup!=0} + {$subprod.setup|price:$currency} {$lang.setupfee}
                                    {/if}

                                    {if $subprod.recurring}{assign value=$subprod.recurring var=recurring}{$lang[$recurring]}
                                    {elseif $subprod.price > 0}{$lang.once}
                                    {/if}
                                </td>
                            </tr>
                            {counter name=alter}
                        {/foreach}
                    {/if}
                    {* DOMAINS *}
                    {if $contents[2] && $contents[2][0].action!='own'}
                        {foreach from=$contents[2] item=domenka key=kk}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}>
                                <td class="description-col">

                                    {if $domenka.action=='register'}{$lang.domainregister}
                                    {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                    {/if}


                                    {$domenka.name}

                                </td>
                                <td >
                                    <span class="bold">
                                        {$domenka.price|price:$currency}
                                    </span> {$domenka.period}&nbsp;{$lang.years}
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
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$lang.discount}</td>
                                <td >- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax1 && $tax.taxed1!=0}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$tax.tax1name} @ {$tax.tax1}%  </td>
                                <td >{$tax.taxed1|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax2  && $tax.taxed2!=0}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$tax.tax2name} @ {$tax.tax2}%  </td>
                                <td >{$tax.taxed2|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.credit!=0}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$lang.credit} </td>
                                <td >{$tax.credit|price:$currency}</td>
                            </tr>
                        {/if}
                    {elseif $credit}
                        {if  $credit.credit!=0}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$lang.credit} </td>
                                <td >{$credit.credit|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $subtotal.coupon}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$lang.discount}</td>
                                <td >- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {else}
                        {if $subtotal.coupon}
                            <tr {if $alter%2==0}class="th-margin"{else}class="dark-row"{/if}{counter name=alter}>
                                <td class="description-col">{$lang.discount}</td>
                                <td >- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {/if}
                    {if !empty($tax.recurring) || !empty($subtotal.recurring)}
                        <tr class="total-row">
                            <td class="total-text">{$lang.total_recurring}</td>
                            <td>
                                {if !empty($tax.recurring)}
                                    {foreach from=$tax.recurring item=rec key=k}
                                        <span class="bold">{$rec|price:$currency}</span> {$lang.$k}
                                    {/foreach}
                                {elseif !empty($subtotal.recurring)}
                                    {foreach from=$subtotal.recurring item=rec key=k}
                                        <span class="bold">{$rec|price:$currency}</span> {$lang.$k}
                                    {/foreach}
                                {/if}
                            </td>

                        </tr>
                    {/if}
                </table>

                <div class="total-value">
                    <span>{$lang.total_today}</span>
                    <p>
                        {if $tax}
                            {$tax.total|price:$currency:true:false:true}
                        {elseif $credit}
                            {$credit.total|price:$currency:true:false:true}
                        {else}
                            {$subtotal.total|price:$currency:true:false:true}
                        {/if}
                    </p>
                </div>
            </div>

            <div class="promotional-code-box form-horizontal">
                {if !$subtotal.coupon}
                    <p>{$lang.usecoupon}</p>
                    <div class="promocode-field input-append">
                        <a href="#" class="btn add-on" onclick="applyCoupon();
                                return false">{$lang.check}</a>
                        <div class="promocode-field-wrap">
                            <input id="couponcde" type="text">
                        </div>
                        
                    </div>
                {else}
                    <a href="#" class="btn" onclick="removeCoupon();
                            return false" title="{$lang.remove_coupon}">{$lang.remove_coupon}: {$subtotal.coupon}</a>
                {/if}
            </div>
        </div>
    </div>
</div>
