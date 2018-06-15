<link type="text/css" rel="stylesheet" href="{$moduleurl}pm_styles.css" />
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>List</span></a>
            </li>
            <li class="{if $action == 'log'}active{/if}">
                <a {if $action != 'log'}href="?cmd={$modulename}&action=log"{/if}><span>Audit log</span></a>
            </li>
            <li class="{if $action == 'add'}active{/if} last">
                <a {if $action != 'add'}href="?cmd={$modulename}&action=add"{/if}><span>New Entry</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1" style="display: block; height: 20px;">
        </div>
    </div>
</div>
{if $list}
    <div >
        <table class="whitetable" width="100%" cellspacing=0>
            <tr>
                <th>Label</th>
                <th>Host</th>
                
                <th>Username</th>
                <th width="20%">Password</th>
                <th>Description</th>
                <th style="width: 60px"></th>
            </tr>
            {foreach from=$list item=entry}
                <tr class="havecontrols">
                    <td>
                        {if in_array(2,$entry.acl)}
                            <a href="?cmd={$modulename}&action=edit&id={$entry.id}" onclick="return pm.getauth();">{$entry.label}</a>
                        {else}
                            {$entry.label}
                        {/if}
                    </td>
                    <td>{if $entry.host}<a href="{$entry.host}" target="_blank">{$entry.host}</a>{else}-{/if}</td>
                    <td>{if $entry.username}{$entry.username}{else}-{/if}</td>
                    <td id="pass{$entry.id}">
                        <span>**************</span>
                        {if in_array(1,$entry.acl)}
                            <a title="View" id="view{$entry.id}" onclick="pm.showpass('{$entry.id}'); return false;" class="btn_ btn_view" href="?cmd={$modulename}&action=view&id={$entry.id}&security_token={$security_token}" ></a>
                        {/if}
                    </td>
                    <td>
                        {if $entry.description}{$entry.description}{else}-{/if}
                    </td>
                    <td>
                        {if in_array(2,$entry.acl)}
                            <a title="Edit" onclick="return pm.getauth();"  class="btn_ btn_edit" href="?cmd={$modulename}&action=edit&id={$entry.id}" ></a>
                        {/if}
                        {if in_array(4,$entry.acl)}
                            <a title="Delete" class="btn_ btn_delete" href="?cmd={$modulename}&action=delete&id={$entry.id}&security_token={$security_token}" 
                               onclick="if(pm.getauth()) return confirm('Are you sure you wantto remove this entry?'); return false;">
                            </a>
                        {/if}
                    </td>
                </tr>
            {/foreach}
        </table>
    </div>
{else}
    <div class="blank_state blank_kb">
        <div class="blank_info">
            <h1>Password manager</h1>
            You can add new entry from here.
            <div class="clear"></div>
            <a style="margin-top:10px" href="?cmd={$modulename}&action=add" class="new_add new_menu">
                <span>Add new entry</span></a>
            <div class="clear"></div>
        </div>
    </div>
{/if}
<script type="text/javascript" src="{$template_dir}js/facebox/facebox.js"></script>
<script type="text/javascript" src="{$moduleurl}pm_script.js"></script>
<link rel="stylesheet" href="{$template_dir}js/facebox/facebox.css" type="text/css" />
<div style="display: none" id="authorize">
    <form>
        <h3>Before you will be able to continue, you need to re-enter your admin area password</h3>
        <h4>Password:</h4>
        <div>
            <input name="password" class="foc2" type="password">
            <input type="submit" value="Confirm" style="padding:3px 6px;font-weight:bold">
        </div>
    </form>
</div>