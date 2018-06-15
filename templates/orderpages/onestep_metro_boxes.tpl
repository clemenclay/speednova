{*
@@author:: HostBill team
@@name:: Metro Boxes, One-step
@@description:: Designed for products that let user customize their orders with sliders, where stadard vps resources are presented in form of server components. A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_metro_boxes/thumb.png
@@img:: onestep_metro_boxes/preview.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_metro_boxes/css/orderpage.css">
<script src="{$orderpage_dir}onestep_metro_boxes/js/script.js"></script>


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


<div class="row">
    <div class="span12 clearfix">

        <hgroup>
            <h1>{$opconfig.headertext}</h1>
            <h2>{$opconfig.subheadertext}</h2>
        </hgroup>

    </div>
</div>


<!-- Plans -->

<div class="row plan-list">

{foreach from=$products item=i name=loop}
<div class="span4 {if $smarty.foreach.loop.index%3==0}clear{/if}">
    <div class="plan-box plan-color-{$smarty.foreach.loop.index%6} {if $smarty.foreach.loop.index%3 == 2} left-hover{/if}">
        <div class="plan-header">
            <div class="header-hover op-9"></div>
            <div class="padding">
                <h3>{$i.name}</h3>
                <div class="text-center">
                    <p class="price-format">{include file="common/price.tpl" product=$i} <span class="price-cycle">/ {include file='common/cycle.tpl' product=$i}</span></p>
                </div>
                <div class="text-center">
                    <a href="#" class="btn-select" data-value="{$i.id}">Order Now</a>
                </div>
            </div>
        </div>
        <div class="plan-body">
            <div class="padding">
                <p class="plan-includes">Plan includes</p>
                <table class="table">
                    {specs var="awords" string=$i.description}
                    {foreach from=$awords item=prod name=lla key=k}
                        {if $prod.specs}
                            {foreach from=$prod.specs item=feat name=plan key=ka}
                                <tr {if $smarty.foreach.plan.index == 0}class="no-border"{/if}>
                                    <td class="property">{$feat[0]}</td>
                                    <td class="value">{$feat[1]}</td>
                                </tr>
                            {/foreach}
                        {/if}

                    {/foreach}
                    {assign var=awords value=false}
                </table>
            </div>
        </div>
        <div class="hidden-info">
            <div class="padding">
                <div class="text-fade">
                    <h4>Why <span>{$i.name}</span> is so special?</h4>
                    {specs var="awords" string=$i.description}
                    {foreach from=$awords item=prod name=lla key=k}
                        {foreach from=$prod item=feat name=desc key=ka}


                            {if $smarty.foreach.desc.index == 1}
                                {$feat}
                            {/if}

                        {/foreach}

                    {/foreach}
                    {assign var=awords value=false}
                </div>
            </div>
        </div>
    </div>
</div>
{/foreach}


</div>


<!-- About us -->

<div class="row">
    <div class="span12 aboutus-container">
        <div class="row">
            <h1>{$opconfig.aboutheader}</h1>
            <h2>{$opconfig.aboutsubheader}</h2>

            <div class="span12 aboutus-box clearfix">
                <div class="bg-icon">
                    <i class="icon-info"></i>
                </div>
                <div id="factsCarousel" class="carousel slide">
                    <div class="text-block carousel-inner">
                        <div class="item active">
                            <h4>{$opconfig.about1title}</h4>
                            <p>{$opconfig.about1text}</p>
                        </div>
                        <div class="item">
                            <h4>{$opconfig.about2title}</h4>
                            <p>{$opconfig.about2text}</p>
                        </div>
                        <div class="item">
                            <h4>{$opconfig.about3title}</h4>
                            <p>{$opconfig.about3text}</p>
                        </div>
                    </div>
                    <div class="aboutus-navigation">
                        <div class="prev-fact">
                            <a href="#factsCarousel" data-slide="prev">
                                <i class="icon-nav-left"></i>
                            </a>
                        </div>
                        <div class="next-fact">
                            <a href="#factsCarousel" data-slide="next">
                                <i class="icon-nav-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="updater" class="row orderpage-config">
    {include file="ajax.onestep_metro_boxes.tpl" }
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
                <button type="submit" class="checkout-button {if $tos}disabled" disabled="disabled"{else}"{/if}>{$lang.checkout}</button>
            </div>
        </div>
    </div>
</div>
</form>
</div>
<!-- End of Orderpage -->