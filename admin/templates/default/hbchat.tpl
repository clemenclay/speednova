<link href="{$template_dir}hbchat/media/settings.css?v={$hb_version}" rel="stylesheet" media="all" />
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" {if $currentfilter}class="searchon"{/if}>
       <tr>
        <td colspan="2"><h3>Live Chat</h3></td>

    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=hbchat"  class="tstyled {if !$action || $action=='default'}selected{/if}">Live chat</a>
            <a href="?cmd=hbchat&action=settings"  class="tstyled {if $action=='settings' || $action=='departments' || $action=='widgets' || $action=='geoip'}selected{/if}">Chat settings</a>
            <a href="?cmd=hbchat&action=canned"  class="tstyled {if $action=='canned'}selected{/if}">Canned Responses</a>
            <a href="?cmd=hbchat&action=history"  class="tstyled {if $action=='history' || $action=='viewtranscript'}selected{/if}">Chat History</a>

        </td>
        <td  valign="top"  class="bordered" rowspan="2"><div id="bodycont">
            {if  $action=='settings' || $action=='departments' || $action=='widgets' || $action=='geoip' }
                {include file='hbchat/settings_shelf.tpl'}
                {include file="hbchat/`$action`.tpl"}
           {elseif  $action=='canned'}
                {include file="hbchat/canned.tpl"}
           {elseif  $action=='history' || $action=='viewtranscript' || $action=='clienthistory'}
                {include file="hbchat/history.tpl"}
            {elseif $action=='default' || !$action}

            {if !$departments}
                <div class="blank_state blank_news">
                    <div class="blank_info">
                        <h1>Create department first</h1>
                        Chat staff can be assigned to departments - create one before using live chat.
                        <div class="clear"></div>
                        <a style="margin-top:10px" href="?cmd=hbchat&action=departments&do=add" class="new_add new_menu">
                            <span>Add new chat department</span></a>
                        <div class="clear"></div>
                    </div>
                </div>
            {else}
            {literal}
            <script type="text/javascript">
                var chat_window;
                function open_chat_console() {
                    if ( typeof( chat_window ) == "undefined" )
			chat_window = window.open( 'index.php?cmd=hbchat&action=popup', '{/literal}{$security_token}{literal}' , "scrollbars=yes,menubar=no,resizable=1,location=no,location=0,width=986,height=493,status=0" ) ;
                    else if ( chat_window.closed )
                        chat_window = window.open( 'index.php?cmd=hbchat&action=popup',  '{/literal}{$security_token}{literal}' , "scrollbars=yes,menubar=no,resizable=1,location=no,location=0,width=986,height=493,status=0" ) ;

                    if ( chat_window )
                            chat_window.focus() ;
                    return false;
                }

            </script>
            {/literal}

            <div style="padding:20px;background:-moz-linear-gradient(center top , #F6F6F6 0pt, #F1F1F1 100%) repeat scroll 0 0 transparent">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td valign="top" width="200">
                                <table border="0" cellspacing="0" cellpadding="4" width="600" class="introduce">
                                    <tr>
                                        <td width="1" style="border-left:none;"></td>
                                        <td width="100">Visitors online:</td>
                                        <td width="100">Staff online:</td>
                                        <td width="100" style="border-right:none;">Active chats:</td>
                                   </tr>
                                    <tr>
                                        <td width="1" style="border-left:none;"></td>
                                        <td width="100"><b>{$visitors}</b></td>
                                        <td width="100"><b>{$operators_cnt}</b></td>
                                        <td width="100" style="border-right:none;"><b>{$active}</b></td>
                                    </tr>
                                </table>
                                    
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:20px 20px 0px;">
                                <a  class="new_dchat new_menu" {if $amiassigned}href="?cmd=hbchat"  onclick="return open_chat_console();"{else}href="?cmd=hbchat&action=departments&flash=true" {/if}>
                                        <span>Open chat console</span></a>

                                <div class="clear"></div>
                            </td>
                        </tr>
                    </tbody></table>
            </div>
            {/if}

            {/if}

            </div></td>
    </tr>
</table>