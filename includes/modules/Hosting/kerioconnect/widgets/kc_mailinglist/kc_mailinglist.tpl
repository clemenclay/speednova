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
            <td colspan="3">
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
            <th> Name </th>
            <th> Email Address</th>
            <th>Description</th>
            <th>Members</th>
            <th style="text-align: right">
                {if $domains && ((!$limits.lists) || ($limits.lists.left > 0))}
                    <a href="#new" id="newacc" class="btn btn-success"  data-action="newAccount" >
                        <i class="icon icon-plus icon-white"></i> New List
                    </a>
                {else}
                    <a class="btn btn-success disabled" >
                        <i class="icon icon-plus icon-white"></i> New List
                    </a>
                {/if}
            </th>
        </tr>
    </thead>
    <tbody id="accountlist">
        {include file="../../`$widgeturl`ajax.kc_mailinglist.tpl"}
    </tbody>
</table>
<p style="text-align: right">
    {if $limits.lists.left > 0}
        You can create {$limits.lists.left} additional mailing list(s)<br/>
    {/if}
</p>

<div class="modal hide fade action-newAccount action-editAccount">
    <div class="modal-header">
        <button type="button" class="close hide-modal" aria-hidden="true">×</button>
        <h3>Mailing list</h3>
    </div>
    <form class="form-horizontal" method="post" action="" id="dlistform" style="margin: 0">
        <div class="modal-body">
            <input type="hidden" name="wdo" value="account" id="wdo">
            <input type="hidden" name="domain_id" id="domain_id">
            <input type="hidden" name="id" id="account_id">

            <div class="control-group">
                <label class="control-label" for="inputFirst">List Name</label>
                <div class="controls">
                    <input type="text" id="inputFirst" name="displayName" placeholder="List Display Name">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDescription">{$lang.Description}</label>
                <div class="controls">
                    <textarea id="inputDescription" name="description" placeholder="{$lang.description}"></textarea>
                </div>
            </div>
            <h3>Members</h3>
            <div class="members">
                
            {if $limits.members && $limits.members.limit >= 0}
                <p>
                    You can assign {$limits.members.limit} member(s) for this list
                </p>
                <input id="memberlimit" value="{$limits.members.limit}" type="hidden" />
            {else}
                <input id="memberlimit" value="-1" type="hidden" />
            {/if}
            <div class="control-group">
                <span class="pull-right">
                    <button class="btn" id="delmember">Remove Selected</button>
                </span>

                <select multiple="multiple" id="aclist" style="height: 100px; width: 100%; display: none">
                    {*foreach from=$accounts item=acc}<option value="{$acc.name}">{$acc.name}</option>{/foreach*}
                </select>

                <div class="input-append form-horizontal">
                    <input type="text" id="acinput" class="span3"><button class="btn" id="addmember">Add</button>
                </div>

            </div>
            <div class="control-group">
                <select name="members" id="memberlist" style="height: 128px; width:100% " multiple="multiple"  >

                </select>
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
        .ajaxLoading{
            opacity: 0.4;
            position: relative;
        }
        .ajaxLoading::after{
            content: "Loading..";
            font-size: 20px;
            margin-top: 100px;
            text-align: center;
            position: absolute;
            right: 0;
            left: 0;
            top: 0;
        }
    </style>
    <script src="includes/modules/Hosting/kerioconnect/widgets/kc_mailinglist/script.js" type="text/javascript"></script>
{/literal}

