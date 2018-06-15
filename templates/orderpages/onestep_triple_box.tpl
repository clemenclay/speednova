{*
@@author:: HostBill team
@@name:: Triple Box, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. 
@@thumb:: onestep_triple_box/thumb.png
@@img:: onestep_triple_box/preview.png
*}

<link href="{$orderpage_dir}onestep_triple_box/css/orderpage.css" rel="stylesheet" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html">
<script type="text/javascript" src="{$orderpage_dir}onestep_triple_box/js/script.js"></script>




<div class="orderpage">


<div class="modal hide fade" id="modal-window">
    <div class="modal-header">
        <h3></h3>
    </div>
    <div class="modal-body">
        <p></p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" class="close" data-dismiss="modal" aria-hidden="true">Close</a>
    </div>
</div>


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



<div class="orderpage-plans row">
    <h1>{$lang.serverpricing}</h1>
    <h3>{$lang.afterchoise}.</h3>




    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat}{assign var=category_name value=$i.name}{/if}
    {/foreach}

    {foreach from=$products item=i name=loop key=k}
    <div class="span4">
        <div class="plan plan-{$smarty.foreach.loop.index+1} {if $product.id == $i.id}no-opacity{/if}">
            <div class="plan-header">
                <div class="plan-bg"></div>
            </div>
            <div class="plan-icon-bg">
                <i class="icon-plan-{$smarty.foreach.loop.index+1}"></i>
            </div>

            <div class="plan-info">
                <p class="plan-name">{$i.name}</p>
                <p class="plan-desc">{$category_name}</p>
            </div>

            <div class="btn-center">
                <a href="#" class="btn-blue">{if $product.id == $i.id}selected{else}{$lang.order|capitalize}{/if}</a>
                <input type="hidden" value="{$i.id}"/>
            </div>

            <div class="modal-desc">
            {$i.description}
            </div>

            <div class="clearfix">
                <div class="plan-price">
                    <div class="btn-center">
                        <i class="icon-plan-cart"></i>
                    </div>
                    <p>{include file='common/price.tpl' product=$i}</p>
                </div>

                <div class="plan-cycle">
                    <div class="btn-center">
                        <i class="icon-plan-details"></i>
                    </div>
                    <p><a href="#" class="modal-window">More details</a></p>
                </div>
            </div>
        </div>
    </div>
    {/foreach}

</div>




<!-- Product Configuration -->


<div class="step_2 page-full" id="configer">
    {include file='ajax.onestep_triple_box.tpl'}
</div>




<!-- Client details -->
<div class="row">
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
     <input type="hidden" name="make" value="order" />
     <input type="hidden" name="gateway" />
    <div class="span8">
        <div>
            {if $logged!="1"}
            <div class="client-toggle">
                <div class="custom-select">
                    <div class="select-box">
                        <div class="select-value"></div>
                        <div class="select-arrow"><i class="icon-select-arrow"></i></div>
                        <ul class="select-list">
                            <li id="new-client" class="{if !$submit || !$submit.make || $submit.cust_method=='newone' || $submit.action!='login'}active-client{/if}">{$lang.newclient}</li>
                            <li id="registered" class="{if $submit.cust_method=='login' || $submit.action=='login'}active-client{/if}">{$lang.registered}</li>
                        </ul>
                    </div>
                </div>
            </div>
            {/if}
            <h2 class="no-ml">{$lang.ContactInfo}</h2>
            <h3 class="no-ml">{$opconfig.clientinfo}</h3>
                            {*CONTACT INFO*}
             <div class="contact-table-bg">
                            {if $logged=="1"}
                                <div class="client-logged">
                                {include file="drawclientinfo.tpl"}
                                </div>
                            {else}
                                <div id="updater" class="clear">
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


    <div class="span4">
        <div>
            <h2 class="no-ml">{$lang.cart_add}</h2>
            <h3 class="no-ml">{$lang.c_tarea}</h3>

            <div class="additional-information">
                <p>Write additional info here:</p>
                <textarea name="notes">
                </textarea>
            </div>

            <div class="tos">
                {if $tos}
                <div class="padding">
                    <p><input id="checkbox-tos" type="checkbox" name="tos" /> {$lang.tos1} <a href="{$tos}" target="_blank">{$lang.tos2}</a></p>
                </div>
                {/if}
                <button type="submit" class="btn-blue checkout-button btn-block disabled" disabled="disabled">{$lang.checkout}</button>
            </div>
        </div>
    </div>
</div>
</form>
<!-- End of Client details -->


</div>












