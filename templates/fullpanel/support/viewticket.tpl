<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}js/fileupload/styles.css" />
{if $department.supportrating}<link type="text/css" rel="stylesheet" href="{$template_dir}css/jRating.jquery.css" />{/if} 
<div class="ticket-box visible {if !$ajax}ticket-box-full{/if}">
    <div class="top-btns clearfix">
        <ul class="nav nav-pills">
            {tickets}
            <li><a href="{$ca_url}tickets/"><i class="icon-dl-cross"></i></a></li>
            <li>
                {if $ticket_prev}
                    <a href="{$ca_url}tickets/view/{$ticket_prev.ticket_number}"><i class="icon-dl-left-arrow"></i></a>
                {else}
                    <a class="disabled"><i class="icon-dl-left-arrow"></i></a>
                {/if}
            </li>
            <li>
                {if $ticket_next}
                    <a href="{$ca_url}tickets/view/{$ticket_next.ticket_number}"><i class="icon-dl-right-arrow"></i></a>
                {else}
                    <a class="disabled"><i class="icon-dl-right-arrow"></i></a>
                {/if}
            </li>
        </ul>
        <span class="ticket-top-info"><strong>{$lang.Ticket}</strong> #{$ticket.ticket_number}</span>
        <span class="ticket-top-info"><strong>{$lang.department}</strong> {$ticket.deptname}</span>
        <span class="ticket-top-info"><strong>{$lang.added}</strong> {$ticket.date|dateformat:$date_format}</span>
    </div>

    <div class="padding">
        {if $ticket.status!='Closed'}
        <form enctype="multipart/form-data" action="{$ca_url}tickets/view/{$ticket.ticket_number}/" method="post" id="replyform" class="ticket-form">
            <fieldset>
                <label>{$lang.reply}</label>
                <input type="hidden" value="addreply" name="make" />
                <input name="client_name" type="hidden" value="{$ticket.name}"/>
                <input name="client_email" value="{$ticket.email}" type="hidden"/>
                <textarea name="body" id="ticketmessage">{$submit.body}</textarea>
            </fieldset>
            <!--BOF: FILEUPLOAD Provide url to file upload handler in data-url -->
            <div class="upload-box" id="fileupload" data-url="?cmd=tickets&action=handleupload">
                <div class="pattern" id="dropzonecontainer">
                    <div id="dropzone"><h2>{$lang.droptoattach}</h2></div>
                    <fieldset class="m-10 clearfix">
                        <div class="pull-right">
                            <button type="submit" id="submitbutton" class="btn btn-green">{$lang.submit}</button>
                        </div>
                        <span class="btn btn-white fileinput-button">
                            <i class="icon-plus"></i> {$lang.attachfile}
                            <input type="file" name="attachments[]" multiple  />
                        </span>
                        <div class="file-extension">
                            <span><strong>{$lang.allowedext|regex_replace:'/%s|[():]/':''}</strong></span>
                            <p>{$extensions}</p>
                        </div>
                    </fieldset>
                    <table role="presentation" class="table table-striped fixed-table fileupload-progress-table bottom-info">
                        <tbody class="files"></tbody>
                    </table>
                </div>
            </div>
            {securitytoken}
        </form>
        {include file="support/attachments.tpl"}
        <div class="separator"></div>
        {/if}
        <div class="ticket-replies">
            {if $replies && !empty($replies) }
                {foreach from=$replies_rev item=reply}
                    <div class="reply clearfix">
                        <div class="pull-right">
                            <a href="#" class="btn btn-grey" onclick="return quoteTicket('r{$reply.id}');"><i class="icon-ticket-quote"></i></a>
                        </div>
                        <p class="author green-txt{if $reply.type!='Admin'} user{/if}">{$reply.name}</p>
                        <p id="r{$reply.id}" class="reply-txt">{$reply.body|httptohref|nl2br}</p>
                        <div class="bottom-info">
                            <span><i class="icon-ticket-date"></i>{$reply.date|dateformat:$date_format}</span>
                            {if !empty($attachments[$reply.id])}
                                <span class="attachments">
                                    &nbsp;&nbsp;&nbsp;<i class="icon-add-file"></i>
                                    {$lang.attachments}:
                                    {foreach from=$attachments[$reply.id] item=attachment}
                                        <a href="?action=download&amp;id={$attachment.id} "  class="label label-info">{$attachment.org_filename}</a>
                                    {/foreach}
                                </span>
                            {/if}
                            {if $reply.type=='Admin' && $ratingscale}
                                {if $department.supportrating}<div class="pull-right rating">
                                    <div class="rating-box {if $reply.rate_date}jDisabled{/if}" id="{$reply.rating}_{$reply.id}{if $ticket.client_id==0}_{$ticket.acc_hash}{/if}"></div>
                                    {if !$reply.rate_date}
                                        <span>{$lang.ratemyresponse}</span>
                                    {/if}{/if}
                                </div>
                            {/if}
                            
                        </div>
                    </div>
                {/foreach}
            {/if}
            <div class="reply clearfix">
                <div class="pull-right">
                    <a href="#" class="btn btn-grey" onclick="return quoteTicket('r{$ticket.id}');"><i class="icon-ticket-quote"></i></a>
                </div>
                <p class="author green-txt{if $ticket.type!='Admin'} user{/if}">{$ticket.name}</p>
                <p id="r{$ticket.id}" class="reply-txt">{$ticket.body|httptohref|nl2br}</p>
                <div class="bottom-info">
                    <span><i class="icon-ticket-date"></i>{$ticket.date|dateformat:$date_format}</span>
                    {if !empty($attachments[$reply.id])}
                        <span class="attachments">
                            &nbsp;&nbsp;&nbsp;<i class="icon-add-file"></i>
                            {$lang.attachments}:
                            {foreach from=$attachments[0] item=attachment}
                                <a href="?action=download&amp;id={$attachment.id} "  class="label label-info">{$attachment.org_filename}</a>
                            {/foreach}
                        </span>
                    {/if}
                    
                </div>
            </div>
        </div>

        <form  action="" method="post">
            {if $ticket.status!='Closed'}
                <div class="close-ticket clearfix">
                    <div class="separator"></div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-white">{$lang.resolved}</button>
                    </div>
                    <p>{$lang.resolvedticket}</p>
                    <input type="hidden" value="closeticket" name="make" />
                </div>
            {else}
                <div class="close-ticket clearfix">
                    <div class="separator"></div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-white">{$lang.reopen}</button>
                    </div>
                    <p>{$lang.notresolvedticket}</p>
                    <input type="hidden" value="reopen" name="make" />
                </div>

            {/if}
            {securitytoken}
        </form>
    </div>
</div>
 <script type="text/javascript" src="{$template_dir}js/jquery.elastic.min.js"></script>
 {literal}
    <script>
    function quoteTicket(target) {
        var resp = $('#'+target).text();
        var reply = $('#ticketmessage').val();
        $('#ticketmessage').val(reply + "\r\n>" + resp.replace(/\n/g,"\n>")+"\r\n").change().focus();
        return false;
    }
    $(document).ready(function(){
        $('a[rel=tooltip], div[rel=tooltip]').tooltip();
        if(!$('#ticketmessage').length) {
            $('.quoter').hide();
        } else {
            $('#ticketmessage').elastic();
        }
    });
    </script>
{/literal}