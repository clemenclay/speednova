<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}clientarea/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="shared-hosting-menu">
        <h1>Account</h1>
        <p>main account</p>
        <ul>
            <li {if $action == 'details'}class="active"{/if}><a href="{$ca_url}clientarea/details/" ><i class="icon-sh-details"></i> {$lang.details} <span></span> </a></li>
                {if $clientdata.contact_id}
                <li {if $action == 'profilepassword'}class="active"{/if}><a href="{$ca_url}clientarea/profilepassword/" ><i class="icon-sh-pass"></i> {$lang.changepass} <span></span> </a></li>
                {/if}
            <li {if $action == 'password'}class="active"{/if}><a href="{$ca_url}clientarea/password/" ><i class="icon-sh-pass"></i> 
                    {if $clientdata.contact_id}
                        {$lang.changemainpass}
                    {else}
                        {$lang.changepass}
                    {/if}
                    <span></span> </a></li>
            <li {if $cmd == 'profiles'}class="active"{/if}><a href="{$ca_url}profiles/" ><i class="icon-sh-contacts"></i> {$lang.managecontacts} <span></span> </a></li>
                {if $enableFeatures.security=='on'}
                <li {if $action == 'ipaccess'}class="active"{/if}><a href="{$ca_url}clientarea/ipaccess/" ><i class="icon-sh-ip"></i> {$lang.security} <span></span> </a></li>
                {/if}
                {if $enableFeatures.deposit!='off' }
                <li {if $action == 'addfunds'}class="active"{/if}><a href="{$ca_url}clientarea/addfunds/"><i class="icon-sh-funds"></i> {$lang.addfunds} <span></span> </a></li>
                {/if}
            <li {if $action == 'invoices'}class="active"{/if}><a href="{$ca_url}clientarea/invoices/"><i class="icon-sh-invoices"></i> {$lang.invoices} <span></span> </a></li>
            <li {if $action == 'ccard'}class="active"{/if}><a href="{$ca_url}clientarea/ccard/"><i class="icon-sh-cc"></i> {$lang.ccard} <span></span> </a></li>
            <li {if $action == 'emails'}class="active"{/if}><a href="{$ca_url}clientarea/emails/"><i class="icon-sh-emails"></i> {$lang.emails} <span></span> </a></li>
            <li {if $action == 'history'}class="active"{/if}><a href="{$ca_url}clientarea/history/"><i class="icon-sh-logs"></i> {$lang.logs} <span></span> </a></li>
        </ul>
    </div>
</div>