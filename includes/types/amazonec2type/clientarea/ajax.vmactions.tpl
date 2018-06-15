<div id="lock" {if $vm.State.Name=='pending'}style="display:block"{/if}>
    <img src="includes/types/amazonec2type/images/ajax-loader.gif" alt=""> {$lang.server_performing_task} <a href="{$service_url}&vpsdo=vmdetails&vpsid={$vpsid}"><b>{$lang.refresh}</b></a>
</div>
<ul id="vm-menu" class="right">
    
    {if $vm.State.Name=='running'}
        <li>
            <a href="{$service_url}&vpsdo=console&vpsid={$vpsid}">
                <img alt="Console" src="includes/types/amazonec2type/images/icons/24_terminal.png"><br>Log output
            </a>
        </li>
        <li>
            <a href="{$service_url}&vpsdo=reboot&vpsid={$vpsid}&security_token={$security_token}" onclick="return confirm('{$lang.sure_to_reboot}?');">
                <img alt="Reboot" src="includes/types/amazonec2type/images/icons/24_arrow-circle.png"><br>{$lang.reboot}
            </a>
        </li>
    {/if}

    
    

    {foreach from=$widgets item=widg}
        <li>
            <a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&vpsid={$vpsid}&vpsdo=vmdetails&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}"><img src="{$system_url}{$widg.config.bigimg}" alt=""><br/>{if $lang[$widg.name]}{$lang[$widg.name]}{elseif $widg.fullname}{$widg.fullname}{else}{$widg.name}{/if}</a>
        </li>
    {/foreach}
    <li>
        <a {if $provisioning_type=='single'}href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel"{else} href="{$service_url}&vpsdo=destroy&vpsid={$vpsid}&security_token={$security_token}" onclick="return  confirm('{$lang.sure_to_destroy}?')" {/if}>
            <img alt="Delete" src="includes/types/amazonec2type/images/icons/24_cross.png"><br>{if $provisioning_type=='single'}{$lang.cancelvps}{else}{$lang.delete}{/if}
        </a>
    </li>
</ul>
<div class="clear"></div>
<div id="new-vm-state" style="display: none;">
    {include file="`$cloudstackdir`ajax.vmstatus.tpl" vm=$VMDetails}
</div>
<script type="text/javascript">
   
    {if $VMDetails.locked!='false'}
        {literal}
        var wx = setTimeout(function() {
            $.post('{/literal}{$service_url}&vpsid={$vpsid}{literal}', {vpsdo: 'vmactions'}, function(data) {
                var r = parse_response(data);
                if (r)
                    $('#lockable-vm-menu').html(r);
            });
        }, 4000);  
        {/literal}
    {/if}
     (function(){literal}{{/literal}
         var status = $('#vm-power .iphone_switch');
         
        if(status.data('tooltip'))
            status.data('tooltip').hide();
        status.replaceWith($('#new-vm-state .iphone_switch'));
    {literal}})(){/literal}
</script>

