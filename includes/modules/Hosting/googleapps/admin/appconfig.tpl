{literal}
    <style>
        #googleapps-conf code,
        #googleapps-conf pre{
            background: #ddd;
            padding: 4px;
            font-family: monospace
        }
        #googleapps-conf code{
            padding: 1px 3px;
        }
    </style>
{/literal}
<div style="float:right; width: 50%"  id="googleapps-conf">
    <strong>Setup API access</strong>
    <br />
    Create new project on <a href="https://console.developers.google.com">https://console.developers.google.com</a><br />
    Open it and navigate to <code>APIs & auth > APIs</code>, activate:
    <pre>Admin SDK
Google Apps Reseller API</pre>

    More info:
    <a href="https://developers.google.com/admin-sdk/reseller/v1/how-tos/prerequisites" />https://developers.google.com/admin-sdk/reseller/v1/how-tos/prerequisites</a> 
    <br /><br /> 
    <strong>Create Service account </strong><br /> 
    Navigate to <code>APIs & auth > Credentials</code> and click on <b>Create new Client ID</b>, set Application type to <b>Service account</b> and confirm.<br />
    <br /> 
    More info: <a href="https://developers.google.com/accounts/docs/OAuth2ServiceAccount#creatinganaccount">https://developers.google.com/accounts/docs/OAuth2ServiceAccount#creatinganaccount</a>
    
    <br /><br />
    <strong>Authorize service account</strong>
    <br /> From the domain console, authorize your new service account going under <code>Security > Advanced settings > Manage API client access</code> and add your <strong>Client ID</strong> (you can find it in the API console) with scope:
    <br /><pre>{foreach from=$scopes item=scope}{$scope},
{/foreach}</pre>
    
    More info: <a href="https://developers.google.com/accounts/docs/OAuth2ServiceAccount#delegatingauthority">https://developers.google.com/accounts/docs/OAuth2ServiceAccount#delegatingauthority</a>
</div>
<table border="0" cellpadding="6" cellspacing="0" width="50%" style="margin-bottom:10px;">
    <tr>
        <td></td>
        <td>

        </td>
    </tr>
    <tr>
        <td style="text-align: right: vertical-align: top; width: 180px "><strong>Service Account Email Address</strong></td>
        <td ><input type="text" name="username"  value="{$server.username}" style="width: 90%" class="inp"/></td>
    </tr>
    <tr>
        <td style="text-align: right: vertical-align: top; width: 180px "><strong>Private key file location (.p12)</strong></td>
        <td ><input type="text" name="field1" class="inp" value="{$server.field1}" style="width: 90%" autocomplete="off"/></td>
    </tr>
    <tr>
        <td style="text-align: right: vertical-align: top; width: 180px "><strong>Domain Administrator Email</strong></td>
        <td ><input type="text" name="field2"  value="{$server.field2}" class="inp" style="width: 90%"/></td>
    </tr>
    <tr>
        <td style="text-align: right: vertical-align: top; width: 180px "><strong>Sandbox Mode</strong></td>
        <td ><input type="checkbox" name="secure"  value="1" class="inp" {if $server.secure}checked="checked"{/if}/></td>
    </tr>
</table>
<div class="clear"></div>
