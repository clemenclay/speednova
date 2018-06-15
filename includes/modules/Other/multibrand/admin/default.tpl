{foreach from=$mbaddons.header item=tpl}
    {include file=$tpl}
{/foreach}
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>Brand List</span></a>
            </li>
            <li class="{if $action == 'add'}active{/if} last">
                <a {if $action != 'add' && $action != 'edit'}href="?cmd={$modulename}&action=add"{/if}><span>{if $action == 'edit'}{$entry.name}{else}New Brand{/if}</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        {if $action == 'add' || $action == 'edit'}
            <div class="subm1 haveitems">
                <ul>
                    <li><a href="#general"><span>General</span></a></li>
                        {if $entry.brand_id != 1 || $entry.brand_id == 'new'}
                        <li><a href="#billing"><span>Billing</span></a></li>
                        <li><a href="#mail"><span>Mail</span></a></li>
                        {/if}
                    <li><a href="#proucts"><span>Products</span></a></li>
                    <li><a href="#gates"><span>Gateways</span></a></li>
                    <li><a href="#support"><span>Support</span></a></li>
                    
                    {if $mbaddons.altmodules}
                        <li><a href="#modules"><span>Modules</span></a></li>
                    {/if}
                </ul>
            </div>
        {else}
            <div class="subm1" style="display: block; height: 20px;">
            </div>
        {/if}
    </div>
</div>
{if !$action || $action == 'default'}
    {if $list}
        <table class="glike hover" width="100%" cellspacing="0" cellpadding="3" border="0">
            <tr>
                <th>Brand Name</th>
                <th>Url</th>
                <th>Clients</th>
                <th>Status</th>
                    {foreach from=$mbaddons.list item=tpl}
                        {include file=$tpl}
                    {/foreach}
                <th style="width: 100px;"></th>
            </tr>
            {foreach from=$list item=field name=fff}
                <tr>
                    <td>
                        <a href="?cmd={$modulename}&action=edit&id={$field.brand_id}" >{$field.name}</a>
                    </td>

                    <td>
                        <a class="external" href="{$field.url}" target="_blank">{$field.url}</a>
                    </td>
                    <td>
                        {if $stats[$field.name]}
                            {$stats[$field.name]}
                        {else} -
                        {/if}
                    </td>
                    <td>
                        {if $field.active}
                            <span class="Active">Active</span>
                        {else} 
                            <span class="Cancelled">Disabled</span>
                        {/if}
                    </td>
                    {foreach from=$mbaddons.list item=tpl}
                        {include file=$tpl}
                    {/foreach}
                    <td style="white-space: nowrap;">
                        <a href="?cmd={$modulename}&action=edit&id={$field.brand_id}" >Edit</a>
                        {if $field.brand_id!=1}
                            &nbsp;
                            <a href="?cmd={$modulename}&action=preview&id={$field.brand_id}" target="_blank" class="external">Preview</a>
                            &nbsp;
                            <a href="?cmd={$modulename}&action=delete&id={$field.brand_id}&security_token={$security_token}"
                               onclick="return confirm('Are you sure you want to remove this entry?')" style="color: red">Remove</a>                            
                        {/if}
                    </td>
                </tr>
            {/foreach}
        </table>
        {securitytoken}
    {else}
        <div class="blank_state blank_kb">
            <div class="blank_info">
                <h1>Multi Brand</h1>
                Create additional brands on single installation
                <div class="clear"></div>
                <a style="margin-top:10px" href="?cmd={$modulename}&action=add" class="new_add new_menu">
                    <span>Add new Brand</span></a>
                <div class="clear"></div>
            </div>
        </div>
    {/if}
{else}
    {include file="add_edit.tpl"}
{/if}