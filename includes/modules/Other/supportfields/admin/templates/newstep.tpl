{include file='navigation.tpl'}
<form method="post" action="?cmd=supportfields&action={$action}" id="status_plugin"  style="padding: 10px 0;">
        <input type="hidden" name="scenario_id" value="{$scenario.id}"/>
    {if $entry.id}
        <input type="hidden" name="id" value="{$entry.id}"/>
        <input type="hidden" name="edit" value="1"/>
    {else}
        <input type="hidden" name="add" value="1"/>
    {/if}
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td style="width: 140px; text-align: right">
                <label><b>Step Name</b></label>
                <a class="vtip_description" title="Customer will see step name"></a>
            </td>
            <td><input type="text" value="{$entry.name}" name="name" class="inp" /></td>
        </tr>
    

        
</table>
<div class="clearfix" style="padding: 0 10px;">
    <a class="new_dsave new_menu" href="#" onclick="$('#status_plugin').submit(); return false;">
        <span>Save Changes</span>
    </a>
</div>
{securitytoken}
</form>