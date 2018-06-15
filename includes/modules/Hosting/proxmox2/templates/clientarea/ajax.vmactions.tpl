<div id="lock" {if $vmtask}style="display:block"{/if}>
    <img src="includes/types/onappcloud/images/ajax-loader.gif" alt=""> {$lang.server_performing_task} <a href="{$service_url}&vpsdo=vmdetails&vpsid={$vpsid}"><b>{$lang.refresh}</b></a>
</div>
<ul id="vm-menu" class="right">
    {if $VMDetails.power=='true'}
        {if $o_sections.o_vnc}
            <li>
                <a href="{$service_url}&vpsdo=console&vpsid={$vpsid}&headless=1" target="_blank" onclick="return openConsole(this.href, {$vpsid}, 550, 800)">
                    <img alt="Console" src="templates/common/cloudhosting/images/icons/24_terminal.png"><br>
                    {$lang.console}
                </a>
            </li>
        {/if}
        {if $o_sections.o_reboot}
            <li>
                <a href="{$service_url}&vpsdo=reboot&vpsid={$vpsid}&security_token={$security_token}" 
                   onclick="return confirm('{$lang.sure_to_reboot}?');">
                    <img alt="Reboot" src="templates/common/cloudhosting/images/icons/24_arrow-circle.png">
                    <br>{$lang.reboot}
                </a>
            </li>
        {/if}
        <li>
            <a href="{$service_url}&vpsdo=shutdown&vpsid={$vpsid}&security_token={$security_token}" 
               onclick="return confirm('Are you sure you wish to shutdown this VM?');">
                <img alt="Shutdown" src="templates/common/cloudhosting/images/icons/poweroff.png">
                <br>{$lang.Shutdown}
            </a>
        </li>
    {else}
        <li>
            <a href="{$service_url}&vpsdo=poweron&vpsid={$vpsid}&security_token={$security_token}" >
                <img alt="Startup" src="templates/common/cloudhosting/images/icons/poweroff.png">
                <br>{$lang.Startup}
            </a>
        </li>
    {/if}
    {if  $o_sections.ha}
        <li>
            <a href="{$service_url}&vpsid={$vpsid}&vpsdo=toggleha&security_token={$security_token}">
                <img alt="Toggle HA" src="includes/modules/Hosting/proxmox2/templates/img/system-monitor{if $VMDetails.ha}-off{/if}.png">
                <br>
                {if !$VMDetails.ha}Enable HA
                {else}Disable HA
                {/if}
            </a>
        </li>
    {/if}
    <li>
        <a href="{$service_url}&vpsid={$vpsid}&vpsdo={if $provisioning_type!='single'}editvm{else}upgrade{/if}">
            <img alt="Scale" src="templates/common/cloudhosting/images/icons/24_equalizer.png">
            <br>
            {if $provisioning_type!='single'}{$lang.scale}
            {else}{$lang.upgrade1}
            {/if}
        </a>
    </li>


    {foreach from=$widgets item=widg}
        <li>
            <a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&vpsid={$vpsid}&vpsdo=vmdetails&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}">
                <img src="{$system_url}{$widg.config.bigimg}" alt=""><br/>
                {if $lang[$widg.name]}{$lang[$widg.name]}
                {elseif $widg.fullname}{$widg.fullname}
                {else}{$widg.name}
                {/if}
            </a>
        </li>
    {/foreach}

    <li>
        {if $provisioning_type=='single'}
            {if $upgrades}
            <a href="{$ca_url}clientarea&action=services&service={$service.id}&cid={$service.category_id}&cancel">
                <img alt="Delete" src="templates/common/cloudhosting/images/icons/24_cross.png"><br />
                {$lang.cancelvps}
            </a>
            {/if}
        {else} 
            {if $VMDetails.power!='true' && !$VMDetails.ha}
                <a  href="{$service_url}&vpsdo=destroy&vpsid={$vpsid}&security_token={$security_token}" 
                    onclick="return  confirm('{$lang.sure_to_destroy}?')"  >
                    <img alt="Delete" src="templates/common/cloudhosting/images/icons/24_cross.png"><br />
                    {$lang.delete}
                </a>
            {else}
                <a  href="{$service_url}&vpsid={$vpsid}" class="disabled"  >
                    <img alt="Delete" src="templates/common/cloudhosting/images/icons/24_cross.png"><br />
                    {$lang.delete}
                    {if $VMDetails.power=='true'}<span class="reason-tooltip">VM has to be powered off</span>{/if}
                    {if $VMDetails.ha}<span class="reason-tooltip">HA has to be disabled</span>{/if}
                </a>
            {/if}
        {/if}
    </li>

</ul>
<div class="clear"></div>
<script type="text/javascript">
    {literal}
        
        $(function () {
            var tooltip = [];
            $('#vm-menu .reason-tooltip').each(function () {
                var self = $(this),
                    parent = self.parent(),
                    title = parent.data('tiitledata') || [];

                title.push(self.text())
                parent.attr('title', title.join(',<br /> '))
                    .data('tiitledata', title)
                    .addClass('add-tooltip');
                self.hide();
            })
            if ($.fn.tooltip)
                $('.add-tooltip').tooltip().removeClass('add-tooltip');
            
            var wx = setTimeout(function () {
                $.post('{/literal}{$service_url}&vpsid={$vpsid}{literal}', {vpsdo: 'vmactions'}, function (data) {
                    var r = parse_response(data);
                    if (r)
                        $('#lockable-vm-menu').html(r);
                });
            }, {/literal}{if $vmtask}5000{else}60000{/if}{literal});
        });
        
    {/literal}
</script>