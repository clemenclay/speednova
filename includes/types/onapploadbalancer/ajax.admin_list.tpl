{if $accounts}
    {foreach from=$accounts item=account}
     <tr class="{if $account.manual=='1'}man{/if} {if $account.bw_percent >99 || $account.disk_percent > 99}alert{/if}" >
        <td><input type="checkbox" class="check" value="{$account.id}" name="selected[]"/></td>
        <td><a href="?cmd=accounts&action=edit&id={$account.id}&list={$currentlist}">{$account.id}</a></td>
        <td><a href="?cmd=clients&action=show&id={$account.client_id}">{$account.firstname} {$account.lastname}</a></td>
        <td>{$account.name}</td>
        <td><a href="?cmd=accounts&action=edit&id={$account.id}&list={$currentlist}">{$account.lblabel}</a></td>
        <td>{$account.lbtype|ucfirst}</td>
        <td>{$account.lbport}</td>
        <td>{$account.lbips}</td>


        <td><span class="{$account.status}">{$lang[$account.status]}</span></td>
        <td>{if $account.next_due == '0000-00-00'}-{else}{$account.next_due|dateformat:$date_format}{/if}</td>
        <td><a href="?cmd=accounts&action=edit&id={$account.id}&list={$currentlist}" class="editbtn">{$lang.Edit}</a></td>

        </tr>
    {/foreach}
{/if}