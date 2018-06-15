<h2>Data Protection Policy</h2>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Disk Safe</th>
            <th>Server name</th>
            <th>Frequancy</th>
            <th>Last Run Time</th>
            <th>Next Run Time</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$list item=entry}
            <tr>
                <td>{$entry.name|escape}</td>
                <td>{$entry.disk.description|escape}</td>
                <td>{$entry.agent.description|escape}</td>
                <td>{$lang[$entry.replicationScheduleFrequencyType]}</td>
                <td>{if $entry.lastReplicationRunTime}{$entry.lastReplicationRunTime|dateformat:$date_format}{else}-{/if}</td>
                <td>{if $entry.nextReplicationRunTime}{$entry.nextReplicationRunTime|dateformat:$date_format}{else}-{/if}</td>
                <td>
                    {if $entry.enabled}
                        <a href="{$widget_url}&act=disable&id={$entry.id|escape:'url'}&security_token={$security_token}"
                           onclick="return confirm('Do You really want to disable this entry?')">
                            <span class="icon icon-ok-sign" title="Disable"></span>
                        </a>
                {else}
                    <a href="{$widget_url}&act=enable&id={$entry.id|escape:'url'}&security_token={$security_token}">
                        <span class="icon icon-remove-sign" title="Enable"></span>
                    </a>
                {/if}
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
            <h2 id="myModalLabel">Create New Policy</h2>
        </div>

        <div class="modal-body">
            <ul class="nav nav-tabs" id="freqTabs">
                <li class="active"><a href="#general" >Details</a></li>
                <li><a href="#replication" >Replication Schedule</a></li>
                <li><a href="#merge" >Merge Schedule</a></li>
                <li><a href="#verification" >Verification Schedule</a></li>
            </ul>
            <div>
                <div id="general" class="tab-content active">
                    <div class="form-control">
                        <label>Name</label>
                        <input type="text" size="40" value="" name="name" class="form-control">
                    </div>
                    <div class="form-control">
                        <label>Description</label>
                        <input type="text" size="40" value="" name="description" class="form-control">
                    </div>
                    <div class="form-control">
                        <label>Disk Safe</label>
                        <select name="disk">
                            <option value=""> - </option>
                            {foreach from=$disks item=entry}
                                {if !$entry.hasPolicy}
                                    <option value="{$entry.id}">{$entry.description|escape}</option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div id="replication" class="tab-content schedule">
                    {include file="`$widget_dir`schedule.tpl"}
                </div>
                <div id="merge" class="tab-content schedule">
                    {include file="`$widget_dir`schedule.tpl"}
                </div>
                <div id="verification" class="tab-content schedule">
                    {include file="`$widget_dir`schedule.tpl"}
                </div>
            </div>
        </div> 
        <div class="modal-footer">
            <span class="pull-right">
                <button type="submit" class="default btn btn-flat-primary btn-primary">Create Policy</button>
                <button type="button" class="default btn hide-modal">Cancel</button>
            </span>
        </div>
        {securitytoken}
    </form>
</div>
<div class="pull-right">
    {if $agents}
        <a class="btn btn-flat-primary btn-primary" id="btn_addServer">Create New Policy</a>
    {else}
        <a class="btn btn-flat-warning btn-warning disabled" disabled>You need to add at least one server</a>
    {/if}
</div>
<div class="clear"></div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>
<link href="{$widgetdir_url}style.css" rel="stylesheet" type="text/css"/>