{if $portlist}
    {if $portlist}
        {foreach from=$portlist item=p name=ports}
            {if $smarty.foreach.ports.index%4 ==0}{if !$smarty.foreach.ports.first}</div>{/if}<div class="port-group">{/if}
            <div class="connector {if $p.title}hastitle{/if}" {if $p.title}title="{$p.title}"{/if} onclick="getportdetails('{$p.id}')">
                {if $p.connected_to!='0'}
                    <div class="{if $p.type=="NIC"}hasconnection{else}haspower{/if}"></div>
                {/if}
                {if $p.port_status!='-1'}
                    <div class="port-status port-status-{$p.port_status}"></div>
                {/if}
                <div class="nth"><div>{$p.number}</div>
                </div>
            </div>
        {/foreach}
        </div>
    {/if}
{else}
<div class="form-group">
    <img src="{$moduledir}icons/network-ethernet.png" alt="" /> 
    <span>Network ports:</span> 
    <select name="conn[NIC][in]" onchange="setports($(this).val(), 'NIC', 'in')" class="w50">
        <option value="0" {if $ports.NIC.in.count=='0'}selected="selected"{/if}>0</option>
        {section name=foo loop=48}
            <option value="{$smarty.section.foo.iteration}" {if $smarty.section.foo.iteration==$ports.NIC.in.count}selected="selected"{/if}>{$smarty.section.foo.iteration}</option>
        {/section}
    </select>
</div>
    
<div class="crow clearfix">
    {if $ports.NIC.in.ports}
        {include file='ajax.connections.tpl' portlist=$ports.NIC.in.ports}
    {/if}
</div>

<div class="form-group">
    <img src="{$moduledir}icons/network-ethernet.png" alt="" /> 
    <span>Uplink ports <a class="vtip_description" title="Use for switch only"></a>:</span> 
    <select name="conn[NIC][OUT]" onchange="setports($(this).val(), 'NIC', 'out')" class="w50">
        <option value="0" {if $ports.NIC.out.count=='0'}selected="selected"{/if}>0</option>
        {section name=foo loop=4}
            <option value="{$smarty.section.foo.iteration}" {if $smarty.section.foo.iteration==$ports.NIC.out.count}selected="selected"{/if}>{$smarty.section.foo.iteration}</option>
        {/section}
    </select>
</div>
<div class="crow clearfix">
    {if $ports.NIC.out.ports}
        {include file='ajax.connections.tpl' portlist=$ports.NIC.out.ports}
    {/if}
</div>

<div class="form-group">
    <img src="{$moduledir}icons/plug.png" alt="" /> 
    <span>In-Power sockets:</span>
    <select name="conn[PDU][IN]"  onchange="setports($(this).val(), 'PDU', 'in')" class="w50">
        <option value="0" {if $ports.PDU.in.count=='0'}selected="selected"{/if}>0</option>
        {section name=foo loop=4}
            <option value="{$smarty.section.foo.iteration}" {if $smarty.section.foo.iteration==$ports.PDU.in.count}selected="selected"{/if}>{$smarty.section.foo.iteration}</option>
        {/section}
    </select>
</div>
<div class="crow clearfix">
    {if $ports.PDU.in.ports}
        {include file='ajax.connections.tpl' portlist=$ports.PDU.in.ports}
    {/if}
</div>

<div class="form-group">
    <img src="{$moduledir}icons/plug.png" alt="" /> 
    <span>Out-Power sockets <a class="vtip_description" title="Use for PDU only"></a>:</span>
    <select name="conn[PDU][OUT]" onchange="setports($(this).val(), 'PDU', 'out')" class="w50">
        <option value="0" {if $ports.PDU.out.count=='0'}selected="selected"{/if}>0</option>
        {section name=foo loop=48}
            <option value="{$smarty.section.foo.iteration}" {if $smarty.section.foo.iteration==$ports.PDU.out.count}selected="selected"{/if}>{$smarty.section.foo.iteration}</option>
        {/section}
    </select>
</div>
<div class="crow clearfix">
    {if $ports.PDU.out.ports}
        {include file='ajax.connections.tpl' portlist=$ports.PDU.out.ports}
    {/if}
</div>


<div class="fs11" style="line-height:25px;">
    <b>Legend:</b>
    <ul class="port-legend">
        <li><div class="port-status port-status-1"></div> This port is UP/ON</li>
        <li><div class="port-status port-status-0"></div> This port is DOWN/OFF</li>
        <li><div class="hasconnection"></div> This port is connected</li>
        <li><div class="haspower"></div> This power socket is connected</li>
    </ul>
    {* not implemented?}<img src="{$moduledir}icons/chart.png" /> <span class="orspace">This port have graphs assigned</span>{*}
</div>

{/if}