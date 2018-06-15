{*

Change password of main client account/contact

*}
<h2>{$lang.changepass}</h2>

<div class="card">
    <div class="card-body">
        <form action='' method='post' >
            <input type="hidden" name="make" value="changepassword" />

                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input name="oldpassword" type="password" id="pass1" class="form-control" autocomplete="off" >
                        <label for="pass1" class="font-weight-light">{$lang.oldpass}</label>
                    </div>
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input name="password" type="password" id="pass2" class="form-control" autocomplete="off" >
                        <label for="pass2" class="font-weight-light">{$lang.newpassword}</label>
                    </div>
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input name="password2" type="password" id="pass3" class="form-control" autocomplete="off" >
                        <label for="pass3" class="font-weight-light">{$lang.confirmpassword}</label>
                    </div>     

                <div class="form-actions">
                <center>
                    <input type="submit" value="{$lang.savechanges}" class="btn btn-info btn-large" style="font-weight:bold"/>
                </center>
            </div>
        {securitytoken}
        </form>
    </div>
</div>