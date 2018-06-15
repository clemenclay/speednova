<h3>To close, set to resolved or not-an-issue</h3>


<label>Resolved in: <small>Optional, version num</small></label>
<input type="text" name="resolved_version" value="{$bug.resolved_version}" />
<div class="clear"></div>

 <label class="nodescr">Status</label>
 <select name="status" class="w250" >
            <option value="Open" {if $bug.status=='Open'}selected="selected"{/if}>Open</option>
            <option value="Resolved" {if $bug.status=='Resolved'}selected="selected"{/if}>Resolved</option>
            <option value="Not-A-Bug" {if $bug.status=='Not-A-Bug'}selected="selected"{/if}>Not-A-Bug</option>
</select>
<div class="clear"></div>

<label>Staff comment <small>Optional</small></label>
<div class="w250 left" style="clear: right; margin: 2px 0px 10px 10px;">
    <textarea name="admin_comment" class="inp " cols="" rows="" style="margin:0px;width:450px;height:100px;" >{$bug.admin_comment}</textarea>
</div>
<div class="clear"></div>