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
            {if $action == 'edit'}
                <li class="active last">
                    <a href="#"><span>{$entry.label|truncate}</span></a>
                </li>
            {else}
                <li class="{if $action == 'add'}active last{/if}">
                    <a {if $action != 'add'}href="?cmd={$modulename}&action=add"{/if}><span>New Entry</span></a>
                </li>
            {/if}
        </ul>
    </div>
</div>
<form enctype="multipart/form-data" method="post" action="?cmd={$modulename}&action={$action}" id="plugin_body" >
    {if $action=="edit"}
        <input type="hidden" name="id" value="{$entry.id}" id="entryid"/>
        <input type="hidden" name="edit" value="1"/>
    {else}
        <input type="hidden" name="add" value="1"/>
    {/if}
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td ><label>Label</label></td>
            <td><input type="text" value="{$entry.label}" name="label" class="inp"/></td>
        </tr>
        <tr>
            <td ><label>Hostname / IP Address</label></td>
            <td><input type="text" value="{$entry.host}" name="host" class="inp" placeholder="eg: https://site.com/"></td>
        </tr>
        <tr>
            <td ><label>Username</label></td>
            <td><input type="text" value="{$entry.username}" name="username" class="inp"></td>
        </tr>
        <tr>
            <td ><label>Password</label></td>
            <td>
                <input type="password" value="{$entry.password}" name="password" class="inp" id="password" style="min-width: 279px;">
                <button onclick="pm.generate(); return false;" >Generate</button>
            </td>
        </tr>
        <tr>
            <td ><label>Description</label></td>
            <td><textarea name="description" class="inp">{$entry.description}</textarea></td>
        </tr>
    </table>
    {if in_array(8,$adminacl)}
        <table cellpadding="5">
            <tr>
                <th>Staff member privileges</th>
                <th style="width: 20px;"><img src="{$moduleurl}icons/Eye.png" /></th>
                <th style="width: 20px;"><img src="{$moduleurl}icons/Pencil.png" /></th>
                <th style="width: 20px;"><img src="{$moduleurl}icons/Bin.png" /></th>
            </tr>
            {foreach from=$adminlist item=admin}
                {if $ownerid == $admin.id}
                    <tr>
                        <td>{$admin.username}</td>
                        <td><input name="acl[{$admin.id}][]" type="checkbox" checked="checked" disabled="disabled" /></td>
                        <td><input name="acl[{$admin.id}][]" type="checkbox" checked="checked" disabled="disabled" /></td>
                        <td><input name="acl[{$admin.id}][]" type="checkbox" checked="checked" disabled="disabled" /></td>
                    </tr>
                {/if}
            {/foreach}

            {foreach from=$adminlist item=admin}
                {if $ownerid != $admin.id}
                    <tr>
                        <td>{$admin.username}</td>
                        <td><input name="acl[{$admin.id}][]" {if !in_array(1,$adminacl)}disabled="disabled"{/if}{if in_array(1,$entry.acl[$admin.id])}checked="checked"{/if} type="checkbox" value="1" /></td>
                        <td><input name="acl[{$admin.id}][]" {if !in_array(2,$adminacl)}disabled="disabled"{/if}{if in_array(2,$entry.acl[$admin.id])}checked="checked"{/if} type="checkbox" value="2" /></td>
                        <td><input name="acl[{$admin.id}][]" {if !in_array(4,$adminacl)}disabled="disabled"{/if}{if in_array(4,$entry.acl[$admin.id])}checked="checked"{/if} type="checkbox" value="4" /></td>
                    </tr>
                {/if}
            {/foreach}
        </table>
    {/if}
    <div class="clearfix">
        <button type="submit">Save Changes</button>
    </div>
</form>
<script type="text/javascript" src="{$moduleurl}hideShowPassword.min.js"></script>
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