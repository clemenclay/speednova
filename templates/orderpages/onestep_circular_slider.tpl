{*
@@author:: HostBill team
@@name:: Circular Slider, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. 
@@thumb:: onestep_circular_slider/thumb.png
@@img:: onestep_circular_slider/preview.png
*}

<link href="{$orderpage_dir}onestep_circular_slider/css/font.css" rel="stylesheet" xmlns="http://www.w3.org/1999/html">
<link href="{$orderpage_dir}onestep_circular_slider/css/orderpage.css" rel="stylesheet">
<script type="text/javascript" src="{$orderpage_dir}onestep_circular_slider/js/raphael.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_circular_slider/js/script.js"></script>





<!-- Orderpage -->
<div class="orderpage">
<div class="padding">
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
    <h2>{$opconfig.header}</h2>
    <h1>{$opconfig.subheader}</h1>
</hgroup>


<div class="slider-relative">
    <!-- Main Slider -->

    <div class="main-slider">
        <div class="slider-wrapper">
            <div class="main-slider-dots">
            </div>
            <div class="main-slider-plans">

                {foreach from=$products item=i name=loop}
                    <span class="slider-pin pin-{$smarty.foreach.loop.index} {if $i.id == $product.id} active {/if}">
                    <div></div>
                    <span class="slider-label"  rel="{$i.id}">
                        <p><strong>{$i.name}</strong></p>
                        <p>{include file='common/price.tpl' product=$i}</p>
                    </span>
                </span>
                {/foreach}


            </div>
            <div class="main-slider-bg">
                <div class="main-slider-gradient"></div>
                <div class="main-slider-mask"></div>
                <div class="main-slider-img">
                    <div class="main-slider-path">
                        <div class="cloud-mask-shadow"></div>
                        <div class="main-slider-handle"></div>
                        <div class="slider-cloud">
                            <p id="plan-name" class="plan-name">Business Plan</p>
                            <p id="plan-price" class="plan-price">$29,99 USD</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Main Slider -->
</div>

<div id="update">
    {include file="ajax.onestep_circular_slider.tpl"}
</div>
    </div>

    <div class="clear"></div>
<div class="orderpage-forms" style="margin-top: 25px">

    <!-- Client Information -->
    {*CONTACT INFO*}
    <div class="client-info">
        {if $logged!="1"}
            <div class="pull-right client-select">
                <i class="icon-client-select"></i>
                <select onchange="clientForm(this); false;">
                    <option value="0">{$lang.newclient}</option>
                    <option value="1" {if $submit.cust_method=='login' || $submit.action=='login'}selected="selected"{/if}>{$lang.registered}</option>
                </select>
            </div>
        {/if}
        <h4><i class="icon-client-info"></i> {$lang.clientinfo}</h4>
        {if $logged=="1"}
            <div class="client-info-t">
                {include file="drawclientinfo.tpl"}
            </div>
        {else}
            <div id="clientform" class="client-info-t clear {if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}new-client{/if}">
                {if $submit.cust_method=='login' || $submit.action=='login'}
                    {include file='ajax.login.tpl}
                    {else}
                        {include file='ajax.signup.tpl}
                {/if}
            </div>
        {/if}
    </div>
    <!-- End of Client Information -->

    <!-- Additional Information -->
    <div class="additional-information">
        <h4><i class="icon-additional-info"></i> {$lang.cart_add}</h4>
        <textarea id="c_notes" placeholder="{$lang.c_tarea}"  name="notes">{if $submit.notes}{$submit.notes}{/if}</textarea>
    </div>
    <!-- End of Additional Information -->

    <div class="tos">
        {if $tos}<p><input id="checkbox-tos" type="checkbox" name="tos"> {$lang.tos1} <a href="{$tos}">{$lang.tos2}</a></p>{/if}
        <div class="checkout-center">
            <div class="checkout-button-fix center">
                <button type="submit" class="checkout-button {if $tos}disabled{/if}" {if $tos}disabled="disabled"{/if}>Order Now</button>
            </div>
        </div>
    </div>
</div>
<!-- End of Forms -->
</div>
</div>
<!-- End of Orderpage -->













