<div class="white-container white-bg">
    <div class="padding">

        <div class="affiliates-box">
            {include file="affiliates/affiliates.top.tpl"}
            <h2>{$lang.withdrawallogs}</h2>
            <div class="table-box m20 overflow-h">
                <div class="table-header">
                </div>
                <table class="table table-header-fix table-striped p-td">
                    <tr>
                        <th>{$lang.date}</th>
                        <th>{$lang.withdrawn}</th>
                        <th>{$lang.note}</th>
                    </tr>
                    {foreach from=$logs item=log name=logs}
                        <tr>
                            <td>{$log.date|dateformat:$date_format}</td>
                            <td>{$log.amount|price:$affiliate.currency_id}</td>
                            <td>{$log.note}</td>
                        </tr>
                    {/foreach}
                </table>
                {if !$logs}
                    <div class="table-content">
                        <p class="text-center">Nothing to display</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

