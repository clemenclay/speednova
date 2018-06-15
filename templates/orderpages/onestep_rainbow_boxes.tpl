{*
@@author:: HostBill team
@@name:: Rainbow Boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_rainbow_boxes/thumb.png
@@img:: onestep_rainbow_boxes/preview.png
*}

<link href="{$orderpage_dir}onestep_rainbow_boxes/css/orderpage.css" rel="stylesheet">
<script type="text/javascript" src="{$orderpage_dir}onestep_rainbow_boxes/js/raphael.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_rainbow_boxes/js/script.js"></script>

<div id="orderpage" class="orderpage">


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



<!-- Plans -->

<div class="row">
    <div class="span12 clearfix">

        <hgroup>
            <h1>{$opconfig.headertext}</h1>
            <h2>{$opconfig.subheadertext}</h2>
        </hgroup>

    </div>
</div>

<div class="row">
<div class="span12">
<!-- Main Sliders -->
<div class="row main-sliders">
    <input type="hidden" id="product_id" value="{$product.id}" />
    <input type="hidden" id="product_cycle" value="{$product.cycle}" />
    <div id="topCart" class="span9">
        <!-- #1 -->
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 0}
                    {include file="onestep_rainbow_boxes/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}



        <!-- #2 -->
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 1}
                    {include file="onestep_rainbow_boxes/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}


        <!-- #3 -->
        {counter name=vsliderc print=false assign=vslider start=0}
        {foreach from=$custom item=cf name=vsliders}
            {if $cf.type == 'slider'}
                {if $vslider == 2}
                    {include file="onestep_rainbow_boxes/slider.tpl" slideno=$vslider}
                {/if}
                {counter name=vsliderc}
            {/if}
        {/foreach}

    </div>


    {include file="ajax.onestep_rainbow_boxes.tpl"}

<!-- Client Info -->
<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" class="clear" onsubmit="return mainsubmit(this)">
    <input type="hidden" name="make" value="order" />
    <input type="checkbox" name="tos" style="display: none">

    {if $gateways}
        <div class="row">
            <div class="span9">
                <div class="configuration-box">
                    <div class="configuration-header blue">
                        <h4>{$lang.choose_payment}</h4>
                    </div>
                    <div class="padding">
                        <div {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="payment-methods">
                            <ul class="radio-fields clearfix" id="payment-method">
                                {foreach from=$gateways item=module key=mid name=payloop}
                                    <li><input  type="radio" name="gateway" value="{$mid}" onclick="return pop_ccform($(this).val())" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </li>
                                {/foreach}
                            </ul>
                        </div>
                        {if $gateways}
                            <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
                                {$gatewayhtml}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    {/if}

    <div class="row">
        <div class="span9">
            <div class="configuration-box">
                <div class="configuration-header red">
                    <h4>{$lang.ContactInfo}</h4>
                </div>
                <div class="domain-tab">
                    <div class="tab-content">
                        <div class="tab-pane active" id="newClient">
                            <div class="padding clearfix">
                                {if $logged=="1"}
                                        {include file="drawclientinfo.tpl"}
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
                    <ul class="nav nav-tabs domain-nav" id="clientInfo">
                        {if $logged!="1"}
                            <li class="active"><a href="#newClient" onclick="setFormType(0); return false">New Client</a></li>
                            <li><a href="#registered" onclick="setFormType(1); return false">Already Registered</a></li>
                        {else}
                            <li class="active"><a href="#newClient">Logged</a></li>
                        {/if}
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <!-- Additional Info -->
    <div class="row">
        <div class="span9">
            <div class="configuration-box">
                <div class="configuration-header blue">
                    <h4>{$lang.cart_add}</h4>
                </div>
                <div class="padding">
                    <textarea class="additional-notes" placeholder="{$lang.c_tarea}" name="notes">{$submit.notes}</textarea>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- End of Configuration -->
</div>
</div>
    </form>
</div>