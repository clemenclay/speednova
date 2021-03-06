{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">{$lang.createnewserver}</h3>
    <div class="clear"></div>
</div>
    
<div id="progressbar" style="padding:10px;display:none;"></div>
<div class="content-bar nopadding" style="position:relative">
    
        <script type="text/javascript" >

            {literal}
                var ostemplates = [];
                var windows = [];
                var distributions = {
                    linux: [],
                    freebsd: [],
                    windows: []
                };{/literal}

        {foreach from=$CreateVM.ostemplates item=templa}{if $templa.swap=='false'}windows[{$templa[0]}] = true;{/if}{/foreach}

    {foreach from=$CreateVM.distributions.linux item=i key=k}distributions.linux[{$k}] = "{$i}";{/foreach}
{foreach from=$CreateVM.distributions.freebsd item=i key=k}distributions.freebsd[{$k}] = "{$i}";{/foreach}
{foreach from=$CreateVM.distributions.windows item=i key=k}distributions.windows[{$k}] = "{$i}";{/foreach}

{foreach from=$CreateVM.ostemplates item=i key=k}ostemplates[{$k}] ={literal} {{/literal}id: "{$i[0]}", name: "{$i[1]} {if $i[2] && $i[2]>0}( {$i[2]|price:$currency} ){/if}", distro: "{$i.distro}", family: "{$i.family}"{literal}}{/literal};{/foreach}
</script>

<form method="post" action="" id="vmbuild">
<input type="hidden" value="createmachine" name="make" />
<input type="hidden" name="CreateVM[hypervisor_group_id]" value="{$CreateVM.hv_zone_id}"/>
<input type="hidden" name="CreateVM[primary_network_group_id]" value="{$CreateVM.network_zone_id}"/>
<input type="hidden" name="CreateVM[data_store_group_primary_id]" value="{$CreateVM.data_zone_id}"/>
<input type="hidden" name="CreateVM[data_store_group_swap_id]" value="{$CreateVM.swap_zone_id}"/>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">

    <tr>
        <td colspan="2"><span class="slabel">{$lang.hostname}</span><input type="text" size="30" required="required" name="CreateVM[hostname]"  class="styled" value="{$submit.CreateVM.hostname}"/></td>
    </tr>
    
    <tr>
        <td colspan="2">
            <span class="slabel">{$lang.password}</span>
            <input type="text" size="30" name="CreateVM[initial_root_password]" class="styled" value="{$submit.CreateVM.initial_root_password}"/>
        </td>
    </tr>

    
    
<tr>
    <td colspan="2" id="flavormgr">
        
    </td>
</tr>
    
<tr>
        <td colspan="2"><span class="slabel">{$lang.os}</span><select required="required" name="CreateVM[operating_system]" id="virtual_machine_operating_system" onchange="filtertemplates('family')" style="min-width:250px;" >
        {if $CreateVM.distributions.linux}<option value="linux" {if $submit.CreateVM.operating_system=='linux'}selected="selected"{/if}>Linux</option>{/if}
{if $CreateVM.distributions.windows}<option value="windows" {if $submit.CreateVM.operating_system=='windows'}selected="selected"{/if}>Windows</option>{/if}
{if $CreateVM.distributions.freebsd}<option value="freebsd" {if $submit.CreateVM.operating_system=='freebsd'}selected="selected"{/if}>FreeBSD</option>{/if}
</select></td>

</tr>
<tr>
    <td colspan="2"><span class="slabel">{$lang.osdistro}</span><select required="required" name="CreateVM[operating_system_distro]" id="virtual_machine_operating_system_distro" onchange="filtertemplates('distro')"style="min-width:250px;" >
            {if $submit.CreateVM.operating_system}
                {foreach from=$CreateVM.distributions[$submit.CreateVM.operating_system] item=d}
                    <option value="{$d}" {if $submit.CreateVM.operating_system_distro==$d}selected="selected"{/if}>{$d|ucfirst}</option>
                {/foreach}
            {else}
                {if $CreateVM.distributions.linux}
                    {foreach from=$CreateVM.distributions.linux item=d}
                        <option value="{$d}">{$d|ucfirst}</option>
                    {/foreach}
                {elseif $CreateVM.distributions.windows}}
                    {foreach from=$CreateVM.distributions.windows item=d}
                        <option value="{$d}">{$d|ucfirst}</option>
                    {/foreach}
                {elseif $CreateVM.distributions.freebsd}}
                    {foreach from=$CreateVM.distributions.freebsd item=d}
                        <option value="{$d}">{$d|ucfirst}</option>
                    {/foreach}
                {/if}
            {/if}
        </select>
    </td>
</tr>
<tr>
    <td colspan="2">
        <span class="slabel">{$lang.ostemplate}</span>
        <select style="min-width:250px;" required="required" name="CreateVM[template_id]" id="virtual_machine_template_id" onchange="swapcheck($(this).val());
            licesecheck($(this).val())" >
            {if $submit.CreateVM.operating_system_distro}
                {foreach from=$CreateVM.ostemplates item=templa}{if  $templa.family==$submit.CreateVM.operating_system && $templa.distro==$submit.CreateVM.operating_system_distro}
                        <option value="{$templa[0]}" {if $submit.CreateVM.template_id==$templa[0]}selected="selected"{/if}>{$templa[1]} {if $templa[2] && $templa[2]>0}( {$templa[2]|price:$currency:true} ){/if}</option>
                {/if} {/foreach}
            {else}
                {foreach from=$CreateVM.ostemplates item=templa}{if $templa.family=='linux' && $templa.distro==$CreateVM.distributions.linux[0]}
                        <option value="{$templa[0]}" >{$templa[1]} {if $templa[2] && $templa[2]>0}( {$templa[2]|price:$currency:true} ){/if}</option>
                {/if}{/foreach}
            {/if}

        </select>
        <span id="ospreloader" style="display:none;"><img src="includes/types/onappcloud/images/ajax-loader.gif" style="margin-bottom: 9px;" /></span>
    </td>
