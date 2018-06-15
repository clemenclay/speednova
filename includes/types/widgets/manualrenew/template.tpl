<div class="wbox">
        <div class="wbox_header">
            {$lang.manualrenew}
        </div>
        <div class="wbox_content">
            {if $notsupportedcycle}
                {$lang.manualrenew_notsupported}

            {elseif $unpaidinvoice}
                {$lang.manualrenew_unpaidinvoice} <a href="{$ca_url}clientarea/invoice/{$unpaidinvoice.id}/" >{$unpaidinvoice|@invoice}</a>

            {else}
                <form action="" method="post">
                    <input type="hidden" name="make" value="issueinvoice" />
                    {$lang.manualrenew_guide}<br/>
                    <input type="submit" class="btn btn-primary" value="{$lang.manualrenew_now}" onclick="return confirm('{$lang.manualrenew_confirm}');" />
                {securitytoken}</form>
            {/if}

        </div>
</div>

