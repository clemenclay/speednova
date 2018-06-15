<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>Xero Connection</span></a>
            </li>
            <li class="{if $action == 'clients'}active{/if}">
                <a {if $action != 'clients'} href="?cmd={$modulename}&action=clients"{/if}><span>Export Clients</span></a>
            </li>
            <li class="{if $action == 'invoices'}active{/if} last">
                <a {if $action != 'invoices'} href="?cmd={$modulename}&action=invoices"{/if}><span>Export Invoices</span></a>
            </li>
            <li class="{if $action == 'transactions'}active{/if} last">
                <a {if $action != 'transactions'}href="?cmd={$modulename}&action=transactions"{/if}><span>Export Transactions</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2">
        <div class="subm1 haveitems">
            {if $action != 'default'}
                <ul>
                    <li class="">
                        <a href="#export" class="exporter" href="#" queue="push" name="export"><span>Export selected</span></a>
                    </li>
                    <li>
                        <form action="" method="POST">
                            From: 
                            <div id="datefilter" style="display:inline-block; vertical-align: middle">
                                <input type="text" class="haspicker" 
                                       name="filter[from]"  
                                       value="{$currentfilter.from}"/>
                            </div>
                            To
                            <div id="datefilter" style="display:inline-block; vertical-align: middle">
                                <input type="text" class="haspicker" 
                                       name="filter[to]"  
                                       value="{$currentfilter.to}"/>
                            </div>
                            <button type="submit" class="btn btn-success btn-sm">Filter</button>
                        </form>
                    </li>
                    <li>
                        <a href="?cmd=xerocom&action={$action}&resetfilter=1" style="{if $currentfilter}display:inline; color: red{else}display:none{/if}"  class="freseter">{$lang.filterisactive}</a>
                    </li>
                </ul>
            {/if}
        </div>
    </div>
</div>

{if $action == 'default'}
    {include file="settings.tpl"}
{elseif $action == 'clients'}
    {include file="export.tpl"}
{elseif $action == 'invoices'}
    {include file="export.tpl"}
{elseif $action == 'transactions'}
    {include file="export.tpl"}
{/if}