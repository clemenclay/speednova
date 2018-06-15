<div class="modal fade" role="dialog" tabindex="-1" id="netBandwidth">
    <form action="" method="POST" style="margin: 0">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h2 id="myModalLabel">{$lang.purchaseadditionalbandwidth}</h2>
        </div>

        <div class="modal-body">
            <div class="description">
                {$addbandwidth.description}
            </div>

            {foreach from=$addbandwidth.items item=opt key=k}
                <div>
                    <div class="radio">
                        <input id="bandwidth{$k}" type="radio" name="addbandwidth" value="{$k}" {if $k==0}checked{/if} />
                        <label for="bandwidth{$k}" >
                            {$lang.additional}

                            {if $opt.data_sent && $stats.data_sent}
                                <strong>{$opt.data_sent} {$stats.data_sent.unit} {$lang[$stats.data_sent.lang]|default:$stats.data_sent.name}</strong>
                                {if $opt.data_received && $stats.data_received} &{/if}
                            {/if}
                            {if $opt.data_received && $stats.data_received}
                                <strong>{$opt.data_received} {$stats.data_received.unit} {$lang[$stats.data_received.lang]|default:$stats.data_received.name}</strong>
                            {/if}

                            {$lang.for} {$opt.price|price:$currency}
                        </label>
                    </div>
                </div>
            {/foreach}

        </div>

        <div class="modal-footer">
                <span class="pull-right">
                    <button type="submit" class="default btn btn-flat-primary btn-primary">{$lang.confirm}</button>
                    <button type="button" data-dismiss="modal" aria-hidden="true" class="default btn hide-modal">{$lang.cancel}</button>
                </span>
        </div>
        {securitytoken}
    </form>
</div>