<h3>Enter quickfix that would go straight to changelog</h3>

<label class="nodescr">Fixed in version:</label>

<input type="text" name="version" value="{$bug.version}" style="width:50px;" />


<div class="clear"></div>


 <label class="nodescr">Category</label>
 <select name="category_id" class="w250" >
    {foreach from=$categories item=category}
            <option value="{$category.id}" {if $category.id==$bug.category_id}selected="selected"{/if}>{$category.name}</option>
    {/foreach}
</select>
<div class="clear"></div>

<label class="nodescr">Subject</label>
<input type="text" name="subject" value="{$bug.subject}" style="width:450px;"  />
<div class="clear"></div>
