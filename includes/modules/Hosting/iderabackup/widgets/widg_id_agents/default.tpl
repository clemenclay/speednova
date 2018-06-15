<h2>Servers</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Server name</th>
            <th>Hostname / IP</th>
            <th>Port</th>
            <th>Agent</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$list item=entry}
            <tr>
                <td>{$entry.description|escape}</td>
                <td>{$entry.hostname}</td>
                <td>{$entry.portNumber}</td>
                <td>{$entry.lastKnownAgentVersion}</td>
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
            <h2 id="myModalLabel">Add Server</h2>
        </div>

        <div class="modal-body">
            <div class="form-control">
                <label>Server Name</label>
                <input type="text" size="40" value="" name="name" class="form-control">
            </div>
            <div class="form-control">
                <label>Host Name/IP</label>
                <input type="text" size="40" value="" name="host" class="form-control">
            </div>
            <div class="form-control">
                <label>Port</label>
                <input type="text" size="6" value="1167" name="port" class="form-control">
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
    <a class="btn btn-flat-primary btn-primary" id="btn_addServer">Add Server</a>
</div>
<div class="clear"></div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>