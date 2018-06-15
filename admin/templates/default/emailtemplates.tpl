<script type="text/javascript">loadelements.emails = true;</script>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" {if $currentfilter}class="searchon"{/if}>
    <tr>
        <td ><h3>{$lang.emailtemplates}</h3></td>
        <td></td>
    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=emailtemplates&action=add"  class="tstyled btn btn-success"><strong>{$lang.addnewtemplate}</strong></a><br>
            <a href="?cmd=emailtemplates"  class="tstyled selected">{$lang.emailtemplates}</a>
            <a href="?cmd=notifications"  class="tstyled ">Mobile/SMS templates</a>

        </td>
        <td  valign="top"  class="bordered" rowspan="2"><div id="bodycont">


                {if $action=='add' ||  $action=='edit'}
                    <link href="{$template_dir}js/chosen/chosen.css" rel="stylesheet" media="all">
                    <script type="text/javascript" src="{$template_dir}js/chosen/chosen.min.js?v={$hb_version}"></script>
                    <script type="text/javascript" src="{$template_dir}js/ace/ace.js?v={$hb_version}"></script>
                    {include file='ajax.emailtemplates.tpl'}

                {elseif $action=='preview'}
                    <div class="blu"> 
                        <a href="?cmd=emailtemplates" class="tload2"><strong>&laquo; {$lang.backtoemailtpl}</strong>
                        </a>&nbsp;
                    </div>
                    {literal}
                        <script language="javascript" type="text/javascript">
                            function resizeIframe(obj, content) {
                                if (content) {
                                    obj.contentWindow.document.write(content)
                                    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
                                } else {
                                    obj.contentWindow.document.write('<body style="padding: 0; margin-left: 0"><em style="color:silver">Empty message</em></body>')
                                    obj.style.height = '30px'
                                }
                            }
                        </script>
                        <style>
                            .et-preview .nav-pills{
                                margin: -5px 0 0 -5px;
                            }
                            .et-preview .nav-pills a{
                                text-decoration: none;
                                padding: 3px 10px;
                                color: #888888;
                            }
                        </style> 
                    {/literal}
                    <div class="lighterblue" style="padding:5px;">

                        {if !$emails}
                            <div class="panel panel-danger et-preview">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Preview was not generated</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active">
                                            Could not create email preview for this notification. Try with different parameters.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="alert alert-danger">
                                This is just a preview to help with template development, actual email can be loaded with different data set. 
                                Before using this template in production please test it with real notifications.
                            </div>
                            {foreach from=$emails key=key item=email}
                                <div class="panel panel-default et-preview">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><strong>Subject</strong>: {$email.subject} <span class="label label-info">{$email.language}</span></h3>
                                    </div>
                                    <div class="panel-body">

                                        {if $email.sendas == 'both'}
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-pills" role="tablist">
                                                <li role="presentation" class="active"><a href="#HTML{$key}" aria-controls="HTML" role="tab" data-toggle="tab">HTML</a></li>
                                                <li role="presentation"><a href="#PlainText{$key}" aria-controls="Plain Text" role="tab" data-toggle="tab">Plain Text</a></li>
                                            </ul>
                                        {/if}
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="HTML{$key}">
                                                <iframe style="width: 100%" frameborder="0" scrolling="no" onload="resizeIframe(this, {$email.message|@json_encode|escape})"></iframe>
                                            </div>
                                            {if $email.altmessage}
                                                <div role="tabpanel" class="tab-pane" id="PlainText{$key}">
                                                    <iframe style="width: 100%" frameborder="0" scrolling="no" onload="resizeIframe(this, {$email.altmessage|@json_encode|escape})"></iframe>
                                                </div>
                                            {/if}
                                        </div>

                                    </div>
                                </div>
                            {/foreach}
                        {/if}
                    </div>


                {elseif $action=='default' || $action=='admins'}
                    {literal}
                        <script>
                            $(document).ready(function () {
                                $('#newshelfnav').TabbedMenu({
                                    elem: '.sectioncontent',
                                    picker: '.list-1 li',
                                    aclass: 'active'
                                });
                            });
                        </script>
                    {/literal}



                    <div id="newshelfnav" class="newhorizontalnav">
                        <div class="list-1">
                            <ul>
                                <li class="active picked">
                                    <a href="#"><span class="ico money">Client Emails</span></a>
                                </li>
                                <li class="last">
                                    <a href="#"><span class="ico plug">Admin Emails</span></a>
                                </li>

                            </ul>
                        </div></div>
                    <div style="padding:15px;background:#F5F9FF;">
                        <div class="sectioncontent">
                            {if $emails}

                                <table width="100%" cellspacing="0" cellpadding="3" border="0" class="whitetable" style="border:solid 1px #ddd;">
                                    <tbody>

                                        {if $emails.Custom}
                                            <tr >
                                                <th colspan="4" align="left">{$lang.MyMessages}</th>
                                            </tr>
                                            {foreach from=$emails.Custom item=email  name=fr}
                                                <tr class="havecontrols {if $email.system=='0'}man{/if} {if $smarty.foreach.fr.index%2==0}even{/if}">

                                                    <td style="padding-left:10px"><a href="?cmd=emailtemplates&action=edit&id={$email.id}" >{$email.tplname}</a></td>
                                                    <td width="40"><a href="?cmd=emailtemplates&id={$email.id}&make={if $email.send=='1'}disable{else}enable{/if}&security_token={$security_token}" class="editbtn {if $email.send=='1'}editgray{/if}">{if $email.send=='1'}{$lang.Disable}{else}{$lang.Enable}{/if}</a></td>
                                                    <td width="23" align="center" ><a href="?cmd=emailtemplates&action=edit&id={$email.id}" class="editbtn">{$lang.Edit}</a></td>
                                                    <td width="17" class="lastitm">{if $email.system=='0'}<a href="?cmd=emailtemplates&make=delete&id={$email.id}&security_token={$security_token}" class="delbtn" onclick="return confirm('{$lang.deletetemplateconfirm}')">{$lang.Delete}</a>{/if}</td>
                                                </tr>
                                            {/foreach}
                                        {/if}
                                        <tr >
                                            <th colspan="4" align="left">{$lang.SystemMessages}</th>
                                        </tr>
                                        {foreach from=$emails.All item=email  name=fr}
                                            {if $email.for!='Admin'}

                                                <tr class="havecontrols {if $smarty.foreach.fr.index%2==0}even{/if} ">

                                                    <td style="padding-left:10px"><strong>{$lang.Client}: </strong><a href="?cmd=emailtemplates&action=edit&id={$email.id}" >{$email.tplname}</a></td>
                                                    <td width="40"><a href="?cmd=emailtemplates&id={$email.id}&make={if $email.send=='1'}disable{else}enable{/if}&security_token={$security_token}" class="editbtn {if $email.send=='1'}editgray{/if}">{if $email.send=='1'}{$lang.Disable}{else}{$lang.Enable}{/if}</a></td>
                                                    <td width="23" align="center" ><a href="?cmd=emailtemplates&action=edit&id={$email.id}" class="editbtn">{$lang.Edit}</a></td>
                                                    <td width="17" class="lastitm">{if $email.system=='0'}<a href="?cmd=emailtemplates&make=delete&id={$email.id}&security_token={$security_token}" class="delbtn" onclick="return confirm('{$lang.deletetemplateconfirm}')">{$lang.Delete}</a>{/if}</td>
                                                </tr>
                                            {/if} 
                                        {/foreach}


                                    </tbody>
                                </table>
                            {else}
                                <strong>{$lang.noemailstodisplay}</strong>

                            {/if}




                        </div>
                        <div class="sectioncontent" style="display:none">
                            {if $emails}

                                <table width="100%" cellspacing="0" cellpadding="3" border="0" class="whitetable" style="border:solid 1px #ddd;">
                                    <tbody>


                                        <tr >
                                            <th colspan="4" align="left">{$lang.SystemMessages}</th>
                                        </tr>
                                        {foreach from=$emails.All item=email  name=fr}
                                            {if $email.for=='Admin'}

                                                <tr class="havecontrols {if $smarty.foreach.fr.index%2==0}even{/if} ">

                                                    <td style="padding-left:10px"><strong>{$lang.Admin}: </strong><a href="?cmd=emailtemplates&action=edit&id={$email.id}" >{$email.tplname}</a></td>
                                                    <td width="40"><a href="?cmd=emailtemplates&id={$email.id}&make={if $email.send=='1'}disable{else}enable{/if}&security_token={$security_token}" class="editbtn {if $email.send=='1'}editgray{/if}">{if $email.send=='1'}{$lang.Disable}{else}{$lang.Enable}{/if}</a></td>
                                                    <td width="23" align="center" ><a href="?cmd=emailtemplates&action=edit&id={$email.id}" class="editbtn">{$lang.Edit}</a></td>
                                                    <td width="17" class="lastitm">{if $email.system=='0'}<a href="?cmd=emailtemplates&make=delete&id={$email.id}&security_token={$security_token}" class="delbtn" onclick="return confirm('{$lang.deletetemplateconfirm}')">{$lang.Delete}</a>{/if}</td>
                                                </tr>
                                            {/if} 
                                        {/foreach}


                                    </tbody></table>
                                {else}
                                <strong>{$lang.noemailstodisplay}</strong>

                            {/if}



                        </div>
                    </div>
                {/if}

            </div>
        </td>
    </tr>
</table>