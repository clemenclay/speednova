{if (($cmd == 'clientarea' &&  ($action == 'details' ||$action == 'password' || $action=='profilepassword' || $action == 'ipaccess' || $action == 'addfunds' || $action == 'invoices' || $action == 'ccard' || $action == 'emails' || $action == 'history')) || $cmd == 'profiles') 
|| ($cmd == 'affiliates' && $affiliate)
|| ($cmd == 'clientarea' && $action == 'services' && !$custom_template && !$widget.replacetpl && $service && in_array('fullpanel',$tpl_path))
|| ($cmd == 'clientarea' && $action == 'domains' && $details)
|| ($cmd == 'knowledgebase' )
|| ($cmd == 'downloads' )
|| ($cmd == 'news' )
|| ($cmd == 'tickets' && $action=='new' && !$ticketcreated)}

{if ($cmd == 'clientarea' &&  ($action == 'details' || $action == 'password' || $action=='profilepassword' || $action == 'ipaccess' || $action == 'addfunds' || $action == 'invoices' || $action == 'ccard' || $action == 'emails' || $action == 'history')) || $cmd == 'profiles'}
    {include file="submenu/account.submenu.tpl"}
{/if}
{if $cmd == 'affiliates' && $affiliate}
    {include file="submenu/affiliates.submenu.tpl"}
{/if}
{if $cmd == 'clientarea' && $action == 'services' && !$custom_template && !$widget.replacetpl && $service && in_array('fullpanel',$tpl_path)}
    {include file="submenu/services.submenu.tpl"}
{/if}
{if $cmd == 'clientarea' && $action == 'domains' && $details}
    {include file="submenu/domains.submenu.tpl"}
{/if}
{if $cmd == 'knowledgebase'}
    {listknowledgebase}
    {include file="submenu/knowledgebase.submenu.tpl"}
{/if}
{if $cmd == 'downloads'}
    {listdownloads}
    {include file="submenu/downloads.submenu.tpl"}
{/if}
{if $cmd == 'news' }
    {include file="submenu/news.submenu.tpl"}
{/if}
{if $cmd == 'tickets' && $action=='new' && !$ticketcreated}
    <div class="knowledgebase">

        <ul class="nav top-btns nav-pills">
            <li><a href="$ca_url}affiliates/"><i class="icon-dl-cross"></i></a></li>
        </ul>
        <div class="shared-hosting-menu">
            <p class="current-categories">Knowledgebase</p>
            <ul id="hintarea">
                {include file="ajax.tickets.tpl" action='kbhint'}
            </ul>
        </div>
    </div>
{/if}
{/if}
