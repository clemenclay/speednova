<h3>Bulk migration utility</h3>

<label class="nodescr" >Migration scenario</label>
<select name="scenario" class="w250">
    {foreach from=$scenarios item=d key=k}
        <option value="{$k}" >{$d}</option>
        {/foreach}
</select>

<div class="clear"></div>

<label >Server to migrate from <small>All active accounts on this server will be scheduled for migration</small></label>
<select name="server" class="w250">
    <option value="0">None</option>
    {foreach from=$servers item=d key=k}
        <option value="{$d.id}" >{$d.groupname} {$d.name}</option>
        {/foreach}
</select>
<div class="clear"></div>


<label >OR Package to migrate from <small>All active accounts using this package will be scheduled for migration</small></label>
<select name="package"  class="w250">
    <option value="0">None</option>
    {foreach from=$products item=d key=k}
        <option value="{$d.id}" >{$d.catname} - {$d.name}</option>
        {/foreach}
</select>


<div class="clear"></div>



<label >Staff responsible for migration <small>If more than one selected, tasks will be evenly distributed</small></label>
{foreach from=$staff  item=d key=k}
<input type="checkbox" name="staff[]" value="{$k}" style="margin-right:10px" /> {$d} <br/>
{/foreach}


<div class="clear"></div>


<label class="nodescr">Schedule date</label>
<input type="text" name="date_scheduled_d" value="" class="haspicker "><div class="clear"></div>


<label >Schedule time <small>HH:MM</small></label>
<input type="text" name="date_scheduled_h" value="12:00" class=""><div class="clear"></div>
