{include file="`$onappdir`header.cloud.tpl"}
<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">Resize</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    <form action="" method="post">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">Current Flavor</label>
                        <div class="controls">
                            <strong>{$flavor.name}</strong> ({$flavor.price_on|price:$currency:true}/{$lang.hourly})
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" id="flavormgr">

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="border-bottom:none"> 
                    <input type="hidden" name="make" value="resize" />
                    <input type="submit" value="Resize VM" name="changeos" class="blue" />
                </td>
            </tr>
        </table>
        {securitytoken}
    </form>
</div>
{literal}
    <script type="text/javascript">
        $(document).ready(function() {
            $.get('?cmd=flavormanager&selected={/literal}{$submit.flavor_id}{literal}', function(data) {
                $('#flavormgr').html(data);
            });
        });
    </script>
{/literal}
{include file="`$onappdir`footer.cloud.tpl"}