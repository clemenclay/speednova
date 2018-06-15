
<div class="wbox">
    <div class="wbox_header">
       Manage SSH Key
    </div>
    <div class="wbox_content">
        {if $sshkeypresent}
            <b>Current ssh key:</b><br/>
            <pre>{$sshkeypresent}</pre>
            
        {/if}
            <form action="" method="post">
                {securitytoken}
                <input type="hidden" name="make" value="addkey" />
                <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker table table-striped">

                    
                        <tr >
                            <td width="160" align="right">Enter your new Public SSH Key</td>
                            <td>
                                
                                    <textarea dir="ltr" name="key" rows="10" class="form-control"  style="width:95%"></textarea>
                            </td>
                        </tr>
                        <tr >
                            <td width="160" align="right"></td>
                            <td>
                                
                                <input type="submit" class="btn btn-primary" value="Submit"/>
                            </td>
                        </tr>
                    
                </table>
            </form>
         
    </div>
</div>
<script type="text/javascript" src="{$widgetdir_url}../widget.js"></script>
<link rel="stylesheet" type="text/css" href="{$widgetdir_url}../widget.css"  media="all">