<div id="confirm_cacc_close" hidden bootbox data-title="{$lang.closeheading}" data-btnclass="btn-danger">

    <form action="?cmd=clients&make=close" method="post">
        <p><strong>{$lang.closedescr}</strong></p>

        <input type="radio" checked="checked" name="hardclose" value="true" id="cc_hard"/> {$lang.closeopt1}<br />
        <input type="radio"  name="hardclose" value="false" id="cc_soft"/> {$lang.closeopt2}<br />

        <input type="hidden" name="id" value="{$client.id}" />
        {securitytoken}
    </form>

</div>

<div id="confirm_cacc_delete"  hidden bootbox data-title="{$lang.deleteheading}" data-btnclass="btn-danger">

    <form action="?cmd=clients&make=delete" method="post">
        <p><strong>{$lang.deletedescr}</strong></p>

        <input type="radio" checked="checked" name="harddelete" value="true" /> {$lang.deleteopt1}<br />
        <input type="radio"  name="harddelete" value="false" /> {$lang.deleteopt2}<br />


        <input type="hidden" name="id" value="{$client.id}" />
        {securitytoken}
    </form>

</div>

<div id="confirm_curr_change"  hidden bootbox data-title="{$lang.currheading}" data-callback="confirmsubmit" data-btnclass="btn-primary">

    <div >
        <p><strong>{$lang.currdescr}</strong></p>

        <div id="conf_c_b_1">
            <input type="radio" checked="checked" name="curchange" value="recalculate" /> {$lang.curropt1}<br />
            <input type="radio"  name="curchange" value="change"/> {$lang.curropt2}<br />
        </div>


    </div>
    <script type="text/javascript">
        {literal}
            function confirmsubmit() {
                var val = $('.bootbox-body input[name=curchange]:checked').val();
                $('#clientform').append('<input type="hidden" name="curchange" value="'+val+'" />');
                $('#clientform').unbind('submit');
                $('#clientsavechanges').click();
            }

        {/literal}
    </script>
</div>
<form action='' method='post' id="clientform" enctype="multipart/form-data">

<div id="bodycont">

<div class="blu">
    <div class="menubar">
        <a href="?cmd=clients" ><strong>&laquo; {$lang.backtoallcl}</strong></a>

        <a onclick="$('.nav_el').eq(0).click();
                $('#tdetail a').click();
                return false;" class="menuitm" href="#" >
            <span >{$lang.editclientdetails}</span>
        </a>

        {if $admindata.access.loginAsClient} 
            <a class=" menuitm menu-auto"  href="{$system_url2}?action=adminlogin&id={$client.client_id}" target="_blank">
                <span ><strong>{$lang.loginasclient}</strong></span>
            </a>
        {/if}
        <a class="menuitm menu-auto" onclick="$('#ccinfo').toggle();
                return false" href="#" >
            <span >{$lang.ccardach}</span>
        </a>
        <a class="menuitm clDropdown menu-auto" id="hd1" onclick="return false" href="#" >
            <span class="morbtn">{$lang.moreactions}</span>
        </a>

        <ul id="hd1_m" class="ddmenu">
            <li ><a href="EditNotes">{$lang.editclientnotes}</a></li>
            <li ><a href="OpenTicket">{$lang.opennewticket}</a></li>
            <li ><a href="PlaceOrder">{$lang.PlaceOrder}</a></li>
            <li ><a href="CreateInvoice">{$lang.CreateInvoice}</a></li>
                {if !$client.affiliate_id}
                <li ><a href="EnableAffiliate">{$lang.EnableAffiliate}</a></li>
                {/if}
            <li ><a href="SendNewPass">{$lang.SendNewPass}</a></li>
            <li ><a href="CloseAccount">{$lang.CloseAccount}</a></li>
            <li ><a href="DeleteAccount" style="color:#ff0000">{$lang.DeleteProfile}</a></li>
        </ul>

        {adminwidget module="clients" section="profileheader"}
    </div>
