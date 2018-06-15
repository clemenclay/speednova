


<div class="sliders clearfix">
    <div class="slider-shadow"></div>
    <div class="left-sliders">
        <input type="hidden" id="product_id" value="{$product.id}" />
        <input type="hidden" id="product_cycle" value="{$product.cycle}" />
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 0}
                    {include file="onestep_circular_slider/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}

        <!-- 2 -->
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 1}
                    {include file="onestep_circular_slider/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}


        <!-- 3 -->
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 2}
                    {include file="onestep_circular_slider/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}


    </div>





    {if $product.paytype!='Free' && $product.paytype!='Once'}
    <div class="billing-cycle">
        {include file='common/cycle.tpl' allprices='cycle' product=$product wrap="select" }
        <p>{$lang.changebillingcycle}:</p>
        <ul class="billing-cycle-box nav nav-pills">
            <div class="active-bg"></div>
        </ul>
    </div>
        <script type="text/javascript"> reloadProductCycle();  </script>
    {/if}

    <div class="plan-includes" id="planIncludes">
        <div class="plan-box-top clearfix">
            <div class="top-left-corner"></div>
            <div class="top-right-corner"></div>
            <div class="top-body"></div>
        </div>
        <div class="plan-box">
            <div class="shadow-inside">
                <div class="padding">
                    <h3>Your plan includes</h3>
                    <table class="table">
                        {counter name=alter print=false start=1 assign=alter}
                        {if $product}
                            <tr>
                                <td class="left-cell">{$contents[0].name} {if $contents[0].domain}({$contents[0].domain}){/if}</td>
                                <td class="right-cell">
                                        {if $contents[0].price==0}{$lang.Free}
                                        {elseif $contents[0].prorata_amount}{$contents[0].prorata_amount|price:$currency} ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                                        {else}{$contents[0].price|price:$currency}
                                        {/if}
                                        {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                                        {/if}
                                </td>
                            </tr>
                            <tr class="empty-row">
                                <td></td>
                                <td></td>
                            </tr>
                        {/if}
                        {if $cart_contents[1]}
                            {foreach from=$cart_contents[1] item=cstom2}
                                {foreach from=$cstom2 item=cstom}
                                    <tr>
                                        <td class="left-cell">
                                            {if $cstom.type == 'slider' || $cstom.type == 'qty'}
                                                <strong>{$cstom.fullname}</strong> {if $cstom.qty>=1} <span class="green-val"> {$cstom.qty}</span>{/if}
                                            {elseif $cstom.type == 'select' || $cstom.type == 'radio'}
                                                {$cstom.name}
                                                <strong>{$cstom.sname}</strong>
                                            {else}
                                                <strong>{$cstom.name}</strong>
                                            {/if}
                                        </td>
                                        <td class="right-cell">
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
                                    <tr class="empty-row">
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    {counter name=alter}
                                {/foreach}
                            {/foreach}
                        {/if}
                        {if $contents[3]}
                            {foreach from=$contents[3] item=addon}
                                <tr>
                                    <td class="left-cell">{$lang.addon} <strong>{$addon.name}</strong></td>
                                    <td class="right-celll">
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
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                                {counter name=alter}
                            {/foreach}
                        {/if}

                        {* SUBPRODUCTS *}
                        {if $contents[4]}
                            {foreach from=$contents[4] item=subprod}
                                <tr>
                                    <td class="left-cell">{$subprod.category_name} <strong>{$subprod.name}</strong></td>
                                    <td class="right-cell">
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
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                                {counter name=alter}
                            {/foreach}
                        {/if}

                        {* DOMAINS *}
                        {if $contents[2] && $contents[2][0].action!='own'}
                            {foreach from=$contents[2] item=domenka key=kk}
                                <tr>
                                    <td class="left-cell">

                                        {if $domenka.action=='register'}{$lang.domainregister}
                                        {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                        {/if}

                                        <strong>
                                            {$domenka.name}
                                        </strong>
                                    </td>
                                    <td class="right-cell">
                                        {$domenka.price|price:$currency} {$domenka.period}&nbsp;{$lang.years}
                                        {if $domenka.dns}&raquo; {$lang.dnsmanage} (+ {$domenka.dns|price:$currency})<br/>
                                        {/if}
                                        {if $domenka.idp}&raquo; {$lang.idprotect}(+ {$domenka.idp|price:$currency})<br/>
                                        {/if}
                                        {if $domenka.email}&raquo; {$lang.emailfwd} (+ {$domenka.email|price:$currency})<br/>
                                        {/if}
                                    </td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                                {counter name=alter}
                            {/foreach}
                        {/if}
                        {if $tax}
                            {if $subtotal.coupon}
                                <tr>
                                    <td class="left-cell">{$lang.discount}</td>
                                    <td class="right-cell">- {$subtotal.discount|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                            {if $tax.tax1 && $tax.taxed1!=0}
                                <tr>
                                    <td class="left-cell">{$tax.tax1name} @ {$tax.tax1}%  </td>
                                    <td class="right-cell">{$tax.taxed1|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                            {if $tax.tax2  && $tax.taxed2!=0}
                                <tr>
                                    <td class="left-cell">{$tax.tax2name} @ {$tax.tax2}%  </td>
                                    <td class="right-cell">{$tax.taxed2|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                            {if $tax.credit!=0}
                                <tr>
                                    <td class="left-cell"><strong>{$lang.credit}</strong> </td>
                                    <td class="right-cell">{$tax.credit|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                        {elseif $credit}
                            {if  $credit.credit!=0}
                                <tr>
                                    <td class="left-cell"><strong>{$lang.credit}</strong> </td>
                                    <td class="right-cell">{$credit.credit|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                            {if $subtotal.coupon}
                                <tr>
                                    <td class="left-cell">{$lang.discount}</td>
                                    <td class="right-cell">- {$subtotal.discount|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                        {else}
                            {if $subtotal.coupon}
                                <tr>
                                    <td class="left-cell">{$lang.discount}</td>
                                    <td class="right-cell">- {$subtotal.discount|price:$currency}</td>
                                </tr>
                                <tr class="empty-row">
                                    <td></td>
                                    <td></td>
                                </tr>
                            {/if}
                        {/if}
                        {if !empty($tax.recurring) || !empty($subtotal.recurring)}
                            <tr>
                                <td class="left-cell">{$lang.total_recurring}</td>
                                <td class="right-cell">
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
                            <tr class="empty-row">
                                <td></td>
                                <td></td>
                            </tr>
                        {/if}

                        </table>



                    {if !$subtotal.coupon}
                        <form action="" method="POST" id="promoform">
                                <input type="text" name="promocode" onchange="applyCoupon();" type="text" placeholder="{$lang.usecoupon}" />
                        </form>
                    {else}
                        <div class="promo-input">
                            <a href="#"onclick="removeCoupon(); return false" title="{$lang.remove_coupon}">{$lang.remove_coupon}: {$subtotal.coupon}</a>
                        </div>
                    {/if}

                    <p class="total-price-text">{$lang.total_today}</p>
                    <p class="total-price">{if $tax}
                            {$tax.total|price:$currency}
                        {elseif $credit}
                            {$credit.total|price:$currency}
                        {else}
                            {$subtotal.total|price:$currency}
                        {/if}</p>
                </div>
            </div>
        </div>
        <div class="plan-includes-shadow"></div>
    </div>
</div>


<!-- Steps -->
<div class="orderpage-steps">
    <h4>Fast and easy steps</h4>
    <div class="steps-line"></div>
    <ul class="steps-list">
        <li>
            <div class="cuztomize-server">
                <span></span>
            </div>
            <p>Customize your server</p>
        </li>
        <div class="step-arrow"></div>
        <li>
            <div class="personal-details">
                <span></span>
            </div>
            <p>Enter personal details</p>
        </li>
        <div class="step-arrow"></div>
        <li>
            <div class="launch-server">
                <span></span>
            </div>
            <p>Launch your server</p>
        </li>
    </ul>
</div>

<div class="steps-shadow"></div>

<!-- Configuration -->
<div class="orderpage-forms">
    <div class="additional-details">
        <h4><i class="icon-additional-details"></i> Additional Details</h4>
        <form id="cartforms" action="" method="post">
        <input type="hidden" name="subproducts[0]" value="0" />
        <input type="hidden" name="addon[0]" value="0" />
        <table class="table">

            {* Addons *}
            {if $addons}
            <tr class="product-row">
                <td>Addons:</td>
                <td></td>
            </tr>
            {foreach from=$addons item=a key=k}
                <tr>
                    <td class="left-cell"> <input name="addon[{$k}]" onchange="if (typeof(simulateCart)=='function')simulateCart();"  type="checkbox" value="1" {if $contents[3].$k}checked="checked"{/if}/> <span class="no-wrap"> {$a.name}</span></td>
                    <td>
                        {price product=$a}
                        {if $a.paytype=='Free'}
                            <span class="product-cycle cycle-free">{$lang.free}</span>
                            <input type="hidden" name="addon_cycles[{$k}]" value="free"/>
                        {elseif $a.paytype=='Once'}
                            <span class="product-price cycle-once">@@price</span>
                            <span class="product-cycle cycle-once">{$lang.once}</span>
                            {if $a.m_setup!=0}<span class="product-setup cycle-once">@@setupline<<' + '@</span>
                            {/if}
                            <input type="hidden" name="addon_cycles[{$k}]" value="once"/>
                        {else}
                            <select name="addon_cycles[{$k}]" >
                                <option value="@@cycle" @@selected>@@line</option>
                            </select>
                        {/if}
                        {/price}
                    </td>
                </tr>
            {/foreach}
            {/if}

            {* Subproduct *}
            {if $subproducts}
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr class="product-row">
                    <td>Subproduct:</td>
                    <td></td>
                </tr>
            {foreach from=$subproducts item=a key=k}
                <tr>
                    <td class="left-cell"> <input name="subproducts[{$k}]" onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"  type="checkbox" value="1" {if $contents[4].$k}checked="checked"{/if}/> <span class="no-wrap">{$a.category_name} - {$a.name}</span></td>
                    <td class="option-val" >
                        {price product=$a}
                        {if $a.paytype=='Free'}
                            <span class="product-cycle cycle-free">{$lang.free}</span>
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                        {elseif $a.paytype=='Once'}
                            <span class="product-price cycle-once">@@price</span>
                            <span class="product-cycle cycle-once">{$lang.once}</span>
                            {if $a.m_setup!=0}<span class="product-setup cycle-once">@@setupline<<' + '@</span>{/if}
                            <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                        {else}
                            <select name="subproducts_cycles[{$k}]" >
                                <option value="@@cycle" @@selected>@@line</option>
                            </select>
                        {/if}
                        {/price}
                    </td>
                </tr>
            {/foreach}
            {/if}

            {* Custom Forms *}
            {counter name=slidersnow print=false assign=slidersnow start=0 }
            {if $custom}
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr class="product-row">
                    <td>Others:</td>
                    <td></td>
                </tr>
                {foreach from=$custom item=cf}
                    {if $cf.items}
                        <tr>
                            {if $cf.type == 'slider' && $slidersnow < 3}
                                {counter name=slidersnow}
                            {else}
                                <td class="left-cell">{$cf.name} {if $cf.options &1}*{/if}</td>
                                <td class="cf-{$cf.type}">
                                    {include file=$cf.configtemplates.cart}
                                    {if $cf.description}
                                        <span class="prod-desc">{$cf.description}</span>
                                    {/if}
                                </td>
                            {/if}
                        </tr>
                    {/if}
                {/foreach}
            {/if}


            {* Domains *}
            {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
                <tr>
                    <td class="left-cell">{$lang.hostname}*</td>
                    <td class="option-val" ><input name="domain" value="{$item.domain}" class="styled" size="50" onchange="if(typeof simulateCart == 'function') simulateCart();"/>
                    </td>
                </tr>
                {if $product.extra.enableos=='1' && !empty($product.extra.os)}
                    <tr>
                        <td class="left-cell"">{$lang.ostemplate} *</td>
                        <td class="option-val" >
                            <select name="ostemplate" class="styled"   onchange="simulateCart('#cart3');">
                                {foreach from=$product.extra.os item=os}
                                    <option value="{$os.id}"  {if $item.ostemplate==$os.id}selected="selected"{/if}>{$os.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                {/if}
            {/if}
            {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
                <tr>
                    <td colspan="2" class="domain-options" >
                        <div class="btn-group">
                            {if $allowregister}
                                <button rel="t1" class="btn {if $contents[2].action=='register' || !$contents[2]}active{/if}" onclick="tabbme(this); return false;">{$lang.register}</button>
                            {/if}
                            {if $allowtransfer}
                                <button rel="t2" class="btn {if $contents[2].action=='transfer'}active{/if}" onclick="tabbme(this);  return false;">{$lang.transfer}</button>
                            {/if}
                            {if $allowown}
                                <button rel="t3" class="btn {if $contents[2].action=='own' && !$subdomain}active{/if}" onclick="tabbme(this); return false;">{$lang.alreadyhave}</button>
                            {/if}
                            {if $subdomain}
                                <button rel="t4" class="btn {if $contents[2].action=='own' && $subdomain}active{/if}" onclick="tabbme(this);  return false;">{$lang.subdomain}</button>
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
                                <a href="#" class="btn" onclick="$('#domoptions22').hide();$('#domoptions11').show();return false;">{$lang.change}</a>
                            </div>
                        {/if}
                        <div {if $contents[2]}style="display:none"{/if} id="domoptions11">
                            <input type="hidden" value="{$cart_contents[0].id}" id="product_id" name="product_id" />
                            <input type="hidden" name="make" value="checkdomain" />
                            <div id="options">
                                {if $allowregister}
                                    <div id="illregister" class="t1 slidme">
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
                                            <input type="submit" value="{$lang.check}" class="btn domain-check" onclick="domainCheck(); return false;"/>
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
                                        <input type="submit" value="{$lang.check}" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                    </div>
                                {/if}
                                {if $allowown}
                                    <div id="illupdate" style="{if $allowregister || $allowtransfer}display: none;{/if}"  class="t3 slidme align-center form-horizontal">
                                        <input type="radio" style="display: none;" value="illupdate" name="domain" {if !$allowregister && !$allowtransfer}checked="checked"{/if}/>
                                        www.
                                        <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled domain-input"/>
                                        .
                                        <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2 domain-tld"/>  <input type="submit" value="{$lang.check}" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                    </div>
                                {/if}
                                {if $subdomain}
                                    <div id="illsub" style="{if $allowregister || $allowtransfer || $allowown}display: none;{/if}"  class="t4 slidme align-center form-horizontal">
                                        <input type="radio" style="display: none;" value="illsub" name="domain"  {if !($allowregister || $allowtransfer || $allowown)}checked="checked"{/if}/>
                                        www.
                                        <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled domain-input"/>
                                        {$subdomain} <input type="submit" value="{$lang.check}" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="updater2" colspan="2">{include file="ajax.checkdomain.tpl"} </td>
                </tr>
            {/if}
        </table>
        </form>

        {* PAYMENT METHOD *}

        {* PAYMENT METHOD *}
        <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
        <input type="hidden" name="make" value="order" />
        {if $gateways}
            <div class="gateways page-section">
                <h4>
                    <i class="icon-additional-payment"></i>
                    {$lang.payment}
                </h4>
                <div class="gateways-list clearfix">
                    {foreach from=$gateways item=module key=mid name=payloop}
                        <div class="left"><input type="radio" name="gateway" value="{$mid}"  onclick="return pop_ccform($(this).val())" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </div>
                    {/foreach}
                </div>
                <div class="clear"></div>

                <div id="gatewayform" class="clear"{if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                    {$gatewayhtml}
                </div>
            </div>
        {/if}


    </div>


    <div id="orderSummary" class="order-summary">
        <h4><i class="icon-order-summary"></i> {$lang.ordersummary}</h4>
        <div class="order-summary-table">
            <div class="order-summary-table-header"></div>
            <div class="padding">
                <table class="table">
                    <tr>
                        <th>Description</th>
                        <th class="w30">Price</th>
                    </tr>
                    {counter name=alter print=false start=1 assign=alter}
                    {if $product}
                        <tr>
                            <td><strong>{$contents[0].name} {if $contents[0].domain}({$contents[0].domain}){/if}</strong></td>
                            <td><strong>
                                {if $contents[0].price==0}{$lang.Free}
                                {elseif $contents[0].prorata_amount}{$contents[0].prorata_amount|price:$currency} ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                                {else}{$contents[0].price|price:$currency}
                                {/if}
                                {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                                {/if}
                                    </strong>
                            </td>
                        </tr>
                    {/if}
                    {* FORMS *}
                    {if $cart_contents[1]}
                        {foreach from=$cart_contents[1] item=cstom2}
                            {foreach from=$cstom2 item=cstom}
                                <tr>
                                    <td>
                                        {if $cstom.type == 'slider' || $cstom.type == 'qty'}
                                            <strong>{$cstom.fullname}</strong> {if $cstom.qty>=1} <span class="green-val"> {$cstom.qty}</span>{/if}
                                        {elseif $cstom.type == 'select' || $cstom.type == 'radio'}
                                            {$cstom.name}
                                            <strong>{$cstom.sname}</strong>
                                        {else}
                                            <strong>{$cstom.name}</strong>
                                        {/if}
                                    </td>
                                    <td>
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
                                <td>{$lang.addon} <strong>{$addon.name}</strong></td>
                                <td>
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
                                <td>{$subprod.category_name} <strong>{$subprod.name}</strong></td>
                                <td>
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
                                <td>

                                    {if $domenka.action=='register'}{$lang.domainregister}
                                    {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                    {/if}

                                    <strong>
                                        {$domenka.name}
                                    </strong>
                                </td>
                                <td>
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
                                <td>{$lang.discount}</td>
                                <td>- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax1 && $tax.taxed1!=0}
                            <tr>
                                <td>{$tax.tax1name} @ {$tax.tax1}%  </td>
                                <td>{$tax.taxed1|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.tax2  && $tax.taxed2!=0}
                            <tr>
                                <td>{$tax.tax2name} @ {$tax.tax2}%  </td>
                                <td>{$tax.taxed2|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $tax.credit!=0}
                            <tr>
                                <td><strong>{$lang.credit}</strong> </td>
                                <td>{$tax.credit|price:$currency}</td>
                            </tr>
                        {/if}
                    {elseif $credit}
                        {if  $credit.credit!=0}
                            <tr>
                                <td><strong>{$lang.credit}</strong> </td>
                                <td>{$credit.credit|price:$currency}</td>
                            </tr>
                        {/if}
                        {if $subtotal.coupon}
                            <tr>
                                <td>{$lang.discount}</td>
                                <td>- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {else}
                        {if $subtotal.coupon}
                            <tr>
                                <td>{$lang.discount}</td>
                                <td>- {$subtotal.discount|price:$currency}</td>
                            </tr>
                        {/if}
                    {/if}
                    {if !empty($tax.recurring) || !empty($subtotal.recurring)}
                        <tr>
                            <td>{$lang.total_recurring}</td>
                            <td>
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
                        <td></td>
                        <td>
                            <span>{$lang.total_today}</span>
                            <p id="orderTotal">
                                {if $tax}
                                    {$tax.total|price:$currency}
                                {elseif $credit}
                                    {$credit.total|price:$currency}
                                {else}
                                    {$subtotal.total|price:$currency}
                                {/if}
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>