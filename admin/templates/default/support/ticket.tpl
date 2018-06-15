<input type="hidden" id="ticket_number" name="ticket_number" value="{$ticket.ticket_number}" />
<input type="hidden" id="ticket_id" name="ticket_id" value="{$ticket.id}" />
<div class="blu">
    <div class="menubar">
        {include file="support/ticket_actions.tpl"}
    </div>
</div>
<div id="ticket_log"></div>
<div class="lighterblue" id="ticket_editdetails" style="display:none">
    <form action="?cmd={$cmd}&action={$action}&num={$ticket.ticket_number}" method="post" id="ticket_editform"></form>
</div>
<div id="ticketbody" {if $ticket.priority=='1'}class="prior_Medium"{elseif $ticket.priority=='2'}class="prior_High"{elseif $ticket.priority=='3'}class="prior_Critical"{/if}>
    <h1 {if $ticket.priority=='1'}class="prior_Medium"{elseif $ticket.priority=='2'}class="prior_High"{elseif $ticket.priority=='3'}class="prior_Critical"{/if}>#{$ticket.ticket_number} - {$ticket.subject|wordwrap:100:"\n":true|escape}
        <span {if $ticket.status_color && $ticket.status_color != '000000'}style="color:#{$ticket.status_color}"{/if} class="{$ticket.status}" id="ticket_status">{if $ticket.status == 'Open'}{$lang.Open}{elseif $ticket.status == 'Answered'}{$lang.Answered}{elseif $ticket.status == 'Closed'}{$lang.Closed}{elseif $ticket.status == 'Client-Reply'}{$lang.Clientreply}{elseif $ticket.status == 'In-Progress'}{$lang.Inprogress}{else}{$ticket.status}{/if}</span>
    </h1>
    {literal}
        <script type="text/javascript">
            $(function () {

                ticket.bindTagsActions('#tagsCont', 10,
                    function (tag) {
                        $.post('?cmd=tickets&action=addtag', {tag: tag, id: $('#ticket_number').val()}, function (data) {
                            ticket.updateTags(data.tags)
                        });
                    },
                    function (tag) {
                        $.post('?cmd=tickets&action=removetag', {tag: tag, id: $('#ticket_number').val()}, function (data) {
                            if (typeof data != 'undefined' && typeof data.reloadwhole != 'undefined' && data.reloadwhole == true) {
                                ajax_update('?cmd=tickets&action=view&list=all&num=' + $('#ticket_number').val(), {}, '#bodycont');
                            } else if (typeof data != 'undefined') {
                                ticket.updateTags(data.tags);
                                if (data.tickettags !== undefined) {
                                    insertTags(data.tickettags);
                                }
                            }
                        });
                    });

                $(document).off('click', '#tagsCont span a:first-child').on('click', '#tagsCont span a:first-child', function () {
                    window.open('?cmd=tickets&filter[tag]=' + $(this).text());
                });
            });

        </script>
    {/literal}
    <div id="tagsCont">
        {foreach from=$tags item=tag}
            <span class="tag"> <a{if $specialtags.$tag} class="{$specialtags.$tag}"{/if} >{$tag}</a> |<a class="cls">x</a></span>
        {/foreach}
        <label style="position:relative" for="tagsin">
            <em style="position:absolute">{$lang.tags}</em>
            <input id="tagsin">
            <ul></ul>
        </label>
        <div class="clear"></div>
    </div>

    {if $ticket.client_id!='0'}
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.ticketmessage}</a>
            {include file="_common/quicklists.tpl"}
            <div class="clear"></div>
        </div>
    {else}
        <div id="client_nav">
            <!--navigation-->
            <a class="nav_el nav_sel left" href="#">{$lang.ticketmessage}</a>
            <div>
                <span class="left" style="padding-top:5px;padding-left:5px;">
                    <form action="?cmd=newclient" method="post" target="_blank">
                        <a href="#" onclick="$(this).parent().submit();
                                return false;">Register as new client</a>
                        <input type="hidden" name="email" value="{$ticket.email}" />
                        <input type="hidden" name="firstname" value="{$ticket.name|regex_replace:"/^([^ ]+)\s.+$/":'$1'|escape}" />
                        <input type="hidden" name="lastname" value="{$ticket.name|regex_replace:"/^[^ ]+\s?/":'$1'|escape}" />
                        <input type="hidden" name="ticket_id" value="{$ticket.id}" />
                    </form>
                </span>
            </div>
            <div class="clear"></div>
        </div>
    {/if}
    <div class="ticketmsg {if $ticket.type!='Admin'}ticketmain{/if}"  id="client_tab">
        <div class="slide" style="display:block">


            <div class="left ticketinfoblock">
                {if $ticket.client_id!='0'  && $ticket.type!='Admin'}
                    <a href="?cmd=clients&action=show&id={$ticket.client_id}" target="_blank">
                    {/if}
                    <strong {if $ticket.type=='Admin'}class="adminmsg"{else}class="clientmsg reply_{$ticket.type}"{/if}>{$ticket.name}</strong>
                    {if $ticket.client_id!='0'  && $ticket.type!='Admin'}
                    </a>
                {/if}
                {if $ticket.client_id!='0' && $ticket.type=='Client'}<label class="label label-success-invert">{$lang.client}</label>
                {elseif $ticket.type=='Admin'}<label class="label label-info-invert">{$lang.staff}</label>
                {/if}
                {if $ticket.type!='Admin' && $ticket.email}
                    <div style="color: rgb(153, 153, 153); font-size: 11px; width: 200px; line-height: 12px;">{$ticket.email}</div>
                {/if}
                <span class="ticketinfo">
                {$lang.opened} {$ticket.date|dateformat:$date_format}

                    {if $ticket.type == 'Client'} using client area, logged in
                    {elseif $ticket.type == 'Unregistered'} from client area, not logged in
                    {elseif $ticket.type != 'Admin'} via Email
                    {/if}
                    &nbsp;&nbsp;&nbsp;
                 </span>
            </div>

            <div class="tdetails auto-height" style="float: right; border-left: 1px solid #bbb; background: #f7f7f7; padding: 5px; margin: -5px -10px -5px 15px; width: 230px;">
                {if !$forbidAccess.editTicket}
                    <a href="#" class="editTicket fs11 right" onclick="$(this).toggle().next().toggle()">Edit details</a>
                    <a href="#" class="editTicket editbtn none right" onclick="$(this).toggle().prev().toggle()">Save details</a>
                {/if}
                <table border="0" width="100%">
                    <tr>
                        <td align="right" class="light" style="min-width: 90px">{$lang.department}:</td>
                        <td align="left">
                            <strong>{$ticket.deptname}</strong>
                            <select class="inp" name="deptid" style="display: none; width: 221px">
                                {foreach from=$departments item=dept}
                                    <option value="{$dept.id}" {if $ticket.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.submitter}</td>
                        <td align="left">
                            <span>{$ticket.name|escape}</span>
                            <input name="name" value="{$ticket.name|escape}" style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.asignedclient}</td>
                        <td align="left">
                            <span>
                                {if $ticket.client_id}#{$ticket.client_id} {$client.firstname} {$client.lastname}
                                {else}{$lang.notreg}
                                {/if}
                            </span>
                            <div style="display: none;">
                                <select class="inp" style="width: 255px;" name="owner_id"  load="clients" default="{$ticket.client_id}">
                                    <option value="0">{$lang.notreg}</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    {if !$ticket.share || $ticket.share=='master'}
                        <tr>
                            <td align="right"  class="light">{$lang.emaill|capitalize}</td>
                            <td align="left">
                                <div class="fold-text"><a href="mailto:{$ticket.email}">{$ticket.email}</a></div>
                                <input name="email" value="{$ticket.email}" style="display: none; width: 250px" class="inp"/>
                            </td>
                        </tr>
                    {else}
                        <tr>
                            <td align="right"  class="light">{$lang.author_uuid}</td>
                            <td align="left">
                                <div class="fold-text">{$ticket.email}</div>
                                <input name="email" value="{$ticket.email}" style="display: none; width: 250px" class="inp"/>
                            </td>
                        </tr>
                    {/if}
                    <tr style="display:none" class="sh_row force">
                        <td align="right" class="light">{$lang.subject|capitalize}</td>
                        <td align="left">
                            <div class="fold-text">{$ticket.subject|escape}</div>
                            <input name="subject" value="{$ticket.subject|escape}"  style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr {if !$ticket.cc}style="display:none"{/if} class="sh_row">
                        <td align="right" class="light">CC</td>
                        <td align="left">
                            <div class="fold-text">{if $ticket.cc}{$ticket.cc}{else}{$lang.none}{/if}</div>
                            <input name="cc" value="{$ticket.cc}"  style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr {if !$ticket.bcc}style="display:none"{/if} class="sh_row">
                        <td align="right" class="light">BCC</td>
                        <td align="left">
                            <div class="fold-text">{if $ticket.bcc}{$ticket.bcc}{else}{$lang.none}{/if}</div>
                            <input name="bcc" value="{$ticket.bcc}"  style="display: none; width: 250px" class="inp"/>
                        </td>
                    </tr>
                    <tr {if !$ticket.owner_id}style="display:none"{/if} class="sh_row">
                        <td align="right" class="light">Assigned to</td>
                        <td align="left">
                            <span>
                                {if $ticket.owner_id}
                                    {foreach from=$staff_members item=stfmbr}
                                        {if $stfmbr.id==$ticket.owner_id}
                                            {$stfmbr.firstname} {$stfmbr.lastname}{break}
                                        {/if}
                                    {/foreach}
                                {else}
                                    {$lang.none}
                                {/if}
                            </span>
                            <select name="owner" class="inp" style="display: none ; width: 221px">
                                <option value="0">{$lang.none}</option>
                                {foreach from=$staff_members item=stfmbr}
                                    <option {if $stfmbr.id==$ticket.owner_id}selected="selected"{/if} value="{$stfmbr.id}">{$stfmbr.firstname} {$stfmbr.lastname}</option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="light">{$lang.IPaddress}</td>
                        <td align="left">
                            {if $ticket.senderip}{$ticket.senderip}
                            {else}{$lang.none}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="light">{$lang.lastreply|capitalize}</td>
                        <td align="left">
                            {$ticket.lastreply|dateformat:$date_format}
                        </td>
                    </tr>
                </table>
            </div>
            <script type="text/javascript">{literal}$(function () {
                    if ($('.auto-height').height() < $('#client_tab').height())
                        $('.auto-height').css('min-height', $('#client_tab').height() + 'px');
                });
                $('.fold-text').click(function () {
                    $(this).toggleClass('show')
                }){/literal}</script>



            <a href="#reply" class="scroller pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-reply" aria-hidden="true"></i></a>
            {if !$forbidAccess.editTicket || (!$forbidAccess.editOwnMesg && $admindata.id == $ticket.creator_id)}
                    <a href="#" class="editor  pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;&nbsp;
            {/if}
                <a href="{$ticket.id}" class="quoter  pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-quote-right" aria-hidden="true"></i></a>&nbsp;&nbsp;&nbsp;
                <a href="#" class="quoter2  pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-quote-left" aria-hidden="true"></i> {$lang.Quoteselected}</a>





            <div style="clear:left"></div>
            <div id="msgbody"> {$ticket.body|blockquote|httptohref|regex_replace:"/^\S\n]+\n/":"<br>"|nl2br} </div>
            {if $ticket.editby != ''}<div class="editbytext fs11" style="color:#555; font-style: italic">{$lang.lastedited} {$ticket.editby} at {$ticket.lastedit|dateformat:$date_format}</div>{/if}
            <div id="editbody{$reply.id}" style="overflow:hidden; display:none; margin: 9px 0 0">
                <textarea style="width:100%"></textarea>
                <div style="padding:5px 0">
                    <a href="{$reply.id}" class="menuitm editorsubmit"><span>{$lang.savechanges}</span></a> {$lang.Or} 
                    <a onclick="$('#msgbody{$reply.id}').show().siblings('.editbytext:first').show();
                                $('#editbody{$reply.id}').hide();
                                return false" href="#" class="menuitm"><span>{$lang.Cancel}</span></a>
                </div>
            </div>
            {if !empty($attachments[0])}<div class="well well-sm" >
                {foreach from=$attachments[0] item=attachment}
                    <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span> <a href="?action=download&id={$attachment.id}">{$attachment.org_filename}</a> <br/>
                    {/foreach}
                </div>
            {/if}
            <div style="clear:both"></div>
        </div>
        {include file="_common/quicklists.tpl" _placeholder=true}
    </div>
    {if $childrens}
        <div class="ticketrelation" style="background: #f3f5f6">
            <strong>Ticket relationship:</strong>
            <ul class="list-unstyled">
                <li>
                    {if $parent.id != $ticket.id}<a href="?cmd=tickets&action=view&list=all&num={$parent.ticket_number}" target="_blank">{else}<strong>{/if}
                        #{$parent.ticket_number} - {$parent.subject}
                    {if $parent.id != $ticket.id}</a>{else}</strong>{/if}
                    <ul>
                      {foreach from=$childrens item=child}
                          <li>
                              {if $child.id != $ticket.id}<a href="?cmd=tickets&action=view&list=all&num={$child.ticket_number}" target="_blank">{else}<strong>{/if}
                                  #{$child.ticket_number} - {$child.subject}
                              {if $child.id != $ticket.id}</a>{else}</strong>{/if}
                          </li>
                      {/foreach}
                    </ul>
                </li>
            </ul>
        </div>
    {/if}
    {if $replies && !empty($replies) }
        {foreach from=$replies item=reply}

            {if $reply.status!='Draft'}
                <div class="ticketmsg " id="reply_{$reply.id}">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="msgavatar">
                                <img src="https://www.gravatar.com/avatar/{$reply.gravatar}?s=32&d=mm" class="img-rounded">

                            </td>
                            <td class="msgwrapper">

                                <div class="left ticketinfoblock">
                                    {if $reply.type!='Admin' && $reply.replier_id}
                                    <a href="?cmd=clients&action=show&id={$reply.replier_id}" target="_blank">
                                        {/if}
                                        <strong {if $reply.type=='Admin'}class="adminmsg"{else}class="clientmsg"{/if}>
                                            {$reply.name}</strong>{if $reply.type!='Admin' && $reply.replier_id}</a>
                                    {/if}
                                    {if $reply.type=='Admin'}<label class="label label-info-invert">{$lang.staff}</label>
                                    {elseif $reply.replier_id!='0'}<label class="label label-success-invert">{$lang.client}</label>
                                    {/if}
                                    <span class="ticketinfo">
                            {$reply.date|dateformat:$date_format}
                                        <span style="display: none;">
                                    {if $reply.type == 'Client'} using client area, logged in
                                    {elseif $reply.type == 'Unregistered'} from client area, not logged in
                                    {elseif $reply.type != 'Admin'} via Email
                                    {/if}
                                </span>
                                &nbsp;&nbsp;&nbsp;
                            </span>


                                    <div style="color: rgb(153, 153, 153); font-size: 11px; width: 200px; line-height: 12px;">{if $reply.type!='Admin' && $reply.email}{$reply.email}{/if}&nbsp;</div>

                                </div>

                                {if !$forbidAccess.editTicket || (!$forbidAccess.editOwnMesg && $reply.type=='Admin' && $admindata.id == $reply.replier_id)}
                                    <a href="{$reply.id}" class="deletereply pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                    <a href="{$reply.id}" class="editor  pull-right btn btn-sm btn-default btn-tickets" type="reply"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                {/if}
                                <a href="{$reply.id}" class="quoter  pull-right btn btn-sm btn-default btn-tickets" type="reply"><i class="fa fa-quote-right" aria-hidden="true"></i></a>
                                <a href="#" class="quoter2  pull-right btn btn-sm btn-default btn-tickets"><i class="fa fa-quote-left" aria-hidden="true"></i> {$lang.Quoteselected}</a>
                                <span class="pull-right btn btn-sm btn-tickets">id: {$reply.id}</span>
                                <div class="clear"></div>
                                <div id="msgbody{$reply.id}"> {$reply.body|blockquote|httptohref|regex_replace:"/[^\S\n]+\n/":"<br>"|nl2br}</div>
                                {if $reply.editby != ''}<div class="editbytext fs11" style="color:#555; font-style: italic">{$lang.lastedited} {$reply.editby} at {$reply.lastedit|dateformat:$date_format}</div>
                                {/if}
                                <div id="editbody{$reply.id}" style="overflow:hidden; display:none; margin: 9px 0 0">
                                    <textarea style="width:100%"></textarea>
                                    <div style="padding:5px 0">
                                        <a href="{$reply.id}" class="menuitm editorsubmit"><span>{$lang.savechanges}</span></a> {$lang.Or}
                                        <a onclick="$('#msgbody{$reply.id}').show().siblings('.editbytext').show();
                                                $('#editbody{$reply.id}').hide();
                                                return false" href="#" class="menuitm"><span>{$lang.Cancel}</span></a>
                                    </div>
                                </div>
                                {if !empty($attachments[$reply.id])}
                                    <div class="well well-sm" >
                                    {foreach from=$attachments[$reply.id] item=attachment}
                                       <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                                        <a href="?action=download&id={$attachment.id}">{$attachment.org_filename}</a><br/>

                                    {/foreach}
                                    </div>
                                {/if}

                            </td>
                        </tr>
                    </table>





                </div>
            {/if}
        {/foreach}
    {/if}


    <div class="ticket-panel-btn">
        <a class="btn btn-default btn-sm {if $ticket.flags & 1}active{/if}" 
           id="LeaveNotes" href="#LeaveNotes" >{$lang.LeaveNotes}</a>
        {if $enableFeatures.supportext}
            <a class="btn btn-default btn-sm {if $ticket.flags & 2}active{/if}" 
               id="timeTracking" href="#timeTracking" >Time Tracking & Bills</a>
        {/if}
    </div>

    <div class="panel panel-warning" style="{if !($ticket.flags & 1)}display:none;{/if}" id="ticketnotebox" >

        <div class="panel-heading">
            Notes 
            <a title="Notes are only visible to Administrators and Staff Members assigned to this department. Clients do not see what you write here." class="vtip_description" style="padding-left:16px">&nbsp;</a>
        </div>
        <div class="panel-body">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" >
                <tbody id="ticketnotes">

                    <tr class="odd">
                        <td></td>
                        <td> Loading... <img src="{$template_dir}img/ajax-loading2.gif"> </td>
                    </tr>

                </tbody>

            </table>
            <div class="admin-note-new">
                <div class="admin-note-input">
                    <textarea rows="4" id="ticketnotesarea" name="notes" class="notes_field notes_changed"></textarea>
                    <div class="admin-note-attach"></div>
                </div>
                <div id="notes_submit" class="notes_submit admin-note-submit">
                    <input value="{$lang.LeaveNotes}" type="button" id="ticketnotessave">
                </div>
                <a href="#" class="editbtn" id="ticketnotesfile">Attach file</a>
            </div>
            <script src="{$template_dir}js/fileupload/init.fileupload.js?v={$hb_version}"></script>
        </div>
    </div>

    {if $enableFeatures.supportext}    
        <div class="panel panel-default" style="{if !($ticket.flags & 2)}display:none;{/if}" id="ticketbils" >

            <div class="panel-heading">
                Time Tracking & Bills 
                <a title="You can add bills for support service here. New items are added as drafts - staff members with billing privilages can generate invoices from them." class="vtip_description" style="padding-left:16px">&nbsp;</a>
            </div>
            <div class="panel-body">
                Loading... 
                <img src="{$template_dir}img/ajax-loading2.gif">
                {if $ticket.flags & 2}
                    <script type="text/javascript">{literal}$(function () {
                                    ticket.getBilling();
                                }){/literal}
                    </script>
                {/if}
            </div>
        </div>
    {/if}
    <div class="ticket-calendar panel panel-default" style="display:none;">
        <div class="panel-body"><div id="calendar-event-list"></div></div>
    </div>
