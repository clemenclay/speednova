<!-- Orderpage -->
<div id="orderpage" class="orderpage">


{include file='cart_chart_table/header.tpl'}


    <div class="row">
        <div class="span12 summary-last-step">
            <h3>{$lang.cartsum1}</h3>

            <div class="order-details no-line" id="orderSummary2">
                <div class="table-bg">
                    <div class="padding">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>{$lang.Description}</th>
                                <th>{$lang.setupfee}</th>
                                <th>{$lang.price}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {if $cart_contents[0]}
                                <tr>
                                    <td><strong>{$cart_contents[0].category_name} - {$cart_contents[0].name}</strong>
                                        {assign var=tit value=$cart_contents[0].recurring}
                                        {if $cart_contents[0].price!=0}
                                            <br />{$lang[$tit]}
                                        {/if}
                                        <p><a style="color: rgb(0, 153, 0);" href="{$ca_url}cart&amp;step=3"  class="fs11">[{$lang.edit_config}]</a> {if !$contents[2] && $contents[0].domainoptions}<a style="color: rgb(0, 153, 0);" href="{$ca_url}cart&amp;step=1"  class="fs11">[{$lang.add_domain}]</a>{/if}</p>
                                    </td>
                                    <td>
                                        {if $cart_contents[0].setup!=0}
                                            {$cart_contents[0].setup|price:$currency}
                                        {else}
                                            -
                                        {/if}
                                    </td>
                                    <td>{if $cart_contents[0].price!=0}
                                            <br/>
                                            {$cart_contents[0].price|price:$currency:true:false:false}
                                        {else}
                                            {$lang.Free}
                                        {/if}
                                    </td>
                                </tr>
                            {/if}

                            {if $cart_contents[1]}
                                {foreach from=$cart_contents[1] item=cstom2}
                                    {foreach from=$cstom2 item=cstom}
                                        {if $cstom.total>0}
                                            <tr>
                                                <td>{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</td>
                                                <td>-</td>
                                                <td>{$cstom.total|price:$currency:true:false:false}</td>
                                            </tr>
                                        {/if}
                                    {/foreach}
                                {/foreach}
                            {/if}

                            {foreach from=$cart_contents[4] item=subprod}
                                <tr>
                                    <td>{$subprod.category_name} - {$subprod.name}
                                        {assign var=tit value=$subprod.recurring}
                                        {if $subprod.price!=0}<br />{$lang[$tit]}
                                        {/if}
                                    </td>
                                    <td>
                                        {if $subprod.setup!=0}
                                            {$subprod.setup|price:$currency}
                                        {else}
                                            -
                                        {/if}
                                    </td>
                                    <td>{if $subprod.price!=0}
                                            <br/>
                                            {$subprod.price|price:$currency:true:false:false}
                                        {else}
                                            {$lang.Free}
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}


                            {foreach from=$cart_contents[3] item=addon}
                                <tr>
                                    <td>
                                        {$lang.addon} {$addon.name}
                                        {assign var=tit value=$addon.recurring}
                                        {if $addon.price!=0}<br />{$lang[$tit]}
                                        {/if}
                                    </td>
                                    <td>{if $addon.setup!=0}
                                                {$addon.setup|price:$currency}
                                            {else}
                                                -
                                            {/if}
                                    </td>
                                    <td>
                                        {if $addon.price!=0}
                                            <br/>
                                            {$addon.price|price:$currency:true:false:false}
                                        {else}
                                            {$lang.Free}
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}



                            {if $cart_contents[2] && $cart_contents[2][0].name!='yep'}
                                {foreach from=$cart_contents[2] item=domenka key=kk}
                                    {if $domenka.action!='own'  && $domenka.action!='hostname'}
                                        <tr>
                                            <td>
                                                {if $domenka.action=='register'}{$lang.domainregister}
                                                {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                                {elseif $domenka.action=='renew'}{$lang.domainrenewal}
                                                {/if}
                                                {$domenka.period} {$lang.years}
                                                <br />{$domenka.name}
                                                {if $domenka.forms}
                                                    {foreach from=$domenka.forms item=cstom2 name=domainfo}
                                                        {foreach from=$cstom2 item=cstom}
                                                            {if $cstom.total>0}
                                                                <br /><small>{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</small>
                                                            {/if}
                                                        {/foreach}
                                                    {/foreach}
                                                {/if}
                                                <p><a style="color: rgb(0, 153, 0);" href="{$ca_url}cart&amp;step=2" class="fs11">[{$lang.config_extras}]</a> <a style="color: rgb(204, 0, 0);"  href="{$ca_url}cart&amp;step=4&amp;removedomain=true&key={$kk}"  class="fs11">[{$lang.remove}]</a</p>
                                            </td>

                                            <td>-</td>
                                            <td>
                                                {$domenka.price|price:$currency:true:false:false}
                                                {if $domenka.forms}
                                                    {foreach from=$domenka.forms item=cstom2 name=domainfo}
                                                        {foreach from=$cstom2 item=cstom}
                                                            {if $cstom.total>0}
                                                                <br />{$cstom.total|price:$currency:true:false:false}
                                                            {/if}
                                                        {/foreach}
                                                    {/foreach}
                                                {/if}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/if}

                            {if $step > 3}
                                {if $tax}
                                    <tr class="border-top">
                                        <td></td>
                                        <td>{$lang.subtotal}</td>
                                        <td>{$tax.subtotal|price:$currency:true:false:false}</td>
                                    </tr>
                                    {if $tax.tax1 && $tax.taxed1!=0}
                                        <tr class="border-top">
                                            <td></td>
                                            <td>{$tax.tax1name} @ {$tax.tax1}%</td>
                                            <td>{$tax.taxed1|price:$currency:true:false:false}</td>
                                        </tr>
                                    {/if}
                                    {if $tax.tax2  && $tax.taxed2!=0}
                                        <tr class="border-top">
                                            <td></td>
                                            <td>{$tax.tax2name} @ {$tax.tax2}%</td>
                                            <td>{$tax.taxed2|price:$currency:true:false:false}</td>
                                        </tr>
                                    {/if}
                                    {if $tax.credit!=0}
                                        <tr class="border-top">
                                            <td></td>
                                            <td>{$lang.credit}</td>
                                            <td>{$tax.credit|price:$currency:true:false:false}</td>
                                        </tr>
                                    {/if}
                                {elseif $credit}
                                    {if  $credit.credit!=0}
                                        <tr class="border-top">
                                            <td></td>
                                            <td>{$lang.credit}</td>
                                            <td>{$credit.credit|price:$currency:true:false:false}</td>
                                        </tr>
                                    {/if}
                                    <tr class="border-top">
                                        <td></td>
                                        <td>{$lang.subtotal}</td>
                                        <td>{$subtotal.total|price:$currency:true:false:false}</td>
                                    </tr>
                                {else}
                                    <tr class="border-top">
                                        <td></td>
                                        <td>{$lang.subtotal}</td>
                                        <td>{$subtotal.total|price:$currency:true:false:false}</td>
                                    </tr>
                                {/if}

                                {if !empty($tax.recurring)}
                                    <tr class="border-top">
                                        <td></td>
                                        <td>
                                            {$lang.total_recurring}
                                            {foreach from=$tax.recurring item=rec key=k}
                                                <br />{$lang.$k}
                                            {/foreach}
                                        </td>
                                        <td>
                                            {foreach from=$tax.recurring item=rec key=k}
                                                <br/>{$rec|price:$currency:true:false:false}
                                            {/foreach}
                                        </td>
                                    </tr>
                                {elseif !empty($subtotal.recurring)}
                                    <tr class="border-top">
                                        <td></td>
                                        <td>
                                            {$lang.total_recurring}
                                            {foreach from=$subtotal.recurring item=rec key=k}
                                                <br />{$lang.$k}
                                            {/foreach}
                                        </td>
                                        <td>
                                            {foreach from=$subtotal.recurring item=rec key=k}
                                                <br/>{$rec|price:$currency:true:false:false}
                                            {/foreach}
                                        </td>
                                    </tr>
                                {/if}
                            {/if}
                            {if $subtotal.coupon}
                                <tr class="border-top">
                                    <td></td>
                                    <td>{$lang.discount}</td>
                                    <td>- {$subtotal.discount|price:$currency}</td>
                                </tr>
                            {/if}
                            <tr class="border-top">
                                <td></td>
                                <td><strong>{$lang.total_today}</strong></td>
                                <td class="total-due-price">
                                    {if $tax}
                                        {$currency.sign}{$tax.total|price:$currency:false}
                                    {elseif $credit}
                                        {$currency.sign}{$credit.total|price:$currency:false}
                                    {else}
                                        {$currency.sign}{$subtotal.total|price:$currency:false}
                                    {/if}</td>
                            </tr>
                            </tbody>
                        </table>
                        {if $subtotal.coupon}
                            <form id="remove" method="post">
                                <input type="hidden" name="step" value="{$step}" />
                                <input type="hidden" name="removecoupon" value="true" />
                            </form>
                            <a href="#" onclick="{if $step!=4}return removeCoupon();{else}$('#remove').submit();return false{/if}">{$lang.removecoupon}</a>
                        {else}
                            <p>{$lang.usecoupon}</p>
                            <form action="" method="post" id="promoform" onsubmit="{if $step >1 }return applyCoupon();{else}{/if}">
                                <input type="hidden" name="step" value="{$step}" />
                                <input type="hidden" name="addcoupon" value="true" />
                                <input type="text" class="styled span3" name="promocode"/>
                                <input type="submit" value="&raquo;" style="font-weight:bold" class="padded btn"/>
                            </form>

                        {/if}
                    </div>
                </div>
            </div>



            <form action="" method="post" id="subbmitorder">

            <h3>{$lang.choose_payment}</h3>
            <div class="payment-method">
                {if $gateways}
                <ul>
                    {foreach from=$gateways item=module key=mid name=payloop}
                        <li>
                            <input style="vertical-align: text-top" onclick="return pop_ccform($(this).val())" type="radio" name="gateway" value="{$mid}" {if $submit && $submit.gateway==$mid||$mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if} />
                            <span>{$module}</span>
                        </li>
                    {/foreach}
                </ul>
                {/if}
            </div>
            {if $gateways}
                <div id="gatewayform">
                    {$gatewayhtml}
                </div>
                <script type="text/javascript">reform_ccform();</script>
            {/if}


            <h3>{$lang.ContactInfo}</h3>
            {if $logged!="1"}
                <div class="client-toggle pull-right">
                    <select name="form_type" onchange="setFormType()">
                        <option value="0">New Client</option>
                        <option value="1">Registered User</option>
                    </select>
                </div>
            {/if}
            <div class="client-details">
                {if $logged=="1"}
                    {include file="drawclientinfo.tpl"}
                {else}
                    <div id="updater" class="openSansRegular" >
                        {if $submit.cust_method=='login'}
                            {include file="ajax.login.tpl"}
                        {else}
                            {include file="ajax.signup.tpl"}
                        {/if}
                    </div>
                {/if}
            </div>


            <h3>{$lang.cart_add}</h3>
            <div class="additional-information">
                <textarea id="c_notes" placeholder="{$lang.c_tarea}"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
                
                {if $tos}
                <div class="tos">
                    <p><input type="checkbox" value="1" name="tos"/> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                </div>
                {/if}
            </div>

            <input type="hidden" name="make" value="step4" />
            </form>
        </div>
    </div>



    {include file='cart_chart_table/pagination.tpl'}



</div>
<!-- End of Orderpage -->