{if $valx=='sizes'} 
    <select id="sizes" name="options[sizes]">
        {foreach from=$modvalues item=size}
            <option value="{$size.slug}" {if $defval == $size.slug}selected="selected"{/if}>{$size.slug}</option>
        {/foreach}
    </select>
{elseif $valx=='regions'} 
    <select id="regions" name="options[regions]">
        {foreach from=$modvalues item=region key=title}
            <option value="{$region.slug}"  {if $defval == $region.slug}selected="selected"{/if}>{$region.name}</option>
        {/foreach}
    </select>
{elseif $valx=='images'} 
    <select id="images" name="options[images]">
        {foreach from=$modvalues item=image key=title}
            <option value="{$image.id}"  {if $defval == $image.id}selected="selected"{/if}>{$image.distribution} - {$image.name}</option>
        {/foreach}
    </select>
{/if}

