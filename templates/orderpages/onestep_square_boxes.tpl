{*
@@author:: HostBill team
@@name:: Square Boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. 
@@thumb:: onestep_square_boxes/thumb.png
@@img:: onestep_square_boxes/preview.png
*}

<link href="{$orderpage_dir}onestep_square_boxes/css/orderpage.css" rel="stylesheet" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html">
<script type="text/javascript" src="{$orderpage_dir}onestep_square_boxes/js/script.js"></script>
<script>
    var or_lang = {literal}{}{/literal};
    or_lang['selected'] = '{$lang.selected|capitalize}';
    or_lang['order'] = '{$lang.order|capitalize}';
</script>


<!-- Orderpage -->
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
    <h1>{$opconfig.header}</h1>
    <h2>{$opconfig.subheader}</h2>
</hgroup>

<div class="center-line"></div>


<div class="orderpage-plans row">
    <h4><i class="icon-plan-selection"></i> {$lang.serverpricing}</h4>


    {foreach from=$products item=i name=loop key=k}
    <div class="plan span3 {if $product.id == $i.id} active{/if}">
        <input type="hidden" value="{$i.id}"/>
        <div class="plan-body plan-{$smarty.foreach.loop.index}">
            <h4>{$i.name}</h4>
            <h5>{include file='common/price.tpl' product=$i}</h5>
            <p>{include file='common/cycle.tpl' product=$i}</p>

            <ul class="plan-features">
                {specs var="awords" string=$i.description}
                {foreach from=$awords item=prod name=lla key=k}
                    {if $prod.specs}
                        {foreach from=$prod.specs item=feat name=ll key=ka}
                            <li> {$feat[1]} {$feat[0]}</li>
                        {/foreach}
                    {/if}

                {/foreach}
                {assign var=awords value=false}
            </ul>
            
            <a href="#" class="btn btn-block btn-plan-{$smarty.foreach.loop.index}">
                {if $product.id == $i.id}{$lang.selected|capitalize}
                {else}{$lang.order|capitalize}
                {/if}
            </a>
        </div>
    </div>
    {/foreach}
   
</div>


<div class="step_2 page-full" id="configer">
    {include file='ajax.onestep_square_boxes.tpl'}
</div>


<!-- Client Information -->
<form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
<input type="hidden" name="make" value="order" />
<input type="hidden" name="gateway" />
<div class="client-details">
    {if $logged!="1"}
    <div class="client-type span5">
        <div class="custom-select">
            <input type="hidden" name="client_type" value="New Client">
            <div class="select-button"><i class="icon-select-list"></i></div>
            <div class="select-value">New Client</div>
            <ul class="select-list">
                <li id="new-client" class="{if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}active{/if}">{$lang.newclient}</li>
                <li id="registered"  class="{if $submit.cust_method=='login' || $submit.action=='login'}active-client{/if}">{$lang.registered}</li>
            </ul>
        </div>
    </div>
    {/if}
    <h4><i class="icon-client-info"></i> {$lang.ContactInfo}</h4>

    <div class="row">
        <div class="contact-table-bg span12">
            {if $logged=="1"}
                <div class="client-logged">
                    {include file="drawclientinfo.tpl"}
                </div>
            {else}
                <div id="updater" class="clear">
                    {if $submit.cust_method=='login' || $submit.action=='login'}
                        <div class="login-table">
                            {include file='ajax.login.tpl'}
                        </div>
                    {else}
                        {include file='ajax.signup.tpl'}
                    {/if}
                </div>
            {/if}
        </div>
    </div>
    <!-- End of Client Information -->


    <!-- Additional Information -->
    <div class="additional-information">
        <h4><i class="icon-additional-notes"></i> {$lang.cart_add}</h4>
        <textarea name="notes"></textarea>
    </div>
    <!-- End of Additional Information -->

    <div class="tos">
        <div class="custom-checkbox">
            <p>
                <input type="checkbox" value="" name="tos" style="display: none" />
                                <span class="checkbox-field">
                                    <i class="icon-ok icon-white"></i>
                                </span>
                {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a>
            </p>
        </div>
        <div class="checkout-center">
            <div class="checkout-button-fix center">
                <button type="submit" class="btn btn-xlarge btn-order disabled" disabled="disabled">{$lang.checkout}</button>
            </div>
        </div>
    </div>

</div>
</div>
<!-- End of Orderpage -->











