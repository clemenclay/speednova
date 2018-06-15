{*
@@author:: HostBill team
@@name:: Table boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_table_boxes/thumb.png
@@img:: onestep_table_boxes/preview.png
*}

<link href="{$orderpage_dir}onestep_table_boxes/css/orderpage.css" rel="stylesheet">
<script type="text/javascript" src="{$orderpage_dir}onestep_table_boxes/js/script.js"></script>



<!-- Orderpage -->
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



<hgroup>
    <h1>{$opconfig.headertext}</h1>
    <h2>{$opconfig.subheadertext}</h2>
</hgroup>



<!-- Plans -->

<div class="row predefinied-plans">
    <div class="span12 clearfix">
        <div class="plan-included">
            <div class="header">
                <span>Check what’s included</span>
            </div>
            <ul class="list-items">
            {specs var="awords" string=$products[0].description}
            {foreach from=$awords item=prod name=lla key=k}
                {if $prod.specs}
                    {foreach from=$prod.specs item=feat name=plan key=ka}
                        <li {if $smarty.foreach.plan.index%2 != 0}class="darker-bg"{/if}><p>{$feat[0]}</p></li>
                    {/foreach}
                {/if}
            {/foreach}
            {assign var=awords value=false}
            </ul>
        </div>



        {foreach from=$products item=i name=loop key=k}
        <div class="plan-box plan-color-{$smarty.foreach.loop.index} {if $smarty.foreach.loop.index == 0}no-ml{/if} {if $product.id == $i.id}active{/if}">
            <div class="hidden-details">
                <div class="btn-center">
                    <a href="#" class="btn btn-select">Select Plan</a>
                </div>
                <p class="price-text">Plan price</p>
                <p class="price-value">{include file='common/price.tpl' product=$i showcycle=false}</p>
            </div>
            <div class="plan-bg">
                <div class="header">
                    <span>{$i.name}</span>
                </div>
                <ul class="list-items">
                    {specs var="awords" string=$i.description}
                    {foreach from=$awords item=prod name=lla key=k}
                        {if $prod.specs}
                            {foreach from=$prod.specs item=feat name=plan key=ka}
                                <li {if $smarty.foreach.plan.index%2 != 0 }class="darker-bg"{/if}><p> {$feat[1]}</p></li>
                            {/foreach}
                        {/if}
                    {/foreach}
                    {assign var=awords value=false}
                </ul>
            </div>
            <div class="plan-select">
                <a href="#" class="btn btn-select">Select Plan</a>
            </div>
            <input type="hidden" value="{$i.id}"/>
        </div>
        {/foreach}


    </div>
</div>

<!-- End of Plans -->




<!-- Product Configuration -->

<div class="configuration-row">
<div class="orderpage-shadow"></div>

<div id="updater" class="row orderpage-config">
    {include file="ajax.onestep_table_boxes.tpl"}
</div>

<!-- End of Product Configuration -->


<!-- Client details -->

<div class="row">
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
        <input type="hidden" name="make" value="order" />
        <input type="hidden" name="gateway" />

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


<!-- Product features -->
<div class="row product-features">
    <h3>Our Advantages</h3>
    <div class="span4">
        <i class="icon-feature-hosting"></i>
        <p class="advatages-title">{$opconfig.advantage1title}</p>
        <p class="advatages-text">{$opconfig.advantage1text}</p>
    </div>

    <div class="span4">
        <i class="icon-feature-payment"></i>
        <p class="advatages-title">{$opconfig.advantage2title}</p>
        <p class="advatages-text">{$opconfig.advantage2text}</p>
    </div>

    <div class="span4">
        <i class="icon-feature-innovation"></i>
        <p class="advatages-title">{$opconfig.advantage3title}</p>
        <p class="advatages-text">{$opconfig.advantage3text}</p>
    </div>
</div>
<!-- End of Product features -->




<!-- End of Orderpage -->