

<div style="padding: 10px">
    {if $bad_conf}
        <p style="color: red">
            Missing required details, you will need to update your <a href="?cmd=managemodules&action=other&expand=true&id={$module_id}">Module configuration</a> to fix issues listed below.

        </p>
        {if !$conf.private_key_file.value}
            <p style="color: red">
                <b>Private key file</b> is not defined.
            </p>
        {elseif !$conf.private_key_file.exists}
            <p style="color: red">
                <b>Private key file</b> was not found at <code>{$conf.private_key_file.value}</code>.
            </p>
        {elseif !$conf.private_key_file.readable}
            <p style="color: red">
                <b>Private key file</b> <code>{$conf.private_key_file.value}</code> exists but is not readable.
            </p>
        {/if}

        {if !$conf.certificate_file.value}
            <p style="color: red">
                <b>Certificate file</b> is not defined.
            </p>
        {elseif !$conf.certificate_file.exists}
            <p style="color: red">
                <b>Certificate file</b> was not found at <code>{$conf.certificate_file.value}</code>.
            </p>
        {elseif !$conf.certificate_file.readable}
            <p style="color: red">
                <b>Certificate file</b> <code>{$conf.certificate_file.value}</code> exists but is not readable.
            </p>
        {/if}

        {if !$conf.consumer_secret.value}
            <p style="color: red">
                <b>Consumer Secret</b> is not defined.
            </p>
        {/if}
        {if !$conf.consumer_key.value}
            <p style="color: red">
                <b>Consumer Key</b> is not defined.
            </p>
        {/if}

        <h2>Status: <span style="color: red">Not Connected</span></h2>
        <p>Xero.com requires app authorization</p>

    {elseif $connection == 'Success'}
        <h2>Status: <span style="color: #24cd19">Connected</span></h2>
        <form action="" method="POST">
            <table class="table table-striped form-horizontal">
                <tr>
                    <th>Default bank account</th>
                    <th>
                        <select class="inp" name="bank[default]">
                            {foreach from=$bank item=acc}
                                <option value="{$acc.AccountID}" {if $bankconf.default == $acc.AccountID}selected{/if}>
                                    {$acc.Name}
                                </option>
                            {foreachelse}
                                <option value="">No bank account found</option>
                            {/foreach}
                        </select>
                    </th>
                </tr>
                {foreach from=$modules item=gate}
                    <tr>
                        <td>
                            <span> {$gate.modname} </span>
                        </td>
                        <td>
                            <select class="inp" name="bank[{$gate.id}]">
                                <option value=""> Default bank account</option>
                                {foreach from=$bank item=acc}
                                    <option value="{$acc.AccountID}" {if $bankconf[$gate.id] == $acc.AccountID}selected{/if}>
                                        {$acc.Name}
                                    </option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                {/foreach}
            </table>
            <button type="submit" class="btn btn-primary">{$lang.savechanges}</button>
            {securitytoken}
        </form>

    {else}
        <h2>Status: <span style="color: red">Connection Error</span></h2>
        <div style="background: #fdd; padding: 5px; border-radius: 3px; margin: 5px 0;">
            Error: {$connection}
        </div>
    {/if}
</div>

