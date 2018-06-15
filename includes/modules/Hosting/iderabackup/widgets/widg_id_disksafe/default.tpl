<h2>Disk Safes</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Server Name</th>
            <th>Recovery Points</th>
            <th>Size</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$list item=entry}
            <tr>
                <td>{$entry.description|escape}</td>
                <td>{if $agents && $agents[$entry.agentID]}{$agents[$entry.agentID].description|escape}{else}{$entry.agentID}{/if}</td>
                <td>{$entry.recoveryPointCount}</td>
                <td>{$entry.size}</td>
                <td>
                    <a href="{$widget_url}&act=del&id={$entry.id|escape:'url'}&security_token={$security_token}"
                       onclick="return confirm('Do You really want to delete this entry?')">
                        <span class="icon icon-trash" title="Remove"></span>
                    </a>
                </td>
            </tr>
        {/foreach}
    </tbody>
</table>

<div class="modal hide fade" id="addServer">
    <form action="{$widget_url}&act=add" method="POST" style="margin: 0">
        <div class="modal-header">
            <button type="button" class="close hide-modal" aria-hidden="true">×</button>
            <h2 id="myModalLabel">Add Disk Safe</h2>
            <p>A Disk Safe is where the backup data from a server is stored.</p>
        </div>

        <div class="modal-body">
            <div class="form-control">
                <label>Name</label>
                <input type="text" size="40" value="" name="name" class="form-control">
            </div>
            <div class="form-control">
                <label>Server</label>
                <select name="agent">
                    {foreach from=$agents item=entry}
                        <option value="{$entry.id}">{$entry.description|escape}</option>
                    {/foreach}
                </select>
            </div>
            <div class="form-control">
                <label> Compression Type</label>
                <select name="compression">
                    <option>None</option>
                    <option>ZLib</option>
                    <option selected="selected">QuickLZ</option>
                </select>
            </div>
        </div> 
        <div class="modal-footer">
            <span class="pull-right">
                <button type="submit" class="default btn btn-flat-primary btn-primary">Add Server</button>
                <button type="button" class="default btn hide-modal">Cancel</button>
            </span>
        </div>
        {securitytoken}
    </form>
</div>
<div class="pull-right">
    {if $agents}
    <a class="btn btn-flat-primary btn-primary" id="btn_addServer">Add Disk Safe</a>
    {else}
        <a class="btn btn-flat-warning btn-warning disabled" disabled>You need to add at least one server</a>
    {/if}
</div>
<div class="clear"></div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>