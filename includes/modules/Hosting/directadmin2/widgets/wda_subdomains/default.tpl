
<div >
    <div id="billing_info" class=" form-inline">
        {include file="`$widget_dir`../domain.tpl"}
        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <div class="section">
            <form autocomplete="off" action="{$widget_url}&act=add" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="right">Subdomain</td>
                            <td align="center">{$lang.managementfunctions}</a></td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {if $listentrys}
                            {foreach from=$listentrys item=entry key=index} 
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                    <td align="right">{$entry}</td>
                                    <td align="center" class="management_links">
                                        <a href="{$widget_url}&act=del&name={$entry}&security_token={$security_token}" 
                                           onclick="return confirm('Do You really want to delete this sub domain?')">
                                            <small>{$lang.delete}</small>
                                        </a> 
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td colspan="2">
                                    {$lang.nothing}
                                </td>
                            </tr>
                        {/if}
                    </tbody>

                </table>
                <h3>Add new sub-domain</h3>
                <div class="form-control">
                    <label>Subdomain</label>
                    <span class="input-append">
                        <input class="span2" autocomplete="off" type="text" name="name" >{*}
                        {*}<span class="add-on">.{if $listdomains|@count == 1}{$listdomains[0].domain}{elseif $listdomains|@count == 0}{$domain}{/if}</span>{*}
                        {*}<input class="btn" type="submit" name="save" value="{$lang.shortsave}">
                    </span>
                </div>
                {securitytoken}
            </form>
        </div>
    </div>
</div>
