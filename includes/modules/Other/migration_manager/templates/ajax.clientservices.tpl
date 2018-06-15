<label class="nodescr">Related service</label>
<select name="related_account_id" >
    <option value="0">None</option>
    {foreach from=$accounts item=d key=k}
        <option value="{$d.id}" {if $d.id==$case.related_account_id}selected="selected"{/if}>#{$d.id} {$d.domain}</option>
        {/foreach}
</select>
<div class="clear"></div>