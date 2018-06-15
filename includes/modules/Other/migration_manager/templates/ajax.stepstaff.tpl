<h3 >Staff per step</h3>
<div>Select staff member responsible to given step. When previous step finishes, staff member of next one will be notified about his pending step</div>

{if $steps}
    <table cellpadding="4" class="table table-striped table-bordered">
        <tr>
            <th>Step</th>
            <th>Step name</th>
            <th>Assigned staff</th>
        </tr>

        {foreach from=$steps item=step name=it}

        <tr>
            <td>#{$smarty.foreach.it.iteration}</td>
            <td>{$step.name}</td>
            <td>
                <select name="staff2step[{$step.id}]" class="form-control" style="margin: 0px;">
                    <option value="0" {if $step.admin_id=='0'}selected="selected"{/if}>None</option>
                    {foreach from=$staff item=s key=k}
                        <option value="{$k}"  {if $step.admin_id==$k}selected="selected"{/if}>{$s}</option>
                    {/foreach}
                </select>
            </td>
        </tr>

        {/foreach}
    </table>
{/if}
