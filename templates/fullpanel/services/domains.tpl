

{if $edit}
    {include file='services/domain_details.tpl'}
{else}
    <div class="white-container services-main">
        <div class="padding">
            <div class="pull-right">

                <div class="search-box clearfix">
                    <div class="pull-right">
                        <form action="{$ca_url}{$cmd}/{$action}/" method="post">
                            <button name="resetfilter=1" type="submit"><i class="icon-search"></i></button>
                            <input type="text" name="filter[name]" value="{$currentfilter.name}" placeholder="{$lang.filterdomains}"  >			
                        </form>
                    </div>
                </div>
                {*}<a href="#" class="btn btn-green">Add domain</a>{*}

            </div>
            <h3>{$lang.domains|capitalize}</h3>
            {if $domains}
                <a href="{$ca_url}clientarea&amp;action=domains" id="currentlist" style="display:none" updater="#updater"></a>
                <input type="hidden" id="currentpage" value="0" />
                <table class="table full-table m20 table-round-rows">
                    <tr class="header-row">
                        <th class="w5 no-r-border"><input type="checkbox" onclick="c_all(this)"></th>
                        <th ><a href="{$ca_url}clientarea/domains/&amp;orderby=name|ASC" class="sortorder" >{$lang.domain} <i class="icon-sort"></i></a></th>
                        <th ><a href="{$ca_url}clientarea/domains/&amp;orderby=status|ASC" class="sortorder">{$lang.status}<i class="icon-sort"></i></a></th>
                        <th ><a href="{$ca_url}clientarea/domains/&amp;orderby=date_created|ASC" class="sortorder">{$lang.registrationdate} <i class="icon-sort"></i></a></th>
                        <th ><a href="{$ca_url}clientarea/domains/&amp;orderby=expires|ASC" class="sortorder">{$lang.expirydate <i class="icon-sort"></i></a>}</th>
                        
                        <th colspan="2" style="width: 110px">{$lang.autorenew}</th>
                    </tr>


                    <tbody id="updater">
                        {include file='ajax/ajax.domains.tpl'}
                    </tbody>
                </table>
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
                    <div class="filter">
                        {$lang.withdomains}
                        <select id="bulk_widget">
                            <option value="">Manage domains</option>
                            <option disabled class="widget_domainrenewal" value="{$ca_url}clientarea/domains/renew/">{$lang.renew_widget}</option>
                            {if $domwidgets}
                                {foreach from=$domwidgets item=widg}
                                    {assign var=widg_name value="`$widg.name`_widget"}
                                    <option disabled class="widget_{$widg.widget}" value="{$ca_url}clientarea/domains/bulkdomains/&widget={$widg.widget}">{*
                                        *}{if $lang[$widg_name]}{*
                                        *}{$lang[$widg_name]}{*
                                        *}{elseif $lang[$widg.widget]}{*
                                        *}{$lang[$widg.widget]}{*
                                        *}{else}{*
                                        *}{$widg.name}{*
                                        *}{/if}
                                    </option>
                                {/foreach} 
                            {/if}
                        </select>
                        <button class="btn btn-white" onclick="return bulk_widget()">Apply</button>
                    </div>
                </div>
            {else}
                <p>{$lang.nothing}</p>
                {if $lang.add_domain}
                    <form method="post" action="{$ca_url}checkdomain">
                        <button class="clearstyle btn c-orange-btn"  style="font-weight:bold;font-size:16px;padding:15px 10px;"></i> {$lang.add_domain}</button>
                        {securitytoken}
                    </form>
                {/if}
            {/if}    
        </div>
    </div>
{/if}
<script type="text/javascript" src="{$template_dir}js/domains.js"></script>