</div>


    <input type="hidden" value="{$client.currency_id}" name="old_currency_id" id="old_currency_id"/>

    <input type="hidden" value="{$client.client_id}" name="id" id="client_id"/>

    <div class="lighterblue" style="padding:5px;display:none" id="ccinfo">
        {if !$admindata.access.viewCC && !$admindata.access.editCC}
            {$lang.lackpriviliges}
        {else}
            {if $client.cardnum!='' || $ach.account}
                <div id="cc_cont" style="min-height: 2em">
                    <div class="left">
                        <strong>{$lang.ccard}</strong><br/>
                        {include file='ajax.clients.tpl' action=ccshow cmake=ccshow cardcode=$client verify=1}
                        <div class="o1" style="padding: 5px 0">
                            {if $admindata.access.editCC}
                                <a href="#" onclick="return load_cc_verify('ccadd');" class="menuitm">{$lang.editcardnumber}</a>
                            {elseif $admindata.access.viewCC}
                                <a href="#" onclick="return load_cc_verify('ccshow');" class="menuitm">{$lang.viewcardnumber}</a>
                            {/if}
                        </div>

                    </div>
                    <div class="left" style="margin-left:60px;">
                        <strong>{$lang.ACHecheck}</strong><br/>
                        {include file='ajax.clients.tpl' action=achshow cmake=achshow cardcode=$ach verify=1}

                        <div class="o1" style="padding: 5px 0">
                            {if $admindata.access.editCC}
                                <a href="#" onclick="return load_cc_verify('achadd');" class="menuitm">Update bank account</a>
                            {elseif $admindata.access.viewCC}
                                <a href="#" onclick="return load_cc_verify('achshow');" class="menuitm">View bank account</a>
                            {/if}
                        </div>
                    </div>
                    <div style="clear:both"></div>

                    <div class="o2" style="display:none; padding: 5px 0">
                        {$lang.provideyourpassword}
                        <input  type="password" autocomplete="off" name="admin_pass" id="admin_pass" />
                        <input type="button" id="ccbutton" data-action="{if $admindata.access.editCC}ccadd{else}ccshow{/if}" onclick="return verify_pass({if $admindata.access.editCC}'ccadd'{else}'ccshow'{/if})" value="{$lang.submit}" style="font-weight:bold" />
                    </div>
                </div>
            {else}
                <div id="cc_cont" style="min-height: 2em">
                    <div class="o1">
                        This client do not have credit card nor bank account added <br/>
                        {if $admindata.access.editCC}
                            <a href="#" onclick="return add_cc();">Click to add Credit Card</a> |
                            <a href="#" onclick="return add_ach();">Click to add Bank Account</a>
                        {/if}
                    </div>
                    {if $admindata.access.editCC}<div class="o2" style="display:none"></div>{/if}
                </div>
            {/if}
        {/if}

        <script type="text/javascript">
            {literal}
                function verify_pass(act) {
                    act = $('#ccbutton').attr('data-action');
                    //act = act || 'ccard';
                    if ($('#admin_pass').val() == '')
                        $('#admin_pass').val('none');
                    $('#cc_cont').addLoader();
                    ajax_update('?cmd=clients', {action: act, client_id: $('#client_id').val(), passprompt: $('#admin_pass').val()}, '#cc_cont');
                    return false;
                }
                function edit_cc() {
                    return add_cc();
                }
                function load_cc_verify(action) {
                    $('#cc_cont .o1').hide();
                    $('#ccbutton').attr('data-action', action)
                    $('#cc_cont .o2').show();
                    return false;
                }
                function view_cc() {

                }
                function add_cc() {
                    $('#cc_cont .o1').hide();
                    $('#cc_cont').addLoader();
                    ajax_update('?cmd=clients&action=ccadd', {client_id: $('#client_id').val()}, '#cc_cont');
                    return false;
                }
                function add_ach() {
                    $('#cc_cont .o1').hide();
                    $('#cc_cont').addLoader();
                    ajax_update('?cmd=clients&action=achadd', {client_id: $('#client_id').val()}, '#cc_cont');
                    return false;
                }
                $(document).on('keydown', '#admin_pass', function (e) {
                    if (e.keyCode == 13) {
                        verify_pass();
                        return false;
                    }
                })
            {/literal}
        </script>
    </div>
    {if $picked_tab}
        <script type="text/javascript">
            {literal}
                function fireme() {
                    $('#{/literal}{$picked_tab}{literal}_tab').click();
                }
                appendLoader('fireme');
            {/literal}
        </script>
    {/if}
    <div id="ticketbody">
        <h1>#{$client.client_id} {$client.companyname} {if $client.firstname || $client.lastname} - {/if} {$client.firstname} {$client.lastname}</h1>
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.clientprofile}</a>
            {include file="_common/quicklists.tpl"}

            <div class="clear"></div>
        </div>

        <div class="ticketmsg ticketmain" id="client_tab">
            <div class="slide" style="display:block">

                <div class="right replybtn tdetail" id="tdetail"><strong><a href="#"><span class="a1">{$lang.editdetails}</span><span class="a2">{$lang.hidedetails}</span></a></strong></div>

                <div id="detcont">
                    <div class="tdetails">
                        <table border="0" width="90%" cellspacing="5" cellpadding="0">

                            {foreach from=$fields item=field key=k name=floop}
                                {if $smarty.foreach.floop.index%3==0}<tr>{/if}

                                    <td width="100" align="right" {if $field.type=='Company'}class="iscomp light" style="{if $client.company!='1'}display:none{/if}"
                                        {elseif $field.type=='Private'}class="ispr light" style="{if $client.company=='1'}display:none{/if}" {else}class="light"{/if}>{if $k=='type'}
                                                        {$lang.clacctype}
                                                    {elseif $field.options & 1}
                                                {if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                                            {else}
                                                {$field.name}
                                            {/if}:</td>
                                        <td width="150" align="left" {if $field.type=='Company'}class="iscomp" style="{if $client.company!='1'}display:none{/if}"
                                            {elseif $field.type=='Private'}class="ispr" style="{if $client.company=='1'}display:none{/if}" {else}{/if}><span class="livemode" >
                                                        {if $k=='type'}{if $client.company=='0'}{$lang.Private}{/if}
                                                        {if $client.company=='1'}{$lang.Company}{/if}

                                                    {elseif $k=='country'}
                                                        {$client.country} - {$client.countryname}
                                                    {else}
                                                        {if $field.field_type=='Password'}
                                                        {elseif $field.field_type=='Check'}
                                                            {foreach from=$field.default_value item=fa}
                                                                {if in_array($fa,$client[$k])}{$fa},{/if}
                                                            {/foreach}

                                                        {else}
                                                            {$client[$k]}

                                                        {/if}
                                                    {/if}</span></td>

                                            {if $smarty.foreach.floop.index%3==5}</tr>{/if}
                                            {/foreach}

                                            <tr>

                                                <td width="100" align="right" class="light">{$lang.clacctype}:</td>
                                                <td width="150" align="left">
                                                    <span class="livemode">{if $client.company=='0'}{$lang.Private}{/if}
                                                    {if $client.company=='1'}{$lang.Company}{/if}</span>
                                            </td>

                                            {if count($currencies)>1}
                                                <td width="100" align="right" class="light">{$lang.currency}:</td>
                                                <td width="150" align="left" <span class="livemode">
                                                        {foreach from=$currencies item=curre}
                                                        {if $client.currency_id==$curre.id}{$curre.code}{/if}
                                                    {/foreach}
                                                </span></td>
                                            {else}
                                            <td colspan="2"></td>
                                        {/if}

                                        <td width="100" align="right" class="light">{$lang.Status}:</td>
                                        <td width="150" align="left"><span class="{$client.status} livemode">{$lang[$client.status]}</span></td>
                                    </tr>

                                    {if $groups}
                                        <tr>
                                            <td width="100" align="right" class="light">{$lang.Group}:</td>
                                            <td width="150" align="left" ><span style="color:{$client.group_color}" class="livemode">{$client.group_name}</span></td>

                                            <td colspan="2"></td>
                                            <td colspan="2"></td>
                                            </td>
                                        </tr>
                                    {/if}

                                </table>
                            </div>
                            <div class="secondtd" style="display:none">

                                <table border="0" width="100%" cellspacing="5" cellpadding="0">

                                    {foreach from=$fields item=field key=k name=floop}
                                        {if $smarty.foreach.floop.index%3==0}<tr>
                                            {/if}

                                            <td  width="100" align="right" {if $field.type=='Company'}class="iscomp light" style="{if $client.company!='1'}display:none{/if}" {elseif $field.type=='Private'}class="ispr light" style="{if $client.company=='1'}display:none{/if}" {else}class="light"{/if}>{if $k=='type'}
                                                {$lang.clacctype}
                                                {elseif $field.options & 1}
                                            {if $lang[$k]}{$lang[$k]}{else}{$field.name}{/if}
                                            {else}
                                                {$field.name}
                                                {/if}:
                                                </td>
                                                <td {if $field.type=='Company'}class="iscomp" style="{if $client.company!='1'}display:none{/if}" {elseif $field.type=='Private'}class="ispr" style="{if $client.company=='1'}display:none{/if}" {else}{/if}>
                                                    {if $k=='type'}
                                                    {elseif $k=='country'}<select name="country"  id="field_live_{$field.code}">
                                                            {foreach from=$countries key=k item=v}
                                                                <option value="{$k}" {if $k==$client.country} selected="Selected"{/if}>{$v}</option>

                                                            {/foreach}
                                                        </select>
                                                    {else}
                                                        {if $field.field_type=='Password'}
                                                        {elseif $field.field_type=='Input'}
                                                            <input  value="{$client[$field.code]}"   id="field_live_{$field.code}" name="{$field.code}" style="width: 80%;"/>
                                                        {elseif $field.field_type=='Check'}
                                                            {foreach from=$field.default_value item=fa}
                                                                <input type="checkbox" name="{$field.code}[{$fa}]" value="1" {if in_array($fa,$client[$field.code])}checked="checked"{/if}/>{$fa}<br />
                                                            {/foreach}
                                                        {else}
                                                            <select name="{$field.code}" id="field_live_{$field.code}"  style="width: 80%;">
                                                                {foreach from=$field.default_value item=fa}
                                                                    <option {if $client[$field.code]==$fa}selected="selected"{/if}>{$fa}</option>
                                                                {/foreach}
                                                            </select>
                                                        {/if}
                                                    {/if}</td>

                                                {if $smarty.foreach.floop.index%3==5}</tr>{/if}
                                                {/foreach}

                                                <tr>

                                                    <td width="100" align="right" class="light">{$lang.clacctype}:</td>
                                                    <td width="150" align="left" ><select  name="type"  onchange="{literal}if ($(this).val() == 'Private') {
                                                                $('.iscomp').hide();
                                                                $('.ispr').show();
                                                            } else {
                                                                $('.ispr').hide();
                                                                $('.iscomp').show();
                                                            }{/literal}">
                                                            <option value="Private" {if $client.company=='0'}selected="selected"{/if}>{$lang.Private}</option>
                                                            <option value="Company" {if $client.company=='1'}selected="selected"{/if}>{$lang.Company}</option>
                                                        </select></td>

                                                    {if count($currencies)>1}
                                                        <td width="100" align="right" class="light">{$lang.currency}:</td>
                                                        <td width="150" align="left" >
                                                            <select name="currency_id" id="currency_id">
                                                                {foreach from=$currencies item=curre}
                                                                    <option value="{$curre.id}" {if $client.currency_id==$curre.id}selected="selected"{/if}>{if $curre.iso}{$curre.iso}{else}{$curre.code}{/if}</option>
                                                                {/foreach}
                                                            </select></td>
                                                        {else}
                                                        <td colspan="2"><input type="hidden" id="currency_id" value="{$client.currency_id}" /></td>
                                                        {/if}

                                                    <td width="100" align="right" class="light">{$lang.Status}:</td>
                                                    <td width="150" align="left" >
                                                        <select name="status">
                                                            <option value="Active" {if $client.status=='Active'}selected="selected"{/if}>{$lang.Active}</option>
                                                            <option value="Closed"{if $client.status=='Closed'}selected="selected"{/if}>{$lang.Closed}</option>
                                                        </select>
                                                    </td>

                                                </tr>
                                                {if $groups}
                                                    <tr>
                                                        <td width="100" align="right" class="light">{$lang.Group}:</td>
                                                        <td width="150" align="left" ><select  name="group_id" >
                                                                <option value="0" {if $client.group_id=='0'}selected="selected"{/if}>{$lang.none}</option>
                                                                {foreach from=$groups item=group}
                                                                    <option value="{$group.id}" style="color:{$group.color}" {if $client.group_id==$group.id}selected="selected"{/if}>{$group.name}</option>
                                                                {/foreach}
                                                            </select></td>

                                                        <td colspan="2"></td>
                                                        <td colspan="2"></td>
                                                        </td>
                                                    </tr>
                                                {/if}
                                                <tr></tr>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                                {include file="_common/quicklists.tpl" _placeholder=true}
                            </div>

                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="50%" valign="top">
                                        <div class="ticketmsg ticketmain" id="client_tab">

                                            <div id="detcont">
                                                <div class="tdetails">
                                                    <table border="0" width="100%" cellspacing="5" cellpadding="0">
                                                        <tr>
                                                            {if $enabletax}
                                                                <td width="25%" align="right" class="light">{$lang.taxexempt}:</td>
                                                                <td width="25%" align="left"><span class="livemode">{if $client.taxexempt=='' || $client.taxexempt=='0'}{$lang.No}{else}{$lang.Yes}{/if}</span></td>
                                                                {else}
                                                                <td colspan="2"></td>
                                                            {/if}
                                                            {if $latefee}
                                                                <td width="25%" align="right" class="light">{$lang.latefees}:</td>
                                                                <td width="25%" align="left"><span class="livemode">{if $client.latefeeoveride=='' || $client.latefeeoveride=='0'}{$lang.Yes}{else}{$lang.No}{/if}</span></td>
                                                                {else}
                                                                <td colspan="2"></td>
                                                            {/if}

                                                        </tr>
                                                        <tr>
                                                            {if $overdue}
                                                                <td width="25%" align="right" class="light">{$lang.oveduenotices}:</td>
                                                                <td width="25%" align="left"><span class="livemode">{if $client.overideduenotices=='' ||  $client.overideduenotices=='0'}{$lang.Yes}{else}{$lang.No}{/if}</span></td>

                                                            {else}
                                                                <td colspan="2"></td>
                                                            {/if}
                                                            {if $enabletax}
                                                                <td width="25%" align="right" class="light">{$lang.taxrateoverride}:</td>
                                                                <td width="25%" align="left"><span class="livemode">{if $client.taxrateoverride!='1'}{$lang.No}{else}{$lang.Yes} {$client.taxrate} % {/if}</span></td>
                                                            {else}
                                                                <td colspan="2"></td>
                                                            {/if}
                                                        </tr>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">Prevent auto suspend/terminate:</td>
                                                            <td width="25%" align="left"><span class="livemode">{if $client.overideautosusp=='1'}{$lang.Yes}{else}{$lang.No}{/if}</span></td>

                                                            <td width="25%" align="right" class="light">{$lang.defaultlanguage}:</td>
                                                            <td width="25%" align="left"><span class="livemode">{$client.language}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">Disable email notifications:</td>
                                                            <td width="25%" align="left"><span class="livemode">{if $client.disableemails=='1'}<span style="color:red">{$lang.Yes}</span>{else}{$lang.No}{/if}</span></td>

                                                            <td width="25%" align="right" class="light"></td>
                                                            <td width="25%" align="left"><span class="livemode"></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">{$lang.password}:</td>
                                                            <td width="25%" align="left"><span class="livemode">**********</span></td>

                                                            <td width="25%" align="right" class="light"></td>
                                                            <td width="25%" align="left"></td>

                                                        </tr>

                                                    </table>
                                                </div>
                                                <div class="secondtd" style="display:none">

                                                    <table border="0" width="100%" cellspacing="5" cellpadding="0">
                                                        <tr>
                                                            {if $enabletax}
                                                                <td width="25%" align="right" class="light">{$lang.taxexempt}:</td>
                                                                <td width="25%" align="left"><select name="taxexempt">
                                                                        <option value="0" {if $client.taxexempt=='0' || $client.taxexempt==''}selected="selected"{/if}>No</option>
                                                                        <option value="1"{if $client.taxexempt=='1'}selected="selected"{/if}>Yes</option>

                                                                    </select></td>
                                                                {else}
                                                                <td colspan="2">
                                                                    <input type="hidden" value="{$client.taxexempt}" name="taxexempt" />
                                                                </td>
                                                            {/if}
                                                            {if $latefee}
                                                                <td width="25%" align="right" class="light">{$lang.latefees}:</td>
                                                                <td width="25%" align="left"><select name="latefeeoveride">
                                                                        <option value="1" {if $client.latefeeoveride=='1' || $client.latefeeoveride==''}selected="selected"{/if}>No</option>
                                                                        <option value="0"{if $client.latefeeoveride=='0'}selected="selected"{/if}>Yes</option>
                                                                    </select></td>
                                                                {else}
                                                                <td colspan="2">
                                                                    <input type="hidden" name="latefeeoveride" value="{$client.latefeeoveride}" />
                                                                </td>
                                                            {/if}

                                                        </tr>
                                                        <tr>
                                                            {if $overdue}
                                                                <td width="25%" align="right" class="light">{$lang.oveduenotices}:</td>
                                                                <td width="25%" align="left"><select name="overideduenotices">
                                                                        <option value="1" {if $client.overideduenotices=='1' || $client.overideduenotices==''}selected="selected"{/if}>No</option>
                                                                        <option value="0"{if $client.overideduenotices=='0'}selected="selected"{/if}>Yes</option>
                                                                    </select></td>
                                                                {else}
                                                                <td colspan="2"><input type="hidden" name="overideduenotices" value="{$client.overideduenotices}"/></td>
                                                                {/if}

                                                            {if $enabletax}
                                                                <td width="25%" align="right" class="light">{$lang.taxrateoverride}:</td>
                                                                <td width="25%" align="left">
                                                                    <select name="taxrateoverride">
                                                                        <option value="1" {if $client.taxrateoverride=='1'}selected="selected"{/if}>Yes</option>
                                                                        <option value="0" {if $client.taxrateoverride!='1'}selected="selected"{/if}>No</option>
                                                                    </select>
                                                                    <input value="{$client.taxrate}"  name="taxrate" style="width: 30px;"> %
                                                                </td>
                                                            {else}
                                                                <td colspan="2">
                                                                    <input type="hidden" value="{$client.taxrateoverride}" name="taxrateoverride" />
                                                                    <input type="hidden" value="{$client.taxrate}" name="taxrateoverride" />
                                                                </td>
                                                            {/if}
                                                        <tr/>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">Prevent auto suspend/terminate:</td>
                                                            <td width="25%" align="left">
                                                                <select name="overideautosusp">
                                                                    <option value="0" {if !$client.overideautosusp || $client.overideautosusp=='0'}selected="selected"{/if}>No</option>
                                                                    <option value="1" {if $client.overideautosusp=='1'}selected="selected"{/if}>Yes</option>
                                                                </select>
                                                            </td>
                                                            <td width="25%" align="right" class="light">{$lang.defaultlanguage}:</td>
                                                            <td width="25%" align="left">
                                                                <select name="language">
                                                                    {foreach from=$client_languages key=k item=v}
                                                                        <option {if $v==$client.language} selected="selected"{/if}>{$v}</option>

                                                                    {/foreach}
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">Disable email notifications:</td>
                                                            <td width="25%" align="left">
                                                                <select name="disableemails">
                                                                    <option value="0" {if !$client.disableemails || $client.disableemails=='0'}selected="selected"{/if}>No</option>
                                                                    <option value="1" {if $client.disableemails=='1'}selected="selected"{/if}>Yes</option>
                                                                </select>
                                                            </td>
                                                            <td width="25%" align="right" class="light"></td>
                                                            <td width="25%" align="left">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="25%" align="right" class="light">{$lang.newpass}:</td>
                                                            <td width="25%" align="left"><input name="password" /></td>

                                                            <td width="25%" align="right" class="light">{$lang.repeatpass}:</td>
                                                            <td width="25%" align="left"><input name="password2" /></td>

                                                        </tr>

                                                    </table>

                                                </div>
                                            </div>

                                        </div>
                                    </td>
                                    <td width="50%" valign="top" style="padding-left:5px;">
                                        <div class="ticketmsg ticketmain" >

                                            <div id="detcont">

                                                <table border="0" width="100%" cellspacing="5" cellpadding="0">
                                                    <tr>
                                                        <td width="25%" align="right" class="light">{$lang.signupdate}:</td>
                                                        <td width="75%" align="left">{$client.datecreated|dateformat:$date_format}</td>
                                                    </tr>

                                                    <tr>
                                                        <td width="25%" align="right" class="light">{$lang.clientlastlogin}:</td>
                                                        <td width="75%" align="left">{if $client.lastlogin == '0000-00-00 00:00:00'}{$lang.never}{else}{$client.lastlogin|dateformat:$date_format}{/if}</td>
                                                    </tr>

                                                    <tr>
                                                        <td width="25%" align="right" class="light">{$lang.From}:</td>
                                                        <td width="75%" align="left">{$client.ip} {$lang.Host}: {$client.host}</td>
                                                    </tr>

                                                </table>

                                            </div>

                                        </div>

                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <div class="p6 secondtd" style="display:none;text-align:center;margin-bottom:7px;padding:15px 0px;">
                                            <a class="new_control greenbtn" href="#" onclick="$('#clientsavechanges').click();
                                                    return false;"><span>{$lang.savechanges}</span></a>
                                            <span class="orspace fs11">{$lang.Or}</span> <a href="#" class="editbtn" onclick="$('#tdetail a').click();
                                                    return false;">{$lang.Cancel}</a>
                                            <input type="submit" value="{$lang.savechanges}" id="clientsavechanges" style="display:none" name="save"/>
                                            <input type="hidden" value="1" name="save"/>
                                        </div>
                                    </td>
                                </tr>


                    </table>

                    {securitytoken}

    </div>
