{include file='navigation.tpl'}
<form method="post" action="?cmd=supportfields&action={$action}&step_id={$step.id}"  id="status_plugin"  style="padding: 10px ;">

    {if !$field.id}
        <h3>Create new field</h3>
        <input type="hidden" name="make" value="add" />
        <input type="hidden" name="type" value="{$type}" />
    {else}
        <h3>Edit field <em>{$field.handlername}</em></h3>
        <input type="hidden" name="make" value="edit" />
        <input type="hidden" name="type" value="{$field.handler}" />
        <input type="hidden" name="id" value="{$field.id}" />
    {/if}
    <table cellpadding="3" cellspacing=0 style="width: 100%">

        <tr>
            <td style="width: 160px; text-align: right"><label><b>Name</b></label></td>
            <td ><input name="name" value="{$field.name}" class="inp" onkeyup="return loadept(this);"/></td>
        </tr>
        <tr>
            <td style="width: 160px; text-align: right"><label><b>Description</b></label><br/><small>HTML allowed</small></td>
            <td ><textarea name="description" cols=60 rows=3 class="inp">{$field.description}</textarea></td>
        </tr>

    </table>
    <div id="fconfiguration">
        <table cellpadding="3"  cellspacing=0 style="width: 100%">
            <tr>
                <td style="width: 160px; text-align: right"><label><b>Default value</b></label><br/><small>Inputs & selects only</small></td>
                <td>
                    <input  type="text" name="f[defaultval]"  value="{$field.configuration.defaultval}"  style="margin-bottom:2px;width:300px;" class="inp"/>
                </td>
            </tr>
            <tr>
                <td style="width: 160px; text-align: right"><label><b>Required</b></label></td>
                <td>
                    <input type="checkbox" name="f[required]" value="1" {if $field.configuration.required}checked="checked"{/if}/>
                </td>
            </tr>
            <tr>
                <td style="width: 160px; text-align: right"><label><b>Validation pattern</b><br><small>RegEx to validate this field with</small></td>
                <td>
                    <input id="expression" type="text" name="f[expression]" value="{$field.configuration.expression}"  style="margin-bottom:2px;width:300px;" />
                    <div class="clear"></div>
                                <span class="left">
                                    <a href="#" class="editbtn" onclick="$(this).hide();$('#premade_pattern').show();return false;">Premade patterns</a>
                                </span><div class="clear"></div>
                    <select name="premade_pattern" id="premade_pattern" onchange="$('#expression').val($(this).val());" class="w250" style="display:none">
                        <option value="">---select---</option>
                        <option value="{literal}/^\d{1,3}$/{/literal}">Number 1-3 digits in length</option>
                        <option value="{literal}/^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/](19|20)\d\d$/{/literal}">Date in mm/dd/yyyy</option>
                        <option value="{literal}/^(19|20)\d\d[\/](0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])$/{/literal}">Date in yyyy/mm/dd</option>
                        <option value="{literal}/^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/](19|20)\d\d$/{/literal}">Date in dd/mm/yyyy</option>
                        <option value="{literal}/^((\(\d{3}\) ?)|(\d{3}[-\s]))?\d{3}[-\s]\d{4}$/{/literal}">US Phone number</option>
                        <option value="{literal}/^\d{5}([\-]\d{4}){0,1}$/{/literal}">US Zip Code</option>
                    </select>
                </td>
            </tr>
        </table>

        <div style="padding:10px 0px">
        {$configform}
        </div>
    </div>
    <div class="clearfix" style="padding:  20px;">
        <a class="new_dsave new_menu" href="#" onclick="$('#status_plugin').submit(); return false;">
            <span>Save Changes</span>
        </a>
    </div>
    {securitytoken}
</form>