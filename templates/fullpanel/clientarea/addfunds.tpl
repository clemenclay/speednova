<div class="white-container white-bg ">
    <div class="padding">
        <div class="account-info-container">
            <h2>{$lang.addfunds}</h2>
            <p>{$lang.addfunds_d}</p>
            <span class="underline"></span>

            <form class="form-style" method="post" action="">
                <input type="hidden" name="make" value="addfunds" />
                <fieldset>
                    <label>{$lang.trans_amount}</label>
                    <input class="span2" type="text" name="funds" value="{$mindeposit|price:$currency:false}">

                    <label>{$lang.trans_gtw}</label>
                    <select name="gateway" class="span2">
                        {foreach from=$gateways key=gatewayid item=paymethod}
                            <option value="{$gatewayid}">{$paymethod}</option>
                        {/foreach}
                    </select>
                </fieldset>
                <div class="well well-funds">
                    <div class="pull-right">
                        <button type="submit" class="btn btn-green"><i class="icon-add-w"></i> {$lang.addfunds}</button>
                    </div>
                    <div class="well-info">
                        <p>{$lang.MinDeposit}: <strong>{$mindeposit|price:$currency}</strong></p>
                        <p>{$lang.MaxDeposit}:<strong> {$maxdeposit|price:$currency}</strong></p>
                    </div>
                </div>
                {securitytoken}
            </form>
        </div>
    </div>
</div>
