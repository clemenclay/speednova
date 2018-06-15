 <label class="nodescr">Item Type</label>
    <select class="w250" name="p_ihtype" id="p_ihtype" {if $firstblank}onchange="ihtype_change($(this).val())"{/if}>
        {if $firstblank}<option value="0">Select item Type</option>{/if}
        {foreach from=$types item=m key=l}
            <option value="{$l}">{$m}</option>
        {/foreach}
    </select>