
<h1>Colocation: <strong><a href="?cmd=module&module={$moduleid}&do=floors&colo_id={$floor.colo_id}">{$floor.coloname}</a></strong> &raquo; 
    Floor:  <a href="?cmd=module&module={$moduleid}&do=floor&floor_id={$floor.id}">{$floor.name}</a> &raquo; Racks: </h1>
<p id="floorview_switch">
    <a class="menuitm menu-auto {if !$floorview}activated{/if}" href="?cmd=module&module={$moduleid}&do=listview&rel=floor&id={$floor.id}">Details</a>
    
    <a class="menuitm menu-auto {if $floorview}activated{/if}" style="width:30px; text-align: center" title="List" 
       href="?cmd=module&module={$moduleid}&do=listview&rel=floor&id={$floor.id}&type=list">List
    </a>
</p>
<div class="wall">
    <table border=0 cellpadding="0" cellspacing="0">
        <tr>
            {foreach from=$racks item=rack}
                <td valign="top">
                    <div class="rack_container">

                        <center><a class="rack3d"></a></center>
                        <div>
                            <p>Rack: <strong>{$rack.name}</strong> ({$rack.units}U)</p>
                        <p>{if $rack.room}Room: {$rack.room}{/if} &nbsp;</p>
                        <div class="usage {if $rack.usage > 75}red{elseif $rack.usage>50}yelow{elseif $rack.usage>25}green{/if}">
                            <div style="width: {$rack.usage}%"><span class="inverted">{$rack.usage}%</span></div>
                            <span>{$rack.usage}%</span>
                        </div>
                        <div style="padding:10px 0px;">
                            <a href="?cmd=module&module={$moduleid}&do=rack&rack_id={$rack.id}" class="sorter-ha menuitm menu-auto"><span>Items</span></a>
                            <a onclick="return editRack('{$rack.id}')" href="#" class="menuitm menu-auto" title="Edit" ><span class="editsth"></span></a>
                            <a class="menuitm menu-auto" title="delete" onclick="return confirm('Are you sure you want to remove this rack and all its contents?');" 
                               href="?cmd=module&module={$moduleid}&do=removerack&rack_id={$rack.id}&floor_id={$rack.floor_id}"><span class="delsth"></span></a>
                        </div>
                    </div>

                </div>
            </td>
        {/foreach}
        <td valign="top">
            <div class="new_rack_container" onclick="return addRack('{$floor.id}')">

                <center><a class="new_rack3d"></a></center>
                <div>
                    &nbsp;
                    <div style="padding:10px 0px;">
                        <a id="addnew_conf_btn" onclick="return false;" class="new_control" href="#"><span class="addsth"><strong>Add new rack</strong></span></a>
                    </div>
                </div>

            </div>

            </div>
        </td>
    </tr>
</table>
</div>
