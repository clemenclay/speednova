<ul style="border:solid 1px #ddd;border-bottom:none;margin:15px" id="grab-sorter"> 
    {foreach from=$bans item=ban key=b}
<li style="background:#ffffff" class="power_row"><div style="border-bottom:solid 1px #ddd;">
<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tbody><tr>
<td width="60" valign="top"><div style="padding:10px 0px;">
<a style="width:14px;"  class="menuitm" href="?cmd=bugtracker&action=unban&id={$ban.client_id}&security_token={$security_token}" onclick="return confirm('Are you sure you want to UNBAN this author?');"><span class="rmsth">unban</span></a>
</div></td>

<td width="150"><a href="?cmd=clients&action=show&id={$ban.client_id}" target="_blank">{$ban.firstname} {$ban.lastname}</a></td>
<td> {if $ban.reason} <b>Reason:</b> <em>{$ban.reason}</em>{/if}</td>
</tr>
</tbody></table></div></li>  
{foreachelse}
    <li style="background:#ffffff" class="power_row"><div style="border-bottom:solid 1px #ddd;">
        <center><h3>No bans yet</h3></center>
    </div></li>  
       
{/foreach}
</ul>