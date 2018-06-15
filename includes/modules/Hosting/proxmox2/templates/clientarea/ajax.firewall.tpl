
{foreach item=rule from=$rules name=ruleloop}
    <tr>
        <td>
            <input type="hidden" name="rules[{$rule.pos}][pos]" value="{$rule.pos}"/>
            <div class="r_edit">
                {if count($interfaces) > 1}
                    <select name="rules[{$rule.pos}][{$rule.pos}][iface]" style="width:auto">
                        {foreach from=$interfaces item=eth}
                            <option value="{$eth.id}" {if $eth.name==$rule.iface}selected="selected"{/if}>{$eth.name}</option>
                        {/foreach}
                    </select>
                {else}
                    {$interfaces[0].name}
                    <input type="hidden" value="{$interfaces[0].name}" name="rules[{$rule.pos}][iface]" />
                {/if}
            </div>
            <span class="r_line">{$rule.iface}</span>
        </td>
        <td>
            <div class="r_edit">
                {if $rule.type != 'group'}
                    <select name="rules[{$rule.pos}][type]" style="width:auto">
                        <option {if $rule.type=='in'}selected="selected"{/if}>IN</option>
                        <option  {if $rule.type=='out'}selected="selected"{/if}>OUT</option>
                    </select>
                {else}
                    <input type="hidden" value="{$rule.type}" name="rules[{$rule.pos}][type]" />
                    <span>{$rule.type|upper}</span>
                {/if}
            </div>
            <span class="r_line">{$rule.type|upper}</span>
        </td>
        {if $rule.type != 'group'}
            <td>
                <select class="r_edit" name="rules[{$rule.pos}][action]" style="width:auto">
                    <option {if $rule.action=='ACCEPT'}selected="selected"{/if}>ACCEPT</option>
                    <option  {if $rule.action=='DROP'}selected="selected"{/if}>DROP</option>
                    <option  {if $rule.action=='REJECT'}selected="selected"{/if}>REJECT</option>
                </select>
                <span class="r_line">{if $rule.action}{$rule.action}{else}-{/if}</span>
            </td>
            <td>
                <div class="input-append r_edit" style="white-space: nowrap;">
                    <input name="rules[{$rule.pos}][source]" value="{$rule.source}" style="width:100px"/>{*}
                    {*}<input name="rules[{$rule.pos}][sport]" value="{$rule.sport}" style="width:50px"/>
                </div>
                <span class="r_line">{if $rule.source}{$rule.source}{elseif !$rule.sport}-{/if}{if $rule.sport}{if $rule.source}:{/if}{$rule.sport}{/if}</span>
            </td>
            <td>
                <div class="input-append r_edit"  style="white-space: nowrap;">
                    <input name="rules[{$rule.pos}][dest]" value="{$rule.dest}" style="width:100px"/>{*}
                    {*}<input name="rules[{$rule.pos}][dport]" value="{$rule.dport}" style="width:50px"/>
                </div>
                <span class="r_line">{if $rule.dest}{$rule.dest}{elseif !$rule.dport}-{/if}{if $rule.dport}{if $rule.dest}:{/if}{$rule.dport}{/if}</span>
            </td>
            <td>
                <select class="r_edit" name="rules[{$rule.pos}][proto]" style="width:auto">
                    <option value="">-</option>
                    {foreach from=$protocols item=proto}
                        <option value="{$proto}" {if $proto == $rule.proto}selected="selected"{/if}>{$proto}</option>
                    {/foreach}
                </select>
                <span class="r_line">{if $rule.proto}{$rule.proto}{else}-{/if}</span>
            </td>
        {else}
            <td colspan="4">
                <select class="r_edit" name="rules[{$rule.pos}][action]" style="width:auto">
                    {foreach from=$securitygroups item=group}
                        <option value="{$group}" {if $group == $submit.action}selected="selected"{/if}>{$group}</option>
                    {/foreach}
                </select>
                <span class="r_line">{if $rule.action}{$rule.action}{else}-{/if}</span>
            </td> 
        {/if}
        <td colspan="2"  style="text-align:right">
            <a href="#save/{$rule.pos}" class="small_control small_save fs11 r_edit">{$lang.savechanges}</a>
            <a href="#edit/{$rule.pos}" class="small_control small_pencil fs11 r_line" >{$lang.edit}</a>
            <a class="small_control small_delete fs11 r_line" onclick="return  confirm('Are you sure you want to remove this rule')" 
               href="{$service_url}&vpsdo=firewall&vpsid={$vpsid}&pos={$rule.pos}&do=delete&security_token={$security_token}">{$lang.remove}</a>
        </td>
    </tr>

{foreachelse}
    <tr>
        <td colspan="9">{$lang.nothing}</td>
    </tr>
{/foreach}
