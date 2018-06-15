
<div class="shared-hosting-example">
    <ul class="nav nav-list sh-menu pull-left">
        <li class="no-border {if $action=='details'} active {/if}">
            <a href="{$ca_url}clientarea/details/">
                <div class="sh-icon"><i class="icon-user"></i></div>
                <p class="sh-text">{$lang.mydetails}</p>
            </a>
        </li>
        {if $clientdata.contact_id}
            <li {if $action=='profilepassword'} class="active" {/if}>
                <a href="{$ca_url}clientarea/profilepassword/">
                    <div class="sh-icon"><i class="icon-unlock"></i></div>
                    <p class="sh-text">        
                        {$lang.changemypass}
                    </p>
                </a>
            </li>
        {/if}
        <li {if $action=='password'} class="active" {/if}>
            <a href="{$ca_url}clientarea/password/">
                <div class="sh-icon"><i class="icon-unlock"></i></div>
                <p class="sh-text">        
                    {if $clientdata.contact_id}
                        {$lang.changemainpass}
                    {else}
                        {$lang.changepass}
                    {/if}
                </p>
            </a>
        </li>
        {if $enableFeatures.deposit!='off' }
            <li {if $action=='addfunds'} class="active" {/if}>
                <a href="{$ca_url}clientarea/addfunds/">
                    <div class="sh-icon"><i class="icon-plus-sign"></i></div>
                    <p class="sh-text">{$lang.addfunds}</p>
                </a>
            </li>
        {/if}
        {if $enableCCards}
            <li {if $action=='ccard'} class="active" {/if}>
                <a href="{$ca_url}clientarea/ccard/">
                    <div class="sh-icon"><i class="icon-credit-card"></i></div>
                    <p class="sh-text">{$lang.ccard}</p>
                </a>
            </li>
        {/if}
        {if $enableACH}
            <li {if $action=='ach'} class="active" {/if}>
                <a href="{$ca_url}clientarea/ach/">
                    <div class="sh-icon"><i class="icon-credit-card"></i></div>
                    <p class="sh-text">{$lang.ACHecheck}</p>
                </a>
            </li>
        {/if}
        <li {if $cmd=='profiles'} class="active" {/if}>
            <a href="{$ca_url}profiles/">
                <div class="sh-icon"><i class="icon-phone"></i></div>
                <p class="sh-text">{$lang.profiles}</p>
            </a>
        </li>
        {if $enableFeatures.security=='on'}
            <li {if $action=='ipaccess'} class="active" {/if}>
                <a href="{$ca_url}clientarea/ipaccess/">
                    <div class="sh-icon"><i class="icon-cloud-upload"></i></div>
                    <p class="sh-text">{$lang.ipaccess}</p>
                </a>
            </li>
        {/if}
    </ul>

