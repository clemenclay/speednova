{*
@@author:: HostBill team
@@name:: Compare-Five, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. This template wll display up to five products.
@@thumb:: onestep_comparefive/thumb.png
@@img:: onestep_comparefive/preview.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_comparefive/css/orderpage.css">
<script src="{$orderpage_dir}onestep_comparefive/js/common.js"></script>
<script src="{$orderpage_dir}onestep_comparefive/js/script.js"></script>


<!-- Orderpage -->
<div id="orderpage" class="orderpage">

    <div class="row">
        <div class="span12">
            <ul class="services-type nav nav-pills">
                {foreach from=$categories item=i name=categories name=cats}
                    {if $i.id == $current_cat}{*
                        *}<li><strong>{$i.name}</strong></li>
                            {/if}
                        {/foreach}
                        {foreach from=$categories item=i name=categories name=cats}
                            {if $i.id != $current_cat}| {*
                        *}<li><a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>

                    {/if}
                {/foreach}
            </ul>
        </div>
    </div>

    <!-- Plans -->
    <div class="plan-list">
        <table class="product-table" cellpadding="0" cellspacing="0" >
            <thead>
                <tr>
                    {foreach from=$products item=i name=loop}
                        {if $smarty.foreach.loop.index > 4}{break}
                        {/if}
                        <td class="{if $smarty.foreach.loop.index==$opconfig.selected}popular{/if}{if $i.id==$product.id} active{/if}">
                            <div class="highligh"></div>
                            <div class="plan-wrapp" data-text="Most Popular">
                                <h3>{$i.name}</h3>
                                <p class="price-format">{include file="common/price.tpl" product=$i hidecode=true} <span class="price-cycle"><br /> {include file='common/cycle.tpl' product=$i}</span></p>
                                        {*}<div>
                                        {$i.description}
                                        </div>{*}
                            </div>
                        </td>
                    {/foreach}
                </tr>
            </thead>
            <tbody class="feature-list">
                {productspec products=$products features=features additional=additional limit=5}
                {foreach from=$features item=values key=feature }
                    <tr>
                        {foreach from=$values item=value key=id name=loop}
                            <td class="{if $smarty.foreach.loop.index==$opconfig.selected}popular{/if}">
                                <div class="plan-wrapp">
                                    <span class="f-left">{$feature}</span>
                                    <strong class="f-right">
                                        {if $value !== false}{$value}
                                        {else} -
                                        {/if}
                                    </strong>
                                </div>
                            </td>
                        {/foreach}
                    </tr>
                {/foreach}
                {if $additional}
                    <tr>
                        {foreach from=$values item=value key=id name=loop}
                            <td class="{if $smarty.foreach.loop.index==$opconfig.selected}popular{/if}">
                                <div class="plan-wrapp">
                                    {if $additional[$id]}
                                        {$additional[$id]}
                                        <strong class="f-right f-adds"><span class="label label-info">{$lang.Free}</span></strong>
                                        {else}
                                        {/if}
                                </div>
                            </td>
                        {/foreach}
                    </tr>
                {/if}
            </tbody>
            <tfoot>
                <tr>
                    {foreach from=$products item=i name=loop}
                        {if $smarty.foreach.loop.index > 4}{break}
                        {/if}
                        <td class="{if $smarty.foreach.loop.index==$opconfig.selected}popular{/if}">
                            <div class="plan-wrapp">
                                <div class="skew-back"></div>
                                <div class="skew-top"></div>
                                <a href="#" class="btn-select" data-product="{$i.id}">{$lang.order|capitalize}</a>
                            </div>
                        </td>
                    {/foreach}
                </tr>
            </tfoot>
        </table>
    </div>
    <!-- EOF: Plans -->


    <div id="updater" class="row orderpage-config">
        {include file="ajax.onestep_comparefive.tpl" }
    </div>


    <!-- Client details -->
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" class="clear" onsubmit="return mainsubmit(this)">

        <input type="hidden" name="make" value="order" />

        {if $gateways}
            <div class="configuration-box" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                <div class="configuration-header">
                    <h4>{$lang.choose_payment}</h4>
                </div>
                <div class="configuration-body">
                    <div class="payment-methods">
                        <ul class="radio-fields" id="payment-method">
                            {foreach from=$gateways item=module key=mid name=payloop}
                                <li>
                                    <input  type="radio" name="gateway" value="{$mid}" onclick="return pop_ccform($(this).val())" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> 
                                    {$module} 
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
        {/if}
        {if $gateways}
            <div id="gatewayform" class="_orderstage" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                {$gatewayhtml}
            </div>
        {/if}

        <div class="row" style="margin-top: 35px">
            <div class="span12">
                {if $logged!="1"}
                    <div class="client-toggle">
                        <select name="form_type" onchange="setFormType()">
                            <option value="0">{$lang.newclient}</option>
                            <option value="1">{$lang.alreadyclient}</option>
                        </select>
                    </div>
                {/if}


                <div class="configuration-box client-details">
                    <div class="configuration-header">
                        <h4>{$lang.ContactInfo}</h4>
                    </div>
                    <div class="configuration-body">

                        {*CONTACT INFO*}
                        {if $logged=="1"}
                            <div class="client-logged">
                                {include file="drawclientinfo.tpl"}
                            </div>
                        {else}
                            <div id="clientForm" class="clear">
                                {if $submit.cust_method=='login' || $submit.action=='login'}

                                    {include file='ajax.login.tpl'}

                                {else}
                                    {include file='ajax.signup.tpl'}
                                {/if}
                            </div>
                        {/if}

                    </div>
                </div>
            </div>
        </div>

        <!-- End of Client details -->


        <!-- Additional informations -->

        <div class="row">
            <div class="span12">

                <div class="configuration-box">
                    <div class="configuration-header">
                        <h4>{$lang.cart_add}</h4>
                    </div>
                    <div class="configuration-body additional-information">
                        <textarea class="additional-notes" placeholder="{$lang.c_tarea}" name="notes">{$submit.notes}</textarea>
                    </div>
                </div>

                <div class="tos">
                    {if $tos}
                        <div class="padding">
                            <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                        </div>
                    {/if}
                    <div class="checkout-button-fix center">
                        <button type="submit" class="checkout-button {if $tos}disabled {/if}"  {if $tos}disabled="disabled"{/if}>{$lang.checkout}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- End of Orderpage -->