{*
@@author:: HostBill team
@@name:: Live  Cloud, One-step
@@description:: Designed for products that let user customize their orders with sliders, where stadard vps resources are presented in form of server components. A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_live_cloud/thumb.png
@@img:: onestep_live_cloud/preview.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_live_cloud/css/orderpage.css">
<script src="{$orderpage_dir}onestep_live_cloud/js/script.js"></script>



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



    <div class="row">
        <div class="span12 setup-bg">
            <div class="orderpage-shadow"></div>
            <div class="glow"></div>
            <h1>{$opconfig.headertext}</h1>

            <div class="clearfix">
                <!-- Whats Included -->

                {foreach from=$products item=i name=loop key=k}
                    <div class="whats-included" {if $product.id == $i.id} style="display:block"{/if}>
                        <div class="whats-included-text"></div>

                        {specs var="awords" string=$i.description}
                        {foreach from=$awords item=prod name=lla key=k}
                            {if $prod.specs}
                                {foreach from=$prod.specs item=feat name=ll key=ka}

                                    {if $smarty.foreach.ll.index < 3}

                                        <div class="included-box included-box-{$smarty.foreach.ll.index}">
                                            <div class="included-box-border">
                                                <div class="included-box-bg">
                                                    <span><p>{$feat[1]}</p> {$feat[0]}</span>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}
                            {/if}

                        {/foreach}
                        {assign var=awords value=false}

                    </div>
                {/foreach}

                <!-- Clouds -->

                <div class="dynamic-clouds">
                    <div id="viewport">
                        <div id="world">
                        </div>
                    </div>
                    <div class="static-clouds">
                        <div class="cloud-gear">
                            <div class="main-cloud"></div>
                            <div class="gear-img gear-small speed-x1"></div>
                            <div class="gear-img gear-medium speed-x1"></div>
                            <div class="gear-img gear-big speed-x1"></div>
                        </div>
                    </div>
                </div>


                <!-- Billing Cycle -->

                <div class="setup-info">

                    <div id="billing-box" class="billing-cycle">
                        <p>{$lang.changebillingcycle}:</p>
                        <ul class="billing-cycle-box nav nav-pills">
                        </ul>
                    </div>


                    <div class="setup-total-box">
                        <p>{$lang.total_today}</p>
                        <span>        
                            {if $tax}
                                {$tax.total|price:$currency}
                            {elseif $credit}
                                {$credit.total|price:$currency}
                            {else}
                                {$subtotal.total|price:$currency}
                            {/if}
                        </span>
                    </div>
                </div>

            </div>


            <!-- Main Slider -->

            <div class="main-slider-box">
                <div class="main-slider-bg">
                    <div id="main-slider">
                    </div>
                </div>
                <ul class="plan-list nav-pills">
                    {foreach from=$products item=i name=loop key=k}
                        <li class="{if $product.id == $i.id} active {/if}" data-value="{$i.id}">
                            <div class="outer-bg">
                                <div class="inner-bg">
                                    <span></span>
                                </div>
                            </div>
                            <p class="plan-name">{$i.name}</p>
                            <p class="plan-cycle">{include file='common/price.tpl' product=$i}</p>
                        </li>
                    {/foreach}
                </ul>
            </div>

        </div>
    </div>
    <!-- End of Product Description -->



    <div id="updater" class="row orderpage-config">
        {include file="ajax.onestep_live_cloud.tpl"}
    </div>

    <!-- Client details -->
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
        <div class="row">

            <input type="hidden" name="make" value="order" />
            {if $gateways}
                <div class="configuration-box">
                    <div class="configuration-header">
                        <h4>{$lang.choose_payment}</h4>
                    </div>
                    <div class="configuration-body">
                        <div {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if} class="payment-methods">
                            <ul class="radio-fields" id="payment-method">
                                {foreach from=$gateways item=module key=mid name=payloop}
                                    <li><input  type="radio" name="gateway" value="{$mid}" onclick="return pop_ccform($(this).val())" {if $submit && $submit.gateway==$mid || $mid==$paygateid}checked="checked"{elseif $smarty.foreach.payloop.first}checked="checked"{/if}/> {$module} </li>
                                    {/foreach}
                            </ul>
                        </div>
                    </div>

                </div>
                <div id="gatewayform" class="_orderstage" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
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
                        <h4>{$lang.c_tarea}</h4>
                    </div>
                    <div class="configuration-body additional-information no-bg">
                        <textarea class="notes">
                        </textarea>
                    </div>
                </div>

                <div class="tos">
                    {if $tos}
                        <div class="padding">
                            <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                        </div>
                    {/if}
                    <div class="checkout-button-fix center">
                        <button type="submit" class="checkout-button" {if $tos}disabled="disabled"{/if}>{$lang.checkout}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>