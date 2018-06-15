{if $monitoring_data}<script type="text/javascript">MonitoringData['{$item.hash}'] = {$monitoring_data};;</script>{/if}
<script type="text/javascript" src="{$moduledir}edititem.js"></script>
<form id="saveform" class="clearfix" method="post" action="?cmd=module&module=dedimgr">
    <input type="hidden" name="do" value="rack" />
        <input type="hidden" name="backview" value="{$backview}" />
    <input type="hidden" name="rack_id" value="{if $rack_id}{$rack_id}{else}{$rack.id}{/if}" />
    {if $item.id!='new'}
        <input type="hidden" name="id" value="{$item.id}" id="item_id"/>
        <input type="hidden" name="make" value="edititem" />
    {else}
        <input type="hidden" name="id" value="new" id="item_id"/>
        <input type="hidden" name="make" value="additem" />
        <input type="hidden" name="item_id" value="{$item.type_id}" />
        <input type="hidden" name="category_id" value="{$item.category_id}" />
        <input type="hidden" name="position" value="{$position}" />
        <input type="hidden" name="location" value="{$location}" />
    {/if}
    {if $itsblade}
        <input type="hidden" name="parent_id" value="{$itsblade}" />
        <input type="hidden" name="location" value="Blade" />
    {/if}
    <input type="hidden" value="{if $item.category_name}{$item.category_name|escape} - {/if}{$item.name|escape} {if $item.label}&raquo; {$item.label|escape}{/if}  #{$item.id}" id="item_name">
    <div id="lefthandmenu">
        <a class="tchoice" href="#0">Basic settings</a>
        {if $item.isblade=='1'}
            <a class="tchoice" href="#1">Blade System</a>   
        {/if}
        {if $inventory_manager}
            <a class="tchoice" href="#2">Inventory Mgr</a>
        {/if}
        <a class="tchoice" href="#3">Hardware</a>
        <a class="tchoice" href="#4">Connections</a> 
        <a class="tchoice" href="#5">Monitoring</a>
        <a class="tchoice" href="#6">Configurations</a>
        <a class="tchoice" href="#7">Notes</a>
    </div>
    <div class="conv_content">

        {if $item.isblade=='1'}
            <!-- BLADE -->
            {include file="blade_servers.tpl"}<!-- BLADE END -->
        {/if}

        <!-- CONNECTIONS -->
        <div class="tabb tabb-big" data-tab="4">
            <h3><i class="fa fa-sitemap"></i> Connections</h3>
            {if $item.id=='new'}
                <strong>Save your item first to connect it to network / power</strong>
            {else}
                <div id="connection_mgr">
                    {include file='ajax.connections.tpl'}
                </div>
            {/if}
        </div><!-- CONNECTIONS END -->

        <!-- CONFIGURATIONS -->
        <div class="tabb tabb-big" id="configurations" data-tab="6">
            <h3><i class="fa fa-archive"></i> Configurations</h3>
            <div>
                {include file="ajax.itemconfigs.tpl"}
            </div>
        </div><!-- CONFIGURATIONS END -->
        
        <!-- MONITORING  -->
        <div class="tabb tabb-big" data-tab="5">
            <h3><i class="fa fa-eye"></i> Monitoring</h3>
            <p>
                If Nagios module is enabled and configured you can monitor this item. <br/>
                Monitoring search items with corresponding hostname/label and match them with those in related rack.
            </p>
            <p style="padding: 5px 0;">
                <a class="new_control" href="#" onclick="loadItemMonitoring(1); return false" ><span>Refresh</span></a>
            </p>
            <div id="itemmonitoring">No monitoring data found/fetched for this item</div>
        </div><!-- MONITORING END -->
        
        <!-- NOTES -->
        <div class="tabb tabb-big" data-tab="7" >
            <h3><i class="fa fa-info-circle"></i> Notes</h3>
            <div class="form-group"> 
                <span>Admin notes</span>
                <textarea name="notes" style="width: 99%; height: 100px">{$item.notes}</textarea>
            </div>
        </div><!-- NOTES END -->
        
        <!-- SETTINGS -->
        <div class="tabb tabb-small tabb-complex tabb-overflow" data-tab="0">
            <h3><i class="fa fa-edit"></i> Basic settings</h3>

            <div class="form-group">
                <label>Hostname / label</label>
                <input type="text" size="" class="w250" name="label" value="{$item.label}" id="item_label"/>
                <input type="hidden" value="{$item.hash}" id="item_hash"/>
            </div>
            {if !$itsblade}
                <div class="form-group">
                    <label>Parent device</label>
                    <select class="w250" name="parent_id" default="{$item.parent_id}" >
                        <option value="0" {if $item.parent_id=='0'}selected="selected"{/if}>#0: None</option>
                    </select>
                </div>

            {/if}
            <div class="form-group">
                <label class="nodescr">Owner</label>
                <select class="w250" name="client_id" default="{$item.client_id}" onchange="reloadServices()">
                    <option value="0">None</option>
                </select>
            </div>
            <div id="related_service" class="form-group">
                {if $item.account_id}
                    <label class="nodescr">Related service</label>
                    <input type="text"   size="" value="{$item.account_id}" class="w250" name="account_id" id="account_id" />

                {/if}
            </div>
            <div class="form-group">
                <label >Is it BladeSystem? <small>After enabling save and re-load</small></label>
                <input type="checkbox" value="1" {if $item.isblade=='1'}checked="checked"{/if} name="isblade" />
            </div>
        </div><!-- SETTINGS END -->
            
        <!-- SUMMARY -->
        <div class="tabb tabb-small tabb-complex" data-tab="0">
            <h3><i class="fa fa-bar-chart-o"></i> Summary</h3>
            <div>
                <table cellspacing="0" cellpadding="0" width="100%" class="whitetable" style="border: 1px solid #DDDDDD;">
                    <tbody>
                        <tr><td>Size:</td><td> {$item.units} U</td></tr>
                        <tr><td>Current:</td><td>{$item.current} Amps</td></tr>
                        <tr><td>Power:</td><td>{$item.power} W</td></tr>
                        <tr><td>Weight: </td><td>{$item.weight} lbs</td></tr>
                        <tr><td>Monthly price:</td><td>{$item.monthly_price} {$currency.code}</td></tr>
                        <tr><td>Vendor:</td><td>{$item.vendor_name}</td></tr>
                        <tr><td colspan="2"><a href="?cmd=module&module=dedimgr&do=inventory&subdo=category&category_id={$item.category_id}&item_id={$item.item_id}" target="_blank" class="editbtn fs11 orspace">Edit this item type</a></td></tr>
                    </tbody>
                </table>
            </div>
        </div><!-- SUMMARY END -->

        {if $accounts}
            <!-- ACCOUNTS -->
            <div class="tabb tabb-small tabb-complex" data-tab="0">
                <h3><i class="fa fa-users"></i> Accounts</h3>
                <div>
                    <table cellspacing="3" cellpadding="0" width="100%" class="whitetable" style="border: 1px solid #DDDDDD;">
                        <tbody>
                            <tr>
                                <td><b>This item is assigned to following accounts:</b></td>
                            </tr>
                            {foreach from=$accounts item=a}
                                <tr>
                                    <td>
                                        <a href="?cmd=clients&action=show&id={$a.client_id}" target="_blank">Client #{$a.client_id} {$a.firstname} {$a.lastname}</a> - <a href="?cmd=accounts&action=edit&id={$a.id}" target="_blank">Account#{$a.id}</a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div><!-- ACCOUNTS END -->
        {/if}

        {if $inventory_manager}
            <!-- INVENTORY MGR -->
            <div class="tabb tabb-small tabb-overflow" data-tab="2">
                <h3><i class="fa fa-tasks"></i> Inventory Mgr</h3>
                <div class="form-group">
                    <label class="nodescr">Finished Build ID</label>
                    <select  class="w250" name="build_id" default="{$item.build_id}" onchange="reloadInventory($(this).val())">
                        <option value="0" {if $item.build_id=='0'}selected="selected"{/if}>#0: None</option>
                    </select>
                </div>
                <div id="inventorygrid">
                </div>
            </div><!-- INVENTORY MGR END -->
        {/if}
        <!-- HARDWARE -->
        <div class="tabb tabb-small" data-tab="3">
            <h3><i class="fa fa-hdd-o"></i> Hardware</h3>
            {foreach from=$item.fields item=f}
                {if $f.field_type=='clients'}{continue}
                {/if}
                <div class="form-group">
                    <label class="nodescr">{$f.name} </label>
                    {if $f.field_type=='input'}
                        <input name="field[{$f.id}]" value="{$f.value}" class="w250"  type="text" />
                    {elseif $f.field_type=='text'}
                        <input name="field[{$f.id}]" value="{$f.value}" type="hidden" />
                        {$f.default_value}
                    {elseif $f.field_type=='select'}
                        <select name="field[{$f.id}]" class="w250">
                            {foreach from=$f.default_value item=d}
                                <option {if $f.value==$d}selected="selected"{/if}>{$d}</option>
                            {/foreach}
                        </select>

                    {elseif $f.field_type=='pdu_app'}
                        <select name="field[{$f.id}]" class="w250" onchange="changeHardwareApp(this, 'pdu')">
                            <option value="0" {if $f.value=='0'}selected="selected"{/if}>---</option>
                            {foreach from=$pdu_apps item=d}
                                <option value="{$d.id}" {if $f.value==$d.id}selected="selected"{/if}>#{$d.id} {$d.groupname} - {$d.name}</option>
                            {/foreach}
                            <option value="new" >Add new connection</option>
                        </select> <a class="new_control" href="#" onclick="loadports('{$f.id}', 'PDU', this); return false;"><span class="gear_small"> Load Ports</span></a>
                    {elseif $f.field_type=='switch_app'}
                        <select name="field[{$f.id}]" class="w250" onchange="changeHardwareApp(this, 'switch')">
                            <option value="0" {if $f.value=='0'}selected="selected"{/if}>---</option>
                            {foreach from=$switch_apps item=d}
                                <option value="{$d.id}" {if $f.value==$d.id}selected="selected"{/if}>#{$d.id} {$d.groupname} - {$d.name}</option>
                            {/foreach}
                            <option value="new" >Add new connection</option>
                        </select> <a class="new_control" href="#" onclick="loadports('{$f.id}', 'NIC', this); return false;"><span class="gear_small"> Load Ports</span></a>
                    {/if}
                </div>
            {foreachelse}
                <div>No additional fields</div>
            {/foreach}
        </div><!-- HARDWARE END -->
        <div id="porteditor" style="display:none"></div>
    </div>
    {securitytoken}
</form>
<div class="dark_shelf dbottom">
        <div class="left spinner page-hidden"><img src="ajax-loading2.gif"></div>
    <div class="right">
            <span class="bcontainer" >
            <a class="new_control greenbtn" href="#" onclick="$('#saveform').submit();
            return false"><span>{$lang.savechanges}</span>
            </a>
        </span>
            <span class="page-hidden">{$lang.Or}</span>
            <span class="bcontainer page-hidden">
            <a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
            return false;"><span>{$lang.Close}</span></a>
        </span>


    </div>
</div>