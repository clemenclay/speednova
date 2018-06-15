{if $wdo == 'members'}
    {foreach from=$members item=acc}<option value="{$acc.emailAddress}">{$acc.emailAddress}</option>{/foreach}
{else}
{foreach from=$lists item=account}
    <tr data-id="{$account.id}"
        data-domainid="{$account.domainId}"
        data-name="{$account.name}"
        data-description="{$account.description}">
        <td>{$account.name}</td>
        <td><a href="mailto:{$account.email}" >{$account.email}</a></td>
        <td> {$account.description|escape}</td>
        <td> {$account.membersCount}</td>
        <td style="text-align: right">
            <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&delaccount={$account.id}&domain_id={$account.domainId}&security_token={$security_token}"
               title="Remove this account" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this list?')">
                <i class="icon icon-remove"></i>
            </a>
            {if !$widgetopt.disableedit}
                <a class="edit" href="#edit" title="Edit list" data-toggle="tooltip" data-action="editAccount">
                    <i class="icon icon-edit"></i>
                </a>
            {/if}
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="6">{$lang.nothing}</td>
    </tr>
{/foreach}
{/if}