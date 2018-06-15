{include file='navigation.tpl'}

<form method="post" action="?cmd=supportfields&action={$action}&step_id={$step.id}"  id="status_plugin"  style="padding: 10px ;">

    <h3>Create new field</h3>
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td style="width: 160px; text-align: right">
                <label><b>Select field type:</b></label>
            </td>
            <td>{foreach from=$types item=type key=k}
                    <input type="radio" name="type" value="{$k}"/> {$type}<br />
                {/foreach}</td>
        </tr>



    </table>
    <div class="clearfix" style="padding: 0 10px;">
        <a class="new_dsave new_menu" href="#" onclick="$('#status_plugin').submit(); return false;">
            <span>Continue</span>
        </a>
    </div>
    {securitytoken}
</form>