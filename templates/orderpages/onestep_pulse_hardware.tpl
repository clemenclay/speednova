{*
@@author:: HostBill team
@@name:: Pulse Hardware, One-step
@@description:: Designed for products that let user customize their orders with sliders, where stadard vps resources are presented in form of server components. A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
@@thumb:: onestep_pulse_hardware/thumb.png
@@img:: onestep_pulse_hardware/preview.png
*}
<link rel="stylesheet" href="{$orderpage_dir}onestep_pulse_hardware/css/jquery-ui-1.8.21.custom.css">
<link rel="stylesheet" href="{$orderpage_dir}onestep_pulse_hardware/css/orderpage.css">
<script src="{$orderpage_dir}onestep_pulse_hardware/js/script.js"></script>


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
        <h1>Setup Your Server</h1>
        <p>Use the slider to setup your best serwer within minutes. You can also select predefined bundles we created for you.</p>

        <div class="slider-box">
            <div class="main-slider-bg">
                <div class="main-slider-outer-bg">
                    <div id="main-slider" class="main-slider-inner-bg">
                    </div>
                </div>
            </div>
            <ul class="plans-list">
                {foreach from=$products item=i name=loop}
                <li class="clearfix {if $i.id == $product.id} active{/if}" data-product="{$i.id}">
                    <span class="plan-circle"></span>
                    <div class="plan-info">
                        <p class="plan-name">{$i.name}</p>
                        <p class="plan-cycle">{include file="common/price.tpl" product=$i}</p>
                    </div>
                </li>
                {/foreach}

            </ul>
        </div>

        <!-- PC -->
        <div class="pc-block">
            <div class="pc-pin ram-pin"></div>
            <div class="pc-pin processor-pin"></div>
            <div class="pc-pin disc-pin"></div>

            <!-- RAM -->
            <div id="ram-box">
                <div class="value-bg pulse">
                    <span class="pc-value"><span class="value-0">0</span><p>RAM</p></span>
                    <div class="bg-icon"><i class="icon-pc-memory"></i></div>
                </div>
                <div class="pc-left-arrow"></div>
            </div>

            <!-- Processor -->
            <div id="processor-box">
                <div class="value-bg pulse">
                    <span class="pc-value"><span class="value-1">0</span><p>Processor</p></span>
                    <div class="bg-icon"><i class="icon-pc-processor"></i></div>
                </div>
                <div class="pc-right-arrow"></div>
            </div>

            <!-- Disc -->
            <div id="disc-box">
                <div class="value-bg pulse">
                    <span class="pc-value"><span class="value-2">0</span><p>Disc Space</p></span>
                    <div class="bg-icon"><i class="icon-pc-disc"></i></div>
                </div>
                <div class="pc-bottom-arrow"></div>
            </div>

            <div class="pc">
            </div>
        </div>
        <!-- End of PC -->
    </div>
</div>

<!-- End of Plans -->


<div class="orderpage-shadow"></div>



<div id="update">
    {include file="ajax.onestep_pulse_hardware.tpl" }
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
                <h2>{$lang.cart_add}</h2>
            </div>
            <div class="configuration-body no-bg">
                <textarea name="notes">
                </textarea>
            </div>
        </div>

        <div class="tos">
            {if $tos}
                <div class="padding">
                    <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                </div>
            {/if}
        </div>
    </div>
</div>

</form>
<!-- End of Product features -->




</div>