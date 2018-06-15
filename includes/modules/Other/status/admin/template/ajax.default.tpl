
{foreach from=$statuses item=entry}
    <tr class="havecontrols">
        <td>{$entry.date}</td>
        <td><a href="?cmd=status&action=edit&id={$entry.id}">{$entry.name}</a></td>
        <td>{if $lang[$entry.status]}{$lang[$entry.status]}{else}{$entry.status}{/if}</td>
        <td>{$entry.relatedinfo|escape|truncate}</td>
        <td>
            {foreach from=$staff item=admin}
                {if $admin.id == $entry.author}
                    {$admin.firstname} {$admin.lastname}
                    {break}
                {/if}
            {/foreach}
        </td>
        <td>
            <div>
                <a title="Update Status" class="menuitm menuf" href="?cmd=status&action=update&id={$entry.id}">
                    <span class="addsth" style="padding: 0 7px"></span>
                </a> <a title="Edit" class="menuitm menuc" href="?cmd=status&action=edit&id={$entry.id}">
                    <span class="editsth"></span>
                </a><!--
                --><a title="Delete" class="menuitm menul" href="?cmd=status&action=delete&id={$entry.id}&security_token={$security_token}" onclick="return confirm('Are you sure you wantto remove this status?')">
                    <span class="delsth"></span>
                </a>
            </div>
        </td>
    </tr>
{/foreach}
