{*
@@author:: Amarok Design
@@name:: Coverflow, one-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
Nice clean template with current plan highlighted
@@thumb:: onestep_coverflow/thumb.png
@@img:: onestep_coverflow/preview.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_coverflow/css/main.css" />
<div id="onestepcontainer">
    <div id="ppicker">
        {if $current_cat!='addons' && $current_cat!='transfer' && $current_cat!='register'}
        {if $products}
        <input id="pidi" value="0" type="hidden" />
        <script src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            {
            literal
            }
            function mainsubmit(formel) {
            var v = $('input[name="gateway"]:checked');
                    if (v.length > 0) {
            $(formel).append("<input type='hidden' name='gateway' value='" + v.val() + "' />");
            }
            if ($('input[name=domain]').length > 0 && $('input[name=domain]').attr('type') != 'radio')
                    $(formel).append("<input type='hidden' name='domain' value='" + $('input[name=domain]').val() + "' />");
                    return true;
            }

            function onsubmit_2() {
            $('#load-img').show();
                    ajax_update('index.php?cmd=cart&' + $('#domainform2').serialize(), {
                    layer: 'ajax'
                    }, '#configer');
                    return false;
            }

            function tabbme(el) {
            $(el).parent().find('li').removeClass('on');
                    $('#options div.slidme').hide().find('input[type=radio]').removeAttr('checked');
                    $('#options div.' + $(el).attr('class')).show().find('input[type=radio]').attr('checked', 'checked');
                    $(el).addClass('on');
            }

            function on_submit() {
            if ($("input[value='illregister']").is(':checked')) {
            //own
            ajax_update('index.php?cmd=checkdomain&action=checkdomain&product_id=' + $('#product_id').val() + '&product_cycle=' + $('#product_cycle').val() + '&' + $('.tld_register').serialize(), {
            layer: 'ajax',
                    sld: $('#sld_register').val()
            }, '#updater2', true);
            } else if ($("input[value='illtransfer']").is(':checked')) {
            //transfer
            ajax_update('index.php?cmd=checkdomain&action=checkdomain&transfer=true&sld=' + $('#sld_transfer').val() + '&tld=' + $('#tld_transfer').val() + '&product_id=' + $('#product_id').val() + '&product_cycle=' + $('#product_cycle').val(), {
            layer: 'ajax'
            }, '#updater2', true);
            } else if ($("input[value='illupdate']").is(':checked')) {
            ajax_update('index.php?cmd=cart&domain=illupdate&sld_update=' + $('#sld_update').val() + '&tld_update=' + $('#tld_update').val(), {
            layer: 'ajax'
            }, '#configer');
                    $('#load-img').show();
            } else if ($("input[value='illsub']").is(':checked')) {
            ajax_update('index.php?cmd=cart&domain=illsub&sld_subdomain=' + $('#sld_subdomain').val(), {
            layer: 'ajax'
            }, '#configer');
                    $('#load-img').show();
            }

            return false;
            }

            function applyCoupon() {
            ajax_update('?cmd=cart&addcoupon=true', $('#promoform').serializeArray(), '#configer');
                    return false;
            }

            function simulateCart(forms, domaincheck) {
            $('#load-img').show();
                    var urx = '?cmd=cart&';
                    if (domaincheck)
                    urx += '_domainupdate=1&';
                    ajax_update(urx, $(forms).serializeArray(), '#configer');
            }

            function removeCoupon() {

            ajax_update('?cmd=cart', {
            removecoupon: 'true'
            }, '#configer');
                    return false;
            }

            function changeProduct(pid) {
            if (pid == $('#pidi').val())
                    return;
                    $('#pidi').val(pid);
                    $('#products-container .product-container').removeClass('active');
                    $('#products-container .product-container[rel=' + pid + ']').addClass('active');
                    $('#errors').slideUp('fast', function() {
            $(this).find('span').remove();
            });
                    $('#load-img').show();
                    $.post('?cmd=cart&cat_id={/literal}{$current_cat}{literal}', {
                    id: pid
                    }, function(data) {
                    var r = parse_response(data);
                            $('#configer').html(r);
                    });
            }

            function submitTheForm() {
            $('form#cart3').find('input,select').each(function() {
            if (($(this).attr('type') != 'radio' && $(this).attr('type') != 'checkbox') || $(this).is(':checked'))
                    $('#orderform').append('<input type="hidden" value="' + $(this).val() + '" name="' + $(this).attr('name') + '" />');
            });
                    $('#orderform').submit();
            }

        </script>
        {/literal}


        <div id="menu">
            <ul>
                {foreach from=$categories item=i name=categories name=cats}
                {if $i.id == $current_cat}
                <li><a href="javascript:void();" class="active">{$i.name}</a></li>
                {else}
                <li><a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>
                {/if}

                {if not $smarty.foreach.cats.last}<li class="separator"></li>{/if}

                {/foreach}
            </ul>
        </div>

        {if count($currencies)>1}
        <form action="" method="post" id="currform">
            <p align="right" style="margin-right:15px">
                <input name="action" type="hidden" value="changecurr">
                {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                    {foreach from=$currencies item=crx}
                    <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                    {/foreach}
                </select>
            </p>
        </form>
        {/if}

        <div class="clearfix"></div>

        <div id="header">
            <h1>{$opconfig.header}</h1>
            <p>{$opconfig.subheader}</p>
        </div>


        <div id="box-wrapper">
            {foreach from=$products item=i name=loop key=k}
            <div class="box {if $smarty.foreach.loop.index == $opconfig.highlighted}current{/if}" data-id="{$k+1}">
                <div class="title">
                    {$i.name}<br />
                    <span><sup>{$currency.sign}</sup>{include file='common/price.tpl' product=$i hideall=true} <span class="currency">{$currency.iso}</span></span>
                </div>

                {specs var="awords" string=$i.description}
                {foreach from=$awords item=prod name=lla key=k}
                {if $prod.specs} 
                {foreach from=$prod.specs item=feat name=ll key=ka}
                <div class="{if $smarty.foreach.ll.index % 2 == 0}odd{else}even{/if}"><strong>{$feat[1]}</strong> {$feat[0]}</div>
                {/foreach}
                {/if}
                {/foreach}
                {assign var=awords value=false}

                <form method="post" action="" class="parentform">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="id" value="{$i.id}" />
                    <div class="order" onclick="changeProduct({$i.id});
                                        return false;">

                        {$lang.ordernow}
                        <a href="#"></a>
                    </div>
                </form>
            </div>
            {/foreach}

        </div>

        <div id="box-slider">
            <div class="box-slide"></div>
        </div>

        {literal}
        <script>
                    $(function() {
                    $("#box-slider .box-slide").slider({
                    range: "min",
                            value: {/literal}{$opconfig.highlighted+1}{literal},
                                    min: 1,
                                    max: {/literal}{$products|@count}{literal},
                                            slide: function(event, ui) {
                                            $('.box').each(function(i) {
                                            if (i + 1 == ui.value) {
                                                $('.current').removeClass('current');
                                                    $(this).addClass("current");
                                                    return;
                                            }
                                            });
                                            }
                                    });
                            });</script>
        {/literal}

        <div class="clearfix"></div>



        {else}
        {foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat} 
        <strong>{$i.name}</strong> {if !$smarty.foreach.cats.last}|{/if}
        {else} 
        <a href="{$ca_url}cart&amp;step={$step}&amp;cat_id={$i.id}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a> {if !$smarty.foreach.cats.last}|{/if}
        {/if}
        {/foreach}
        {if $logged=='1'} 
        {if $current_cat=='addons'} | <strong>{$lang.prodaddons}</strong>
        {else} | <a href="{$ca_url}cart&amp;step={$step}&amp;cat_id=addons">{$lang.prodaddons}</a>
        {/if}
        {/if}
        {/if}
        {/if}
    </div>



    <div id="configer">
        {include file='ajax.onestep_coverflow.tpl'}
    </div>
    <form action="?cmd=cart&cat_id={$current_cat}" method="post" id="orderform" onsubmit="return mainsubmit(this)">
        {if $gateways}
        <div id="gatewayform" {if $tax && $tax.total==0}style="display:none"{elseif $credit && $credit.total==0}style="display:none"{elseif $subtotal.total==0}style="display:none"{/if}>
             {$gatewayhtml}
    </div>
    <div class="clear"></div>
    {/if}
    <input type="hidden" name="make" value="order" />
    {if $logged=="1"}
    <h3 class="modern modern-client">{$lang.ContactInfo}</h3>
    <div class="newbox1">
        {include file="drawclientinfo.tpl"}
    </div>
    {else}
    <div class="newbox1header">
        <h3 class="modern modern-client">{$lang.ContactInfo}</h3>
        <ul class="wbox_menu tabbme">
            <li {if !isset($submit) || $submit.cust_method=='newone'}class="t1 on"{else}class="t1"{/if} onclick="{literal}ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);$(this).parent().find('li.t2').removeClass('on');$(this).addClass('on');{/literal}" >

                {$lang.newclient}</li>
            <li {if $submit.cust_method=='login'}class="t2 on"{else}class="t2"{/if} onclick="{literal}ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);$(this).parent().find('li.t1').removeClass('on');$(this).addClass('on');{/literal}">
                {$lang.alreadyclient}
        </li>
    </ul>
</div>
<div class="newbox1" style="border-top: 0;">
    <div id="updater" >
        {if $submit.cust_method=='login'}
        {include file='ajax.login.tpl}
        {else}
        {include file='ajax.signup.tpl}
        {/if} 
    </div>
</div>
{/if}
<div class="newbox1header">
    <h3 class="modern modern-note">{$lang.cart_add}</h3>
</div>
<div class="newbox1">
    <textarea placeholder="{$lang.c_tarea}" name="notes" style="width:99%; height: 80px;">{$submit.notes}</textarea>        </div>
<p align="center">
    <br />
    {if $tos}
    <input type="checkbox" value="1" name="tos"/> {$lang.tos1} <a href="{$tos}" target="_blank" style="color: #515b6b; font-weight: 700;">{$lang.tos2}</a>
    {/if}
    <a href="#" onclick="$('#orderform').submit();
                                return false;" id="checksubmit-cu">{$lang.checkout}</a>
</p>
</form>

{literal}
<script>
                    $('.box').click(function() {
            $('.current').removeClass('current');
                    $(this).addClass("current");
                    var id = $(this).data('id');
                    $("#box-slider .box-slide").slider('value', id);
            });
</script>
{/literal}

</div>