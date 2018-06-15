{if $vm.State.Name!='pending'}
    {if $vm.State.Name=='running'}
        <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweroff&vpsid={$vm.id}&security_token={$security_token}"  
           class="iphone_switch iphone_switch_on" onclick="return powerchange(this, '{$lang.sure_to_poweroff}?');">
            {$lang.On}
        </a>
    {else}
        <a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=poweron&vpsid={$vm.id}&security_token={$security_token}"  
           class="iphone_switch iphone_switch_off" onclick="return powerchange(this, '{$lang.sure_to_power_on}?');">
            {$lang.Off} 
        </a>
    {/if}
{else}
    <a class="iphone_switch vm-status-pending" data-vid="{$vm.id}" title="Your server is changing power state, it might take few minutes." data-toggle="tooltip">
        {$lang.Pending}
    </a>

{/if}