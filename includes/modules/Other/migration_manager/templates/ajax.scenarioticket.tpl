<h3>When migration starts new ticket can be opened for related client</h3>


<label >Open new ticket <small>when migration starts </small></label>
<input type="checkbox"  name="ticket" value="1" {if $scenario.ticket=='1'}checked="checked"{/if} />
<div class="clear"></div>

<label class="nodescr">Department</label>
<select name="ticket_department">
    {foreach from=$departments item=d key=k}
        <option value="{$k}" {if $k==$scenario.ticket_department}selected="selected"{/if}>{$d}</option>
        {/foreach}
</select>
<div class="clear"></div>



    <label class="nodescr">Ticket subject</label>
    <input type="text"  style="width:450px" class="w250" name="ticket_subject" value="{$scenario.ticket_subject}" />
    <div class="clear"></div>
    
    
    <label class="nodescr">Ticket message</label>
    <textarea name="ticket_body" class="inp" cols="" rows="" style="width:450px;height:150px;">{$scenario.ticket_body}</textarea>
    <div class="clear"></div>