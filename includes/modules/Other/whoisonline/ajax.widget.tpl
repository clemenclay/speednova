{if !$clients_online}
    No registered clients are online now
{else}
    {foreach from=$clients_online item="client"}
         <a href="?cmd=clients&action=show&id={$client.id}" class="isclient isclient-{$client.group_id}"><i class="fa fa-user"></i> #{$client.id} {$client.firstname} {$client.lastname}</a> &nbsp;&nbsp;&nbsp;&nbsp;
    {/foreach}

{/if}