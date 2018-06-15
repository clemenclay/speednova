{if $wdo == 'acclist'}
    {foreach from=$accounts item=acc}<option value="{$acc.name}">{$acc.name}</option>{/foreach}
{else}
{foreach from=$lists item=account}
    <tr>
        <td><a href="mailto:{$account.name}" title="Quota: {$account.zimbraMailQuota} MB">{$account.name}</a></td>
        <td>{$account.displayName}</td>
        <td> {$account.count}</td>
        <td style="text-align: right">
            <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&delaccount={$account.id}&domain_id={$account.domainid}&security_token={$security_token}"
               title="Remove this account" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this list?')">
                <i class="icon icon-remove"></i>
            </a>
            {if !$widgetopt.disableedit}
                <a class="edit" href="#edit" title="Edit list" data-toggle="tooltip" 
                   data-id="{$account.id}" 
                   data-email="{$account.mail}" 
                   data-description="{$account.description}"
                   data-name="{$account.displayName}"
                   data-domainid="{$account.domainid}"
                   data-members="{foreach from=$account.members item=acc}{$acc|escape},{/foreach}">
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