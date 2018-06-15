{foreach from=$accounts item=account}
    <tr data-id="{$account.id|escape}"
        data-loginname="{$account.loginName|escape}"
        data-fullname="{$account.fullName|escape}"
        data-domainid="{$account.domainId|escape}"
        data-addedquota="{$account.quota.addedmb}"
        data-quota="{$account.quota.limitmb}">
        <td>{$account.loginName}</td>
        <td>
            {foreach from=$account.emailAddresses item=email name=list}
                <a href="mailto:{$email}">{$email}</a>{*}
                {*}{if !$smarty.foreach.list.last}, {/if}
            {/foreach}
        </td>
        <td>
            <div class="quotaDiv {if $account.quota.percent > 75}red{/if}" >
                <div style="width:{$account.quota.percent}%">
                    <span>{$account.quota.used}{if $account.quota.enabled} / {$account.quota.limit}{/if}</span>
                </div>
                <div>{$account.quota.used}{if $account.quota.enabled} / {$account.quota.limit}{/if}</div>
            </div>
        </td>
        <td>
            {if $limits.quota && $limits.quota.limit > 0 && $account.quota.enabled && $limits.quota.left > 0 }
                <a class="iquota" href="#quota" title="Increase quota" data-toggle="tooltip" data-action="resizeAccount">
                   <i class="icon icon-resize-full"></i>
                </a>
            {/if}
        </td>
        <td style="text-align: right">
            {if $account.role.userRole == "UserRole"}
                <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&delaccount={$account.id}&domain_id={$account.domainId}&security_token={$security_token}"
                   title="Remove this account" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this account?')">
                    <i class="icon icon-remove"></i>
                </a>
            {/if}
            {if !$widgetopt.disableedit}
                <a class="edit" href="#edit" title="Edit account" data-toggle="tooltip" data-action="editAccount">
                    <i class="icon icon-edit"></i>
                </a>
            {/if}

            {*}<a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/#webmail"
            title="Access webmail" data-toggle="tooltip" data> <i class="icon icon-inbox"></i>
            </a>{*}
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="6">{$lang.nothing}</td>
    </tr>
{/foreach}
