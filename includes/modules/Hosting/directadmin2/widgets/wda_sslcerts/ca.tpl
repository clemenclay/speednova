<div class="body-content">
    <h3 id="hdrInstallWebsite">Certificate Authority Bundle</h3>
    <p>
        The CA bundle is not necessary if your certificate is recognized in browsers, but it is recomended to provide it anyway. 
    </p>
    <div class="section">
        <form enctype="multipart/form-data" method="post" name="mainform" action="{$widget_url}&act=ca" id="mainform">
            <input type="hidden" name="install" value="1" />

            <div class="control-group">
                <div class="row">
                    <div class="span8">
                        <textarea dir="ltr" name="cacert" class="form-control span8" rows="10" id="sslcab">{$list.cacert}</textarea>

                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="row">
                    <div class="span8">
                        <label class="checkbox">
                            <input type="checkbox" name="enabled" value="1" {if $list.enabled=='yes'}checked="checked"{/if}> Use this CA Bundle
                        </label>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <input type="submit" title="Click to update the CA Bundle" class="btn btn-flat-primary btn-primary" value="Update CA Root Certificate" id="btnInstall">
            </div>
            {securitytoken}
        </form>
    </div>


    <a href="{$widget_url}" id="lnkHomeReturn" class="btn">
        <span class="icon icon-chevron-left"></span>
        Return to SSL Manager
    </a>
</div>
<script src="{$widgetdir_url}script.js" type="text/javascript"></script>