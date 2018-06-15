<script src="{$template_dir}/js/affiliates.js" type="text/javascript"></script>
<div id="bodycont">
    <input type="hidden" id="affiliate_id" value="{$affiliate.id}" />
    <div class="modal fade" tabindex="-1" role="dialog" id="batch-status">
        <form action="?cmd=affiliates&action=affiliate&id={$affiliate.id}" method="post">
            <input type="hidden" name="make" value="manualcommission" />
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Add manual commission</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <p>Enter related invoice id.</p>
                                <input class="form-control" type="text" name="invoice_id" value="0"/>
                            </div>
                            <div class="form-group col-md-6">
                                <p>Commisson amount</p>
                                <input class="form-control" type="text" name="commission" value="0.00"/>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Commission</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
            {securitytoken}
        </form>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" id="withdrawal_tab">
        <form action="?cmd=affiliates&action=affiliate&id={$affiliate.id}" method="post">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{$lang.makewithd}</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>{$lang.amount}</label>
                            <input class="form-control" type="text" value="{$affiliate.balance}" name="payout"/>
                        </div>
                        <div class="form-group">
                            <label>{$lang.Type}</label>
                            <select class="form-control" name="type">
                                <option value="0">{$lang.manualmode}</option>
                                <option value="1">{$lang.addtransaction}</option>
                                <option value="2">{$lang.addcredit|capitalize}</option>
                            </select> 
                        </div>
                        <div class="form-group">
                            <label>{$lang.notes}</label>
                            <textarea class="form-control" name="note"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit"  name="withok" class="btn btn-primary">{$lang.makewithd}</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
            {securitytoken}
        </form>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" id="assign-client">
        <form action="?cmd=affiliates&action=affiliate&id={$affiliate.id}&assign" method="post">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Assign client</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Select client to assign.</label>
                            <select class="form-control" name="client_id"></select> 
                            <div class="help-block"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary client-assign" >Assign</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
            {securitytoken}
        </form>
    </div>

    <div class="blu">
        <a href="?cmd=affiliates"><strong>{$lang.backtoaffi}</strong></a>
        <a href="#" onclick="$('#affiliateform').submit();
                return false;" class="menuitm"><span>{$lang.savechanges}</span></a>
        <a href="#" class="menuitm"  data-toggle="modal" data-target="#batch-status">Add commission</a>
        <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>
        <ul class="ddmenu" id="hd1_m">
            <li>
                <a onclick="$('#withdrawal_tab').modal('show');
                    return false;" href="#">{$lang.makewithd}</a>
            </li>
            <li>
                <a class="directly" href="?cmd=affiliates&action=toggle&id={$affiliate.id}&security_token={$security_token}">
                    {if $affiliate.status == 'Active'}
                        Disable Affiliate
                    {else}
                        Enable Affiliate
                    {/if}
                </a>
            </li>
            <li>
                <a onclick="confirm('{$lang.affdelconf}') && (window.location = '?cmd=affiliates&make=delete&id={$affiliate.id}&security_token={$security_token}');
                    return false;"
                   href="#AffDelete"> Delete Affiliate</a>
            </li>

        </ul>
    </div>
    <div id="ticketbody">
        <h1>{$lang.affiliatehash}{$affiliate.id} {$affiliate.firstname} {$affiliate.lastname}</h1>
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.affdetails}</a> 
            {include file="_common/quicklists.tpl"}
            <div class="clear"></div>
        </div>

        <div class="ticketmsg ticketmain" id="client_tab">
            <div class="slide" style="display:block">
                <form action='' method='post' id="affiliateform">
                    <table cellspacing="2" cellpadding="3" border="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 15%; text-align: right" >{$lang.affiliatehash}</td>
                                <td >#{$affiliate.id}</td>
                                <td style="width: 15%; text-align: right" >{$lang.pendingcom}</td>
                                <td >{$pending|price:$affiliate.currency_id}</td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right">{$lang.Client}</td>
                                <td ><a href="?cmd=clients&action=show&id={$affiliate.client_id}">{$affiliate.firstname} {$affiliate.lastname}</a> </td>

                                <td style="width: 15%; text-align: right">{$lang.affsince}</td>
                                <td >{$affiliate.date_created|dateformat:$date_format}</td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right">{$lang.status}</td>
                                <td ><span class="{$affiliate.status}">{$lang[$affiliate.status]}</span></td>

                                <td style="width: 15%; text-align: right">{$lang.convrate}</td>
                                <td >{$affiliate.conversion} %</td> 

                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right">{$lang.visitors}</td>
                                <td ><input size="3" value="{$affiliate.visits}" name="visits"/></td>

                                <td style="width: 15%; text-align: right">{$lang.withdrawn}</td>
                                <td ><input size="3" value="{$affiliate.total_withdrawn}" name="total_withdrawn"/></td>

                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right">Parent Affiliate</td>
                                <td >
                                    <select name="parent_id">
                                        <option value="0"> - </option>
                                        {foreach from=$affiliates item=aff}
                                            {if $aff.id != $affiliate.id}
                                                <option value="{$aff.id}" {if $affiliate.parent_id==$aff.id}selected="selected"{/if} >
                                                    #{$aff.id} {$aff.firstname} {$aff.lastname}
                                                </option>
                                            {/if}
                                        {/foreach}  
                                    </select>
                                </td>

                                <td style="width: 15%; text-align: right">Auto Withdraw</td>
                                <td >
                                    <select name="withdraw_method">
                                        <option {if $affiliate.withdraw_method==0}selected="selected"{/if} value="0">Disabled</option>
                                        <option {if $affiliate.withdraw_method==1}selected="selected"{/if} value="1">Mailed Check</option>
                                        <option {if $affiliate.withdraw_method==2}selected="selected"{/if} value="2">Account Credit</option>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">{$lang.commissions}</td>
                                <td ><input size="3" value="{$affiliate.total_commissions}" name="total_commissions"/></td>

                                <td style="width: 15%; text-align: right; vertical-align: top; line-height: 23px" rowspan="2">Available Commission plans</td>
                                <td rowspan="2" style="vertical-align: top">
                                    <select name="commision_plans[]" {if $AffMultiplePlans}multiple="multiple"  size=3{/if}  style="min-width:200px">
                                        {if $AffMultiplePlans}
                                            <option value="all" {if !$affiliate.commision_plans}selected="selected"{/if}>All Commission plans</option>
                                        {/if}
                                        {foreach from=$commisionsplans item=cp}
                                            <option value="{$cp.id}" {if in_array($cp.id, $affiliate.commision_plans)}selected="selected"{/if}>{$cp.name}</option>
                                        {/foreach}
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right">{$lang.affiliateurl}</td>
                                <td><input value="{$system_url}?affid={$affiliate.id}" readonly="readonly" style="width:300px"/></td>

                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right; vertical-align: top">
                                    {$lang.AffLandingPage}
                                </td>
                                <td>
                                    <input value="{$landingurl}" name="landingurl" type="text" style="width:300px"/><br />
                                    <input id="landingurl_disable" type="checkbox" name="landingurl_disable" value="1" {if $landingurl_disabled}checked{/if} /> 
                                    Disabled landing page redirect for this affiliate
                                    <br />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" value="{$lang.savechanges}" name="savechanges"/>
                    {securitytoken}
                </form>
            </div>

            {include file="_common/quicklists.tpl" _placeholder=true}
        </div> 
        <div style="padding: 0 5px 5px 0">
            <a href="#" onclick="$('#affiliateform').submit();
                    return false;" class="menuitm"><span>{$lang.savechanges}</span></a>

            <a href="#" class="menuitm"  data-toggle="modal" data-target="#batch-status">Add commission</a>
            <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>

        </div>
    </div> 

