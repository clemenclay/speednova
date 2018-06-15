<!-- Single button -->
<div class="btn-group">
    <button type="button" class="btn btn-sm btn-default" >
        Nexmo Verify:
    </button>
    <button type="button" class="btn btn-sm {if $notverified}btn-danger{else}btn-primary{/if} dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <strong>{if $notverified}NOT-VERIFIED{else}VERIFIED{/if}</strong>  <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
        {if !$notverified}<li><a href="?cmd=nexmoverify&action=setnotverified&client_id={$client.client_id}">Set to: not-verified</a></li>{/if}
        {if $notverified}<li><a href="?cmd=nexmoverify&action=setverified&client_id={$client.client_id}">Set to: verififed</a></li>{/if}
    </ul>
</div>