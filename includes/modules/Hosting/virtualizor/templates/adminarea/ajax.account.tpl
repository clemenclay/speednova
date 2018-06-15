{if $vpsdo == 'getstatus'}
{if $status}<span class="yes">Yes</span>{else}<span class="no">No</span>{/if}
{elseif $vpsdo == 'clientsvms'}

    <div class="data-table backups-list">
        <table width="100%" cellspacing="0" class="data-table backups-list left">
            <thead>
                <tr>
                    <td colspan="5">VPS Info</td>
                </tr>
            </thead>
            <tbody>
                <tr style="background-color: #eee;">
                    <td class="right-aligned" width="33%">
                        <b>State</b>
                    </td> 
                    <td class="power-status" >{if $vm.status == 'active'}<span class="yes left">Yes</span>{else}<span class="no left">No</span>{/if} 
                        <div class="left">
                            {$vm.status|capitalize}
                            <button onclick="load_clientvm();
                                    $('#lmach').addLoader();
                                    return false;">Refresh</button>
                            {if $vm.status == 'active'}
                                <button onclick="reboot_clientvm();
                                    return false;">Reboot</button>
                                <button onclick="shutdown_clientvm();
                                    return false;">Shutdown</button>
                            {elseif $vm.status == 'off'}
                                <button onclick="startup_clientvm();
                                    return false;">Power On</button>
                            {/if}
                        </div>
                    </td>
                </tr>
                <tr style="background-color: #eee;">
                    <td class="right-aligned"><b>Hostname</b></td>
                    <td class="courier-font">
                        {$vm.hostname}
                    </td>
                </tr>
                <tr style="background-color: #eee;">
                    <td class="right-aligned"><b>IP&nbsp;Addresses</b></td>
                    <td class="courier-font">
                        {foreach from=$vm.ips item=ip}
                            <a style="display: block; width: 100px;" href="http://{$ip}">{$ip}</a> 
                        {/foreach}
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="clear"></div>
    </div>
    {literal}
        <style>
            table.data-table tbody tr td{
                height:30px
            }
            span.infospan{
                border-bottom: 1px dashed #777777;
                cursor: help;    
            }
        </style>
        <script type="text/javascript">
            $('.infospan').each(function() {
                $(this).attr('title', 'This value is not accessible, and cannot be obtained from server at this time');
            }).vTip();
        </script>
    {/literal}

{/if}