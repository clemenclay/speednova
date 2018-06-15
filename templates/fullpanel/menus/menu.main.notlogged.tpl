<li class="nav-header"><div>{$lang.mainmenu}</div></li>
<li>
    <a href="{$ca_url}">
        <i class="icon-mm-dashboard"></i> <span>{$lang.homepage}</span>
    </a>
</li>

<li >
    <a href="{$ca_url}cart/" {if $cmd == 'cart'}class="small-active"{/if}>
        <i class="icon-mm-order"></i> <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>

<li>
    <a href="{$ca_url}clientarea/" {if $cmd == 'clientarea'}class="small-active"{/if}>
        <i class="icon-mm-service"></i> <span>{$lang.clientarea}</span>
    </a>
</li>

<li>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}">
        <i class="icon-mm-support"></i> <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>

{if $enableFeatures.affiliates!='off'}
    <li>
        <a href="{$ca_url}affiliates/">
            <i class="icon-mm-affiliate"></i> <span>{$lang.affiliates}</span>
        </a>
    </li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
    <li>
        <a href="{$ca_url}{$ad.link}/">
            <i class="icon-mm-service"></i> <span>{$ad.name}</span>
        </a>
    </li>
{/foreach}

{if $infopages}
    <li>
        <a href="#">
            <i class="icon-mm-support"></i> <span>{$lang.moreinfo}</span>
        </a>
        <ul class="nav-submenu nav nav-stacked">
            {foreach from=$infopages item=paged}
                <li>
                    <a href="{$ca_url}page/{$paged.url}/" >{$paged.title}</a>
                </li>
            {/foreach}
        </ul>  
    </li>
{/if}


