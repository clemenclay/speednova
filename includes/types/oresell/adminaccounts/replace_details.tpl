<script type="text/javascript" src="{$system_url}templates/common/facebox/facebox.js"></script>
<link rel="stylesheet" href="{$system_url}templates/common/facebox/facebox.css" type="text/css" />
<script type="text/javascript">{literal}
  
    function bindMe() {
        $('#tabbedmenu').TabbedMenu({elem:'.tab_content',picker:'li.tpicker',aclass:'active'});
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
            <li class="tpicker"><a href="#tab2" onclick="return false">Virtual Machines<span  class="top_menu_count" id="vm_count">0</span> </a></li>
            <li class="tpicker"><a href="#tab3" onclick="return false">Addons<span id="numaddons" class="top_menu_count">{$details.addons}</span> </a></li>
        </ul>
        <div class="tab_container">

            <div class="tab_content" style="display: block;">
                {include file='_common/accounts_details.tpl'}

            </div>
            
            <div class="tab_content" style="display: none;">
                <div id="lmach">
                    <br />
                </div>
                <script type="text/javascript">
                        {literal}
                           
                        {/literal}
                </script>
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
            
            function destroyVM_onp(url) {
                if(confirm('Are you sure you wish to destroy this VM?')) {
                 $('#lmach').addLoader();
                 ajax_update(url,'','#lmach');
                     }
                         return false;
            }
            function power_onp(url,what) {
                var conf = what=='off'?confirm('Are you sure you wish to power-off this VM?'):true;
                if(conf) {
                 $('#lmach').addLoader();
                 ajax_update(url+'&power='+what,'','#lmach');
                     }
                         return false;
            }
            function loadClientMachines_onp() {
                var url={/literal}'?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=clientsvms';{literal}
                ajax_update(url,'','#lmach',true);

            setInterval ( function(){
                if(!$('#tabbedmenu .tpicker').eq(2).hasClass('active'))
                    return;
                  $('#lmach').addLoader();
                 ajax_update(url,'','#lmach');
            }, 20000);

            }
           appendLoader('loadClientMachines_onp');
</script> {/literal}
{literal}
<style type="text/css">
    ul.accor li > div.darker {
        background:#e3e2e4 !important;
        border-bottom:1px solid #d7d7d7  !important;
        border-left:1px solid #d7d7d7  !important;
        border-right:1px solid #d7d7d7  !important;
    }
    ul.accor li > a.darker {
        background:url("{/literal}{$template_dir}{literal}img/plus1.gif") no-repeat scroll 6px 50% #444547 !important;
    }
    #lmach {
        padding:10px;
    }
    a.power {
        float: left;
        display: block;
        width: 31px;
        height: 19px;
        margin-left: 3px;
        text-decoration: none;
        text-align: center;
        color: #555 !important;
        cursor: default;
    }
    a.power.on-inactive, a.power.off-inactive, a.power.on-disabled, a.power.off-disabled {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll 0 0;
    }

    a.power.on-inactive:hover {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll -32px 0;
    }

    a.power.off-inactive:hover {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll -64px 0;
    }

    a.power.on-active {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll -96px 0;
    }

    a.power.off-active {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll -128px 0;
    }
    .power.pending {
        background: transparent url({/literal}{$system_url}{literal}includes/types/onappcloud/images/power-bg.png) no-repeat scroll -160px 0;
        width: 65px;
        color: #909090 !important;
    }
    .vm-overview a.power {
        margin-left: 0;
        margin-right: 3px;
        text-shadow: none;
    }
    a.power.on-inactive:hover, a.power.off-inactive:hover {
        cursor: pointer;
        color: #fafafa !important;
    }

    a.power.on-active {
        color: #efe !important;
    }

    a.power.off-active {
        color: #fee !important;
    }

    a.power.on-disabled, a.power.off-disabled {
        color: #909090 !important;
        opacity: 0.8;
    }
    .power-status .yes {
        background:url("{/literal}{$system_url}{literal}includes/types/onappcloud/images/vm-on.png") no-repeat scroll 0 0 transparent;
        display:block;
        height:16px;
        text-indent:-99999px;
        width:16px;
    }
    .power-status .no {
        background:url("{/literal}{$system_url}{literal}includes/types/onappcloud/images/vm-off.png") no-repeat scroll 0 0 transparent;
        display:block;
        height:16px;
        text-indent:-99999px;
        width:16px;
    }
    .right-aligned {
        text-align:right;
    }
    .ttable td {
        padding:3px 4px;
    }
    table.data-table.backups-list thead {
        border:1px solid #DDDDDD;
    }
    table.data-table.backups-list thead {
        border-left:1px solid #005395;
        border-right:1px solid #005395;
    }
    table.data-table.backups-list thead {
        font-size:80%;
        font-weight:bold;
        text-transform:uppercase;
    }
    table.data-table.backups-list thead td {
        background:none repeat scroll 0 0 #777777;
        color:#FFFFFF;
        padding:8px 5px;
    }
    table.data-table tbody td {
        background:none repeat scroll 0 0 #FFFFFF;
        border-top:1px solid #DDDDDD;
    }
    table.data-table tbody tr:hover td {
        background-color: #FFF5BD;
    }
    table.data-table tbody tr td {
        border-color:-moz-use-text-color #DDDDDD #DDDDDD;
        border-right:1px solid #DDDDDD;
        border-style:none solid solid;
        border-width:0 1px 1px;
        font-size:90%;
        padding:8px;
    }
</style> {/literal}