{include file="`$onappdir`firewall_header.tpl"}
<form action="" method="POST" class="form-horizontal" id="firewall-form">
    <input type="hidden" value="update" name="do" />
    <table class="tonapp"  width="100%" cellspacing="0" style="border-top:solid 1px #DDDDDD;">
        <thead>
            <tr>
                <td>Option</td>
                <td>Value</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td width="120">
                    <b>Enable Firewall</b>
                </td>
                <td>
                    <select name="options[enable]">
                        <option value="0">No</option>
                        <option value="1" {if $options.enable}selected="selected"{/if}>Yes</option>
                    </select>
                </td>
            </tr>
            <tr>
                 <td><b>Enable DHCP</b> </td>
                <td>
                    <select name="options[dhcp]">
                        <option value="0">No</option>
                        <option value="1" {if $options.dhcp}selected="selected"{/if}>Yes</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>MAC Filter</b> </td>
                <td>
                    <select name="options[macfilter]">
                        <option value="1">Yes</option>
                        <option value="0" {if $options.macfilter === 0}selected="selected"{/if}>No</option>
                    </select>
                </td>
            </tr> 
            <tr>
                <td><b>Log Level (IN)</b> </td>
                <td>
                    <select name="options[log_level_in]">
                        <option value="nolog" {if $options.log_level_in == 'nolog'}selected="selected"{/if}>None</option>
                        <option value="info" {if $options.log_level_in == 'info'}selected="selected"{/if}>Info</option>
                        <option value="err" {if $options.log_level_in == 'err'}selected="selected"{/if}>Error</option>
                        <option value="warning" {if $options.log_level_in == 'warning'}selected="selected"{/if}>Warning</option>
                        <option value="crit" {if $options.log_level_in == 'crit'}selected="selected"{/if}>Critical</option>
                        <option value="alert" {if $options.log_level_in == 'alert'}selected="selected"{/if}>Alert</option>
                        <option value="emerg" {if $options.log_level_in == 'emerg'}selected="selected"{/if}>Emergency</option>
                        <option value="debug" {if $options.log_level_in == 'debug'}selected="selected"{/if}>Debug</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>Log Level (OUT)</b> </td>
                <td>
                    <select name="options[log_level_out]">
                        <option value="nolog" {if $options.log_level_out == 'nolog'}selected="selected"{/if}>None</option>
                        <option value="info" {if $options.log_level_out == 'info'}selected="selected"{/if}>Info</option>
                        <option value="err" {if $options.log_level_out == 'err'}selected="selected"{/if}>Error</option>
                        <option value="warning" {if $options.log_level_out == 'warning'}selected="selected"{/if}>Warning</option>
                        <option value="crit" {if $options.log_level_out == 'crit'}selected="selected"{/if}>Critical</option>
                        <option value="alert" {if $options.log_level_out == 'alert'}selected="selected"{/if}>Alert</option>
                        <option value="emerg" {if $options.log_level_out == 'emerg'}selected="selected"{/if}>Emergency</option>
                        <option value="debug" {if $options.log_level_out == 'debug'}selected="selected"{/if}>Debug</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>Input Policy</b> </td>
                <td>
                    <select name="options[policy_in]">
                        <option value="DROP" {if $options.policy_in == 'DROP'}selected="selected"{/if}>DROP</option>
                        <option value="ACCEPT" {if $options.policy_in == 'ACCEPT'}selected="selected"{/if}>ACCEPT</option>
                        <option value="REJECT" {if $options.policy_in == 'REJECT'}selected="selected"{/if}>REJECT</option>
                    </select>
                </td>
            </tr> 
            <tr>
                <td><b>Output Policy</b> </td>
                <td>
                    <select name="options[policy_out]">
                        <option value="ACCEPT" {if $options.policy_out == 'ACCEPT'}selected="selected"{/if}>ACCEPT</option>
                        <option value="DROP" {if $options.policy_out == 'DROP'}selected="selected"{/if}>DROP</option>
                        <option value="REJECT" {if $options.policy_out == 'REJECT'}selected="selected"{/if}>REJECT</option>
                    </select>
                </td>
            </tr> 
            <tr>
                <td colspan="2">
                    <input type="submit" value="Save settings"  class="blue" />
                </td>
            </tr> 
        </tbody>
    </table>
    {securitytoken}
</form>
