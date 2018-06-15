{if $make=='getonappval' && $valx}
    {if $valx=='vdc'}
        <select id="{$valx}" name="options[{$valx}]" onchange="refetch()">
            <option value="">--- Select ---</option>
            {foreach from=$modvalues item=value}
                <option value="{$value[0]}" {if $value[0]==$defval}selected="selected"{/if}>{$value[1]}</option>
            {/foreach}
        </select>

    {elseif $valx=='role' ||  $valx=='pool' || $valx=='profile'}

        <select id="{$valx}" name="options[{$valx}]">
            <option value="">--- Select ---</option>
            {foreach from=$modvalues item=value}
            <option value="{$value[0]}" {if $value[0]==$defval}selected="selected"{/if}>{$value[1]}</option>
            {/foreach}
        </select>

    {/if}
{elseif $make=='importformel' && $fid}
<a href="#" onclick="return editCustomFieldForm('{$fid}','{$pid}')" class="editbtn orspace">Edit related form element</a>
{if $vartype=='os'}<a href="#" onclick="return updateOSList('{$fid}')" class="editbtn orspace">Update template list from Proxmox</a>{/if}
<script type="text/javascript">editCustomFieldForm('{$fid}','{$pid}');</script>
{/if}