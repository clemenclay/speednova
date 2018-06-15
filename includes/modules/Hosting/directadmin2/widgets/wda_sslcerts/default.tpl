
<div style="margin: 10px 0; padding: 0 10px;">
    {include file="`$widget_dir`../domain.tpl"}
    <h2>
        <span class="spriteicon_img_mini" id="icon-ssl-manager_mini"></span>
        <span id="pageHeading">SSL/TLS</span>
    </h2>
    {if $act !='default'}
        {include file="`$widget_dir``$act`.tpl"}
    {else}

        <div class="body-content">
            <p class="description" id="descSSL">
                It is important to secure your site’s login areas, 
                shopping areas, and other pages where sensitive information could be sent over the web.
            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Domain</th>
                        <th>SSL</th>
                        <th>Type</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{$domain}</td>
                        <td>{if $list.ssl_on=='yes'}{$lang.On}{else}{$lang.Off}{/if}</td>
                        <td>{if $list.server=='yes'}Server's shared signed certificate{else}Own certificate{/if}</td>
                        <td>
                            {if $list.ssl_on=='yes'}
                                <a href="{$widget_url}&act=toggle&security_token={$security_token}">{$lang.disable}</a>
                            {else}{$lang.disabled}
                                <a href="{$widget_url}&act=toggle&security_token={$security_token}">{$lang.enable}</a>
                            {/if}
                        </td>
                    </tr>
                </tbody>
            </table>
            {if $list.error==1}
                <div class="alert">
                    {if $list.error_no_ip}
                        You can only add a certificate if have dedicated IP assigned to your account
                    {elseif $list.error_main_ip}
                        You can only add a certificate to your main domain ({$main_domain}), You would need additional IPs for other domains
                    {else}
                        {$list.details}
                    {/if}
                </div>
            {else}
                <h3 id="hdrCRT">Certificates (CRT)</h3>
                <p><a href="{$widget_url}&act=crts" id="lnkCRT">Generate, view, or upload SSL certificate.</a></p>

                <h3 id="hdrCSR">Certificate Signing Requests (CSR)</h3>
                <p><a href="{$widget_url}&act=csrs" id="lnkRequests">Generate SSL certificate signing requests.</a></p>

                <h3 id="hdrInstall">Certification Authority (CA)</h3>
                <p><a href="{$widget_url}&act=ca" id="lnkInstall">Upload a CA Root Certificate.</a></p>
            {/if}
        </div>
    {/if}
</div>
