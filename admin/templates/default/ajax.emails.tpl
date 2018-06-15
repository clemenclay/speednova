

{if $action=='clientemails'}
    <div class="blu clearfix">
        <div class="pull-right">
            {include file='ajax.filterquicktool.tpl' client_id=$client_id loadid='emailslist' href="?cmd=emails&action=getadvanced"}
            <a href="?cmd=sendmessage&type=clients&selected={$client_id}" class="btn btn-primary btn-xs" target="_blank"><i class="fa fa-envelope-o"></i> {$lang.SendEmail}</a>
        </div>
    </div>


    {if $emails}<script type="text/javascript">
            {literal}
                function resent(mail_id) {
                    $.post('?cmd=emails&action=resend', {
                        selected: mail_id
                    }, function (data) {
                        var resp = parse_response(data);

                    });
                }
            {/literal}
        </script>
        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table glike hover">
            <tbody>
                <tr>

                    <th><a href="?cmd=emails&action=clientemails&id={$client_id}" class="sortorder" data-orderby="subject">{$lang.Subject}</a></th>
                    <th><a href="?cmd=emails&action=clientemails&id={$client_id}" class="sortorder" data-orderby="lastname">Sent to</a></th>
                    <th><a href="?cmd=emails&action=clientemails&id={$client_id}" class="sortorder" data-orderby="date">{$lang.Date}</a></th>
                    <th width="20"></th>
                </tr>
            </tbody>
            <tbody >

                {foreach from=$emails item=email}
                    <tr  >

                        <td><a href="?cmd=emails&action=show&id={$email.id}">{$email.subject}</a></td>
                        <td>
                            {foreach from=$email.emails item=addr name=emlo}
                                <span>{$addr}</span>{if !$smarty.foreach.emlo.last},{/if}
                            {/foreach}
                        </td>
                        <td>{$email.date}</td>         
                        <td><a href="javascript:void(0)" onclick="resent({$email.id})" class="editbtn">{$lang.resend}</a></td>

                    </tr>
                {/foreach}
            </tbody>

        </table>
        {if $totalpages}
            <center class="blu paginercontainer" >
                <strong>{$lang.Page} </strong>
                {section name=foo loop=$totalpages}
                    <a href='?cmd=emails&action=clientemails&id={$client_id}&page={$smarty.section.foo.iteration-1}' class="npaginer
                    {if $smarty.section.foo.iteration-1==$currentpage}
                    currentpage
                    {/if}"
                    >{$smarty.section.foo.iteration}</a>

                {/section}
            </center>
            <script> $('.paginercontainer','div.slide:visible').infinitepages();
                FilterModal.bindsorter('{$orderby.orderby}','{$orderby.type}');  </script>

        {/if}
    {else}
        <strong>{$lang.nothingtodisplay}</strong>
    {/if}

{elseif $action=='getadvanced'}

    <a href="?cmd=emails&resetfilter=1"  {if $currentfilter}style="display:inline"{/if}  class="freseter">{$lang.filterisactive}</a>
    <form class="searchform filterform" action="?cmd=emails" method="post" onsubmit="return filter(this)">  
        {include file="_common/filters.tpl"}
        {securitytoken}
    </form>

    <script type="text/javascript">bindFreseter();</script>

{elseif $action=='show'}
    <script type="text/javascript">
        {literal}
            function resent(mail_id) {
                $.post('?cmd=emails&action=resend', {
                    selected: mail_id
                }, function (data) {
                    var resp = parse_response(data);

                });
            }
        {/literal}
    </script>
    <div class="blu">
        <a href="?cmd=emails" data-pjax>
            <strong>&laquo; {$lang.backtoallemails}</strong>
        </a> 
        <input type="submit" name="resend" value="{$lang.Resend}" onclick="resent({$email.id})" style="font-weight: bold; margin-left: 5px" class="btn btn-primary btn-sm" />
    </div>
    <table cellpadding="4" style="width: 100%; background: rgb(224, 236, 255);">
        <tr>
            <td><b>To</b></td>
            <td>
                {foreach from=$email.emails item=addr name=emlo}
                    {if $addr.id}
                        <a href="?cmd=clients&action=show&id={$addr.id}">{$addr.firstname} {$addr.lastname} &lt;{$addr.email}&gt;</a>{if !$smarty.foreach.emlo.last},{/if}
                    {else}
                        <span>{$addr.email}</span>{if !$smarty.foreach.emlo.last},{/if}
                    {/if}
                {/foreach}
            </td>
            <td><b>Date</b></td>
            <td>{$email.date|dateformat:$date_format}</td>
        </tr>
        <tr>
            <td><b>{$lang.Subject}</b></td>
            <td>{$email.subject}</td>
            <td><b>Status</b></td>
            <td>{if $email.status}<span class="Successfull">Sent</span>{else}<span class="Failure">Failed</span>{/if}</td>
        </tr>
    </table>
    {literal}
        <script src="https://rawgithub.com/davidjbradshaw/iframe-resizer/master/js/iframeResizer.min.js"></script>
        <script language="javascript" type="text/javascript">
            function resizeIframe(obj, content) {

                if (content) {
                    obj.contentWindow.document.write(content)
                    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
                } else {
                    obj.contentWindow.document.write('<body style="padding: 0; margin-left: 0"><em style="color:silver">Empty message</em></body>')
                    obj.style.height = '30px'
                }
                //fix for big images without preset height
                $('img', obj.contentWindow.document).on('load', function () {
                    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
                })
            }
        </script>

    {/literal}

    <div class="lighterblue" style="padding:15px 10px 0">  
        {if $email.error}
            <div class="panel panel-danger et-preview">
                <div class="panel-heading">
                    <h3 class="panel-title">Error message</h3>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active">
                            {$email.error}
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        <iframe style="width: 100%" frameborder="0" scrolling="no" onload="resizeIframe(this, {$email.message|@json_encode|escape})"></iframe>
    </div>




