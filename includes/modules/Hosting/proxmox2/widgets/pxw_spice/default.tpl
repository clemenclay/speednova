
<form action="" method="POST" class="form-horizontal" id="content-cloud">
    <div class="header-bar">
        <h3 class="vmdetails hasicon">Spice Console</h3>
    </div>
    <div class="content-bar" id="boot-order-form">
        <div class="control-group ">
            <label>Spice support is not activated on this VM, do you want to activate it now? <br />This action will reboot your VM.</label>
            
            <form action="" method="POST">
                <input type="submit" name="no" class="btn btn-default" value="Cancel" />
                <input type="submit" name="yes" class="btn btn-danger" value="Activate" />
                {securitytoken}
            </form>
        </div>
        <div class="clear"></div>
    </div>
    {securitytoken}
</form>