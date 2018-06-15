<ul class="nav-submenu nav nav-stacked">
    {foreach from=$orderpages item=op}
        <li>
            <a href="{$ca_url}cart/{$op.slug}/" {if $current_cat == $op.id}class="active"{/if}>{$op.name}</a>
        </li>
    {/foreach}
</ul>