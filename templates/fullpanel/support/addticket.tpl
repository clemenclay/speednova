<!--BOF: FILEUPLOAD -->
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}js/fileupload/styles.css" />
<!--EOF: FILEUPLOAD -->

<div class="white-container white-bg">
    <div class="padding">
        <h1><strong>{$lang.openticket}</strong></h1>

        <p>{$lang.mytickets_desc}</p>
        <form  enctype="multipart/form-data" method="post" action="" id="ticketsform" class="open-new-ticket">
            <input name="make" type="hidden" value="addticket" />
            <fieldset>

                <label for="department" >{$lang.department}</label>
                <select id="department" name="dept_id" class="span3" onchange="switchdeptdesc(this.value)">
                    {foreach from=$depts item=dept}
                        <option value="{$dept.id}" {if $submit.dept_id==$dept.id}selected="selected"{/if}>{$dept.name}</option>
                    {/foreach}
                </select>
                {foreach from=$depts item=dept name=fff}
                    <span class="department-description dept_{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block"  {else} style="display:none"{/if}>
                        {$dept.description}
                    </span>
                {/foreach}
                {foreach from=$depts item=dept name=fff}
                    {if $depts_avg[$dept.id]}
                        <div class="date-box" class="dept_{$dept.id}" {if $submit.dept_id && $submit.dept_id==$dept.id} style="display:block" {elseif $smarty.foreach.fff.first}  style="display:block" {else} style="display:none" {/if}>
                            <i class="icon-large-date"></i>
                            <span class="t-date">
                                {$lang.deptavgresponsetime}
                            </span> 
                            <p class="t-date bold">{$depts_avg[$dept.id]|convert:'second'}</p>
                        </div>
                    {/if}
                {/foreach}
            </fieldset>
            {if !$clientdata.firstname}
                <fieldset>
                    <label>{$lang.name}</label>
                    <input type="text" name="client_name" value="{$submit.client_name}"/>

                    <label>{$lang.email}</label>
                    <input type="text" name="client_email" value="{$submit.client_email}"/>
                </fieldset>
            {else}
                {foreach from=$depts item=dept name=loop}
                    {if $dept.options & 64}
                        <fieldset id="p{$dept.id}" class="dptpriority" {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}style="display: none"{/if}>
                            <label>{$lang.priority}</label>
                            <select {if ($submit && $submit.dept_id!=$dept.id) || ( !$submit && !$smarty.foreach.loop.first)}disabled="disabled"{/if} 									name="priority" style="float:left; margin-right:10px;">
                                <option {if $submit.priority==0}selected="selected"{/if} value="0" >{$lang.low}</option>
                                <option {if $submit.priority==1}selected="selected"{/if} value="1" >{$lang.medium}</option>
                                <option {if $submit.priority==2}selected="selected"{/if} value="2" >{$lang.high}</option>
                            </select>
                        </fieldset>
                    {/if}
                {/foreach}

            {/if}
            <fieldset>
                <label>{$lang.subject}</label>
                <input class="t-subject" type="text" value="{$submit.subject}"  name="subject"/>
            </fieldset>

            <fieldset>
                <label>{$lang.message}</label>
                <textarea name="body" id="ticketmessage">{$submit.body}</textarea>
            </fieldset>
            {if $captcha}
                <fieldset>
                    <label>{$lang.typethecharacters}</label>
                    <input type="text" value="" size="15" name="image_verification"   style="width:100px"/>
                    <img src="?cmd=root&amp;action=captcha" alt="captcha" />
                </fieldset>
            {/if}
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
                    <table role="presentation" class="table table-striped fixed-table fileupload-progress-table">
                        <tbody class="files"></tbody>
                    </table>
                </div>
            </div>
        </form>

    </div>
</div>
{literal}
    <script type="text/javascript">
                    function switchdeptdesc(items) {
                        $('.deptsdesc').find('div').hide();
                        $('.dept_' + items).show();
                        $('.dptpriority').hide().find('select').attr('disabled', 'disabled');
                        $('#p' + items).show().find('select').removeAttr('disabled');
                    }
    </script>
{/literal}
{include file="support/attachments.tpl"}