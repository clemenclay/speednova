{foreach from=$accounts item=account}
    <tr>
        <td><a href="mailto:{$account.name}" title="Quota: {$account.zimbraMailQuota} MB">{$account.name}</a><br/>{$account.displayName}</td>
        <td> {$account.cos}</td>
        <td>
            <div class="quotaDiv {if $account.quota.percent > 75}red{/if}" >
                <div style="width:{if $account.quota.percent}{$account.quota.percent}{else}0{/if}%">
                    <span>{$account.quota.used}{if $account.quota.limitb} / {$account.quota.limit}{/if}</span>
                </div>
                <div>{$account.quota.used}{if $account.quota.limitb} / {$account.quota.limit}{/if}</div>
            </div>
        </td>

        <td style="text-align: right">
            {if $limits.quota && $limits.quota.limit > 0 && $account.cosQuota }
                <a class="iquota" href="#quota" data-toggle="tooltip"
                   title="Increase quota"
                   data-min="{$account.cosQuota}"
                   data-limit="{$account.zimbraMailQuota}"
                   data-id="{$account.id}"
                   data-name="{$account.name}"
                   data-cosid="{$account.zimbraCOSId}"
                   data-domainid="{$account.domainid}"
                >
                    <i class="icon icon-resize-full"></i>
                </a>
            {/if}
            <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&delaccount={$account.id}&domain_id={$account.domainid}&security_token={$security_token}"
               title="Remove this account" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this account?')">
                <i class="icon icon-remove"></i>
            </a>
            {if !$widgetopt.disableedit}
                <a class="edit" href="#edit" title="Edit account" data-toggle="tooltip" 
                   data-id="{$account.id}" 
                   data-lastname="{$account.sn}" 
                   data-firstname="{$account.givenName}" 
                   data-quota="{$account.zimbraMailQuota}"
                   data-name="{$account.name}"
                   data-domainid="{$account.domainid}"
                   data-cosid="{$account.zimbraCOSId}">
                    <i class="icon icon-edit"></i>
                </a>
            {/if}
            {*if (!$limits.archive || $limits.archive.left > 0 || $account.zimbraArchiveEnabled) && !$widgetopt.disablearhive && $account.zimbraArchiveEnabled_enabled*}
                <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&archiveaccount={$account.id}&domain_id={$account.domainid}&security_token={$security_token}"
                   title="{if !$account.zimbraArchiveEnabled}Enable archiving{else}Disable archiving{/if}" data-toggle="tooltip">
                    {if !$account.zimbraArchiveEnabled}<i class="icon icon-folder-close"></i>
                    {else}<i class="icon icon-folder-open"></i>
                    {/if}
                </a>
            {*/if*}
        </td>
    </tr>
{foreachelse}
    <tr>
        <td colspan="6">{$lang.nothing}</td>
    </tr>
{/foreach}
