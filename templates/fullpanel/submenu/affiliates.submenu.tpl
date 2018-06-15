<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="$ca_url}affiliates/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="shared-hosting-menu">
        <h1>{$lang.affiliates}</h1>
        <p>{$lang.affiliatecenter}</p>
        <ul>
            <li{if $action == 'default' || $action == '_default'} class="active" {/if}><a href="{$ca_url}affiliates/" >{$lang.summary} <span></span> </a></li>
            <li{if $action == 'commissions'} class="active" {/if}><a href="{$ca_url}affiliates/commissions/">{$lang.mycommissions} <span></span> </a></li>
            <li{if $action=='payouts'} class="active" {/if}><a href="{$ca_url}affiliates/payouts/" >{$lang.payouts} <span></span> </a></li>
        </ul>
        <p>{$lang.myvouchers}</p>
        <ul>
            <li{if $action=='vouchers'} class="active" {/if}><a href="{$ca_url}affiliates/vouchers/">{$lang.managevouchers} <span></span> </a></li>
            <li{if $action=='addvoucher'} class="active" {/if}><a href="{$ca_url}affiliates/addvoucher/" >{$lang.createnewvoucher} <span></span> </a></li>
        </ul>
    </div>
</div>