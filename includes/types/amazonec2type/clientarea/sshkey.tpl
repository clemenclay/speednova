<div class="header-bar">
    <h3 class="console hasicon">Import SSH Key</h3>
    <div class="clear"></div>
</div>
<div class="content-bar">
    Copy and paste the contents of your public key into the dialog.
    <form action="" method="post"> 
        <input type="hidden" name="make" value="import" />
        <textarea style="width:98%;height:120px" name="public_key"></textarea>
         <input type="submit" value="Import SSH Key" style="font-weight:bold" class=" blue" />
        {securitytoken}
    </form>
    
</div>