</div>
<div class="row no-gutter" style="margin-top:20px;">


    <div class="col-md-6  mainleftcol">

        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Client stats <i class="fa fa-line-chart pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div >

                    {include file="clients/statistics.tpl"}
                </div>
            </div>
        </div>


        {if $stats.affiliate}

        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Affiliate <i class="fa fa-user pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div >

                    <table border="0" cellpadding="3" cellspacing="0" width="100%">
                        <tr >
                            <td> <strong>{$lang.affiliatehash}</strong>	 </td>
                            <td> <a href="?cmd=affiliates&action=affiliate&id={$stats.affiliate.id}">{$stats.affiliate.id}</a></td>
                        </tr>
                        <tr >
                            <td><strong>{$lang.affsince}</strong>	</td>
                            <td>{$stats.affiliate.date_created|dateformat:$date_format}</td>
                        </tr>
                        <tr >
                            <td><strong>{$lang.convrate}</strong>	</td>
                            <td>{$stats.affiliate.conversion} %</td>
                        </tr>
                        <tr >
                            <td><strong>{$lang.balance}</strong>	</td>
                            <td>{$stats.affiliate.balance|price:$stats.currency_id}</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>

        {/if}

    </div>

    <div class="col-md-6 mainrightcol">

        {adminwidget module="clients" section="profilewidgets"}

        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Contact Client <i class="fa fa-envelope pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div id="" class="form-horizontal">

                    <div class="form-group">
                        <div class="col-sm-2">
                            <label >{$lang.SendMessage}</label>
                        </div>
                        <div class="col-sm-8">
                            <select name="mail_id" id="mail_id" style="width: 100%">
                                <option value="1">Details:Signup</option>
                                {foreach from=$client_emails item=send_email}
                                    <option value="{$send_email.id}">{$send_email.tplname}</option>
                                {/foreach}
                                <option value="custom" style="font-weight:bold">{$lang.newmess}</option>

                            </select>
                        </div>
                        <div class="col-sm-2">

                            <input type="button" name="sendmail" value="{$lang.Send}" id="sendmail" class="btn btn-primary btn-sm"/>
                        </div>
                    </div>


                    {if $mobilenotify}
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label >{$lang.SendTextMessage}</label>
                            </div>

                            <div class="col-sm-8">
                                <select name="sms_id" id="sms_id" style="width: 100%">
                                    {foreach from=$client_sms.All item=send_email}
                                        {if $send_email.for!='Client'}{continue}{/if}
                                        <option value="{$send_email.id}">{$send_email.tplname}</option>
                                    {/foreach}
                                    {foreach from=$client_sms.Custom item=send_email}
                                        {if $send_email.for!='Client'}{continue}{/if}
                                        <option value="{$send_email.id}">{$send_email.tplname}</option>
                                    {/foreach}
                                    <option value="custom" style="font-weight:bold">{$lang.newmess}</option>
                                </select>
                            </div>
                            <div class="col-sm-2">

                                <input type="button" name="sendsms" value="{$lang.Send}" id="sendsms" class="btn btn-primary btn-sm"/>
                            </div>

                        </div>
                    {/if}
                </div>
            </div>
        </div>


        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Queued Invoice Items <i class="fa fa-list pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div id="itemqueue">
                    {include file="ajax.itemqueue.tpl"}
                </div>
            </div>
        </div>


        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Client Files <i class="fa fa-paperclip pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div id="clientfiles">
                    {include file="ajax.clientfiles.tpl"}
                </div>
            </div>
        </div>

        <div class="box box-primary  ">
            <div class="box-header">
                <h3 class="box-title">Client notes <i class="fa fa-sticky-note-o pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div id="clientnotes">
                    {include file='_common/noteseditor.tpl'}

                </div>
            </div>
        </div>




        <div class="box box-primary  no-padding">
            <div class="box-header">
                <h3 class="box-title">Client Profile Changes <i class="fa fa-clock-o pull-left"></i></h3>

            </div>
            <div class="box-body">
                <div id="clienthistory">
                    {include file="clients/ajax.changeslog.tpl"}
                </div>
            </div>
        </div>


    </div>
</div>

</form>
