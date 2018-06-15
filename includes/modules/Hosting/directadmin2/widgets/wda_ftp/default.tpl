
<div >
    <div id="billing_info">
        {include file="`$widget_dir`../domain.tpl"}
        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <br />
        <div class="section">
            {literal}
                <script type="text/javascript">
                    $(document).ready(function() {
                        $('.management_links').each(function(i) {
                            $(this).children().eq(0).click(function() {
                                $(this).parents('tr').next().toggle();
                                return false;
                            });
                        });
                    });
                </script>
            {/literal}
            <form autocomplete="off" action="{$widget_url}&act=update" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="right">{$lang.username}</td>
                            <td align="center"> {$lang.homedirectory}</td>
                            <td align="center">{$lang.managementfunctions}</a></td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {foreach from=$listentrys item=entry key=index} 
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td align="right" style="white-space: nowrap">{$entry.user}</td>
                                <td align="left">{$entry.homedir}</td>
                                <td align="center" class="management_links">
                                    {if !$entry.main}
                                        <a href="{$widget_url}&act={$act}&changepass">{$lang.changepass}</a> |
                                        <a href="{$widget_url}&act=del&user={$entry.user}&security_token={$security_token}" 
                                           onclick="return confirm('Do You really want to delete this FTP account?')">{$lang.delete}</a> 
                                    {/if}
                                </td>
                            </tr>
                            <tr {if $even % 2 !=0}class="even"{/if} style="display:none">
                                <td colspan="3" class="form-inline">

                                    <div style="display: inline-block">
                                        {$lang.password}: <br/>
                                        <input class="span2" autocomplete="off" type="password" name="passchange[{$index}][passmain]">
                                    </div>
                                    <div style="display: inline-block">
                                        {$lang.confirmpassword}: <br/>
                                        <input class="span2" autocomplete="off" type="password" name="passchange[{$index}][passcheck]">
                                    </div>
                                    <div style="display: inline-block">
                                        <br/>
                                        <input type="submit" name="save" value="{$lang.shortsave}" class="btn">	
                                        <input type="hidden" name="passchange[{$index}][homedir]" value="{$entry.homedir}">
                                    </div>
                                </td>
                            </tr>
                        {foreachelse}
                            <tr {if $even % 2 !=0}class="even"{/if} style="display:none">
                                <td colspan="3">{$lang.nothing}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
                {securitytoken}
            </form>
            <form autocomplete="off" action="{$widget_url}&act=add" method="post" class="form-horizontal">
                <h3>{$lang.addftpaccount}</h3>
                <div class="control-group">
                    <label>{$lang.username}</label>
                    <span class="input-append">
                        <input class="span2" autocomplete="off" type="text" name="name" id="name" ><span class="add-on">@{$domain}</span>
                    </span>
                </div>
                <div class="control-group">
                    <label>{$lang.password}</label>
                    <input class="span2" autocomplete="off" type="password" name="passmain" >
                </div>
                <div class="control-group">
                    <label>{$lang.confirmpassword}</label>
                    <input class="span2" autocomplete="off" type="password" name="passcheck" >
                </div>
                <div class="control-group">
                    <label>{$lang.homedirectory}</label>
                    <select name="type" id="type">
                        <option value="system">/</option>
                        <option value="domain">/domains/{$domain}</option>
                        <option value="ftp">/domains/{$domain}/public_ftp</option>
                        <option value="user">/domains/{$domain}/public_html/user</option>
                        <option value="custom">Custom</option>
                    </select>
                    <input autocomplete="off" type="text" name="custom" class="span4" >
                </div>
                <input class="btn" type="submit" name="save" value="{$lang.shortsave}">
                {securitytoken}
            </form>
        </div>
    </div>
</div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>