<div class="tabb tabb-big" data-tab="1">
                <h3><i class="fa fa-tasks"></i> Blade Servers</h3>
                {if $item.bladeitems}
                    <div>
                        <table width="100%" cellspacing="0" cellpadding="3" border="0" class="whitetable" style="border:solid 1px #ddd;">
                            <tbody>
                                {foreach from=$item.bladeitems item=blade name=ff}
                                    <tr class="havecontrols man {if $smarty.foreach.ff.index%2==0}even{/if}">
                                        <td>{$blade.category_name}</td>
                                        <td>{$blade.name}</td>
                                        <td>{$blade.label}</td>
                                        <td class="lastitm fa-actions" align="right">
                                            <a href="?cmd=module&module=dedimgr&do=rack&make=delitem&id={$blade.id}{if $backview}&backview=parent&parent_id={$item.id}{/if}&rack_id={$item.rack_id}" 
                                               onclick="return confirm('Do you really want to remove this item?')" title="Remove item"><i class="fa fa-trash-o"></i></a>
                                            <a href="?cmd=module&module=dedimgr&do=itemeditor&item_id={$blade.id}" onclick="return editBladeItem('{$blade.id}')"
                                               title="Edit item"><i class="fa fa-pencil"></i></a>
                                            <a href="?cmd=module&module=dedimgr&do=itemeditor&item_id={$blade.id}"
                                               title="Show details in new page"><i class="fa fa-share"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}

                            </tbody>
                        </table>
                    </div>
                {/if}
                <br/>
                <div class="form-group">
                    <label class="nodescr">New blade server category:</label>
                    <select id="blade_cat_id"  onchange="loadSubitems(this)" class="w250">>
                        <option value="0">Select category to add item from</option>
                        {foreach from=$categories item=c}
                            <option value="{$c.id}">{$c.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div id="updater1" class="form-group"></div>
                <div class="form-group">
                    <a class="new_control greenbtn" href="#" onclick="createBladeEntry();
                                                return false" id="bladeadd" style="display:none"><span>Add this item</span></a>
                </div>
            </div>