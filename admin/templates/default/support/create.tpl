<form action="?cmd=tickets&action=new" method="post" id="newticketform" enctype="multipart/form-data">
    <input type="hidden" name="make" value="createticket" />
    <input type="hidden" value="new" id="ticket_number" />
    <input type="hidden" name="useclientname" value="1" />
    <div class="lighterblue" style="padding:5px">
        <table width="100%" cellspacing="2" cellpadding="3" border="0" class="">
            <tbody>
                <tr>
                    <td width="120px">{$lang.Client}</td>
                    <td>
                        <select name="client" id="client_picker" class="inp" load="clients" default="{if $submit.client}{$submit.client}{elseif $client_id}{$client_id}{else}0{/if}" style="width:340px">
                            <option value="-1"  {if $submit.client=='-1' && !$client_id}selected="selected"{/if}>{$lang.nonregistered}</option>
                            <option value="-2"  {if $submit.client=='-2' && !$client_id}selected="selected"{/if}>Public Ticket (Multiple clients)</option>

                            <option value="0" {if ($submit.client=='0' && !$client_id) || !isset($submit.client)}selected="selected"{/if}>{$lang.chooseone}</option>
                            {foreach from=$clients item=client}
                                {if $submit.client==$client.id || $client_id==$client.id}
                                    <option value="{$client.id}" selected="selected">#{$client.id} {if $client.companyname!=''}{$client.companyname}{else}{$client.firstname} {$client.lastname}{/if}</option>
                                {/if}
                            {/foreach}
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr id="emailrow3" {if !isset($submit.client) || $submit.client!='-2'  || $client_id }style="display:none"{/if}>
                    <td>Client IDs <a href="#" class="vtip_description" title="Clients will be notified about this ticket, can see it, but are not allowed to reply it. <br/>Use client filter or comma separated list"></a></td>
                    <td colspan="2"><input type="text" value="{$submit.client_ids}" size="50" name="client_ids" id="client_ids"  class="inp"/> <a href="#" class="editbtn" id="clientfilter">Select clients</a></td>
                </tr>
                <tr id="emailrow2" {if !isset($submit.client) || $submit.client!='-1'  || $client_id }style="display:none"{/if}>
                    <td>{$lang.Name}</td>
                    <td colspan="2"><input type="text" value="{$submit.name}" size="50" name="name"  class="inp"/></td>
                </tr>

                <tr id="emailrow" {if !isset($submit.client) || $submit.client!='-1' || $client_id }style="display:none"{/if}>
                    <td>{$lang.email}</td>
                    <td colspan="2"><input type="text" value="{$submit.email}" size="50" name="email"  class="inp"/></td>
                </tr>


                <tr id="emailrow4" {if !$submit.contact_id }style="display:none"{/if}>
                    <td>Send to contact:</td>
                    <td colspan="2" id="contactloader"></td>
                </tr>

                <tr>
                    <td>{$lang.Subject}</td>
                    <td colspan="2">
                        <input type="text" value="{$submit.subject|escape}" size="75" name="subject" required="required"  class="inp"/>
                    </td>
                </tr>

                <tr>
                    <td>{$lang.department}</td>
                    <td colspan="2">
                        <select name="dept_id" class="inp">
                            {foreach from=$departments item=dept}
                                <option value="{$dept.id}" {if $submit.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>{$lang.status}</td>
                    <td colspan="2">
                        <select name="status" class="inp">
                            {foreach from=$statuses item=status}
                                <option value="{$status}" {if $submit.status==$status}selected="selected"{/if}>{$status}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Assigned to</td>
                    <td>
                        <select name="owner_id" class="inp">
                            <option value="0">{$lang.none}</option>
                            {foreach from=$staff_members item=stfmbr}
                                <option {if $stfmbr.id==$submit.owner_id}selected="selected"{/if} value="{$stfmbr.id}">{$stfmbr.firstname} {$stfmbr.lastname}</option>
                            {/foreach}
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>CC</td>
                    <td colspan="2">
                        <a href="#" onclick="$(this).hide();
                                $('#addcc').show();
                                return false;" {if $submit.cc}style="display:none"{/if} class="editbtn">{$lang.addcc}</a>
                        <div {if !$submit.cc}style="display:none"{/if} id="addcc">
                            <input type="text" value="{$submit.cc}" size="75" name="cc" class="inp" 
                                   placeholder="Separate multiple emails with comma, eg. joe@example.com, mark@example.com"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>BCC</td>
                    <td colspan="2">
                        <a href="#" onclick="$(this).hide();
                                $('#addbcc').show();
                                return false;" {if $submit.bcc}style="display:none"{/if} class="editbtn">Add BCC</a>
                        <div {if !$submit.bcc}style="display:none"{/if} id="addbcc">
                            <input type="text" value="{$submit.bcc}" size="75" name="bcc" class="inp" 
                                   placeholder="Separate multiple emails with comma, eg. joe@example.com, mark@example.com"/> 
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" valign="top">
                        <div class="container-fluid" style="padding: 10px 0 0">
                            <div class="row">
                                <div class="col-md-8">
                                    <label>Message</label>
                                    <textarea rows="14" id="replyarea" name="body">{$submit.body}</textarea>
                                    <div id="draftinfo">
                                        <span class="draftdate" {if $submit.date}style="display:inline"{/if}>{$lang.draftsavedat}{$submit.date|dateformat:$date_format}</span> 
                                        <span class="controls" style="display:inline">
                                            <a href="#" onclick="return savedraft()">{$lang.savedraft}</a> 
                                            <a href="#" onclick="return removedraft()">{$lang.removedraft}</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    {adminwidget module="tickets" section="reply"}
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            {literal}
                                function savedraft() {
                                    ajax_update('?cmd=tickets', {make: 'savedraft', action: 'menubutton', id: $('#ticket_number').val(), body: $('#replyarea').val()}, '#draftinfo .draftdate');
                                    $('#draftinfo .draftdate').show();
                                    return false;
                                }
                                function removedraft() {
                                    ajax_update('?cmd=tickets', {make: 'removedraft', action: 'menubutton', id: 'new'});
                                    $('#draftinfo .draftdate').html('').hide();
                                    $('#draftinfo .controls').hide();
                                    $('#replyarea').val("");
                                    return false;
                                }
                            {/literal}
                        </script>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <a href="#" onclick="$(this).hide().next().show();
                                return false;" {if $submit.parent_id}style="display:none"{/if} class="editbtn">Set parent thread</a>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" {if !$submit.parent_id}style="display:none"{/if} >
                            <tbody>
                            <tr class="odd">
                                <td style="white-space: nowrap; padding: 5px;width:111px; ">
                                    <strong style="">Parent thread</strong>
                                </td>
                                <td style="padding-top:5px" >
                                    <select class="form-control" name="parent_id" id="parent_id" default="{$submit.parent_id}" >
                                        <option value="0">{$lang.None}</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <a href="#" onclick="$(this).hide().next().show();
                                return false;" {if $submit.notes}style="display:none"{/if} class="editbtn">Add note</a>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" {if !$submit.notes}style="display:none"{/if} >
                            <tbody>
                                <tr class="odd">
                                    <td style="vertical-align: baseline; white-space: nowrap; padding: 5px; width:111px;">
                                        <strong style="">Note</strong><br>
                                        ({if $admindata.lastname!='' && $admindata.firstname!=''}{$admindata.firstname} {$admindata.lastname}{else}{$admindata.username}{/if})
                                    </td>
                                    <td style="padding-top:5px"  >
                                        <textarea class="notes_field notes_changed" id="ticketnotesarea"  style="width:40%; height:auto" name="notes" >{$submit.notes}</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <a  class="attach editbtn" href="#" >{$lang.addattachment}</a> &nbsp;&nbsp;({$lang.allowedextensions} {$extensions})<br />
                        <div id="attachments"> </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="container-fluid lighterblue" id="replytable">
        <div class="row">
            <div class="col-md-3 col-lg-2">
                <button type="submit" class="btn btn-success" id="ticketsubmitter">{$lang.createticket}</button>
            </div>
        </div>
    </div>
    {securitytoken}
</form>
{if $ajax}
    {literal}
        <script type="text/javascript">
            bindEvents();
            bindTicketEvents();
        </script>{/literal}
    {/if}
{literal}
<script type="text/javascript">
    $(document).trigger('HostBill.newticketform');

    window.setTimeout(function(){
        $('#client_picker').change();
        $('select[name=parent_id]').chosensearch(
            {
                width: "50%",
                placeholder_text: "Search for ticket number of subject",
                enable_split_word_search: true,
                search_contains: true,
                type:'Tickets',
                args: {type: 'Tickets'},
                none_option: {
                    name: "None",
                    value: 0,
                    query: ''
                }
            });
    },1000);


</script>        {/literal}
