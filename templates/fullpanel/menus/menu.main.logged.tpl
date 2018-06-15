

<li class="nav-header no-border"><span>{$lang.mainmenu}</span></li>
<li {if $cmd == 'clientarea' && $action == 'default'}class="active"{/if}>
    <a {if $cmd == 'clientarea' && $action == 'default'} class="active"{/if} href="{$ca_url}clientarea/">
        <i class="icon-mm-dashboard"></i> <span>{$lang.dashboard}</span>
    </a>
</li>
<li >
    <a href="{$ca_url}cart/" {if $cmd == 'cart'}class="small-active"{/if}>
        <i class="icon-mm-order"></i> <span>{$lang.order}</span>
    </a>
    {include file='menus/menu.dropdown.cart.tpl'}
</li>
<li>
    <a href="{$ca_url}clientarea/" {if $cmd == 'clientarea' && ( $action == 'service' || $action == 'services' || $action == 'domains')}class="small-active"{/if}>
        <i class="icon-mm-service"></i>
        <span>{$lang.services}</span>
    </a>
    {include file='menus/menu.dropdown.services.tpl'}
</li>
<li>
    <a href="{$ca_url}clientarea/" {if ($cmd=="clientarea" && ($action=="details" 
|| $action=="password" || $action=="ipaccess" || $action=="addfunds" || $action=="invoices" 
|| $action=="ccard" || $action=="emails" || $action=="history")) || $cmd=="profiles" }class="small-active"{/if}>
        <i class="icon-mm-account"></i> <span>{$lang.account}</span>
    </a>
    {include file='menus/menu.dropdown.account.tpl'}
</li>
<li>
    <a href="{$ca_url}{if $enableFeatures.kb!='off'}knowledgebase/{else}tickets/new/{/if}" {if $cmd == 'support' || 
$cmd == 'tickets' || $cmd == 'downloads' || $cmd == 'knowledgebase'}class="small-active"{/if}>
        <i class="icon-mm-support"></i> <span>{$lang.support}</span>
    </a>
    {include file='menus/menu.dropdown.support.tpl'}
</li>
{if $enableFeatures.affiliates!='off'}
    <li>
        <a href="{$ca_url}affiliates/" {if $cmd == 'affiliates'}class="small-active"{/if}>
            <i class="icon-mm-affiliate"></i> <span>{$lang.affiliates}</span>
        </a>
        {include file='menus/menu.dropdown.affiliates.tpl'}
    </li>
{/if}

{foreach from=$HBaddons.client_mainmenu item=ad}
    <li>
        <a href="{$ca_url}{$ad.link}/"><i class="icon-mm-service"></i> <span>{$ad.name}</span></a>
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