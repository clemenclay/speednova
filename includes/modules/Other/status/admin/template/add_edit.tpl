<link media="all" rel="stylesheet" href="{$moduleurl}css/jquery.timepicker.css" />
<link media="all" rel="stylesheet" href="{$moduleurl}css/styles.css" />
<script type="text/javascript" src="{$moduleurl}js/jquery.timepicker.min.js" ></script>
<script type="text/javascript" src="{$moduleurl}js/script.js" ></script>
<script type="text/javascript">
    var __dateformat = "{$date_format}";
    __status_add_edit()
</script>

<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd=status"{/if}><span>Statuses</span></a>
            </li>
            {if $action == 'edit'}
                <li class="active last">
                    <a href="#"><span>{$entry.name|truncate}</span></a>
                </li>
            {else}
                <li class="{if $action == 'add'}active last{/if}">
                    <a {if $action != 'add'}href="?cmd=status&action=add"{/if}><span>New Status</span></a>
                </li>
            {/if}
        </ul>
    </div>
    {if $action == 'edit'}
        <div class="list-2">
            <div class="subm1 haveitems" style="display: block;">
                <ul>
                    <li>
                        <a href="?cmd=status&action=update&id={$entry.id}"><span>Add new status update</span></a>
                    </li>
                </ul>
            </div>
        </div>
    {/if}
