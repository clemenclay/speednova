<div class="well-small well-info clearfix">
    <p>{$lang.reflink}: <a class="bold" href="{$system_url}?affid={$affiliate.id}">{$system_url}?affid={$affiliate.id}</a></p>
    <p class="align-r">{$lang.unpaidcommissions} ({$lang.approved} / {$lang.Pending}): <span class="bold">{$affiliate.balance|price:$currency} / {$affiliate.pending|price:$currency}</span></p>
</div>