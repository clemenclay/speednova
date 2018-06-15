{if $csr}
    <div class="body-content">
        <div class="section">
            <h3 id="hdrViewKey">
                View Certificate Signing Request
            </h3>
            <p class="description">
                You are viewing the CSR you selected. 
                To purchase a trusted certificate, 
                you must copy the Encoded CSR below and send it to the Certificate Authority. 
                Follow the instructions provided by your certificate authority. 
            </p>
        </div>
        <div class="section">
            <div class="control-group">
                <label for="domain" id="lblDomain">Domain:</label>
                <div class="row">
                    <div class="span6">
                        <strong>{$name}</strong>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="encoded-key" id="lblEncodedKey">Encoded CSR:</label>
                <div class="row">
                    <div class="span8">
                        <pre id="encoded-key">{$csr.request}</pre>
                    </div>
                </div>
            </div>
        </div>
        <a href="{$widget_url}" id="lnkHomeReturn" class="btn">
            <span class="icon icon-chevron-left"></span>
            Return to SSL Manager
        </a>
    </div>
{else}

    <div class="body-content">
        <div class="section">
            <h3 id="hdrGenerateCsr">Generate a New Certificate Signing Request (CSR)</h3>
            <div class="cjt-pagenotice-container cjt-notice-container" id="cjt_pagenotice_container"></div>
            <p class="description" id="descNewsrc">
                Use this form to generate a new certificate signing request for your domain. 
                Your SSL certificate authority (CA) will ask for a certificate 
                signing request to complete the certificate purchase. 

                Your CA may require specific information in the form below. 
                Check with the CA’s CSR requirements for the Apache web server.
            </p>
            <form name="csrform" id="csrform" method="post" action="{$widget_url}&act=csrs">
                {include file="`$widget_dir`gencert.tpl"}
            </form>
        </div>


        <a href="{$widget_url}" id="lnkHomeReturn" class="btn">
            <span class="icon icon-chevron-left"></span>
            Return to SSL Manager
        </a>

    </div>
{/if}