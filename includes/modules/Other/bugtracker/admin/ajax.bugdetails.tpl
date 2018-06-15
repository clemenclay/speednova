<h3>Bug details: #{$bug.id} - {$bug.subject}</h3>


<label class="nodescr">Subject</label>
<input type="text" name="subject" value="{$bug.subject}" style="width:450px;"  />
<div class="clear"></div>
<label class="nodescr">Version / severity</label>

<input type="text" name="version" value="{$bug.version}" style="width:50px;clear:none;" />

<input type="text" name="votes" value="{$bug.votes}" style="width:20px;"  />
<div class="clear"></div>

 <label class="nodescr">Category</label>
 <select name="category_id" class="w250" >
    {foreach from=$categories item=category}
            <option value="{$category.id}" {if $category.id==$bug.category_id}selected="selected"{/if}>{$category.name}</option>
    {/foreach}
</select>

<label>Description</label>
<div class="w250 left" style="clear: right; margin: 2px 0px 10px 10px;">
    <textarea name="description" class="inp " cols="" rows="" style="margin:0px;width:450px;height:150px;" >{$bug.description}</textarea>
</div>
<div class="clear"></div>