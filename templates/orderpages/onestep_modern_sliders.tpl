{*
@@author:: HostBill team
@@name:: Modern Sliders, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_modern_sliders/thumb.png
@@img:: onestep_modern_sliders/preview.png
*}

<link href="{$orderpage_dir}onestep_modern_sliders/css/orderpage.css" rel="stylesheet">
<script type="text/javascript" src="{$orderpage_dir}onestep_modern_sliders/js/script.js"></script>

<div class="orderpage">


    <ul class="services-type nav nav-pills">
        {foreach from=$categories item=i name=categories name=cats}
            {if $i.id == $current_cat}{*
                *}<li class="active"><a href="#">{$i.name}</a></li>
                {/if}
            {/foreach}
            {foreach from=$categories item=i name=categories name=cats}
                {if $i.id != $current_cat}| {*
                *}<li><a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>

            {/if}
        {/foreach}
    </ul>



    <hgroup>
        <h1>{$opconfig.headertext}</h1>
        <h2>{$opconfig.subheadertext}</h2>
    </hgroup>



    <div class="row" id="topCart">
        {if count($currencies)>1}
            <div class="pull-right currency-box">
                <form action="" method="post" id="currform">
                    <p align="right">
                        <input name="action" type="hidden" value="changecurr">
                        {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                            {foreach from=$currencies item=crx}
                                <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                            {/foreach}
                        </select>
                    </p>
                </form>
            </div>
        {/if}
        {if ($product.paytype!='Free' && $product.paytype!='Once')}
            <div class="pull-right billing-cycle">
                <p>{$lang.pickcycle}
                    {include file="common/price.tpl" allprices='cycle'}
                </p>
            </div>
        {/if}
        <input type="hidden" id="product_id" value="{$product.id}" />
        <input type="hidden" id="product_cycle" value="{$product.cycle}" />
        <div class="span12 top-sliders-bg">
            <div class="padding">
                <table class="table">
                    <thead>
                        <tr>
                            <th width="100px">Options</th>
                            <th>Plan strenght</th>
                            <th width="100px">Customize</th>
                            <th width="100px">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        {counter name=vsliderc print=false assign=vslider start=0}
                        {foreach from=$custom item=cf name=vsliders}
                            {if $cf.type == 'slider'}
                                {if $vslider == 0}
                                    {include file="onestep_modern_sliders/slider.tpl" slideno=$vslider}
                                {/if}
                                {counter name=vsliderc}
                            {/if}
                        {/foreach}

                        <!-- 2 -->
                        {counter name=vsliderc print=false assign=vslider start=0}
                        {foreach from=$custom item=cf name=vsliders}
                            {if $cf.type == 'slider'}
                                {if $vslider == 1}
                                    {include file="onestep_modern_sliders/slider.tpl" slideno=$vslider}
                                {/if}
                                {counter name=vsliderc}
                            {/if}
                        {/foreach}


                        <!-- 3 -->
                        {counter name=vsliderc print=false assign=vslider start=0}
                        {foreach from=$custom item=cf name=vsliders}
                            {if $cf.type == 'slider'}
                                {if $vslider == 2}
                                    {include file="onestep_modern_sliders/slider.tpl" slideno=$vslider}
                                {/if}
                                {counter name=vsliderc}
                            {/if}
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <!-- Product Description -->
    <div class="row">
        <div class="span12 product-description">
            <div class="padding clearfix">
                <div class="product-feature">
                    <p><i class="icon-feature-release"></i> <span>Weekly releases</span></p>
                </div>
                <div class="product-feature">
                    <p><i class="icon-feature-innovation"></i> <span>Innovation</span></p>
                </div>
                <div class="product-feature no-border">
                    <p><i class="icon-feature-future"></i> <span>Ready for the future</span></p>
                </div>

                <ul class="product-content clearfix">

                    {foreach from=$products item=prod name=lla key=k}
                        {$prod.description}
                    {/foreach}

                </ul>
            </div>
        </div>
    </div>

    <div class="orderpage-shadow row">
        <a href="#">Show details</a>
    </div>
    <!-- End of Product Description -->




    <!-- Product Configuration -->

    <div id="updater" class="row orderpage-config">
        {include file="ajax.onestep_modern_sliders.tpl"}
    </div>

    <!-- End of Product Configuration -->


    <!-- Client details -->

    <div class="row">
        <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
            <input type="hidden" name="make" value="order" />
            <input type="hidden" name="gateway" />



            {if $gateways}
                <div class="configuration-box">
                    <div class="configuration-header">
                        <h4>{$lang.choose_payment}</h4>
                    </div>
                    <div class="configuration-body">
                        <div {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="payment-methods">
                            <ul class="radio-fields" id="payment-method">
                                {foreach from=$gateways item=module key=mid name=payloop}
                                    <li><input onclick="setPayment($(this).val());" type="radio" name="gateway2" value="{$mid}" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </li>
                                    {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            {/if}
            {if $gateways}
                <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                    {$gatewayhtml}
                </div>
            {/if}
            

            <div class="span12">
                {if $logged!="1"}
                    <div class="client-toggle">
                        <select name="form_type" onchange="setFormType()">
                            <option value="0">New Client</option>
                            <option value="1">Registered User</option>
                        </select>
                    </div>
                {/if}


                <div class="configuration-box client-details">
                    <div class="configuration-header">
                        <h4>{$lang.ContactInfo}</h4>
                    </div>
                    <div class="configuration-body no-bg">
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
                <div class="configuration-body additional-information no-bg">
                    <textarea id="c_notes" placeholder="{$lang.c_tarea}"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
                </div>
            </div>

            <div class="tos">
                {if $tos}
                    <div class="padding">
                        <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                    </div>
                {/if}
                <div class="checkout-button-fix center">
                    <button type="submit" class="checkout-button disabled" disabled="disabled">{$lang.checkout}</button>
                </div>
            </div>
        </div>
    </div>

</form>
</div>
