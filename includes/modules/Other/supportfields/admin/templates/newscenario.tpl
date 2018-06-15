{include file='navigation.tpl'}
<form method="post" action="?cmd=supportfields&action={$action}" id="status_plugin"  style="padding: 10px 0;">
    {if $entry.id}
        <input type="hidden" name="id" value="{$entry.id}"/>
        <input type="hidden" name="edit" value="1"/>
    {else}
        <input type="hidden" name="add" value="1"/>
    {/if}
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td style="width: 140px; text-align: right">
                <label><b>Form Name</b></label>
                <a class="vtip_description" title="For staff member reference only"></a>
            </td>
            <td><input type="text" value="{$entry.name}" name="name" class="inp" /></td>
        </tr>
    

        <tr >
            <td style="width: 140px; text-align: right"><label><b>Ticket department</b></label></td>
            <td>
                <select id="module" name="dept_id">
                    <option value="0">-- None yet --</option>
                    
            {foreach from=$depts item=dept}
                        <option value="{$dept.id}" {if $entry.dept_id == $dept.id}selected="selected"{/if}>{$dept.name}</option> 
            {/foreach}
                </select>
            </td>
        </tr>
        <input type="hidden" id="typepicked" name="type" value="{if $entry.type == 0}VM{else}STORAGE{/if}"/>
        
</table>
<div class="clearfix" style="padding: 0 10px;">
    <a class="new_dsave new_menu" href="#" onclick="$('#status_plugin').submit(); return false;">
        <span>Save Changes</span>
    </a>
</div>
{securitytoken}
</form>