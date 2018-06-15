<script type="text/javascript" src="{$system_url}templates/common/facebox/facebox.js"></script>
<link rel="stylesheet" href="{$system_url}templates/common/facebox/facebox.css" type="text/css" />
<link rel="stylesheet" href="../includes/types/widgets/meteredwidget/demo_table.css" type="text/css" />
<script type="text/javascript" src="../includes/types/widgets/meteredwidget/jquery.dataTables.min.js"></script> 
<script type="text/javascript">{literal}
    var bPaginate={
        "bFilter": false, 
        "sPaginationType": "full_numbers",
        "bLengthChange":false,
        "iDisplayLength": 24,
        "aaSorting": []
    };
	function metteredBillinghistory() {
                $('#meteredusagelog').addLoader();
		var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=metered_history';{literal};
                $.post(url,{metered_period:$('#metered_period').val(),metered_interval:$('#metered_interval').val()},function(data){
                    var r = parse_response(data);
                    if(r) {
                       var c=$('#meteredusagelog').empty().html(r).find('th');
                       c.width(Math.floor(100/c.length)+'%');
                      $('#meteredusagelog table').eq(0).dataTable(bPaginate);
                    }
                });
		return false;
	}
    function bindMe() {
        $('#tabbedmenu').TabbedMenu({elem:'.tab_content',picker:'li.tpicker',aclass:'active'});
        $('#meteredusagelog table').eq(0).dataTable(bPaginate);
    }
    appendLoader('bindMe');
    {/literal}</script>

