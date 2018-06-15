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



    <div id="ticketbody">
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
                                    <option value="0">{$lang.none}</option>{foreach from=$gateways item=module key=id}
                                    <option value="{$id}" {if $details.payment_module==$id}selected="selected"{/if}>{$module}</option>
			 {/foreach} <option value="new" style="font-weight: bold">{$lang.newgateway}</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td >{$lang.Client}</td>
                            <td ><a href="?cmd=clients&action=show&id={$details.client_id}">{$details.firstname} {$details.lastname}</a> </td>
                            <td >{$lang.billingcycle}</td>
                            <td ><select name="billingcycle">
                                    <option value="Free" {if $details.billingcycle=='Free'}selected='selected'{/if}>{$lang.Free}</option>
                                    <option value="One Time" {if $details.billingcycle=='One Time'}selected='selected'{/if}>{$lang.OneTime}</option>
                                    <option  value="Hourly" {if $details.billingcycle=='Hourly'}selected='selected'{/if}>{$lang.Hourly}</option>
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
                            <td >{$lang.Addons}</td>
                            <td ><span id="numaddons">{$details.addons}</span> {$lang.addons_plu}</td>
                            <td >{$lang.firstpayment}</td>
                            <td >{$details.currency.sign}<input type="text" value="{$details.firstpayment}" name="firstpayment" size="10"/></td>
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
                            <td >{$lang.recurring}</td>
                            <td >{$details.currency.sign}<input type="text" value="{$details.total}" name="total" size="10"/></td>
                        </tr>

                    </tbody>
                </table>
            </div>
{if $enableFeatures.profiles=='on'}<div class="slide">Loading</div>{/if}{if $enableFeatures.estimates=='on'}<div class="slide">Loading</div>{/if}
            <div class="slide">Loading</div><div class="slide">Loading</div><div class="slide">Loading</div>
            <div class="slide">Loading</div>  <div class="slide">Loading</div><div class="slide">Loading</div>
            <div class="slide">Loading</div> <div class="slide">Loading</div><div class="slide">Loading</div>
        </div>



        <ul class="tabs" id="tabbedmenu">
            <li class="tpicker active"><a href="#tab1" onclick="return false">Provisioning</a></li>
            {if $bandwidthtab}<li class="tpicker"><a href="#tab2" onclick="return false">Bandwidth</a></li>{/if}
            {if $mtred}<li class="tpicker"><a href="#tab2" onclick="return false">Metered Billing</a></li>{/if}
             <li class="tpicker"><a href="#tab2" onclick="return false">IPAM</a></li>
            {if $dedimgr}            <li class="tpicker"><a href="#tab2" onclick="return false">Dedicated Srv Manager</a></li> {/if}
            {if $switch}            <li class="tpicker"><a href="#tab2" onclick="return false">Switch</a></li> {/if}
            {if $pdu}            <li class="tpicker"><a href="#tab2" onclick="return false">PDU</a></li> {/if}
            <li class="tpicker"><a href="#tab3" onclick="return false">Addons<span id="numaddons" class="top_menu_count">{$details.addons}</span> </a></li>
        </ul>
        <div class="tab_container">

            <div class="tab_content" style="display: block;">
                {include file='_common/accounts_details.tpl'}
            </div>
            {if $bandwidthtab}<div class="tab_content" style="display: none;">
                 {include file=$bandwidthtab}
            </div>{/if}

            {if $mtred}<div class="tab_content" style="display: none;">
                {include file='accountbilling_Metered.tpl'}
                </div>{/if}
            <div class="tab_content" style="display: none;">

                                                <input value="{$details.os}" name="os" type="hidden" />
                                                <input name="node" value="{$details.node}" type="hidden"  />
                                                <input value="{$details.burstable_ram}" name="burstable_ram"  type="hidden"/>
                                                <input value="{$details.guaranteed_ram}" name="guaranteed_ram"  type="hidden"/>
                                                <input value="{$details.bw_limit}" name="bw_limit"  type="hidden"/>
                                                <input value="{$details.disk_limit}" name="disk_limit" type="hidden" />

                <div id="ipameditor">  {if $ipam}
                {literal}
                <script type="text/javascript">
                    function loadIpamMGR() {
                        ajax_update('?cmd=module&module=ipam&action=accountseditor',{account_id:$('#account_id').val()},'#ipameditor');
                    }
                    $(document).ready(loadIpamMGR);
                </script>
                {/literal}
                {/if}


                            <table cellspacing="2" cellpadding="3" border="0" width="100%" >
                                <tbody>
                                    <tr>
                                        <td width="150">{$lang.mainip}</td>
                                        <td><input value="{$details.ip}" name="ip" /></td>
                                    </tr>

			{if $details.additional_ip}
				{foreach from=$details.additional_ip item=ip}

                                    <tr>
                                        <td width="150">{$lang.addip}</td>
                                        <td><input value="{$ip}" name="additional_ip[]" /></td>
                                    </tr>
				{/foreach}
                                    <tr>
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" id="addip0" style="display:none" />
                                            <a href="#" onclick="$(this).hide();$('#addip0').show();$('#addip00').show();return false;">{$lang.clicktoadd}</a>

                                            <a href="#" onclick="$(this).hide();$('#addip1').show();return false;" id="addip00" style="display:none">{$lang.addmoreip}</a></td>
                                    </tr>
			{else}

                                    <tr>
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" id="addip0" style="display:none" />
                                            <a href="#" onclick="$(this).hide();$('#addip0').show();$('#addip00').show();return false;">{$lang.clicktoadd}</a>

                                            <a href="#" onclick="$(this).hide();$('#addip1').show();return false;" id="addip00" style="display:none">{$lang.addmoreip}</a></td>
                                    </tr>

			{/if}


                                    <tr style="display:none" id="addip1">
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();$('#addip2').show();return false;">{$lang.addmoreip}</a></td>
                                    </tr>
                                    <tr style="display:none"  id="addip2">
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();$('#addip3').show();return false;">{$lang.addmoreip}</a></td>
                                    </tr>
                                    <tr style="display:none"  id="addip3">
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();$('#addip4').show();return false;">{$lang.addmoreip}</a></td>
                                    </tr>
                                    <tr style="display:none"  id="addip4">
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" />  <a href="#" onclick="$(this).hide();$('#addip5').show();return false;">{$lang.addmoreip}</a></td>
                                    </tr>
                                    <tr style="display:none"  id="addip5">
                                        <td>{$lang.addip}</td>
                                        <td><input value="" name="additional_ip[]" /> </td>
                                    </tr>
                         </tbody>
                     </table>
