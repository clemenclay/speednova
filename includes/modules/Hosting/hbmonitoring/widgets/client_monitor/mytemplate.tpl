<div class="left">{if $allowadd}
    <a href="#" class="btn btn-info" onclick="$('#addhost').toggle();return false;" ><i class="icon-plus-sign icon-white"></i> Add new host to monitor</a>
    {else}
        <h2>Monitored hosts</h2>
{/if}
</div>
<div class="right">
{if $hosts}
    <b>Host:</b> 
    <select onchange="changeHostMon($(this).val())">
        <option value="0">Select host</option>
    {foreach from=$hosts item=h}
        <option value="{$h._id}" {if $check._id==$h._id}selected="selected"{/if} {if !$h.isUp}style="background:#ee5f5b"{/if}>{$h.name}</option>
        {/foreach}
    </select>
    
    {/if}

</div>    
    

<div class="clear"></div>
    
    

{if $allowadd}
    <form id="addhost" style="display:none;margin:20px 0px;" action="" method="post">
    
        <input type="hidden" name="make" value="addhost" />
        <table border="0" cellpadding="3" cellspacing="0" width="100%" class="fullscreen table" >
 
    <tr>
        <td style="padding-top:15px;font-weight:bold">Hostname</td>
        <td>
            <input name="newhostname" style="width:350px;" type="text"/>
        </td>
        <td><input type="submit" value="Submit" class="btn" /></td>
    </tr>
    </table>
        {securitytoken}
    </form>

{/if}


{if $check}
    
    {include file=$checktpl}
    {/if}


<script>
    var u = "{$widurl}";
    {literal}
    function changeHostMon(id) {
    if(!id) {
        return;
        }
        window.location=u+"&_id="+id;
    }
    
    {/literal}
    </script>