<form action="" method="post" id="account_form" >
    <input type="hidden" value="{$details.firstpayment}" name="firstpayment" />
    <input type="hidden" name="account_id" value="{$details.id}" id="account_id" />
    <div class="blu">
        <table border="0" cellpadding="2" cellspacing="0" >
            <tr>
                <td class="menubar"><a href="?cmd=accounts&list={$currentlist}"><strong>&laquo; {$lang.backto} {$lang.accounts}</strong></a>&nbsp;
                    <input type="submit" name="save" value="{$lang.savechanges}" style="font-weight:bold;display:none"  id="formsubmiter"/>
                    <a   class="menuitm"   href="#" onclick="$('#formsubmiter').click();return false" ><span ><strong>{$lang.savechanges}</strong></span></a>
                    <a   class=" menuitm menuf"    href="#" onclick="confirm1();return false;"><span style="color:#FF0000">{$lang.Delete}</span></a><a   class="setStatus menuitm menul" id="hd1" onclick="return false;"   href="#" ><span class="morbtn">{$lang.moreactions}</span></a>
                <td><input type="checkbox" name="manual" value="1" {if $details.manual == '1'}checked="checked" {/if}  id="changeMode" style="display:none"/></td>
            </tr>
        </table>
        <ul id="hd1_m" class="ddmenu">
            <li ><a href="AdminNotes">{$lang.editadminnotes}</a></li>
            <li ><a href="ChangeOwner">{$lang.changeowner}</a></li></ul>
    </div>

    <div class="lighterblue" id="ChangeOwner" style="display:none;padding:5px;">
    </div>



    <div id="ticketbody" >
        <h1>{$lang.accounthash}{$details.id}</h1>

        {include file='_common/accounts_cancelrequest.tpl'}


        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.accountbdetails}</a>
            <a class="nav_el  left" href="?cmd=accounts&action=log&id={$details.id}" onclick="return false">{$lang.accountlog}</a>
            <div class="left">
                <span class="left" style="padding-top:5px;padding-left:5px;"><strong>{$details.firstname} {$details.lastname}'s:</strong>&nbsp;&nbsp;</span>

                {if $enableFeatures.profiles=='on'}<a class="nav_el  left"  href="?cmd=clients&action=clientcontacts&id={$details.client_id}" onclick="return false" >{$lang.Contacts}</a> {/if}
                <a class="nav_el  left"  href="?cmd=orders&action=clientorders&id={$details.client_id}" onclick="return false">{$lang.Orders}</a>
                <a class="nav_el  left"  href="?cmd=accounts&action=clientaccounts&id={$details.client_id}" onclick="return false">{$lang.Services}</a>
                <a class="nav_el  left" href="?cmd=domains&action=clientdomains&id={$details.client_id}" onclick="return false">{$lang.Domains}</a>
                <a class="nav_el  left" href="?cmd=invoices&action=clientinvoices&id={$details.client_id}" onclick="return false">{$lang.Invoices}</a>
                <a class="nav_el  left" href="?cmd=invoices&action=clientinvoices&id={$details.client_id}&currentlist=recurring" onclick="return false">{$lang.Recurringinvoices}</a>

		  {if $enableFeatures.estimates=='on'}<a class="nav_el  left" href="?cmd=estimates&action=clientestimates&id={$details.client_id}" onclick="return false">{$lang.Estimates}</a>{/if}

                <a class="nav_el  left" href="?cmd=transactions&action=clienttransactions&id={$details.client_id}" onclick="return false">{$lang.Transactions}</a>
                <a class="nav_el  left" href="?cmd=tickets&action=clienttickets&id={$details.client_id}" onclick="return false">{$lang.Tickets}</a>
                <a class="nav_el  left" href="?cmd=emails&action=clientemails&id={$details.client_id}" onclick="return false">{$lang.Emails}</a>
                <a class="nav_el direct left" href="?cmd=clients&action=show&id={$details.client_id}">{$lang.Profile}</a>

            </div>


            <div class="clear"></div>
        </div>
        <div class="ticketmsg ticketmain" id="client_tab">
            <div class="slide" style="display:block">
                <table cellspacing="2" cellpadding="3" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td width="15%" >{$lang.orderid}</td>
                            <td width="35%"><a href="?cmd=orders&action=edit&id={$details.order_id}">{$details.order_id}</a></td>
                            <td width="15%" >{$lang.paymethod}</td>
                            <td width="35%"><select name="payment_module" onclick="new_gateway(this)">
                                    <option value="0">{$lang.none}</option>
		  {foreach from=$gateways item=module key=id}
                                    <option value="{$id}" {if $details.payment_module==$id}selected="selected"{/if}>{$module}</option>
		  {/foreach}
                                    <option value="new" style="font-weight: bold">{$lang.newgateway}</option>

                                </select></td>
                        </tr>
                        <tr>
                            <td >{$lang.Client}</td>
                            <td ><a href="?cmd=clients&action=show&id={$details.client_id}">{$details.firstname} {$details.lastname}</a> </td>
                            <td >{if $metered_enable}Generate invoices{else}{$lang.billingcycle}{/if}</td>
                            <td ><select name="billingcycle">
                                    <option value="Free" {if $details.billingcycle=='Free'}selected='selected'{/if}>{if $metered_enable}Off{else}{$lang.Free}{/if}</option>
                                    {if !$metered_enable}<option value="One Time" {if $details.billingcycle=='One Time'}selected='selected'{/if}>{$lang.OneTime}</option>
                                    <option  value="Hourly" {if $details.billingcycle=='Hourly'}selected='selected'{/if}>{$lang.Hourly}</option>{/if}
                                    <option  value="Daily" {if $details.billingcycle=='Daily'}selected='selected'{/if}>{$lang.Daily}</option>
                                    <option  value="Weekly" {if $details.billingcycle=='Weekly'}selected='selected'{/if}>{$lang.Weekly}</option>
                                    <option  value="Monthly" {if $details.billingcycle=='Monthly'}selected='selected'{/if}>{$lang.Monthly}</option>
                                    <option value="Quarterly" {if $details.billingcycle=='Quarterly'}selected='selected'{/if}>{$lang.Quarterly}</option>
                                    <option value="Semi-Annually" {if $details.billingcycle=='Semi-Annually'}selected='selected'{/if}>{$lang.SemiAnnually} </option>
                                    <option value="Annually" {if $details.billingcycle=='Annually'}selected='selected'{/if}>{$lang.Annually} </option>
                                    <option value="Biennially" {if $details.billingcycle=='Biennially'}selected='selected'{/if}>{$lang.Biennially} </option>
                                    <option value="Triennially" {if $details.billingcycle=='Triennially'}selected='selected'{/if}>{$lang.Triennially} </option>
                                </select></td>
                        </tr>
                        <tr>
                            <td >{$lang.regdate}</td>
                            <td ><input type="text" class="haspicker" value="{$details.date_created|dateformat:$date_format}" name="date_created" size="12" /></td>
                            <td >{$lang.next_due}</td>
                            <td ><input type="text" class="haspicker" value="{$details.next_due|dateformat:$date_format}" name="next_due" size="12" /> <a class="editbtn" href="?cmd=invoices&filter[item_id]={$details.id}&filter[type]=Hosting" >{$lang.findrelatedinv}</a></td>
                        </tr>


                        <tr>
                            <td >{$lang.Status}</td>
                            <td >
                                <select name="status" {if $details.manual != '1'}style="display:none"{/if} class="manumode">
                                        <option {if $details.status == 'Pending'}selected="selected" {/if} value="Pending">{$lang.Pending}</option>
                                    <option {if $details.status == 'Active'}selected="selected" {/if} value="Active">{$lang.Active}</option>
                                    <option {if $details.status == 'Suspended'}selected="selected" {/if}  value="Suspended">{$lang.Suspended}</option>
                                    <option {if $details.status == 'Terminated'}selected="selected" {/if}  value="Terminated">{$lang.Terminated}</option>
                                    <option {if $details.status == 'Cancelled'}selected="selected" {/if}  value="Cancelled">{$lang.Cancelled}</option>
                                    <option {if $details.status == 'Fraud'}selected="selected" {/if}  value="Fraud">{$lang.Fraud}</option>
                                </select>

                                <span class="{$details.status} livemode" {if $details.manual == '1'}style="display:none"{/if}><strong>{$lang[$details.status]}</strong></span>
                            </td>
                            <td >{if $metered_enable}Next invoice total{else}{$lang.recurring}{/if}</td>
                            <td >{if $metered_enable}<b>{$details.metered_total|price:$details.currency}</b><a href="#" onclick="$('#tabbedmenu .tpicker').eq(1).click().ShowNicely();$('.tab_content').eq(1).ShowNicely();return false" class="editbtn orspace">Details</a>{else}<input type="text" value="{$details.total}" name="total" size="10"/>{/if}</td>
                        </tr>

                    </tbody>
                </table>
            </div>
            {if $enableFeatures.profiles=='on'}<div class="slide">Loading</div>{/if}
            <div class="slide">Loading</div>
            <div class="slide">Loading</div>
            <div class="slide">Loading</div>
		  {if $enableFeatures.estimates=='on'}<div class="slide">Loading</div>{/if}
            <div class="slide">Loading</div>  <div class="slide">Loading</div><div class="slide">Loading</div>
            <div class="slide">Loading</div> <div class="slide">Loading</div><div class="slide">Loading</div>
        </div>



        <ul class="tabs" id="tabbedmenu">
            <li class="tpicker active"><a href="#tab1" onclick="return false">Provisioning</a></li>
            {foreach from=$subsections item=subsection key=sid}
                <li class="tpicker"><a href="#sub{$sid}" >{$subsection.name}</a></li>
            {/foreach}
            <li class="tpicker"><a href="#tab2" onclick="return false">Metered Billing</a></li>
            <li class="tpicker"><a href="#tab3" onclick="return false">Addons<span id="numaddons" class="top_menu_count">{$details.addons}</span> </a></li>
        </ul>
        <div class="tab_container">

            <div class="tab_content" style="display: block;">
                {include file='_common/accounts_details.tpl'}
                <script type="text/javascript">
                    if(!$('[name="customfn"][value="Synchronize"]').length)
                        $('[name="suspend"],[name="create"],[name="terminate"]').last().after('<input type="submit" value="Synchronize" name="customfn">')
                    else $('[name="customfn"][value="Synchronize"]').show();
                </script>
            </div>
            {foreach from=$subsections item=subsection}
                <div class="tab_content" id="sub{$sid}" style="display: none;">
                    {include file=$subsection.tpl}
                </div>
            {/foreach}
            <div class="tab_content" style="display: none;">
                <!--metered billing start-->
                {if !$metered_enable}
                    Metered billing is disabled for this package, <a href="?cmd=services&action=product&id={$details.product_id}" target="_blank">click here to manage metered billing pricing.</a>
                {else}
                <table class="whitetable" width="100%" cellspacing="0" cellpadding="3">
                    <tr class="odd">
                        <td width="16%" align="right"><b>Billing period</b></td>
                        <td width="16%">{$details.previous_invoice|dateformat:$date_format} - {$details.next_invoice|dateformat:$date_format}</td>
                   
                        <td width="16%" align="right"><b>Next invoice total</b></td>
                        <td width="16%"><b>{$details.metered_total|price:$details.currency}</b></td>
                    
                        <td width="16%" align="right"><b>Fixed recurring charge</b></td>
                        <td width="16%">{$details.currency.sign}<input value="{$details.total}" name="total" size="4"/></td>
                    </tr>
                     <tr class="odd">
                        <td colspan="6">
                            <b>Next invoice details</b> <span class="fs11">updated Daily</span><br/>
                            <div class="report">
                              {if $details.total}
                               <div class="button">
                                    <span class="attr">{$lang[$details.billingcycle]}:</span>
                                    <span class="value">{$details.total|price:$details.currency_id}</span>
                                </div>
                              {/if}

                              {foreach from=$metered_summary item=vr}{if $vr.options & 4}{continue}{/if}
                                <div class="button">
                                    <span class="attr">{$vr.name}:</span>
                                    <span class="value">{$vr.charge|price:$details.currency_id:true:false:true:4}</span>
                                </div>
                              {/foreach}
                            </div>
                        </td>
                    </tr>
                    <tr class="even">
                        <td colspan="4"></td>
                        <td colspan="2" style="text-align:right">
                            Interval: <select name="metered_interval" id="metered_interval" onchange="metteredBillinghistory()">

                                <option value="1d">1 Day</option>

                            </select>
                            Month (yyyy-mm): <select name="metered_period" id="metered_period" onchange="metteredBillinghistory()">
                                {foreach from=$metered_periods item=p}
                                    <option value="{$p}">{$p}</option>
                                {/foreach}
                            </select></td>
                    </tr>
                </table>
                {if $metered_usage_log}<div id="meteredusagelog" style="width:100%">
                   {include file="ajax.accountbilling_Metered.tpl"}

                </div>
                <div class="clear"></div>
                <br/><b>Legend</b>
                <table class="whitetable fs11" width="100%" cellspacing="0" cellpadding="3">
                    {foreach from=$metered_usage_log.variables item=vr}
                        <tr class="even">
                            <td width="150"><b>{$vr.name}</b></td>
                            <td>{$vr.description}</td>

                        </tr>
                    {/foreach}
                </table>

                {else}
                <table class="whitetable" width="100%" cellspacing="0" cellpadding="3">
                    <tr class="odd havecontrols">
                        <td align="center"><b>No data reported yet</b></td>
                    </tr>

                </table>

                {/if}
              
               
                {/if}
                <!--eof: metered billing -->
            </div>
            <div class="tab_content" style="display: none;">
                {include file='_common/accounts_addons.tpl'}
            </div>
        </div>

        <div class="clear"></div>
        {include file='_common/accounts_multimodules.tpl'}
        {include file='_common/noteseditor.tpl'}

    </div>



    <div class="blu">{include file='_common/accounts_nav.tpl'}</div>
    {securitytoken}
</form>
{literal}
<script type="text/javascript">
            function metteredBillinghistory_cloudstack() {
                var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=metered_history&';{literal}
                $.facebox({ ajax: url,width:800,nofooter:true,opacity:0.8,addclass:'modernfacebox' });
                return false;
            }
            function metteredBillingusage_cloudstack(varid) {
                var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=metered_addusage&variable='+varid;{literal}
                $.facebox({ ajax: url,width:500,nofooter:true,opacity:0.8,addclass:'modernfacebox' });
                return false;
            }
            function metteredBillingentry_cloudstack(varid) {
                 var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=variable_log&variable='+varid;{literal}

                $.facebox({ ajax: url,width:900,nofooter:true,opacity:0.8,addclass:'modernfacebox' });
                return false;
            }
</script> 
{/literal}
