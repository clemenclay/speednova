<ul class="nav-submenu nav nav-stacked">
    {foreach from=$offer item=offe}
        {if $offe.total>0}
            <li>
                <a href="{$ca_url}clientarea/services/{$offe.slug}/" {if $offe.id == $cid}class="active"{/if}> {$offe.name} <span>{$offe.total}</span> </a>
            </li>
        {/if}
    {/foreach}
    {if $offer_domains}
        <li>
            <a href="{$ca_url}clientarea/domains/" {if $cmd == "clientarea" && $action == "domains"}class="active"{/if}>{$lang.domains} <span>{$offer_domains}</span></a>
        </li>
    {/if}
</ul>