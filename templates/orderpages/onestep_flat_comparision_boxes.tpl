{*
@@author:: HostBill team
@@name:: Flat Comparison boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. Nice clean template with current plan highlighted, designed to hold 4 packages. 
@@thumb:: onestep_flat_comparision_boxes/thumb.png
@@img:: onestep_flat_comparision_boxes/preview.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_flat_comparision_boxes/css/flat-ui.css" />
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_flat_comparision_boxes/css/orderpage.css" />
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/bootstrap-select.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/script.js"></script>

{foreach from=$categories item=i name=categories name=cats}
{if $i.id == $current_cat}{assign var=category_name value=$i.name}{/if}
{/foreach}

<div id="orderpage">
    <div class="orderpage">
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


        <hgroup>
            <h1>{$opconfig.headertext}</h1>
            <h2>{$opconfig.headerslogan}</h2>
        </hgroup>


        <!-- Plans -->
        <div class="orderpage-plans">
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
            <h4>
                <div class="section-icon-bg">
                    <div class="todo-icon fui-check-inverted"></div>
                </div>
                {$lang.serverpricing}
            </h4>

            <div class="plans">

                {foreach from=$products item=i name=loop key=k}
                    <div class="plan {if $product.id == $i.id}active{/if}">
                        {if $smarty.foreach.loop.index == $opconfig.highlighted}
                            <div class="popular"></div>
                        {/if}
                        <h4>{$i.name}</h4>
                        <h5>{include file='common/price.tpl' product=$i}</h5>
                        <p>{include file='common/cycle.tpl' product=$i}</p>

                        <ul class="plan-features">
                            {specs var="awords" string=$i.description}
                            {foreach from=$awords item=prod name=lla key=k}
                                {if $prod.specs}
                                    {foreach from=$prod.specs item=feat name=ll key=ka}
                                        <li><span class="fui-check"></span> {$feat[1]} {$feat[0]}</li>
                                        {/foreach}
                                    {/if}

                            {/foreach}
                            {assign var=awords value=false}
                        </ul>
                        {if $prod.features}
                            {$prod.features}
                        {/if}

                        <a href="#" class="btn btn-large btn-block btn-primary {if $product.id == $i.id}btn-selected{/if}">{if $product.id == $i.id}Selected{else}{$lang.selectthisplan|capitalize}{/if}</a>
                        <input type="hidden" value="{$i.id}"/>
                    </div>
                {/foreach}



            </div>
        </div>
        <!-- End of Plans -->


        <div class="clear"></div>

        <div class="orderpage-forms clearfix" id="configer">
            <div class="clearfix">
                {include file='ajax.onestep_flat_comparision_boxes.tpl'}
            </div>
        </div>

        <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
            <input type="hidden" name="make" value="order" />


            <!--  Payment-->
            {if $gateways}
                <div class="clear" style="margin-top: 15px"></div>
                <h4 {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} >
                    <div class="section-icon-bg">
                        <div class="todo-icon fui-lock"></div>
                    </div>
                    {$lang.choose_payment}</h4>
                <div class="padding">
                    <div {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="payment-methods">
                        <ul>
                            {foreach from=$gateways item=module key=mid name=payloop}
                                <li><input onclick="$('#gatewayform').show();
                                        ajax_update('?cmd=cart&action=getgatewayhtml&gateway_id=' + $(this).val(), '', '#gatewayform', true)" type="radio" name="gateway" value="{$mid}" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </li>
                                {/foreach}
                        </ul>
                    </div>
                </div>
            {/if}
            {if $gateways}
                <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                    {$gatewayhtml}
                </div>
            {/if}

            <!-- End of Payment -->

            <div class="client-details">
                <h4>
                    <div class="section-icon-bg">
                        <div class="todo-icon fui-user"></div>
                    </div>
                    {$lang.ContactInfo}
                </h4>

                {if $logged=="1"}
                    {include file="drawclientinfo.tpl"}
                {else}
                    <div class="client-toggle pull-right">
                        <select name="client_type">
                            <option id="new-client" class="left-client-option {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}active-client{/if} openSansBold" value="new_client">{$lang.newclient}</option>
                            <option id="registered-client" class="right-client-option {if $submit.cust_method=='login' || $submit.action=='login'}active-client{/if} inactive-client openSansBold" value="registered">{$lang.registered}</option>
                        </select>
                    </div>
                    <div id="updater" class="clear">
                        {if $submit.cust_method=='login' || $submit.action=='login'}
                            {include file='ajax.login.tpl'}
                        {else}
                            {include file='ajax.signup.tpl'}
                        {/if}
                    </div>
                {/if}

            </div>

            <!-- Additional Information -->
            <div class="additional-information">
                <h4>
                    <div class="section-icon-bg">
                        <div class="todo-icon fui-chat"></div>
                    </div>
                    {$lang.cart_add}
                </h4>
                <textarea name="notes" placeholder="{$lang.c_tarea}"></textarea>
            </div>
            <!-- End of Additional Information -->

            <div class="tos">
                {if $tos}
                    <p>
                        <label class="checkbox" for="tos">
                            <input type="checkbox" value="1" name="tos" id="tos" data-toggle="checkbox">
                            {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
                        </label></p>
                    {/if}
                <div class="checkout-center">
                    <div class="checkout-button-fix center">
                        <button type="submit" class="btn btn-xlarge btn-primary {if $tos}disabled" disabled="disabled"{else}"{/if}>Order Now</button>
                    </div>
                </div>
            </div>

    </div>
</div>
<!-- End of Orderpage -->
