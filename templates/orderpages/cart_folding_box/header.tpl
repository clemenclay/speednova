<ul class="services-type nav nav-pills">
    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat}{*
            *}<li><strong>{$i.name}</strong></li>
        {/if}
    {/foreach}
    {foreach from=$categories item=i name=categories name=cats}
        {if $i.id != $current_cat}| {*
        *}<li><a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>

        {/if}
    {/foreach}
</ul>


<h1 class="center">{$opconfig.headertext}</h1>
