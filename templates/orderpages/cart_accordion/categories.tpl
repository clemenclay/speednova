<div id="menu">
    <ul>
        {foreach from=$categories item=i name=categories name=cats}
        {if $i.id == $current_cat}
        <li><a href="javascript:void();" class="active">{$i.name}</a></li>
        {else}
        <li><a href="{$system_url}{$ca_url}cart/{$i.slug}/&amp;step={$step}{if $addhosting}&amp;addhosting=1{/if}">{$i.name}</a></li>
        {/if}

        {if not $smarty.foreach.cats.last}<li class="separator"></li>{/if}
        
        {/foreach}
    </ul>
</div>

<div class="clearfix"></div>