{elseif $action=='default'}
    {if $emails}
        {if $showall}
            <script type="text/javascript">
                {literal}
                    function resent(mail_id) {
                        $.post('?cmd=emails&action=resend', {
                            selected: mail_id
                        }, function (data) {
                            var resp = parse_response(data);

                        });
                    }
                {/literal}
            </script>
            <form action="" method="post" id="testform" ><input type="hidden" value="{$totalpages}" name="totalpages2" id="totalpages"/>
                <div class="blu">
                    <div class="left">
                        {$lang.withselected}
                        <input type="submit" name="resend" value="{$lang.Resend}"  class="btn btn-primary btn-sm" />
                    </div>
                    <div class="right"><div class="pagination"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <a href="?cmd=emails" id="currentlist" style="display:none" updater="#updater"></a>
                <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table glike hover" style="table-layout: fixed;">
                    <tbody>
                        <tr>      
                            <th width="20"><input type="checkbox" id="checkall"/></th>
                            <th><a href="?cmd=emails&orderby=subject|ASC"  class="sortorder">{$lang.Subject}</a></th>
                            <th width="170"><a href="?cmd=emails&orderby=lastname|ASC"  class="sortorder">Send to</a></th>
                            <th width="120"><a href="?cmd=emails&orderby=date|ASC"  class="sortorder">{$lang.Date}</a></th>
                            <th width="40">{$lang.Status}</th>
                            <th width="40">&nbsp;</th>
                        </tr>
                    </tbody> 
                    <tbody id="updater"> 
                    {/if}
                    {foreach from=$emails item=email}
                        <tr>
                            <td><input type="checkbox" class="check" value="{$email.id}" name="selected[]"/></td>
                            <td class="subjectline"><div class="df1"><div class="df2"><div class="df3"><a href="?cmd=emails&action=show&id={$email.id}"  data-pjax>{if $email.subject == ''}<em>(empty subject)</em>{else}{$email.subject}{/if}</a></div></div></div></td>
                            <td>


                                {if $email.client_id}
                                    <a href="?cmd=clients&action=show&id={$email.client_id}">{$email.firstname} {$email.lastname}</a>
                                {else}
                                    <span title="{$email.emails[0]}">{$email.emails[0]|truncate:20:'..':true:true}</span>
                                {/if}
                                {if $email.addresscnt > 0} 
                                    <small>and {$email.addresscnt} more..</small>
                                {/if}
                            </td>
                            <td>{$email.date|dateformat:$date_format}</td>   
                            <td>{if $email.status}<span class="Successfull">Sent</span>{else}<span class="Failure">Failed</span>{/if}</td>
                            <td><a href="javascript:void(0)" onclick="resent({$email.id})" class="editbtn">{$lang.resend}</a></td>

                        </tr>
                    {/foreach}
                    {if $showall}
                    </tbody>
                    <tbody id="psummary">
                        <tr>
                            <th></th>
                            <th colspan="5">
                                {$lang.showing} <span id="sorterlow">{$sorterlow}</span> - <span id="sorterhigh">{$sorterhigh}</span> {$lang.of} <span id="sorterrecords">{$sorterrecords}</span>
                            </th>
                        </tr>
                    </tbody>
                </table>
                <div class="blu">
                    <div class="left">
                        {$lang.withselected}
                        <input type="submit" name="resend" value="{$lang.Resend}" class="btn btn-primary btn-sm"/>
                    </div>
                    <div class="right"><div class="pagination"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                {securitytoken}</form>

        {/if}
    {else} 
        {if $showall}
            <p class="blu"> {$lang.nothingtodisplay} </p>
        {else}
            <tr>
                <td colspan="5"><p align="center" > {$lang.nothingtodisplay} </p></td>
            </tr>
        {/if}
    {/if}


{/if}
