<table class="whitetable" width="100%">
    <tr>
        <th>Account</th>
        <th>Status</th>
        <th>Cancel On</th>
        <th>Customer</th>
        <th>Type</th>

    </tr>
    {foreach from=$cancelrequests item=account}
        <tr>
            <td><a href="?cmd=accounts&action=edit&id={$account.id}">{if $account.domain}{$account.domain}{elseif $account.name}{$account.name}{else}{$account.id}{/if}</a></td>
            <td><span class="{$account.status}">{$account.status}</span></td>
            <td>{$account.next_invoice|dateformat:$date_format} - {$account.left} days left</td>
            <td><a href="?cmd=clients&action=show&id={$acount.client_id}" class="isclient isclient-{$account.group_id}">{$account.firstname} {$account.lastname}</a></td>
            <td>{$account.type}</td>
        </tr>
    {/foreach}
</table>