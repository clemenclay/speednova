{*
@@author:: HostBill team
@@name:: Sketch Hardware, One-step
@@description:: Designed for products that let user customize their orders with sliders, where stadard vps resources are presented in form of server components. A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_sketch_hardware/thumb.png
@@img:: onestep_sketch_hardware/preview.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_sketch_hardware/css/jquery-ui-1.8.21.custom.css">
<link rel="stylesheet" href="{$orderpage_dir}onestep_sketch_hardware/css/font.css">
<link rel="stylesheet" href="{$orderpage_dir}onestep_sketch_hardware/css/orderpage.css">
<script src="{$orderpage_dir}onestep_sketch_hardware/js/script.js"></script>


<!-- Orderpage -->
<div id="orderpage" class="orderpage">


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



<!-- Plans -->

<div class="row predefinied-plans">
    <div class="span12 clearfix">
        <h1>
            Setup <span>your server</span>
            <div class="underline-img"></div>
        </h1>

        <div class="row">
            <div class="span7">
                <ul class="plan-list">
                    {foreach from=$products item=i name=loop}
                    <li class="clearfix {if $i.id == $product.id} active{/if}" data-value="{$i.id}">
                        <div class="point-outer"><div class="point-inner"></div></div>
                        <div class="plan-box">
                            <div class="plan-details">
                                <p class="plan-name">{$i.name}</p>
                                <p class="plan-price">{include file="common/price.tpl" product=$i hidecode=true} <span>{$currency.code}</span></p>
                            </div>
                            <div class="plan-description">
                                <p>{$i.description}</p>
                            </div>
                        </div>
                    </li>
                    {/foreach}

                </ul>
            </div>

            <div class="span5">
                <div class="sketch-hardware">
                    <div class="cpu"></div>
                    <div class="memory"></div>
                    <div class="hdd"></div>

                    <div class="cpu-text-field">
                        <i class="icon-x"></i>
                        <span class="value-2">0</span>
                    </div>

                    <div class="memory-text-field">
                        <i class="icon-x"></i>
                        <span class="value-1">0</span>
                    </div>

                    <div class="hdd-text-field">
                        <i class="icon-x"></i>
                        <span class="value-0">0</span>
                    </div>

                    <div class="hardware"></div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="orderpage-shadow"></div>


<div id="update">
    {include file="ajax.onestep_sketch_hardware.tpl" }
</div>


<!-- Client details -->
<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" class="clear" onsubmit="return mainsubmit(this)">
    <input type="hidden" name="make" value="order" />
    <div class="row" style="margin-top: 35px">
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
                    <h2>{$lang.ContactInfo}</h2>
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
                <textarea class="notes" placeholder="{$lang.c_tarea}" name="notes">{$submit.notes}</textarea>
            </div>
        </div>

        <div class="tos">
            {if $tos}
                <div class="padding">
                    <p>
                        <input id="checkbox-tos" type="checkbox" name="tos" /> 
                        {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
                    </p>
                </div>
            {/if}
            <div class="checkout-button-fix center">
                <button type="submit" class="checkout-button disabled" {if $tos}disabled="disabled"{/if}>{$lang.checkout}</button>
            </div>
        </div>
    </div>
</div>
</form>
</div>
<!-- End of Orderpage -->