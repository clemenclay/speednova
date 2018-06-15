{if $cperror}
    <div style="border-radius: 6px 6px 6px 6px; background: url('icons/ico_warn.gif') no-repeat scroll 8px 8px #FFFBCC; border: 1px solid #E6DB55;color: #FF0000;font-weight: bold;margin-bottom: 8px;padding: 8px 8px 8px 30px;">
        {$lang.couldconectto} <strong>CPanel</strong>
        <br />
        {$lang.checkyourloginpassword}
    </di>
{else}
    <div style="margin: 10px 0; padding: 0 10px;">
        <h2>
            <span>Addon Domains</span>
        </h2>
        <br />
        <div class="body-content">
            <p class="description">
                Use addon domains to host additional domains on your account. 
            </p>

            <div class="section">
                <table id="subdomaintbl" class="sortable table table-striped">
                    <thead>
                        <tr>
                            <th class=" clickable" style="white-space:nowrap;" nowrap="nowrap">
                                Addon Domains
                            </th>
                            <th class="cell-end sorttable_nosort">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$list item=entry key=key}
                            <tr>
                                <td style="white-space:nowrap;" nowrap="nowrap">
                                    {$entry.domain}
                                </td>
                                <td>
                                    <a href="{$widget_url}&act=del&name={$entry.domain}&security_token={$security_token}"
                                       onclick="return confirm('Do You really want to delete this entry?')">
                                        <span class="icon icon-trash" title="Remove"></span>
                                    </a>
                                </td>
                            </tr>
                        {foreachelse}
                            <tr>
                                <td id="errNoConfigured" colspan="6" class="errors">
                                    No addon domains are configured.
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
                <!-- end subdomaintbl -->
            </div>
            <!-- end cpanelfeature addondomains -->
        </div><!-- end body-content -->
       
        <h3>Create an Addon Domain</h3>
        <div class="section">
            <form id="mainform" method="post" action="{$widget_url}&act=add" name="mainform">
                <div class="control-group">
                    <label id="lblDomain" for="domain">
                        New Domain Name
                    </label>
                    <input id="domain" class="form-control" name="domain" type="text" required>
                </div>
                
                <div class="control-group">
                    <input id="submit_domain" name="go" class="btn btn-flat-primary btn-primary" value="Add Domain" type="submit">
                </div>
                {securitytoken}
            </form>
        </div>
    </div>
    <script src="{$widgetdir_url}script.js" type="text/javascript"></script>        
{/if}
