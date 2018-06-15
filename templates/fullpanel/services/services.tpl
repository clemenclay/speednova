
{if $service}
    {include file='services/service_details.tpl'}
{else}

    <div class="padding">
        {if $services}
            {if $custom_template}
                {include file=$custom_template}
            {else}

                <h2>
                    {if $action=='services' && $cid}
                        {foreach from=$offer item=o}{if $action=='services' && $cid==$o.id}{$o.name}
                            {/if}
                        {/foreach}
                    {else}
                        {$lang[$action]|capitalize}
                    {/if}
                </h2>
                <p>{$lang.listservices}</p>

                <a href="{$ca_url}clientarea&amp;action=services&amp;cid={$cid}" id="currentlist" style="display:none" updater="#updater"></a>
                <input type="hidden" id="currentpage" value="0" />
                <table class="table full-table m20 table-round-rows">

                    <tr>
                        <th class="w0"></th>
                        <th class="w40"><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=name|ASC" class="sortorder">{$lang.service} <i class="icon-sort"></i></a></th>
                        <th><a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=status|ASC" class="sortorder">{$lang.status} <i class="icon-sort"></i></a></th>
                                {if $action=='vps'}
                            <th>
                                <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=domain|ASC" class="sortorder">{$lang.hostname} <i class="icon-sort"></i></a>
                            </th>
                            <th>{$lang.ipadd}</th>
                            {else}
                            <th>
                                <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=total|ASC" class="sortorder">{$lang.price} <i class="icon-sort"></i></a>
                            </th>
                            <th>
                                <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=billingcycle|ASC" class="sortorder">{$lang.bcycle} <i class="icon-sort"></i></a>
                            </th>
                        {/if}
                        <th colspan="2">
                            <a href="{$ca_url}clientarea&amp;action={$action}&amp;cid={$cid}&amp;orderby=next_due|ASC" class="sortorder">{$lang.nextdue} <i class="icon-sort"></i></a>
                        </th>

                    </tr>
                    <tbody id="updater">
                        {include file='ajax/ajax.services.tpl'}
                    </tbody>
                </table>
            {/if}
            {if $totalpages}
                <div class="bottom-options clearfix">
                    {if $totalpages}
                        <div class="pull-right">
                            <div class="pagination c-pagination">
                                <ul rel="{$totalpages}">
                                    <li><a href="#{$lang.previous}">{$lang.previous}</a></li>
                                    <li><a href="#{$lang.next}">{$lang.next}</a></li>
                                </ul>
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}
        {else}
            <h2><i class="icon-main-cog"></i> 
                {$lang[$action]|capitalize}
            </h2>

            <p>{$lang.nothing}</p>

            {if $cid}
                {foreach from=$offer item=oo}
                    {if $cid==$oo.id && $oo.visible=='1'}
                        <form method="post" action="{$ca_url}cart&cat_id={$cid}" style="text-align: center">
                            <button class=" btn btn-green btn-large"  style="font-weight:bold;font-size:16px;padding:15px 10px;">
                                <i class="icon-add-w"></i> {$lang.Add} {$oo.name}
                            </button>
                            {securitytoken}
                        </form>
                    {/if}
                {/foreach}
            {/if}

        {/if}
    </div>
{/if}

