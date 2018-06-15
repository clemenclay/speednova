<link href="includes/modules/Hosting/zimbra/widgets/zcs_accounts/style.css" rel="stylesheet" type="text/css"/>
{foreach from=$widgets item=wig}
    {if $widget.name == $wig.name}
        {assign value=$wig.location var=widgeturl}
    {/if}
{/foreach}
<h3>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h3>


<p>{$widgetopt.wdescription}</p>

<table class="table table-striped accountlist">
    <thead>
        <tr class="form-inline">
            <th width="350">
                Domain
                <select name="domain" id="zcsdomain">
                    {foreach from=$domains item=domain}
                        <option value="{$domain.remote_id}" {if $domain_id == $domain.remote_id}selected="selected"{/if}> {$domain.domain} </option>
                    {foreachelse}
                        <option> - </option>
                    {/foreach}
                </select>
            </th>
            <th>COS</th>
            <th width="120">Quota usage</th>
            <th style="text-align: right"  width="125">
                {if $domains && ((!$limits.account) || ($limits.account.left > 0))}
                    <a href="#new" id="newacc" class="btn btn-success"  data-domainid="{$domain.remote_id}" data-domain="{$domain.domain}" >
                        <i class="icon icon-plus icon-white"></i> New Account
                    </a>
                {else}
                    <a class="btn btn-success disabled" >
                        <i class="icon icon-plus icon-white"></i> New Account
                    </a>
                {/if}
            </th>
        </tr>
    </thead>
    <tbody id="accountlist">
        {include file="../../`$widgeturl`ajax.zcs_accounts.tpl"}
    </tbody>
</table>
<p style="text-align: right">
    {if $limits.account.left > 0}
        You can create {$limits.account.left} more email account(s)<br/>
    {/if}
    {if $limits.archive.left > 0}
        You can archive {$limits.archive.left} more email account(s)<br/>
    {/if}
</p>
<h4>Quota usage</h4>
<div id="service-quota">
    <div class="usage" style="width:{$storage.usage_p}%" title="Used {$storage.usage_p}%" data-toggle="tooltip"><span>{$storage.usage}B</span></div>
    <div class="assigned" style="width:{$storage.assigned_p}%" title="Free {$storage.assigned_p}%" data-toggle="tooltip"><span>{$storage.assigned}B</span></div>
    <div class="unassigned" style="width:{$storage.unassigned_p}%" title="Unassigned {$storage.unassigned_p}%" data-toggle="tooltip"><span>{$storage.unassigned}B</span></div>
</div>
<script>console.log({$storage|@json_encode})</script>

<div class="modal hide fade" id="accoount">
    <div class="modal-header">
        <a href="#close" class="xclose pull-right"><i class="icon icon-remove" aria-hidden="true">&times;</i></a>
        <h3>Account</h3>
    </div>
    <form class="form-horizontal" method="post" action="" style="margin: 0">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="account" id="wdo">
            <input type="hidden" name="domain_id" class="parent">
            <input type="hidden" name="id" class="parentac">
            {foreach from=$limits.cos.left item=limit key=id}
                <input type="hidden" id="cos_{$id}" value="{$limit}">
            {/foreach}
            <div class="control-group">
                <label class="control-label" for="inputFirst">{$lang.firstname}</label>
                <div class="controls">
                    <input type="text" id="inputFirst" name="firstname" placeholder="{$lang.firstname}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputLast">{$lang.lastname}</label>
                <div class="controls">
                    <input type="text" id="inputLast" name="lastname" placeholder="{$lang.lastname}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">{$lang.email}</label>
                <div class="controls">
                    <input type="text" id="inputEmail" name="email" placeholder="{$lang.email}" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">{$lang.password}</label>
                <div class="controls">
                    <input type="password" id="inputPassword" name="password" placeholder="{$lang.password}">
                </div>
            </div>
            {*}<div class="control-group">
            <label class="control-label" for="inputQuota">{$lang.quota}</label>
            <div class="controls">
            <div id="slider" class="slides" style="clear: none; width: 200px; margin: 10px 15px 0px 0px;" data-limit="{$limits.quota.left}">
            <div class="sl"></div>
            <div class="sr"></div>
            </div>
            <div style="float: left; margin: 8px 15px 0px 0px;"><span id="quotaIndicator">1</span>MB</div>

            <input type="hidden" id="inputQuota" name="quota" placeholder="{$lang.quota}">
            </div>
            </div>{*}
            {if $limits.cos.left}
                <div class="control-group">
                    <label class="control-label" for="selectCos">Class of service</label>
                    <div class="controls">
                        <select id="selectCos" name="cos">
                            {if $defcos}<option value=""> Default </option>{/if}
                            {foreach from=$limits.cos.left item=limit key=id}
                                <option value="{$id}" {if $limit<1}disabled="disabled"{/if}> {$coslist.$id} ({$limit} left)</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            {/if}
            {securitytoken}

        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="buttonSubmit">Save</button>
        </div>
    </form>
</div>

<div class="modal hide fade" id="iquota">
    <div class="modal-header">
        <a href="#close" class="xclose pull-right"><i class="icon icon-remove" aria-hidden="true">&times;</i></a>
        <h3>Increase <span class="iqota-mailbox"></span> quota</h3>
    </div>
    <form class="form-horizontal" method="post" action="" style="margin: 0">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="quota" id="wdo">
            <input type="hidden" name="domain_id" class="parent">
            <input type="hidden" name="id" class="parentac">
            <input type="hidden" name="cos" class="cos">

            <div class="control-group">
                <label class="control-label" for="inputQuota">{$lang.quota}</label>
                <div class="controls">
                    <div id="slider" class="slides" style="clear: none; width: 200px; margin: 10px 15px 0px 0px;" data-limit="{$limits.quota.left}">
                        <div class="sl"></div>
                        <div class="sr"></div>
                    </div>
                    <div style="float: left; margin: 8px 15px 0px 0px;"><span id="quotaIndicator">1</span>MB</div>

                    <input type="hidden" id="inputQuota" name="quota" placeholder="{$lang.quota}">
                </div>
            </div>
            {securitytoken}
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="buttonSubmit">Save</button>
        </div>
    </form>
</div>
<script type="text/javascript">var pass_complexity = {$complexity};</script>
<script src="includes/modules/Hosting/zimbra/widgets/zcs_accounts/script.js" type="text/javascript"></script>


