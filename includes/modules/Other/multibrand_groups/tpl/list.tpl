{if $field}
    <td>
        {foreach from=$field.config.BrandGroups item=group name=groups}
            {$group}{if !$smarty.foreach.groups.last},{/if}
            {if $smarty.foreach.groups.index > 1}...{break}{/if}
        {foreachelse}
            -
        {/foreach}
    </td>
{else}
    <th>
        Groups
    </th>
{/if}