<!-- Customize Plan -->
<div class="customize-plan">
    <h4>
        <div class="section-icon-bg">
            <div class="todo-icon fui-gear"></div>
        </div>
        {$lang.productconfig}
    </h4>

    <div class="padding">
        <form id="cartform" action="" method="post">
            {if ($product.paytype!='Free' && $product.paytype!='Once')
            || ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain) }

            <h6>{$lang.serverdetails}</h6>
            {if ($product.paytype!='Free' && $product.paytype!='Once')}

                <p>{$lang.pickcycle}</p>
                <div class="billing-cycle span3">
                    {include file="common/price.tpl" allprices='cycle'}
                </div>

            {/if}
            {if ($product.hostname) && !($cart_contents[0].domainoptions.register=='1' ||  $allowown || $subdomain)}
                <p>{$lang.hostname}:</p>

                <div class="hostname-input">
                    <input name="domain" value="{$item.domain}" class="styled" size="50" onchange="if (typeof simulateCart == 'function')
                                    simulateCart();"/>
                </div>
            {/if}
            {/if}
                {if $custom || $addons || $subproducts}
                    <h6 class="margin">{$lang.serverconfiguration}</h6>
                    {include file='common/onestep_forms.tpl'}
                    {if $addons}
                        <p class="config-subtitle">{$lang.addons_single}:</p>
                    {/if}
                    {include file='common/onestep_addons.tpl'}
                    {if $subproducts}
                        <p class="config-subtitle">{$lang.subproduct}:</p>
                    {/if}
                    {include file='common/onestep_subproducts.tpl'}
                {/if}
            </form>
            {if ($cart_contents[0].domainoptions.register)=='1' && ($allowregister || $allowtransfer || $allowown || $subdomain)}
                <div class="clear"></div>
                <h6>{$lang.mydomains}</h6>
                <div class="btn-group domain-tab">
                    {if $allowregister}
                        <button rel="t1" class="btn {if $contents[2].action=='register' || !$contents[2]}active{/if}" onclick="tabbme(this);">{$lang.register}</button>
                    {/if}
                    {if $allowtransfer}
                        <button rel="t2" class="btn {if $contents[2].action=='transfer'}active{/if}" onclick="tabbme(this);">{$lang.transfer}</button>
                    {/if}
                    {if $allowown}
                        <button rel="t3" class="btn {if $contents[2].action=='own' && !$subdomain}active{/if}" onclick="tabbme(this);">{$lang.alreadyhave}</button>
                    {/if}
                    {if $subdomain}
                        <button rel="t4" class="btn {if $contents[2].action=='own' && $subdomain}active{/if}" onclick="tabbme(this);">{$lang.subdomain}</button>
                    {/if}
                </div>
                <div class="clear" style="text-align: left">
                    {include file='common/onestep_domains.tpl' bulktld_col=2}
                </div>
            {/if}

        </div>


    </div>
    <!-- End of Customize Plan -->



    <!-- What's inclued -->
    <div class="plan-included">
        <div class="padding">
            <h4>What's included</h4>
            <ul>
                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Free SiteBuilder
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Hosting Automation
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        DNS Management
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Order Pages
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>
            </ul>
        </div>
    </div>
    <!-- End of What's inclued -->


    <!-- Order Summary -->
    <div class="summary" id="orderSummary">
        <h4>
            <div class="section-icon-bg">
                <div class="todo-icon fui-list"></div>
            </div>
            {$lang.ordersummary}
        </h4>

        <div class="table-bg">
            <div class="padding">
                <table class="table">
                    <tr>
                        <th>{$lang.Description}</th>
                        <th width="90">{$lang.price}</th>
                    </tr>
                    {if $product}
                        <tr>
                            <td>
                                {$contents[0].name}
                                {if $contents[0].domain}({$contents[0].domain})
                                {/if}
                            </td>
                            <td>
                                {if $contents[0].price==0}
                                    {$lang.Free}
                                {elseif $contents[0].prorata_amount}
                                    {$contents[0].prorata_amount|price:$currency}
                                    ({$lang.prorata} {$contents[0].prorata_date|dateformat:$date_format})
                                {else}
                                    {$contents[0].price|price:$currency}
                                {/if}

                                {if $contents[0].setup!=0} + {$contents[0].setup|price:$currency} {$lang.setupfee}
                                {/if}
                            </td>
                        </tr>
                    {/if}

                    {if $cart_contents[1]}
                        {foreach from=$cart_contents[1] item=cstom2}
                            {foreach from=$cstom2 item=cstom}
                                {if $cstom.total>0}
                                    <tr>
                                        <td>
                                            {$cstom.fullname}  {if $cstom.qty>=1}x {$cstom.qty}{/if}
                                        </td>

                                        <td>
                                            {if $cstom.price==0}{$lang.Free}
                                            {elseif $cstom.prorata_amount}{$cstom.prorata_amount|price:$currency}
                                            {else}{$cstom.price|price:$currency}
                                            {/if}
                                            {if $cstom.setup!=0} + {$cstom.setup|price:$currency} {$lang.setupfee}
                                            {/if}
                                        </td>
                                    </tr>
                                {/if}
                            {/foreach}
                        {/foreach}
                    {/if}

                    {if $contents[3]}
                        {foreach from=$contents[3] item=addon}
                            <tr>
                                <td>
                                    {$lang.addon} <strong>{$addon.name}</strong>
                                </td>
                                <td>
                                    {if $addon.price==0}<strong>{$lang.Free}</strong>
                                    {elseif $addon.prorata_amount}<strong>{$addon.prorata_amount|price:$currency}</strong> ({$lang.prorata} {$addon.prorata_date|dateformat:$date_format})
                                    {else}<strong>{$addon.price|price:$currency}</strong>
                                    {/if}
                                    {if $addon.setup!=0} + {$addon.setup|price:$currency} {$lang.setupfee}
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    {/if}

                    {if $contents[2] && $contents[2][0].action!='own'}
                        {foreach from=$contents[2] item=domenka key=kk}
                            <tr>
                                <td>
                                    {if $domenka.action=='register'}{$lang.domainregister}
                                    {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                    {/if}</strong> - {$domenka.name} - {$domenka.period} {$lang.years}
                                </td>
                                <td>
                                    {$domenka.price|price:$currency}
                                </td>
                            </tr>
                        {/foreach}
                    {/if}

                    {if $contents[4]}
                        {foreach from=$contents[4] item=subprod}
                            <tr>
                                <td>
                                    {$subprod.category_name} - <strong>{$subprod.name}</strong>
                                </td>
                                <td>
                                    {if $subprod.price==0}<strong>{$lang.Free}</strong>
                                    {elseif $subprod.prorata_amount}
                                        <strong> {$subprod.prorata_amount|price:$currency}</strong>
                                        ({$lang.prorata} {$subprod.prorata_date|dateformat:$date_format})
                                    {else}<strong>{$subprod.price|price:$currency}</strong>
                                    {/if}
                                    {if $subprod.setup!=0} + {$subprod.setup|price:$currency} {$lang.setupfee}
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    {/if}


                    {if !empty($tax.recurring)}
                        <tr>
                            <td>
                                {$lang.total_recurring}
                            </td>
                            <td>
                                {foreach from=$tax.recurring item=rec key=k}
                                    {$rec|price:$currency} {$lang.$k}<br/>
                                {/foreach}
                            </td>
                        </tr>
                    {elseif !empty($subtotal.recurring)}
                        <tr>
                            <td>
                                {$lang.total_recurring}
                            </td>
                            <td>
                                {foreach from=$subtotal.recurring item=rec key=k}
                                    {$rec|price:$currency} {$lang.$k}<br/>
                                {/foreach}
                            </td>
                        </tr>
                    {/if}

                    {if $tax}
                        {if $subtotal.coupon}
                            <tr>
                                <td>
                                    {$lang.discount}
                                </td>
                                <td>
                                    - {$subtotal.discount|price:$currency}
                                </td>
                            </tr>
                        {/if}
                        {if $tax.tax1 && $tax.taxed1!=0}
                            <tr>
                                <td>
                                    {$tax.tax1name} @ {$tax.tax1}%
                                </td>
                                <td>
                                    {$tax.taxed1|price:$currency}
                                </td>
                            </tr>
                        {/if}
                        {if $tax.tax2  && $tax.taxed2!=0}
                            <tr>
                                <td>
                                    {$tax.tax2name} @ {$tax.tax2}%
                                </td>
                                <td>
                                    {$tax.taxed2|price:$currency}
                                </td>
                            </tr>
                        {/if}
                        {if $tax.credit!=0}
                            <tr>
                                <td>
                                    {$lang.credit}
                                </td>
                                <td>
                                    {$tax.credit|price:$currency}
                                </td>
                            </tr>
                        {/if}
                    {elseif $credit}
                        {if  $credit.credit!=0}
                            <tr>
                                <td>
                                    {$lang.credit}
                                </td>
                                <td>
                                    {$credit.credit|price:$currency}
                                </td>
                            </tr>

                        {/if}

                        {if $subtotal.coupon}
                            <tr>
                                <td>
                                    {$lang.discount}
                                </td>
                                <td>
                                    - {$subtotal.discount|price:$currency}
                                </td>
                            </tr>

                        {/if}
                    {else}
                        {if $subtotal.coupon}
                            <tr>
                                <td>
                                    {$lang.discount}
                                </td>
                                <td>
                                    - {$subtotal.discount|price:$currency}
                                </td>
                            </tr>
                        {/if}
                    {/if}

                </table>
            </div>

            <div class="separator-line"></div>
            <div class="padding promo-code clearfix">
                {if !$subtotal.coupon}
                    <a class="pull-right" style="margin: 0px 5px 15px;" href="#" onclick="$(this).hide().next().show();
                        return false" title="Add coupon"> <i class="fui-plus"></i> Add coupon </a>
                    <div class="padding hostname-input" style="display: none">
                        <input class="span4" type="text" name="promocode" onchange="applyCoupon()" placeholder="{$lang.usecoupon}" style="width:190px">
                    </div>
                {else}
                    <div class="promo-input">
                        <a class="pull-right" style="margin: 0px 5px 15px;" href="#"onclick="removeCoupon();
                            return false" title="{$lang.remove_coupon}">{$lang.remove_coupon}: {$subtotal.coupon}</a>
                    </div>
                {/if}
            </div>
            <div class="padding">
                <p>{$lang.total_today}</p>
                <h1>
                    {if $tax}
                        {$tax.total|price:$currency}
                    {elseif $credit}
                        {$credit.total|price:$currency}
                    {else}
                        {$subtotal.total|price:$currency}
                    {/if}</h1>
            </div>
        </div>
    </div>
    <!-- End of Order Summary -->

    <script type="text/javascript">bindSimulateCart();</script>
