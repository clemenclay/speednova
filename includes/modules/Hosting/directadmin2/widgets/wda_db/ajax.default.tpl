{counter start=0 skip=1 assign=even}
{if $act=='usermanage'}
    {if $listentrys}
        {foreach from=$listentrys item=entry key=index} 
            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                <td align="right">{$entry}</td>
                <td align="center" class="management_links"> 
                    <a href="{$widget_url}&act={$act}&db={$db}#priv" data-user="{$entry}">{$widget_lang.permissions}</a> | 
                    <a href="{$widget_url}&act={$act}&db={$db}#pwd">{$lang.password}</a> |
                    <a href="{$widget_url}&act={$act}&db={$db}&deluser={$entry}" onclick="return confirm('{$widget_lang.confirm_delusr}')">{$lang.delete}</a>
                </td>
            </tr>
            <tr {if $even % 2 !=0}class="even"{/if} style="display:none">
                <td align="center" class="management_priv form-inline" colspan="2">

                </td>
            </tr>
            <tr {if $even % 2 !=0}class="even"{/if} style="display:none">
                <td align="center" colspan="2">
                    <div style="display:table-cell; padding:0 3px">{$lang.password}: <br>
                        <input autocomplete="off" type="password" name="passchange[{$entry}][passmain]"></div>
                    <div style="display:table-cell; padding:0 3px">{$lang.confirmpassword}:<br> 
                        <input autocomplete="off" type="password" name="passchange[{$entry}][passcheck]">
                    </div> 
                    <div style="display:table-cell; padding:0 3px"><br> 
                        <input type="submit" value="{$lang.shortsave}"/>
                    </div> 
                </td>
            </tr>
        {/foreach}
    {else}
        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
            <td align="center" colspan="2">{$widget_lang.nousers}</td> 
        </tr>
    {/if}
{elseif $act=='hostmanage'}
    {if $listentrys}
        {foreach from=$listentrys item=entry} 
            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                <td align="right">{$entry}</td>
                <td align="center">
                    <a href="{$widget_url}&act=delhost&db={$db|escape:'url'}&host={$entry|escape:'url'}&security_token={$security_token}" 
                       onclick="return confirm('{$widget_lang.confirm_delhost}')">{$lang.delete}</a>
                </td>
            </tr>
        {/foreach}
    {else}
        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
            <td align="center" colspan="2">{$widget_lang.nohosts}</td>
        </tr>
    {/if}
{else}	
    {if $listentrys}
        {foreach from=$listentrys item=entry} 
            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                <td align="right">{$entry}</td>
                <td align="center">MySQL</td>
                <td align="center">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            Action
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            {*}<li><a data-db="{$entry}" 
                                   href="{$access.url}&goto_uri={$access.token}" 
                                   target="_blank" onmouseup="regenerate();"><i class="icon icon-edit"></i> {$widget_lang.db_admin}</a>
                            </li>{*}
                            <li><a href="{$widget_url}&act=usermanage&db={$entry}"><i class="icon icon-user"></i> {$widget_lang.db_users}</a>
                            </li>
                            <li><a href="{$widget_url}&act=hostmanage&db={$entry}"><i class="icon icon-asterisk"></i> {$widget_lang.host_list}</a>
                            </li>
                            <li><a href="{$widget_url}&act=deldb&db={$entry}&security_token={$security_token}" 
                                   onclick="return confirm('{$widget_lang.confirm_deldb}')"> <i class="icon icon-trash"></i> {$lang.delete}</a>

                            </li>
                        </ul>
                    </div>


                </td>
            </tr>
        {/foreach}
    {else}
        <tr {counter}{if $even % 2 ==0}class="even"{/if}>
            <td align="center" colspan="4">{$widget_lang.nodatabase}</td>
        </tr>
    {/if}
{/if}