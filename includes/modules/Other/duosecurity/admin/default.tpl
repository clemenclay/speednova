
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="active last">
                <a><span>User mapping</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1" style="display: block; height: 20px;">
        </div>
    </div>
</div>
<div >
    <table class="whitetable" width="100%" cellspacing=0>
        <tr>
            <th style="width: 160px">Local User</th>
            <th>DuoSecurity User</th>
            <th style="width: 160px"></th>
        </tr>
        {foreach from=$list item=map}
            <tr class="havecontrols ">
                <td style="padding-left: 10px">
                    <a href="?cmd=editadmins&action=administrator&id={$map.id}" >{$map.username}</a>
                </td>
                <td>
                    {$map.alias}
                </td>
                <td>
                    <a title="Delete" class="delbtn" href="?cmd={$modulename}&action=delete&id={$map.id}&security_token={$security_token}"></a>
                </td>
            </tr>
        {foreachelse}
            <tr>
                <td colspan="3" style="text-align: center">Nor user mapping defined</td>
            </tr>
        {/foreach}
    </table>
</div>
<form method="post" action="?cmd={$modulename}" id="status_plugin"  style="padding: 10px 0;width: 50%; float: left">
    <input name="make" value="add" type="hidden"/>
    <table cellpadding="5" style="width: 100%">
        <tr>
            <td style="width: 140px; text-align: right"><label>User</label></td>
            <td>
                <select name="user_id" class="inp">
                    {foreach from=$staff item=user}
                        <option value="{$user.id}">#{$user.id} {$user.username}</option>
                    {/foreach}
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top"><label>DuoSecurity User</label>
                <a class="vtip_description" title="Selected user will be mapped to this login name"></a></td>
            <td >
                <input class="inp" type="text" name="alias" value="" placeholder="Username"/>
            </td>
        </tr>
    </table>
    <div class="clearfix" style="padding: 0 10px;">
        <button type="submit">Add Mapping</button>
    </div>
    {securitytoken}
</form>

