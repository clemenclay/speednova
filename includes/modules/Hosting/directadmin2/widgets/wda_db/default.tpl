<div >
    {foreach from=$widgets item=wig}
        {if $widget.name == $wig.name}
            {assign value=$wig.location var=widgeturl}
        {/if}
    {/foreach}
    <div id="billing_info">

        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <br />
        <ul class="breadcrumb">
            {if $act != 'default'}<li>
                    <a href="{$widget_url}">{$widget_lang.db_list}</a> <span class="divider">/</span>
                </li>
            {else}
                <li class="active">
                    {$widget_lang.db_list}
                </li>
            {/if}
            {if $act == 'usermanage'}
                <li>
                    {$db} <span class="divider">/</span>
                </li>
                <li class="active">
                    {$widget_lang.db_users}
                </li>
            {/if}
            {if $act == 'hostmanage'}
                <li >
                    {$db} <span class="divider">/</span>
                </li>
                <li class="active">
                    {$widget_lang.host_list}
                </li>
            {/if}
        </ul>

        <div class="section">
            {if $act=='default'}
                <form autocomplete="off" action="{$widget_url}&act=default" method="post">
                    <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">

                        <thead>
                            <tr>
                                <td align="right">{$widget_lang.db_name}</td>
                                <td align="center">{$lang.type}</td>
                                <td align="center">{$widget_lang.management_functions}</td>
                            </tr>
                        </thead>
                        <tbody id="updater">
                            {include file="`$widget_dir`ajax.default.tpl"}
                        </tbody>
                    </table>
                    {securitytoken}
                </form>
                <form autocomplete="off" action="{$widget_url}&act=addb" method="post">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" >
                        <tbody>
                            <tr>
                                <td style="border:none" colspan="2">
                                    <div class="form-control">
                                        <label>Name</label>
                                        <input type="text" name="name">
                                    </div>
                                    <div class="form-control">
                                        <label>{$widget_lang.db_username}</label>
                                        <input autocomplete="off" type="text" name="user" class="span2" >
                                    </div>
                                    <div class="form-control">
                                        <label>{$lang.password}</label>
                                        <input autocomplete="off" type="password" name="passmain" class="span2">
                                    </div>
                                    <div class="form-control">
                                        <label>{$lang.confirmpassword}</label>
                                        <input autocomplete="off" type="password" name="passcheck" class="span2">
                                    </div>
                                    <div class="form-control">
                                        <input type="submit" name="save" value="{$widget_lang.add_new_db}" class="btn"> 
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    {securitytoken}
                </form>
            {elseif $act=='usermanage'}
                <form autocomplete="off" action="{$widget_url}&act=moduser" method="post">
                    <input type="hidden" value="{$db}" name="db" />
                    <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                        <thead>
                            <tr>
                                <td align="right">{$widget_lang.db_username}</td>
                                <td align="center">{$widget_lang.management_functions}</td>
                            </tr>
                        </thead>
                        <tbody id="updater">
                            {include file="`$widget_dir`ajax.default.tpl"}
                        </tbody>
                    </table>
                    {securitytoken}
                </form>
                <h3>{$widget_lang.add_new_usr}</h3>
                <form autocomplete="off" action="{$widget_url}&act=adduser" method="post">
                    <input type="hidden" value="{$db}" name="db" />
                    <div class="form-control">
                        <label>{$widget_lang.db_username}</label>
                        <input autocomplete="off" type="text" name="name" class="span2" >
                    </div>
                    <div class="form-control">
                        <label>{$lang.password}</label>
                        <input autocomplete="off" type="password" name="passmain" class="span2">
                    </div>
                    <div class="form-control">
                        <label>{$lang.confirmpassword}</label>
                        <input autocomplete="off" type="password" name="passcheck" class="span2">
                    </div>	
                    <div>
                        <input type="submit" name="save" value="{$widget_lang.add_new_usr}" class="btn"> 
                    </div>
                    {securitytoken}
                </form>
                <a href="{$widget_url}" class="btn"><i class="icon icon-chevron-left"></i> Back</a>
            {elseif $act=='hostmanage'}
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <thead>
                        <tr>
                            <td align="right">{$widget_lang.ip_list}</td>
                            <td align="center">{$widget_lang.management_functions}</td>
                        </tr>
                    </thead>
                    <tbody>
                        {include file="`$widget_dir`ajax.default.tpl"}
                    </tbody>
                    <tfoot>
                        <tr>
                            <td style="border:none" colspan="3" align="right">
                                <form autocomplete="off" action="{$widget_url}&act=addhost" method="post">
                                    <input type="hidden" name="db" value="{$db}" />
                                    <div class="form-control form-horizontal">
                                        <label>Host (% {$lang.wildcardallowed}): </label>
                                        <span class="input-append">
                                            <input type="text" name="name">{*}
                                            {*}<input type="submit" name="save" value="{$widget_lang.add_new_ip}" class="btn"> 
                                        </span>
                                        {securitytoken}
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <a href="{$widget_url}" class="btn"><i class="icon icon-chevron-left"></i> Back</a>
            {/if}
        </div>
    </div>
</div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>