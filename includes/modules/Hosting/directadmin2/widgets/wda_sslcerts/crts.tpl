{if $do == 'generate'}
    <div class="body-content">
        <div class="section">
            <h3 id="hdrNewcert">Generate a New Certificate</h3>
            <p class="description" id="descNewcert">
                Use this form to generate a new, self-signed certificate for your domain. Typically, self-signed certificates are temporarily used until you receive a trusted SSL certificate from your SSL certificate authority.
            </p>
            <div class="cjt-pagenotice-container cjt-notice-container" id="cjt_pagenotice_container"></div>
            <form class="simple" id="mainform" name="mainform" method="post" action="{$widget_url}&act=crts&do=generate">
                {include file="`$widget_dir`gencert.tpl"}
            </form>
        </div>
        <a href="{$widget_url}&act=crts" id="lnkHomeReturn" class="btn">
            <span class="icon icon-chevron-left"></span>
            Back
        </a>
    </div>

{elseif $do =='upload'}
    <div class="body-content">
        <div class="section">


            <h3>Upload a New Certificate</h3>
            <p class="description" id="descUpload">
                Use this form to upload a certificate provided by a third-party Certificate Authority. You may either paste the body of the certificate or upload it from a “.crt” file.
            </p>

            <form enctype="multipart/form-data" method="post" id="paste" name="upload" action="{$widget_url}&act=crts&do=upload">
                <input type="hidden" value="1" name="paste" />
                <div class="control-group">
                    <label for="crt" id="lblCrt">Paste your certificate below</label>
                    <div class="row">
                        <div class="span8">
                            <textarea title="The certificate should include the lines that contain BEGIN and END."  dir="ltr" id="crt" name="crt" class="form-control paste span8"></textarea>
                            <div class="textarea-parse" id="cert_parse" style="display: none;"></div>
                        </div>
                    </div>
                    <label for="crt" id="lblCrt">Paste your private key below</label>
                    <div class="row">
                        <div class="span8">
                            <textarea title="Private key should include the lines that contain BEGIN and END."  dir="ltr" id="key" name="key" class="form-control paste span8"></textarea>
                            <div class="textarea-parse" id="cert_parse" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <input type="submit" value="Save Certificate" class="btn btn-flat-primary btn-primary" id="save-certificate">
                </div>
                {securitytoken}
            </form>

            <h3>OR</h3>
            <br />
            <form enctype="multipart/form-data" method="post" id="upload" name="upload" action="{$widget_url}&act=crts&do=upload">
                <input type="hidden" value="1" name="upload" />
                <div class="control-group">
                    <label for="crtfile" id="lblCrtfile">Choose a certificate file (*.crt).</label>
                    <div class="row">
                        <div class="span6">
                            <input type="file" title="The certificate files usually have the “.crt” extension." id="crtfile" name="crtfile">
                        </div>
                    </div>
                    <label for="crtfile" id="lblCrtfile">Choose a private key file (*.key).</label>
                    <div class="row">
                        <div class="span6">
                            <input type="file" title="The certificate files usually have the “.key” extension." id="privkey" name="privkey">
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <input type="submit" value="Upload Certificate" class="btn btn-flat-primary btn-primary" id="upload-certificate">
                </div>
                {securitytoken}
            </form>
        </div>
        <a href="{$widget_url}&act=crts" id="lnkHomeReturn" class="btn">
            <span class="icon icon-chevron-left"></span>
            Back
        </a>
    </div>

{else}
    <div class="body-content">

        <div class="section">
            <h3 id="hdrCertificates">
                SSL Certificates
            </h3>
            <p class="description" id="descSelfsigned">You can use a self-signed certificate or a trusted certificate from an SSL Certificate Authority. 
                If you plan to use a self-signed certificate for one of your sites, you can generate it below. 
                To use a trusted certificate, upload or provide the certificate below, after you have received the SSL certificate from your trusted provider.
            </p>
            <div class="pull-right">
                <a href="{$widget_url}&act=crts&do=shared&security_token={$security_token}" class="btn">Use the server's shared signed certificate</a>
                <a href="{$widget_url}&act=crts&do=upload" class="btn">Upload a New Certificate</a>
                <a href="{$widget_url}&act=crts&do=generate" class="btn">Generate a New Certificate</a>
            </div>
            <div class="clear"></div>
            <br />
        </div>
            
        <div class="section">

            {if $list.certificate}
                <h3 id="hdrOnserver">Certificate on Server</h3>
                <pre id="encoded-cert">{if $list.server=='yes'}Server's shared signed certificate{else}{$list.certificate}{/if}</pre>
            {/if}
            {if $list.key && $list.server!='yes'}
                <h3 id="hdrOnserver">Private key</h3>
                <pre id="encoded-key">{$list.key}</pre>
            {/if}
        </div>
        <a href="{$widget_url}" id="lnkHomeReturn" class="btn">
            <span class="icon icon-chevron-left"></span>
            Return to SSL Manager
        </a>
    </div>

{/if}