<div class="white-container white-bg ">
    <div class="padding">
        <div class="account-info-container">
            <h2>
                {$lang.changepass}
            </h2>

            <form class="form-horizontal m20 form-style" action='' method='post' >
                <input type="hidden" name="make" value="changepassword" />
                <fieldset>
                    <label >{$lang.oldpass}:</label>
                    <input class="span4" type="password" autocomplete="off" name="oldpassword">
                </fieldset>
                <fieldset>
                    <label >{$lang.newpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" name="password">
                </fieldset>
                <fieldset>
                    <label >{$lang.confirmpassword}:</label>
                    <input class="span4" type="password" autocomplete="off" name="password2">
                </fieldset>
                <div class="separator"></div>
                <div class="m15">
                    <button type="submit" class="btn btn-green">{$lang.savechanges}</button>
                </div>
                {securitytoken}
            </form>

        </div>

    </div>


</div>