</tr>
<tr id="license_type">
    <td colspan="2">
        <span class="slabel">Licensing Type</span>
        <select style="min-width:250px;" required="required" name="CreateVM[license_type]" id="virtual_machine_license_type" onchange="licesetypecheck($(this).val())" >
            <option value="mak" {if $submit.CreateVM.license_type=="mak"}selected="selected"{/if}> MAK</option>
            <option value="kms" {if $submit.CreateVM.license_type=="kms"}selected="selected"{/if}> KMS</option>
            <option value="own" {if $submit.CreateVM.license_type=="own"}selected="selected"{/if}> Your own license</option>
        </select>
    </td>
</tr>
<tr id="license_own">
    <td colspan="2">
        <span class="slabel">License Key</span>
        <input type="text" size="30" name="CreateVM[license_key]" class="styled" value="{$submit.CreateVM.license_key}"/>
    </td>
</tr>

    {if $CreateVM.limits.allowautobackup}
        <tr>
            <td colspan="2"><span class="slabel">{$lang.enableautobackup}</span>
                <input name="CreateVM[required_automatic_backup]" id="virtual_machine_required_automatic_backu"  value="1" type="checkbox" style="margin:8px 20px 0px;"/></td>
        </tr>
    {/if}




<tr>
    <td align="center" style="border:none" colspan="2">

        <input type="submit" value="{$lang.CreateVM}" style="font-weight:bold" class=" blue" />
    </td>
</tr>
</table>


<script type="text/javascript">
    {$passwordv.length};{literal}
        
         var intervalx = undefined;
                $('#progressbar').on("positionChanged", function (e) {
                    if (e.percent >= 100) {
			clearInterval(intervalx);
			intervalx = undefined;
                    }
                });
                function initprogress() {
                $('.content-bar').hide();
                  $('#progressbar').addClass('content-bar').show().progressbar({
                            maximum: 1001,
			warningMarker: 110,
			dangerMarker: 110,
                            step: 5
                    });
                   intervalx= setInterval(function () {
			$('#progressbar').progressbar('stepIt');
                    },50);
                }
            $(document).ready(function() {
                $('#vmbuild').submit(initprogress);
                init_sliders();
                licesecheck();
                $.get('?cmd=flavormanager&selected={/literal}{$submit.flavor_id}{literal}', function(data){
                        $('#flavormgr').html(data);
                });
                var timeout = false;
                function updateTitle(elm, title){
                    if(title){
                        if(timeout)
                            clearTimeout(timeout);
                        timeout = setTimeout(function(){
                            elm.attr('title',title);
                            if(typeof jQuery.fn.tooltip == 'function')
                               elm.tooltip({placement:'right', animation:false}).tooltip('fixTitle').tooltip('enable');
                            if($('.tooltip:visible').length){
                                elm.tooltip('show');
                            }
                                 
                        }, 100);
                    }else{
                        elm.removeAttr('title');
                        if(typeof jQuery.fn.tooltip == 'function')
                           elm.tooltip('hide').tooltip('disable');
                    }
                }
                
                {/literal}{if $passwordv.length}{literal}
                $('input[name="CreateVM[initial_root_password]"]').unbind('keyup input change').bind('keyup input change',function() {
                    var that = $(this),
                            val = that.val(),
                            btn = $('input[type="submit"]'),
                            invalid = false
                            title = [],
                            lang = {};
                    {/literal} 
                    lang['len'] = '{$lang.passistooshort|replace:'%d':$passwordv.length}';
                    lang['loweruppercase'] = '{$lang.uppercaselowercase}';
                    lang['lettersnumbers'] = '{$lang.lettersanddigits}';
                    lang['symbols'] = '{$lang.specialcharacters}';
                    if (val.length < {$passwordv.length}){literal}{
                        invalid = true;
                        title.push(lang.len);
                    }{/literal}
                    {if $passwordv.lettersnumbers}{literal}if (val.match(/([a-zA-Z].*\d)|(\d.*[a-zA-Z])/) == null){
                        invalid = true;
                        title.push(lang.lettersnumbers);
                    }{/literal}{/if}
                    {if $passwordv.loweruppercase}{literal}if (val.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) == null){
                        invalid = true;
                        title.push(lang.loweruppercase);
                    }{/literal}{/if} 
                    {if $passwordv.symbols}{literal}if (val.match(/[~!@#$%^&*_\-+=`|\(){}[\]:;"'<>,.?\/]/) == null){
                        invalid = true;
                        title.push(lang.symbols);
                    }{/literal}{/if}{literal}
                    if(invalid){
                        that.parent().addClass('error');
                        btn.prop('disabled', true).fadeTo(200, 0.5);
                        updateTitle(that, title.join('. '))
                    } else {
                        btn.prop('disabled', false).fadeTo(200, 1);
                        that.parent().removeClass('error').fadeTo(200, 1);
                        updateTitle(that);
                    }
                }).keyup().parent().addClass('control-group');
                {/literal}{/if}{literal}
            });
    {/literal}
</script>
<style>{literal}
    #orderpage .plan-list {
        margin: 0px auto;
        width:  946px;
    }      
    {/literal}
    </style>



{securitytoken}
</form>
</div>
{include file="`$onappdir`footer.cloud.tpl"}