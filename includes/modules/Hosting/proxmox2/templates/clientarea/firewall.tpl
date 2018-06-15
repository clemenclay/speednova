{include file="`$onappdir`firewall_header.tpl"}
<form action="" method="POST" class="form-horizontal" id="firewall-form">
    <input type="hidden" value="update" name="rule[do]" />
    <table class="tonapp"  width="100%" cellspacing=0>
        <thead>
            <tr>
                <td>{$lang.interface} #</td>
                <td>Type</td>
                <td>Action</td>
                <td>Source / Port</td>
                <td>Destination  / Port</td>
                <td>Protocol</td>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody id="firewall-rules">
            {include file="`$onappdir`ajax.firewall.tpl"}
        </tbody>
    </table>
    {securitytoken}
</form>

<form action="" method="post" class="form-horizontal" id="firewal-add">
    <input type="hidden" name="do" value="create"/>

    <br/><h3> {$lang.addrule}: </h3>
    <table class="tonapp"  width="100%" cellspacing="0" style="border-top:solid 1px #DDDDDD;">
        <tr>
            <td style="width: 80px">
                <label>{$lang.interface}</label>
                <div style="line-height: 2em">
                    {if count($interfaces) > 1}
                        <select name="rule[iface]" style="width:auto">
                            {foreach from=$interfaces item=eth}
                                <option value="{$eth.id}" {if $eth.name==$submit.iface}selected="selected"{/if}>{$eth.name}</option>
                            {/foreach}
                        </select>
                    {else}
                        {$interfaces[0].name}
                        <input type="hidden" value="{$interfaces[0].name}" name="rule[iface]" />
                    {/if}
                </div>
            </td>
            <td style="width: 80px">
                <label>Type</label>
                <select name="rule[type]" style="width:auto" id="firewall-rule-type">
                    <option value="in" {if $submit.type=='in'}selected="selected"{/if}>IN</option>
                    <option value="out"  {if $submit.type=='out'}selected="selected"{/if}>OUT</option>
                    {if $securitygroups}
                        <option value="group"  {if $submit.type=='group'}selected="selected"{/if}>GROUP</option>
                    {/if}
                </select>
            </td>
            {if $securitygroups}
                <td class="rule-type rule-type-group">
                    <label>Security Group</label>
                    <select name="rule[action]" style="width:auto">
                        {foreach from=$securitygroups item=group}
                            <option value="{$group}" {if $group == $submit.action}selected="selected"{/if}>{$group}</option>
                        {/foreach}
                    </select>
                </td>
            {/if}
            <td class="rule-type rule-type-in rule-type-out">
                <label>Action</label>
                <select  name="rule[action]" style="width:auto">
                    <option {if $submit.action=='ACCEPT'}selected="selected"{/if}>ACCEPT</option>
                    <option  {if $submit.action=='DROP'}selected="selected"{/if}>DROP</option>
                    <option  {if $submit.action=='REJECT'}selected="selected"{/if}>REJECT</option>
                </select>
            </td>
            <td class="rule-type rule-type-in rule-type-out">
                <label>Source / Port</label>
                <div class="input-append " style="white-space: nowrap;">
                    <input name="rule[source]" value="{$submit.source}" style="width:100px" placeholder="IP address"/>{*}
                    {*}<input name="rule[sport]" value="{$submit.sport}" style="width:50px" placeholder="Port"/>
                </div>
            </td>
            <td class="rule-type rule-type-in rule-type-out">
                <label>Destination / Port</label>
                <div class="input-append "  style="white-space: nowrap;">
                    <input name="rule[dest]" value="{$submit.dest}" style="width:100px" placeholder="IP address"/>{*}
                    {*}<input name="rule[dport]" value="{$submit.dport}" style="width:50px" placeholder="Port"/>
                </div>
            </td>
            <td class="rule-type rule-type-in rule-type-out">
                <label>Protocol</label>
                <select name="rule[proto]" style="width:auto">
                    <option value="">-</option>
                    {foreach from=$protocols item=proto}
                        <option value="{$proto}" {if $proto == $submit.proto}selected="selected"{/if}>{$proto}</option>
                    {/foreach}
                </select>
            </td>

            <td valign="bottom" style="width: 80px">
                <input type="submit" value="{$lang.submit}" style="font-weight:bold;padding:2px 3px;"  class="blue" />
            </td>
        </tr>


    </table>
    {securitytoken}
</form>
