<div style="padding: 5px 20px;" class="lighterblue" id="config_contain">
    <table cellspacing="0" cellpadding="6" border="0" width="100%" style="margin-bottom:10px;">
        <tbody>
            <tr>
                <td align="right" width="165"><strong>Endpoint</strong></td>
                <td>
                    <select class="inp" name="field2" id="endpoint">
                        <option {if $server.field2 == "ovh-eu"}selected{/if} value="ovh-eu">Europe</option>
                        <option {if $server.field2 == "ovh-ca"}selected{/if} value="ovh-ca">North America</option>
                        {*}<option {if $server.field2 == "runabove-ca"}selected{/if} value="runabove-ca">Runabove</option>{*}
                    </select>
                </td>
            </tr>  
            <tr>
                <td>

                </td>
                <td>
                    Click here to generate your Application Key & Secret<br/>
                    <a href="" id="endpointCreateApp" target="_blank"></a>
                </td>
            </tr>
            <tr> 
                <td align="right" width="165"><strong>Application Key</strong></td> 
                <td><input class="inp" value="{$server.username}" size="25" name="username"></td>
            </tr>        
            <tr>
                <td align="right" width="165"><strong>Application Secret</strong></td>
                <td><input type="password" autocomplete="off" value="{$server.password}" class="inp" size="25" name="password"></td>
            </tr>    
            <tr>
                <td align="right" width="165"><strong>Authorization</strong></td>
                <td>
                    {if $isNew}
                        You need to save this app before you can authorize.
                    {else}
                        <button type="submit" name="auth">Authorize using provided Application details</button>
                    {/if}

                </td>
            </tr>  

            <tr style="display:none;">
                <td align="right" width="165"><strong>Consumer Key</strong></td>
                <td><input  type="hidden" class="inp" value="{$server.field1}" size="25" name="field1"></td>
            </tr>     

            {securitytoken}
        </tbody>
    </table>
</div>
{literal}
    <script type="text/javascript">
        $('#endpoint').on('change', function() {
            var map = {
                'ovh-eu': 'eu.api.ovh.com',
                'ovh-ca': 'ca.api.ovh.com',
                'runabove-ca': 'api.runabove.com'
            };
            var endpointCreateApp = 'https://' + map[$(this).val()] + '/createApp/';

            $('#endpointCreateApp').attr('href', endpointCreateApp).text(endpointCreateApp);
        }).change();
    </script>
{/literal}