</div>
<form method="post" action="?cmd=status&action={$action}" id="status_plugin" >
    {if $action=="edit"}
        <input type="hidden" name="id" value="{$entry.id}"/>
        <input type="hidden" name="edit" value="1"/>
    {else}
        <input type="hidden" name="add" value="1"/>
    {/if}
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td ><label>Name / Subject</label></td>
            <td><input type="text" value="{$entry.name}" name="name" class="inp" /></td>
        </tr>
        <tr>
            <td ><label>Date</label> 
            <td>
                <input type="text" value="{$entry.date|dateformat:$date_format}" name="date" class="haspicker inp" placeholder="eg. {"2014-05-14"|dateformat:$date_format}" />
            </td>
        </tr>
        <tr>
            <td ><label>Status</label></td>
            <td>
                <select name="status" class="inp">
                    <option {if $entry.status == "Scheduled"}selected="selected"{/if} value="Scheduled">Scheduled</option>
                    <option {if $entry.status == "InProgress"}selected="selected"{/if} value="InProgress">In-Progress </option>
                    <option {if $entry.status == "Cancelled"}selected="selected"{/if} value="Cancelled">Cancelled </option>
                    <option {if $entry.status == "ResolvedFaultIssue"}selected="selected"{/if} value="ResolvedFaultIssue">Resolved Fault / Issue</option>
                    <option {if $entry.status == "CompletedMaintenance"}selected="selected"{/if} value="CompletedMaintenance">Completed Maintenance</option>
                    <option {if $entry.status == "Finished"}selected="selected"{/if} value="Finished">Finished</option>
                </select>
            </td>
        </tr>
        <tr>
            <td ><label>Start time</label></td>
            <td class="datepickers">
                <input type="text" value="{$entry.startdate|dateformat:$date_format}" name="startdate" class="inp haspicker" placeholder="eg. {"2014-05-15"|dateformat:$date_format}">
                <input type="text" value="{$entry.start}" name="start" class="inp timepicker" placeholder="eg. 21:35">
            </td>
        </tr>
        <tr>
            <td ><label>Finish time</label></td>
            <td class="datepickers">
                <input type="text" value="{$entry.enddate|dateformat:$date_format}" name="enddate" class="inp haspicker" placeholder="eg. {"2014-05-16"|dateformat:$date_format}">
                <input type="text" value="{$entry.end}" name="end" class="inp timepicker" placeholder="eg. 01:35">
            </td>
        </tr>
        <tr>
            <td ><label>Description</label></td>
            <td >
                <textarea name="description" class="inp">{$entry.description}</textarea>
            </td>
        </tr>
        <tr>
            <td ><label>Related Servers Information</label></td>
            <td>
                <textarea name="relatedinfo" class="inp">{$entry.relatedinfo}</textarea>
            </td>
        </tr>
        {if $action=="add"}
            <tr>
                <td ><label>Notify</label></td>
                <td>
                    <input type="checkbox" {if $entry.notify}checked="checked"{/if} name="notify" class="inp" onchange="if ($(this).is(':checked'))
                $(this).parents('tr').eq(0).nextAll('tr').show();
            else
                $(this).parents('tr').eq(0).nextAll('tr').hide();"/>
                    Notify affected clients using support ticket
                    <a href="#" class="vtip_description" 
                       title="Once enabled clients will have support ticket opened with description above & auto closed afterwards"></a>
                </td>
            </tr>
            <tr {if !$entry.notify}style="display: none;"{/if}>
                <td ><label>Related Servers</label></td>
                <td>
                    <select id="servers" multiple="multiple" name="servers[]" class="inp">
                        {foreach from=$servers item=category}
                            <optgroup label="{$category.name}">
                                {foreach from=$category.servers item=server}
                                    <option value="{$server.id}"  {if in_array($server.id,$entry.servers)}selected="selected"{/if}>{$server.name}</option>
                                {/foreach}
                            </optgroup>
                        {foreachelse}
                            <option value="">{$lang.none}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr {if !$entry.notify}style="display: none;"{/if}>
                <td ><label>Related Products</label></td>
                <td>
                    <select id="products" multiple="multiple" name="products[]" class="inp">
                        {foreach from=$products item=category}
                            <optgroup label="{$category.name}">
                                {foreach from=$category.products item=product}
                                    <option value="{$product.id}" {if in_array($product.id,$entry.products)}selected="selected"{/if}>{$product.name}</option>
                                {/foreach}
                            </optgroup>
                        {foreachelse}
                            <option value="">{$lang.none}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr {if !$entry.notify}style="display: none;"{/if}>
                <td ><label>Ticket department</label></td>
                <td>
                    <select name="department" class="inp">
                        {foreach from=$departments item=dept}
                            <option value="{$dept.id}" {if in_array($dept.id,$entry.department)}selected="selected"{/if}>{$dept.name}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr {if !$entry.notify}style="display: none;"{/if}>
                <td ><label>Ticket template</label></td>
                <td>
                    <select name="meta[template_id]" class="inp">
                        {foreach from=$emails item=email}
                            <option value="{$email.id}" {if $email.tplname == 'Ticket:By Admin'}selected="selected"{/if}>{$email.tplname}</option>
                        {/foreach}
                    </select>
                    <div style="background: #EBEBEB; color: #7F7F7F; font-size: 11px; padding: 2px 5px; width: 345px; margin-top: 0.5em">
                    Selected email template will include following variables:<br />
                    {literal}- {$status.name}<br />
                        - {$status.startdate}<br />
                        - {$status.enddate}<br />
                        - {$status.description}<br />
                        - {$status.relatedinfo}<br />
                    {/literal}
                    </div>
                </td>
            </tr>
        {elseif $updates}
            <tr>
                <th>Previous updates</th>
                <th></th>
            </tr>
            {foreach from=$updates item=update}
                <tr class="update-row havecontrols">
                    <td>
                        <input type="hidden" name="updates[]" value="{$update.id}">
                        <a title="Delete" class="delbtn" 
                           href="#" 
                           onclick="if (confirm('Are you sure you wantto remove this status update?'))
                $(this).parents('tr').eq(0).remove();
            return false;"
                           style="display: inline-block">
                        </a>
                        {$update.date|dateformat:$date_format}
                    </td>
                    <td>
                        {$update.description}
                    </td>
                </tr>
            {/foreach}
        {/if}
    </table>
    <div class="clearfix">
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </div>
    {securitytoken}
</form>