</div>

<div class="row no-gutter" style="margin-top: 20px">

    <div class="col-md-6 mainleftcol">
        <div class="box ">
            <div class="box-header">
                <div class="pull-right">
                    <a href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#withdrawal_tab"><i class="fa fa-usd"></i> {$lang.makewithd}</a>
                </div>
                <h3 class="box-title">
                    <i class="fa fa-clock-o"></i>
                    {$lang.withhistory}
                </h3>
            </div>
            <div class="box-body">

                <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="table glike">
                    <tbody>
                        {if $withdrawals}
                            <tr>
                                <th width="130">{$lang.Date}</th>        
                                <th width="160">{$lang.amount}</th>
                                <th>{$lang.notes}</th>
                                <th width="20"></th>
                            </tr>
                            {foreach from=$withdrawals item=wid}
                                <tr>
                                    <td width="130">{$wid.date|dateformat:$date_format}</td>        
                                    <td>{$wid.amount|price:$affiliate.currency_id}</td>
                                    <td>{$wid.note}</td>
                                    <td>
                                        <a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&removelog={$wid.id}&security_token={$security_token}" 
                                           class="btn btn-danger btn-xs"  onclick="return confirm('{$lang.confirmloga}')"><span class="fa fa-trash-o"></span></a>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr><td><center>{$lang.nothingtodisplay}</center></td></tr>
                        {/if}

                    </tbody>
                </table>	
            </div>   
        </div>
    </div>
    <div class="col-md-6 mainrightcol">
        <div class="box ">
            <div class="box-header">
                <div class="pull-right">
                    <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#assign-client" ><span class="fa fa-plus"></span> Add Client</a>
                </div>
                <h3 class="box-title">
                    <i class="fa fa-users"></i>
                    Assigned Clients
                </h3>
            </div>
            <div class="box-body">
                <table width="100%" cellspacing="0" cellpadding="3" border="0" style="" class="table glike">
                    <tbody>
                        {if $clients}
                            <tr>
                                <th width="130">ID</th>        
                                <th>{$lang.Client}</th>
                                <th>Assigned by</th>
                                <th width="20"></th>
                            </tr>
                            {foreach from=$clients item=client}
                                <tr>
                                    <td width="130"><a href="?cmd=clients&action=show&id={$client.client_id}">#{$client.client_id}</a></td>        
                                    <td><a href="?cmd=clients&action=show&id={$client.client_id}">{$client.firstname} {$client.lastname}</a></td>
                                    <td>{$client.by}</td>
                                    <td><a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&unassign={$client.client_id}&security_token={$security_token}"
                                           class="btn btn-danger btn-xs" ><span class="fa fa-trash-o"></span></a></td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr><td><center>{$lang.nothingtodisplay}</center></td></tr>
                        {/if}

                    </tbody>
                </table>	
            </div>   
        </div>
    </div>
    <div class="col-md-12">
        <div class="box ">
            <div class="box-header">
                <h3 class="box-title">
                    <i class="fa fa-line-chart pull-left"></i>
                    {$lang.commissions}
                </h3>  
                <div style="float: right; font-weight: normal; font-size: 11px; color: rgb(83, 83, 83);"><span class="pord"></span>&nbsp; {$lang.paidcommissions}</div>
            </div>

            <div class="box-body">

                <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike" style="line-height: 20px;">
                    <tbody>
                        {if $orders}
                            <tr>
                                <th style="width: 50px">ID</th>
                                <th style="width: 130px">{$lang.signupdate}</th>
                                <th style="width: 180px">{$lang.Client}</th>
                                <th style="width: 180px">{$lang.service|capitalize}</th>
                                <th style="width: 180px">{$lang.commission}</th>
                                <th style="width: 180px" colspan="2" style="text-align: center">{$lang.servicestatus}</th>
                                <th style="width: 180px"></th>
                            </tr> 
                            {foreach from=$orders item=order}
                                <tr {if $order.paid=='1'}class="compor"{/if}>
                                    <td>{$order.id}</td>
                                    <td>{$order.date_created|dateformat:$date_format}</td>
                                    <td><a href="?cmd=clients&action=show&id={$order.client_id}">{$order.firstname} {$order.lastname}</a></td>
                                    <td style="vertical-align: top">
                                        {$lang.Order}: <a href="?cmd=orders&action=edit&id={$order.order_id}">#{$order.order_id}</a> {$lang.Total}: {$order.total|price:$order.currency_id}
                                        {if $order.invoice_id}
                                            <br />{$lang.Invoice}: <a href="?cmd=invoices&action=edit&id={$order.invoice_id}">#{$order.invoice_id}</a>
                                        {/if}
                                        {if $order.accounts}
                                            {foreach from=$order.accounts item=acc}
                                                <br />{$lang.Account}: <a href="?cmd=accounts&action=edit&id={$acc.id}">#{$acc.id} - {$acc.name}</a>
                                            {/foreach}
                                        {/if}
                                        {if $order.domains}
                                            {foreach from=$order.domains item=dom }
                                                <br />{$lang.Domain}: <a href="?cmd=domains&action=edit&id={$dom.id}">#{$dom.id} - {$dom.name}</a>
                                            {/foreach}
                                        {/if}
                                        {if $order.invoice_id && $order.order_id}
                                            <br />
                                            <span style="color: red">This is a recurring commission</span>
                                        {/if}
                                    </td>
                                    <td style="vertical-align: middle">
                                        {if $order.paid=='1'}{$order.commission|price:$affiliate.currency_id}
                                        {else}
                                            <input type="text" class="commission-val" data-ref="{$order.id}"
                                                   value="{$order.commission|price:$affiliate.currency_id:false}" size="6"> 
                                            {$affiliate.currency.code}
                                        {/if}
                                    </td>
                                    <td style="vertical-align: top; text-align: right">
                                        {if $order.order_id}
                                            {$lang.Order}:
                                        {/if}
                                        {if $order.invoice_id}
                                            <br />{$lang.Invoice}:
                                        {/if}
                                        {if $order.accounts}
                                            {foreach from=$order.accounts item=acc}
                                                <br />{$lang.Account} #{$acc.id}: 
                                            {/foreach}
                                        {/if}
                                        {if $order.domains}
                                            {foreach from=$order.domains item=dom}
                                                <br />{$lang.Domain} #{$dom.id}: 
                                            {/foreach}
                                        {/if}
                                    </td>
                                    <td style="vertical-align: top">
                                        <span class="{$order.status}"><strong>{$lang[$order.status]}</strong></span>
                                                {if $order.invoice_id}
                                            <br /><span class="{$order.invstatus}"><strong>{$lang[$order.invstatus]}</strong></span>
                                                {/if}
                                                {if $order.accounts}
                                                    {foreach from=$order.accounts item=acc}
                                                <br /><span class="{$acc.status}"><strong>{$lang[$acc.status]}</strong></span>
                                                    {/foreach}
                                                {/if}
                                                {if $order.domains}
                                                    {foreach from=$order.domains item=dom}
                                                <br /><span class="{$dom.status}"><strong>{$lang[$dom.status]}</strong></span>
                                                    {/foreach}
                                                {/if}
                                    </td>
                                    <td style="text-align: right">

                                        {if $order.paid!='1'}
                                            <a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&acceptref={$order.id}&security_token={$security_token}" 
                                               class="btn btn-success btn-sm acceptref">
                                                {if $order.invoice_id}
                                                    Accept commission 
                                                {else}
                                                    {$lang.acceptref}
                                                {/if}
                                            </a>
                                        {/if}
                                        <a href="?cmd=affiliates&action=affiliate&id={$affiliate.id}&removeref={$order.id}&security_token={$security_token}" 
                                           class="btn btn-danger btn-sm" onclick="return confirm('{$lang.confirmlogab}')"><span class="fa fa-trash-o"></span></a>

                                    </td>
                                </tr> 
                            {/foreach}
                        {else}
                            <tr><td><center>{$lang.nothingtodisplay}</center></td></tr>
                        {/if}
                    </tbody>
                </table>	
            </div> 
        </div>
    </div>
</div>
<div class="blu">
    <a href="?cmd=affiliates"><strong>{$lang.backtoaffi}</strong></a>
    <a href="#" onclick="$('#affiliateform').submit();
            return false;" class="menuitm"><span>{$lang.savechanges}</span></a>
    <a class="menuitm clDropdown" id="hd1" onclick="return false;" href="#"><span class="morbtn">More actions</span></a>
</div>
