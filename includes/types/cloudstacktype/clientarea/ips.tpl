{if $subdo=='assignip'}
    <form action="" method="post">
        <input type="hidden" name="make" value="addnewipaddress">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="checker">
            <tbody>
                <tr>
                    <td colspan="2">
                        <div>
                            <span class="slabel">{$lang.interface} <a class="vtip_description" title="Select which network interface this IP address should be assigned to. "></a></span>
                            <select style="min-width:250px;" name="assign[network_interface_id]" required="required" id="interface_id" >
                                <option value=""></option>
                                {foreach from=$interfaces item=n key=k}
                                    <option value="{$n.networkid}" >NIC {$k+1}</option>
                                {/foreach}
                            </select>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2" class="checker-none">
                        <input type="submit" class="blue" value="{$lang.assign_new_ip}" />
                    </td>
                </tr>
            </tbody>
        </table>
        {securitytoken} 
    </form>
{elseif $subdo=='enablenat'}
    <form action="" method="post">
        <input type="hidden" name="vpsdo" value="ips">
        <input type="hidden" name="do" value="enablenat">
        <input type="hidden" name="ipid" value="{$ipid}">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="checker form-horizontal">
            <tbody>
                <tr>
                    <td style="width:50%">
                        <div>
                            <span class="slabel">{$lang.enable} {$lang.staticnat} </span>
                            <select style="min-width:250px;" name="vpsid" required="required" id="interface_id" >
                                {foreach from=$vms item=n key=k}
                                    <option value="{$n.id}" >{$n.hostname}</option>
                                {/foreach}
                            </select>
                        </div>
                    </td>
                    <td class="checker-none">
                        <input type="submit" class="blue" value="{$lang.shortsave}">
                    </td>
                </tr>
            </tbody>
        </table>
        {securitytoken} 
    </form>
{/if}

<table class="data-table backups-list"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td >{$lang.ipadd}</td>
            <td >{$lang.netmask}</td>
            <td >{$lang.gateway}</td>
            {if $network_overview}<td>VM</td>{/if}
            <td >{$lang.interface}</td>
            <td></td>
        </tr>
    </thead>
    {foreach item=ip from=$ips.basic}
        <tr>
            <td >{$ip.address}</td>
            <td>{$ip.netmask} </td>
            <td>{$ip.gateway}</td>
            {if $network_overview}<td>{$ip.name}</td>{/if}
            <td>{$ip.interface}</td>
            <td>&nbsp;</td>
        </tr>
    {foreachelse}
        <tr>
            <td colspan="{if $network_overview}6{else}5{/if}">{$lang.nothing}</td>
        </tr>
    {/foreach}
</table>

{if $ips.advanced}
    <br />
    <table class="data-table backups-list"  width="100%" cellspacing=0>
        <thead>
            <tr>
                <td >{$lang.publicip}</td>
                <td >{$lang.sourcenat} </td>
                <td >{$lang.staticnat}</td>
                {if $network_overview}<td>VM</td>{/if}
                <td>{$lang.interface}</td>
                <td></td>
            </tr>
        </thead>
        {foreach item=ip from=$ips.advanced}
            {if !$ip.netmask}
                <tr>
                    <td >{$ip.address}</td>
                    <td >{if $ip.sourcenat}{$lang.yes}{else}{$lang.no}{/if}</td>
                    <td >{if $ip.staticnat}{$lang.yes}{else}{$lang.no}{/if}</td>
                    {if $network_overview}<td>{$ip.name}</td>{/if}
                    <td>{$ip.interface}</td>
                    <td class="wrap-text">&nbsp;
                        <div class="btn-group left">
                            <a href="#" class="btn btn-mini dropdown-toggle" data-toggle="dropdown" title="Manage"><i class="icon icon-cog"></i><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                {if $feature.firewall}
                                    <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=firewall{if $vpsid}&vpsid={$vpsid}{/if}&ipid={$ip.id}" ><i class="icon icon-fire"></i> {$lang.inboundfirewall}</a></li>
                                    {/if}
                                    {if $ip.staticnat}
                                    <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}&do=disablenat&ipid={$ip.id}&security_token={$security_token}" ><i class="icon icon-minus"></i> {$lang.disable} {$lang.staticnat}</a> </li>
                                    {else}
                                        {if $feature.portforward}
                                        <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=fowarding{if $vpsid}&vpsid={$vpsid}{/if}&ipid={$ip.id}" ><i class="icon icon-random"></i> {$lang.portforwarding}</a></li>
                                        {/if}
                                        {if !$ip.sourcenat}
                                        <li><a {if !$staticnat_on}href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}&do=enablenat&ipid={$ip.id}&security_token={$security_token}"{else}style="color:#aaa; cursor:default" title="Static NAT already enabled for this NIC"{/if} ><i class="icon icon-plus"></i> {$lang.enable} {$lang.staticnat}</a> </li>
                                        {/if}
                                    {/if}
                                    {if $feature.vpn}
                                    <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=vpn{if $vpsid}&vpsid={$vpsid}{/if}&ipid={$ip.id}" ><i class="icon icon-lock"></i> {$lang.setupvpn}</a> </li>
                                    {/if}
                                    {if !$ip.sourcenat}
                                    <li><a href="?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}&do=deleteip&ipid={$ip.id}&security_token={$security_token}" onclick="return  confirm('{$lang.suretodeleteip}?')" ><i class="icon icon-trash"></i> {$lang.delete}</a> </li>
                                    {/if}
                            </ul>
                        </div>
                    </td>
                </tr>
            {/if}
        {foreachelse}
            <tr>
                <td colspan="{if $network_overview}6{else}5{/if}">{$lang.nothing}</td>
            </tr>
        {/foreach}
    </table>
{/if}


<div class="btn-group-cloud">

    {if $vpsaddons.ip.available}
        <input type="button" class="gray" onclick="$('#addon_bar').toggle();
                return false;" value="{$lang.ordernewip}"/>
    {/if}
    {*   <input type="button" class="blue" onclick="if(confirm('{$lang.rebuildconfirm}'))window.location='?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}&do=rebuildnetwork&security_token={$security_token}'" value="{$lang.rebuildnetwork}"/> *}

    {if $allowaddingip && !$subdo}
        <input type="button" class="blue" onclick="window.location = '?cmd=clientarea&action=services&service={$service.id}&vpsdo=ips{if $vpsid}&vpsid={$vpsid}{/if}&do=assignip'" 
               value="{$lang.assign_new_ip}"/>
        <span class="text">{$lang.freeipleft1} <b>{$allowaddingip}</b> {$lang.freeipleft}</span>

    {/if}
</div>

