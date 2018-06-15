{foreach from=$widgets item=wig}
    {if $widget.name == $wig.name}
        {assign value=$wig.location var=widgeturl}
    {/if}
{/foreach}
<h3>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h3>


<p>{$widgetopt.wdescription}</p>

<table class="table table-striped">
    <tr>
        <th>Domains</th>
        <th></th>
        <th style="width: 50px"></th>
    </tr>
    {foreach from=$domains item=domain}
        <tr>
            <td>{$domain.name}</td>
            <td>{if $domain.main}Main{/if}</td>
            <td>
                {if !$domain.main}
                    <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&deldomain={$domain.remote_id}&security_token={$security_token}"
                       title="Remove this domain" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this domain? All related email accounts will also be removed.')">
                        <i class="icon icon-remove"></i>
                    </a>
                {/if}
                {if !$domain.parent_id && (!$limits.alias || $limits.alias.left > 0)}
                    <a  class="alias" href="#alias" title="Add allias for this domain" data-toggle="tooltip" data-domainid="{$domain.remote_id}" data-domain="{$domain.domain}">
                        <i class="icon icon-share-alt"></i>
                    </a>
                {/if}
            </td>
        </tr>
        {foreach from=$domain.aliasList item=alias}
            <tr>
                <td>{$alias}</td>
                <td><em>Alias of {$domain.name}</em></td>
                <td>
                    <a href="{$ca_url}{$cmd}/{$action}/{$service.slug}/{$service.id}/&widget={$widget.name}&delalias={$domain.remote_id}&name={$alias|escape:'url'}&security_token={$security_token}"
                       title="Remove this alias" data-toggle="tooltip" onclick="return confirm('Are you sure to remove this domain alias?')">
                        <i class="icon icon-remove"></i>
                    </a>
                </td>
            </tr>
        {/foreach}
    {foreachelse}
        <tr>
            <td colspan="2">{$lang.nothing}</td>
        </tr>
    {/foreach}
</table>
{if !$limits.domain || $limits.domain.left > 0}
    <form class="form-inline" method="post" action="">
        <div class="input-append">
            <input type="text" id="domain" name="adddomain" class="span3"><button type="submit" class="btn btn-success">Add Domain</button>
            {securitytoken}
        </div>
        {if $limits.domain.left > 0}<span class="right">You can create {$limits.domain.left} more domain(s)</span>{/if}
    </form>
{/if}
<div class="modal hide fade" id="aliasing">
    <div class="modal-header">
        <a href="#close" class="xclose pull-right"><i class="icon icon-remove" aria-hidden="true">&times;</i></a>
        <h3>Alias for <span class="alias-domain"></span></h3>
    </div>
    <div class="modal-body">
        <form class="form-inline" method="post" action="">
            {if $limits.alias.left > 0}<p>You can create {$limits.alias.left} more domain alias</p>{/if}
            <div class="input-append">
                <input type="hidden" name="parent_id" class="parent">
                <input type="text" id="domain" name="name" class="span3"><button type="submit" class="btn btn-success">Create Alias</button>
                {securitytoken}
            </div>

        </form>
    </div>
</div>

{literal}
    <script type="text/javascript">
        $(function() {
            var m = $('#aliasing');
            m.detach().appendTo('body');
            m.find('.xclose').click(function() {
                m.modal('hide');
                return false;
            });
            $('.alias').click(function() {

                m.find('.parent').val($(this).data('domainid')).next().val('');
                m.find('.alias-domain').text($(this).data('domain'));
                m.modal();
                return false;
            })
            $('[data-toggle="tooltip"]').tooltip();
        })
    </script>
{/literal}