</div>
<div id="recentreplies"></div>
<form id="reply-form" action="?cmd=tickets&action=view&num={$ticket.ticket_number}&list={$currentlist}" method="post" enctype="multipart/form-data" >
    <div class="container-fluid" id="replytable" {if $ticket.status=='Closed'}style="display:none"{/if}>
        <div class="row ticket-reply-row">
            <div class="col-md-8">

                <div id="alreadyreply">
                    {if $drafts}
                        <div class="alert alert-warning">
                            {foreach from=$drafts item=reply}
                                <p class="adminr_{$reply.replier_id}">
                                    <strong>{$reply.name}</strong> 
                                    {$lang.startedreplyat} {$reply.date|dateformat:$date_format} 
                                    <a href="#showDraft" data-draft="{$reply.id}" data-draft-by="{$reply.name}">{$lang.preview}</a>
                                </p>
                            {/foreach}
                        </div>
                    {/if}
                </div>

                <div class="alert alert-warning" id="justadded" style="display:none">
                    {$lang.newreplyjust}  &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" rel="{$ticket.viewtime}" id="showlatestreply"><strong>{$lang.updateticket}</strong></a>&nbsp;&nbsp;
                    <a href="#" onclick="$('#justadded').hide();
                                return false;">{$lang.Hide}</a>
                </div>


                <input type="hidden" name="make" value="addreply" />

                <div class="ticket-reply-input">
                    <label>{$lang.Reply}</label>
                    <a name="reply"></a>
                    <textarea rows="14" id="replyarea" name="body">{if $draftreply}{$draftreply.body}{/if}</textarea>
                </div>
                <div id="draftinfo">
                    <span class="draftdate" {if $draftreply}style="display:inline"{/if}>
                        {if $draftreply}
                            {$lang.draftsavedat} {$draftreply.date|dateformat:$date_format}
                        {/if}
                    </span> 
                    <span class="controls"  {if $draftreply }style="display:inline"{/if}>
                        <a href="#" onclick="return ticket.savedraft()">{$lang.savedraft|capitalize}</a> 
                        <a href="#" onclick="return ticket.removedraft()">{$lang.removedraft|capitalize}</a>
                    </span>
                </div>

                <a  class="attach" href="#" >{$lang.addattachment}</a> 
                &nbsp;&nbsp;
                ({$lang.allowedextensions} {$extensions})<br />
                <div id="attachments"> 
                </div>

                <input type="hidden" id="backredirect" name="brc" value="{$backredirect}" />
                {securitytoken}

            </div>
            <div class="col-md-4" >
                {adminwidget module="tickets" section="reply"}
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1 col-md-2 col-sm-3 ticket-submit-col">
                <button name="justsend" type="submit" value="{$lang.Send}" id="ticketsubmitter"
                        class="btn btn-lg btn-success ">{$lang.Send}</button>
            </div>
            <div class="col-lg-11 col-md-10 col-sm-9  ticket-widgets" >
                <div class="well"  id="ticketwidgetarea">
                    <div class="ticket-widget-form col-xs-12 col-sm-5  col-md-4 col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">{$lang.Setstatus}</span>
                            <select class="form-control" name="status_change" >
                                {foreach from=$statuses item=status}
                                    <option value="{$status}" {if $status=='Answered'}selected="selected"{/if} >{$lang.$status}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>

                    <div class="ticket-widget-btn t-w-modal" id="addasarticle">
                        <a class="btn btn-default" href="#addAsArticle"
                           data-content="Enter new name for this article" data-callback="ticket.savemacro">{$lang.askbarticle}</a>
                        <input type="hidden" name="send_save_name2" value=""/>
                    </div>

                    {if !$forbidAccess.manageMacros}
                        <div class="ticket-widget-btn t-w-modal" id="manageMacros">
                            <a class="btn btn-default" href="#asMacros"
                               data-content="Enter new name for this macro" data-callback="ticket.savemacro">{$lang.asmacro}</a>
                            <input type="hidden" name="send_save_name" value=""/>
                        </div>
                    {/if}

                    {adminwidget module="tickets" section="btn"}


                    <div class="ticket-widget-btn pull-right" >
                        <a class="btn btn-default" onclick=" $('body').scrollToEl('#hostbill-logo'); return false;" title="Scroll to top"><i class="fa fa-angle-double-up"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="blu"> 
    <div class="menubar">
        {include file="support/ticket_actions.tpl" bottom=true}
    </div>
</div>
{if $ajax}
    <script type="text/javascript">bindEvents();
        bindTicketEvents();</script>
{/if}