<tr>
    <td id="getvaluesloader">
        {if $test_connection_result}
            <span style="margin-left: 10px; font-weight: bold;text-transform: capitalize; color: {if $test_connection_result.result == 'Success'}#009900{else}#990000{/if}">
                {$lang.test_configuration}:
                {if $lang[$test_connection_result.result]}{$lang[$test_connection_result.result]}
                {else}{$test_connection_result.result}
                {/if}
                {if $test_connection_result.error}: {$test_connection_result.error}
                {/if}
            </span>
        {/if}
    </td>
    <td>
        <table class="editor-container" id="configoptionstable" border="0" cellpadding="5" cellspacing="0" width="600">
            <tbody><tr id="quotarow">
                    <td align="right" width="190">
                        <strong>Quota:</strong><br>
                        <small id="config_quota_descr">Example: 1TB, 1GB, 1MB, default</small>                        </td>
                    <td id="config_quota">
                        <input name="options[quota]" value="{$default.quota}">
                    </td>
                </tr>

                <tr class="odd" id="grouprow">
                    <td align="right" width="190" style="vertical-align: top">
                        <strong>Groups:</strong>                        
                    </td>
                    <td id="config_group">
                        <label><input type="radio" name="options[isolated]" value="0"  {if $default.isolated==0 || !$default.isolated}checked="checked"{/if} /> Shared group </label><br />
                        <label><input type="radio" name="options[isolated]" value="1" {if $default.isolated==1}checked="checked"{/if} /> Isolated group </label><br /><br />
                        <label>
                            <span class="isolated on">Prefix: </span>
                            <span class="isolated off">Name: </span>
                            <input name="options[group]" value="{$default.group}">
                        </label>
                    </td>
                </tr>
            </tbody>
        </table>


        <script type="text/javascript">
            {literal}
                $('input[name="options[isolated]"]').change(function(){
                    var self = $(this),
                        offon = self.val() == '1' ? 'on' : 'off',
                        isd = $('.isolated');
                        
                    isd.hide().filter('.' + offon).show();
                }).filter(':checked').trigger('change');
                
            {/literal} 
        </script>
    </td>
</tr>
