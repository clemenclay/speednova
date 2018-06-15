
    <div style="margin: 10px 0; padding: 0 10px;">
        {include file="`$widget_dir`../domain.tpl"}
        <h2>
            <span id="pageHeading">Forwarders</span>
        </h2>
        <br />
        <div class="body-content">

            <div class="section">
                <h3>Email Account Forwarders</h3>

                <p class="description" id="txt_forwarders-description">
                    Send a copy of any incoming email from one address to another. For example, 
                    forward <strong>joe@example.com</strong> to <strong>joseph@example.com</strong> 
                    so that you only have one inbox to check. 
                </p>

                <table id="mailtbl" class="sortable truncate-table table table-striped">
                    <thead>
                        <tr>
                            <th class=" clickable" id="tblHead_EmailAddress">Email Address</th>
                            <th class=" clickable" id="tblHead_ForwardTo">Forward To</th>
                            <th style="width: 40px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$list item=entry}
                            <tr>
                                <td style="white-space: nowrap">{$entry.email}</td>
                                <td >{$entry.forward|escape}</td>
                                <td >
                                    <a href="{$widget_url}&act=del&usr={$entry.user}&security_token={$security_token}"
                                       onclick="return confirm('Do You really want to delete this entry?')">
                                        <span class="icon icon-trash" title="Remove"></span>
                                    </a>
                                </td>
                            </tr>
                        {foreachelse}
                            <tr>
                                <td colspan="3" class="errors">
                                    There are no forwarders configured for the current domain.
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                    <tfoot></tfoot>
                </table>
            </div>
            <!-- end cpanelfeature forwarders -->
            <div class="section">
                <h3>Forward All Email for a Domain</h3>
                <p class="description" id="forwarders-domain-forward-description-text">
                    In addition to forwarding individual mail accounts, you can forward all email from one domain to another.
                </p>
                <table id="dfwdmailtbl" class="sortable table table-striped">
                    <thead>
                        <tr>
                            <th class="cell-end clickable">Domain</th>
                            <th class="cell clickable">Forward To</th>
                            <th style="width: 40px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $dlist}
                            <tr>
                                <td style="white-space: nowrap">{$dlist.domain}</td>
                                <td >{$dlist.forward|escape}</td>
                                <td >
                                    <a href="{$widget_url}&act=deldomain&domain={$dlist.domain}&security_token={$security_token}">
                                        <span class="icon icon-trash" title="Remove"></span>
                                    </a>
                                </td>
                            </tr>
                        {else}
                            <tr>
                                <td colspan="3" class="errors">
                                    There are no Domain Forwarders setup for this domain.
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>

            <div class="pull-right">
                <a class="btn btn-flat-primary btn-primary" id="btn_AddForwarder" data-action="newfowarder">Add Forwarder</a>
                <a class="btn btn-flat-primary btn-primary" id="btn_AddDomainForwarder" data-action="newdomainfowarder" >Set Domain Forwarder</a>
            </div>
            <!--  -------------- -->

            <div style="display: none">
                <div class="modal hide fade" id="action-newfowarder">
                    <form action="{$widget_url}&act=addforwarder" method="POST" style="margin: 0">
                        <div class="modal-header">
                            <button type="button" class="close hide-modal" aria-hidden="true">×</button>
                            <h2 id="myModalLabel">Add a New Forwarder</h2>
                            <p>Note, you can specify multiple email addresses in the "Destination" field if you wish: email1@domain.com, email2@domain.com</p>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" size="40" value="" name="name" class="form-control _txt">
                            <div class="row-fluid">
                                <h3 class="span6">Address</h3>
                                <h3 class="span6">Destination</h3>
                            </div>
                            <div class="row-fluid">
                                <div class="control-group span6">
                                    <label for="email">
                                        Address to Forward
                                    </label>
                                    <div class="input-append form-inline" style="white-space: nowrap">
                                        <input type="text" name="email" id="email" autocomplete="off" autofill="off" class="form-control span2">{*}
                                        {*}<span class="add-on">@{$domain}</span>
                                    </div>
                                </div>
                                <div class="control-group span6">
                                    <label for="fwd_radio">
                                        Forward to email address
                                    </label>
                                    <div class="">
                                        <input type="text" class="form-control" id="fwdemail" name="fwdemail">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="modal-footer">
                            <span class="pull-right">
                                <button type="submit" class="default btn btn-flat-primary btn-primary">Add Forwarder</button>
                                <button type="button" class="default btn hide-modal">Cancel</button>
                            </span>
                        </div>
                        {securitytoken}
                    </form>
                </div>
                <!--  
                    DOMAIN FORWARDER MODAL
                -->   
                <div class="modal hide fade" id="action-newdomainfowarder">
                    <form action="{$widget_url}&act=adddomainforwader" method="POST" style="margin: 0">
                        <div class="modal-header">
                            <button type="button" class="close hide-modal" aria-hidden="true">×</button>
                            <h2 id="myModalLabel">Domain Forwarder</h2>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" size="40" value="" name="name" class="form-control _txt">
                            <p class="description" id="descDomainFwder">
                                In addition to forwarding individual mail accounts, you can forward all email from one domain to another.
                            </p>
                            <div class="control-group">
                                <label for="domain" id="lblDomain">
                                    Forward emails from
                                </label>
                                <div class="control-group">
                                    <span class="input-prepend form-inline">
                                        <strong class="add-on">{$domain}</strong>{*}
                                        {*}<span class="add-on"> to </span>{*}
                                        {*}<input type="text" id="forward" name="forward" class="form-control" value="{$dlist.forward}">
                                    </span>
                                    
                                </div>
                            </div>
                        </div> 
                        <div class="modal-footer">
                            <span class="pull-right">
                                <button type="submit" class="default btn btn-flat-primary btn-primary">Update Domain Forwarder</button>
                                <button type="button" class="default btn hide-modal">Cancel</button>
                            </span>
                        </div>
                        {securitytoken}
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="{$widgetdir_url}script.js" type="text/javascript"></script>
