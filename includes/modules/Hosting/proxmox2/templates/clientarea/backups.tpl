
<table class="tonapp"  width="100%" cellspacing=0>
    <thead>
        <tr>
            <td>{$lang.date}</td>
            <td>File</td>
            <td>Format</td>
            <td>{$lang.size}</td>
            <td>&nbsp;</td>
        </tr>
    </thead>
    {foreach item=backup from=$backups}
        <tr>
            <td>{$backup.date}</td>
            <td>{$backup.name}</td>
            <td>{$backup.format}</td>
            <td>{$backup._size}B</td>
            <td width="60" >
                <a href="{$service_url}&vpsid={$vpsid}&vpsdo=backups&do=restore&backupid={$backup.id|escape:'url'}&security_token={$security_token}" 
                   onclick="return confirm('{$lang.suretorestorebkp}')" class="small_control small_backup_restore fs11">{$lang.restore}</a>
                <a href="{$service_url}&vpsid={$vpsid}&vpsdo=backups&do=delete&backupid={$backup.id|escape:'url'}&security_token={$security_token}" 
                   onclick="return confirm('{$lang.suretodeletebkp}')" class="small_control small_delete fs11">{$lang.delete}</a>
            </td>
        </tr>
    {foreachelse}
        <tr>
            <td colspan="7">{$lang.nothing}</td>
        </tr>
    {/foreach}
</table>
<div style="padding: 10px 0; text-align: right">
    <a href="{$service_url}&vpsid={$vpsid}&vpsdo=backups&do=create&security_token={$security_token}" 
       class="btn btn-primary" >Create backup</a>
</div>

