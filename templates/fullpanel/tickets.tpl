
{if $newticket}
    {include file='support/addticket.tpl'}
{/if}
{if $ticketcreated}
<div class="wrapper-bg">
    <div class="service-white-bg">
        <div class="text-block clear clearfix">
            <div id="loginbox_container">
                <div class="wbox">
                    <div class="wbox_header">{$lang.ticketcreated} <a href="{$ca_url}tickets/view/{$tnum}/&amp;hash={$thash}">#{$tnum}</a></div>
                    <div class="wbox_content">
                        <div class="alert alert-info">
                           {$lang.tcreatednfo}
                        </div>
                        <center>
                            <a href="{$ca_url}tickets/view/{$tnum}/&amp;hash={$thash}" class="clearstyle btn green-custom-btn l-btn">{$lang.viewticket}</a>
                            <a href="{$ca_url}" class="clearstyle btn grey-custom-btn l-btn">{$lang.back}</a>
                            
                        </center>
                        
                    </div>
                </div>
            </div>
		</div>
	</div>
</div>

{/if}
{if $ticket}
    {include file='support/viewticket.tpl'}
{elseif $action=='default' || $action=='_default' }
    {include file='support/listtickets.tpl'}
{/if}




