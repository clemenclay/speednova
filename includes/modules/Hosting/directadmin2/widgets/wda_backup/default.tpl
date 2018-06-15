
<div >
    {foreach from=$widgets item=wig}
        {if $widget.name == $wig.name}
            {assign value=$wig.location var=widgeturl}
        {/if}
    {/foreach}
    <div id="billing_info" class="">
        <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
        <br />
        <div class="section">
            <form autocomplete="off" action="{$widget_url}&act=add" method="post">
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="left">{$lang.Available}:</td>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {if $listentrys}
                            {foreach from=$listentrys item=entry key=index} 
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                    <td align="center">

                                        <img src="{$widgetdir_url}ico_info.gif"
                                             alt="OK" title="{$entry.status|capitalize}">
                                        <strong>{$entry}</strong>
                                        <a href="{$widget_url}&act=restore&file={$entry|escape:'url'}&security_token={$security_token}"
                                           class="btn btn-flat-primary btn-primary pull-right"
                                           onclick="return confirm('Are you sure?')"
                                           ><i class="icon icon-cog icon-white"></i> Restore</a>


                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                <td align="center">
                                    <strong>{$lang.nobackups}</strong>
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                    <tfoot>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                            <td colspan="4">{$lang.yourbackapslocatedin}
                                <strong>/backups</strong> directory
                            </td>
                        </tr>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                            <td style="border:none" colspan="4">
                                <input class="btn" type="submit" name="save" value="Create new backup">
                            </td>
                        </tr>
                    </tfoot>
                </table>
                {securitytoken}
            </form>
        </div>
    </div>
</div>
