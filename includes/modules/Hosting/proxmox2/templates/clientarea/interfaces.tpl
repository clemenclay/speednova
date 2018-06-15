{if $subdo=='create'}
    <form action="" method="post">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="checker">
            <tr>
                <td colspan="2">
                    <span class="slabel">Network device</span>
                    <select name="network_type_id" 
                            style="min-width:250px;" >
                        {foreach from=$ntypes item=name key=type}
                            <option value="{$type}">{$name}</option>
                        {/foreach}
                    </select></td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="border:none">
                    <input type="submit" class="blue" value="{$lang.addnewnetwork}">
                </td>
            </tr>
        </table>
        {securitytoken} 
    </form>

{else}
    <table class="tonapp"  width="100%" cellspacing=0>
        <thead>
            <tr>
                <td width="50">Id</td>
                <td width="50">Model</td>
                <td>MAC</td>
                {if $hasIps}
                    <td>IP Address</td>
                    <td>IP v6</td>
                {/if}
                <td width="100">Bridge</td>
                <td width="50"></td>
            </tr>
        </thead>
        {foreach  from=$interfaces item=interface key=ifname}
            <tr>
                <td >{$interface.name}</td>
                <td >{$interface.model}</td>
                <td >{$interface.mac}</td>
                {if $hasIps}
                    <td>{if $interface.ip.wan}{$interface.ip.wan}{else}{$interface.ip.ipaddress}{/if}</td>
                    <td>{if $interface.ip6}{$interface.ip6}{else}-{/if}</td>
                {/if}
                <td >{$interface.bridge}</td>
                <td>
                    <a href="{$service_url}&vpsdo=interfaces&vpsid={$vpsid}&do=remove&if={$ifname}&security_token={$security_token}"
                       class="btn btn-mini btn-danger" ><i class="icon icon-remove icon-white"></i></a>
                </td>
            </tr>
        {foreachelse}
            <tr>
                <td colspan="4">{$lang.nothing}</td>
            </tr>
        {/foreach}
    </table>
    
    <div style="padding:10px 0px;text-align:right">
        <a {if $limits.left}href="{$service_url}&vpsdo=interfaces&vpsid={$vpsid}&do=create&security_token={$security_token}"                
           class="btn btn-primary"
           {else} class="btn btn-primary disabled"{/if}
           >{$lang.addnewnetwork}</a>
    </div>
{/if}