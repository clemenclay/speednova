
<div >
    <div id="billing_info" class="form-inline">
        {include file="`$widget_dir`../domain.tpl"}
        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <br />
        <div class="section">
            {literal}
                <script type="text/javascript">
                    $(document).ready(function() {
                        var change = 0;
                        $('.management_links').each(function(i) {
                            $(this).children().eq(0).click(function() {
                                if ($(this).parents('tr').next().data('status') == 1) {
                                    $(this).parents('tr').next().hide().data('status', 0);
                                } else {
                                    $(this).parents('tr').next().show().data('status', 1);
                                    $(this).parents('tr').next().find('.change_div').hide().eq(1).show();
                                }
                                return false;
                            });
                            $(this).children().eq(1).click(function() {
                                if ($(this).parents('tr').next().data('status') == 2) {
                                    $(this).parents('tr').next().hide().data('status', 0);
                                    change = 0;
                                } else {
                                    $(this).parents('tr').next().show().data('status', 2);
                                    $(this).parents('tr').next().find('.change_div').hide().eq(0).show();
                                }
                                return false;
                            });
                        });
                        $('.email_quota').change(function() {
                            if ($(this).children("option:selected").val() == 'custom') {
                                var name = $(this).attr('name');
                                $(this).replaceWith('<input name="' + name + '" size="8" class="span1">MB');
                            }
                        });
                    });
                </script>
            {/literal}
            <form autocomplete="off" action="{$widget_url}&act=update" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">

                    <thead>
                        <tr>
                            <td align="right">{$lang.account}</td>
                            <td align="center">{$lang.usage}</td>
                            <td align="center">{$lang.managementfunctions}</a></td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {if $listentrys}
                            {foreach from=$listentrys item=entry key=index} 
                                <tr>
                                    <td align="right">{$entry.email}</td>
                                    <td align="center">
                                        <div>{$entry.usage}/{$entry.quota|capitalize} MB</div>
                                        <div style="width:80%; height:8px; border:solid 1px #aaa; text-align:left; overflow:hidden">
                                            <div style="height:100%; width:{$entry.percent}%; background-color:{if $entry.percent < 50}#8FFF00{elseif $entry.percent < 80}yellow{else}#FF4F4F{/if}; border"></div>
                                        </div>
                                    </td>
                                    <td align="center" class="management_links">
                                        <a href="{$widget_url}&act={$act}#chang">{$lang.changepass}</a> |
                                        <a href="{$widget_url}&act={$act}#chang">{$lang.changequota}</a> |
                                        <a href="{$widget_url}&act=del&user={$index}&security_token={$security_token}" 
                                           onclick="return confirm('Do You really want to delete this Email account?')">{$lang.delete}</a> 
                                    </td>

                                </tr>
                                <tr style="display:none">
                                    <td align="right" ><input type="submit" name="save" value="{$lang.shortsave}" class="btn"></td>
                                    <td align="right" colspan="3" class="change_div">
                                        <input type="hidden" name="change[{$index}][user]" value="{$entry.user}">
                                        <input type="hidden" name="change[{$index}][domain]" value="{$entry.domain}">
                                        <input type="hidden" name="change[{$index}][oldquota]" value="{$entry.quota}">
                                        {$lang.quota}:
                                        <select name="change[{$index}][quota]" class="email_quota">
                                            <option value="custom" >{$lang.custom}</option>
                                            {if ($entry.quota != 20) && ($entry.quota != 50) && ($entry.quota != 100) && ($entry.quota != 250) && ($entry.quota != 'unlimited')}
                                                <option value="{$entry.quota}" selected="selected">{$entry.quota} MB</option>
                                            {/if}
                                            <option value="20" {if $entry.quota == 20}selected="selected"{/if}>20 MB</option>
                                            <option value="50" {if $entry.quota == 50}selected="selected"{/if}>50 MB</option>
                                            <option value="100" {if $entry.quota == 100}selected="selected"{/if}>100 MB</option>
                                            <option value="250" {if $entry.quota == 250}selected="selected"{/if}>250 MB</option>
                                            <option value="0" {if $entry.quota == 'unlimited'}selected="selected"{/if}>{$lang.unlimited}</option>
                                        </select>
                                    </td>
                                    <td class="change_div" align="right" colspan="3">
                                        {$lang.password}:
                                        <input autocomplete="off" type="password" name="change[{$index}][passmain]" class="span2">&nbsp;&nbsp;&nbsp;
                                        {$lang.confirmpassword}:
                                        <input autocomplete="off" type="password" name="change[{$index}][passcheck]" class="span2">

                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td align="center" colspan="3">{$lang.nothing}</td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
                {securitytoken}
            </form>
            <form autocomplete="off" action="{$widget_url}&act=add" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tfoot>
                        <tr><td colspan="4"><strong>{$lang.addemailaccount}</strong></td></tr>
                        <tr>
                            <td style="border:none" colspan="4" align="center">
                                <table style="float:left" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="text-align:right;border:none">{$lang.username}: </td>
                                        <td style="text-align:left; border:none"> <input class="span2" autocomplete="off" type="text" name="name" >@{if $listdomains|@count == 1}{$listdomains[0].domain}{elseif $listdomains|@count == 0}{$domain}{/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="text-align:right;border:none">{$lang.password}: </td>
                                        <td style="text-align:left;border:none"> <input class="span2" autocomplete="off" type="password" name="passmain" ></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;border:none">{$lang.confirmpassword}: </td>
                                        <td style="text-align:left;border:none"> <input class="span2" autocomplete="off" type="password" name="passcheck" ></td>
                                    </tr>
                                </table>
                                <div style="float:left;padding:0 0 0 10px;vertical-align:middle">{$lang.quota}:<br> 
                                    <select name="quota" class="email_quota span2">
                                        <option value="custom" >{$lang.custom}</option>
                                        <option selected="selected" value="20" >20 MB</option>
                                        <option value="50" >50 MB</option>
                                        <option value="100" >100 MB</option>
                                        <option value="250" >250 MB</option>
                                        <option value="0" >{$lang.unlimited}</option>
                                    </select>
                                </div>
                                <div style="float:left; padding:15px 6px;vertical-align:middle">
                                    <input type="submit" name="save" value="{$lang.shortsave}" class="btn"> 
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                {securitytoken}
            </form>
        </div>
    </div>
</div>

