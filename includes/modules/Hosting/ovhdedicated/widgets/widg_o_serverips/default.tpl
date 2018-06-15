
<div >
    <div id="billing_info" class="wbox form-inline">
        <div class="wbox_header">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</div>
        <div class="wbox_content">
            <form autocomplete="off" action="{$widget_url}" method="post">
                <input type="hidden" name="make" value="updaterdns" />
                <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                    {counter start=1 skip=1 assign=even}
                    <thead>
                        <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                            <td align="right">{$lang.IPs}</td>
                        
                        </tr>
                    </thead>
                    <tbody id="updater">
                        
                            {foreach from=$listentrys item=entry key=index} 
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                    <th align="right" colspan="3">{$entry.ip}</th>
                                   
                                </tr>
                                {if $entry.reverses}

                                        <tr>
                                            <td>IP</td>
                                            <td>Reverse DNS</td>
                                            <td></td>
                                        </tr>
                                    {foreach from=$entry.reverses item=reverse key=rip}
                                        <tr>
                                            <td width="200">{$rip}</td>
                                            <td><input name="reversedns[{$rip}]" value="{$reverse}" type="text"/></td>
                                            <td><button type="submit" name="updaterdns" value="{$rip}" class="btn btn-sm btn-primary">Save</button></td>
                                        </tr>
                                    {/foreach}
                                    {/if}
                                
                            {foreachelse}
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                    <td align="center" style="text-overflow:ellipsis; overflow: hidden" >{$lang.nothing}</td>
                                </tr>
                            {/foreach}
                        
                    </tbody>
                    
                </table>
                {securitytoken}       
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="{$widgetdir_url}../widget.js"></script>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">