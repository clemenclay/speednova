<link media="all" rel="stylesheet" href="{$moduleurl}css/jquery.timepicker.css" />
<link media="all" rel="stylesheet" href="{$moduleurl}css/styles.css" />
<script type="text/javascript" src="{$moduleurl}js/jquery.timepicker.min.js" ></script>
<script type="text/javascript" src="{$moduleurl}js/script.js" ></script>
<script type="text/javascript">
    var __dateformat = "{$date_format}";
    __status_update()
</script>

<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li>
                <a href="?cmd=status"><span>Statuses</span></a>
            </li>
            <li>
                <a href="?cmd=status&action=edit&id={$entry.id}"><span>{$entry.name}</span></a>
            </li>
            <li class="active last">
                <a href="#"><span>Status Update</span></a>
            </li>
        </ul>
    </div>
</div>

<form method="post" action="?cmd=status&action={$action}" id="status_plugin" >
    <input type="hidden" name="id" value="{$entry.id}"/>
    <input type="hidden" name="update" value="1"/>
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td ><label>Date</label> 
            <td class="datepickers">
                <input type="text" value="{$entry.date|dateformat:$date_format}" name="date" class="inp haspicker" placeholder="eg. {"2014-05-16"|dateformat:$date_format}">
                <input type="text" value="{$entry.time}" name="time" class="inp timepicker" placeholder="eg. 01:35">
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
            <td ><label>Description</label></td>
            <td >
                <textarea name="description" class="inp">{$entry.description}</textarea>
            </td>
        </tr>
        {if $ticketsno}
            <tr>
                <td ><label>Update tickets</label></td>
                <td>
                    <input type="checkbox" {if $entry.notify}checked="checked"{/if} name="notify" class="inp" />
                    Notify affected clients using support tickets, {$ticketsno} tickets will be updated
                    <a href="#" class="vtip_description" 
                       title="Once enabled clients will have support their ticket updated with description above"></a>
                </td>
            </tr>

            <tr>
                <td ><label>Close tickets</label></td>
                <td>
                    <input type="checkbox" {if $entry.close}checked="checked"{/if} name="close" class="inp" />
                    Close related tickets after this status update, {$ticketsno} tickets will be closed
                    <a href="#" class="vtip_description"
                       title="Once enabled clients will have support their ticket closed"></a>
                </td>
            </tr>
        {/if}
    </table>
    <div class="clearfix">
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </div>
</form>