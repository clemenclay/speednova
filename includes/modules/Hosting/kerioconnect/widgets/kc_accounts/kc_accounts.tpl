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
            <td colspan="4">
                <label><strong>Domain</strong></label>
                <select name="domain" id="keirodomain">
                    {foreach from=$domains item=domain}
                        <option value="{$domain.safeId}" {if $domain_id == $domain.safeId}selected="selected"{/if}> {$domain.domain} </option>
                    {foreachelse}
                        <option> - </option>
                    {/foreach}
                </select>
            </td>
        </tr>
        <tr class="form-inline">
            <th >Username</th>
            <th >Email Address</th>
            <th colspan="2">Quota</th>
            <th style="text-align: right">
                {if $domains && ((!$limits.account) || ($limits.account.left > 0))}
                    <a href="#new" id="newacc" class="btn btn-success"  data-action="newAccount" >
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
        {include file="../../`$widgeturl`ajax.kc_accounts.tpl"}
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

<div class="modal hide fade action-newAccount action-editAccount">
    <div class="modal-header">
        <button type="button" class="close hide-modal" aria-hidden="true">×</button>
        <h3>Account</h3>
    </div>
    <form class="form-horizontal" method="post" action="" style="margin: 0">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="account" id="wdo">
            <input type="hidden" name="domain_id" id="domain_id">
            <input type="hidden" name="id" id="account_id">

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
                <label class="control-label" for="inputEmail">{$lang.username}</label>
                <div class="controls">
                    <input type="text" id="inputEmail" name="email" placeholder="{$lang.username}" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">{$lang.password}</label>
                <div class="controls">
                    <input type="password" id="inputPassword" name="password" placeholder="{$lang.password}">
                </div>
            </div>
            {securitytoken}

        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" id="buttonSubmit">Save</button>
        </div>
    </form>
</div>

<div class="modal hide fade action-resizeAccount">
    <div class="modal-header">
        <button type="button" class="close hide-modal" aria-hidden="true">×</button>
        <h3>Increase <span class="iqota-mailbox"></span> quota</h3>
    </div>
    <form class="form-horizontal" method="post" action="" style="margin: 0">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="quota" id="wdo">
            <input type="hidden" name="domain_id" class="domain_id">
            <input type="hidden" name="id" class="account_id">
            {if $limits.quota}
                <input type="hidden" value="{$limits.quota.left}" class="quota_left">
            {/if}

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

{literal}
    <style>
        table.accountlist th, table.accountlist td{
            line-height: 24px;
        }
        .quotaDiv{
            white-space: nowrap;
            border: 1px solid #ccc;
            padding: 1px;
            line-height: 18px;
            font-size: 11px;
            width: 85px;
        }
        .quotaDiv div{
            background: none repeat scroll 0 0 #52ae51;
            color: #eee;
            height: 18px;
            overflow: hidden;
            padding: 1px 0;
            position: relative;
            text-align: center;
            z-index: 1;
        }
        .quotaDiv div span{
            display: block;
            position: absolute;
            width: 85px;
        }
        .quotaDiv.green div{
            background-color: #52AE51;
        }
        .quotaDiv.red div{
            background-color: #C96855;
        }
        .quotaDiv div + div{
            background: none!important;
            color: #444;
            margin-top: -20px;
            z-index: 0;
        }
    </style>
    <script src="includes/modules/Hosting/kerioconnect/widgets/kc_accounts/script.js" type="text/javascript"></script>
{/literal}

