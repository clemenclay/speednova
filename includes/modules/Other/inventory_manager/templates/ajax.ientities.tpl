 <label class="nodescr">Item</label>
    <select class="w250" name="p_ientity" id="p_ientity">
        {foreach from=$entities item=m}
            <option value="{$m.id}">#{$m.id} SN:{$m.sn} BY:{$m.manufacturer}</option>
        {/foreach}
    </select>