</div>

            </div>
            {if $dedimgr} <div class="tab_content" style="display: none;">
                <div id="dedimgr">Loading...</div>
                {literal}
                <script type="text/javascript">
                    function loadDediMgr() {
                        ajax_update('?cmd=module&module=dedimgr&do=getassignments',{account_id:$('#account_id').val()},'#dedimgr');
                    }
                    $(document).ready(loadDediMgr);
                </script>
                {/literal}


            </div> {/if}
            {if $switch} <div class="tab_content" style="display: none;">
                {literal}
                <script type="text/javascript">
                    function loadSwitchMgr() {
                        ajax_update('?cmd=switch_control&action=getAvailableSwitches',{account_id:$('#account_id').val()},'#switchmgr');
                    }
                    $(document).ready(loadSwitchMgr);
                </script>
                <div id="switchmgr">Loading...</div>
                {/literal}

            </div> {/if}
            {if $pdu} <div class="tab_content" style="display: none;">
                {literal}
                <script type="text/javascript">
                    function loadPDUMgr() {
                        ajax_update('?cmd=pdu_snmp&action=getAvailablePDUs',{account_id:$('#account_id').val()},'#pdumgr');
                    }
                    $(document).ready(loadPDUMgr);
                </script>
                <div id="pdumgr">Loading...</div>
                {/literal}
            </div> {/if}
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
    function bindMe() {
        $('#tabbedmenu').TabbedMenu({elem:'.tab_content',picker:'li.tpicker',aclass:'active'});
    }
    appendLoader('bindMe');
</script>{/literal}

{graphs rel_id=$details.id rel_type='Hosting'}
