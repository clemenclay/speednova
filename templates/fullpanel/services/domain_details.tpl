<div class="white-container white-bg">
    <div class="padding">
        {if $bulkdetails}
            <div class="widget">
                <div class="wbox">
                    <div class="wbox_header">{$lang.bulkdomains}</div>
                    <div  class="wbox_content" id="cartSummary">
                        {foreach from=$bulkdetails item=b}
                            <a href="{$ca_url}clientarea/domains/{$b.id}/{$b.name}/"><span class="label label-warning">{$b.name}</span></a>
                            {/foreach}
                    </div>
                </div>

                {if $widget.replacetpl}
                    {include file=$widget.replacetpl}
                {elseif $widget.appendtpl}
                    {include file=$widget.appendtpl}
                {elseif $widget.appendaftertpl}
                    <a name="{$widget.name}"></a>
                    {include file=$widget.appendaftertpl}
                {/if}
            </div>
        {elseif $details}
            {*}
            <h2>{$lang.domdetails}</h2>
            
            <p class="no-icon">{$details.name} </p>
            <div class="shared-wrapper clearfix">
            <aside class="shared-hosting-menu">
            <div class="header">
            <p>{$lang.menu}</p>
            </div>
            <ul class="nav">
        
            
            </aside>
            {*}
            {if $widget.appendtpl}
                <div class="widget">
                    {include file=$widget.appendtpl}
                </div>
            {/if}

            {if $widget.replacetpl}
                <div class="widget">
                    {include file=$widget.replacetpl}
                </div>
            {else}
                <h2>{$lang.domdetails}</h2>
                <table class="table table-striped table-aff-center p-top">
                    <tr>
                        <td class="w30 bold">{$lang.domain}</td>
                        <td><span class="label {$details.status}-label">{$lang[$details.status]}</span> <a href="http://{$details.name}" target="_blank">{$details.name}</a></td>
                    </tr>
                    <tr>
                        <td class="w30 bold">{$lang.registrationdate}</td>
                        <td>{if !$details.date_created || $details.date_created == '0000-00-00'}{$lang.none}{else}{$details.date_created|dateformat:$date_format}{/if}</td>
                    </tr>
                    {if $details.status == 'Active' || $details.status == 'Expired'}
                        <tr>
                            <td class="w30 bold">{$lang.expirydate}</td>
                            <td>
                                {if !$details.expires || $details.expires == '0000-00-00'}{$lang.none}
                                {else}{$details.expires|dateformat:$date_format}
                                    {if $details.daytoexpire >= 0}
                                        <small>
                                            ({$details.daytoexpire} 
                                            {if $domain.daytoexpire==1}{$lang.day}
                                            {else}{$lang.days}
                                            {/if} {$lang.toexpire})
                                        </small>
                                    {/if}
                                {/if}
                                {if $allowrenew}
                                    <span class="m-icon"><i class="icon-cart"></i></span> 
                                    <a href="{$ca_url}clientarea/domains/renew/&ids[]={$details.id}">{$lang.renewdomain}</a>
                                {/if}
                            </td>
                        </tr>
                    {/if}
                    {if $details.status == 'Active'}
                        <tr>
                            <td class="w30 bold">
                                {$lang.reglock} <span class="vtip_description" title="{$lang.reglock_desc}"></span>
                            </td>
                            <td>
                                {if $details.reglock=='1'}<span class="label On-label">{$lang.On}</span> 
                                {else}<span class="label Off-label">{$lang.Off}</span> 
                                {/if}
                                {foreach from=$widgets item=widg name=cst}
                                    {if $widg.name=='reglock'}
                                        <span class="m-icon"><i class="icon-domain-lock"></i></span> 
                                        <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#reglock">
                                            {assign var=widg_name value="`$widg.name`_widget"}
                                            {if $lang[$widg_name]}{$lang[$widg_name]}
                                            {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                            {elseif $widg.fullname}{$widg.fullname}
                                            {else}{$widg.name}
                                            {/if}
                                        </a>{break}
                                    {/if}
                                {/foreach}&nbsp;
                            </td>
                        </tr>
                    {/if}
                    {if !$details.not_renew}
                        <tr>
                            <td class="w30 bold">
                                {$lang.autorenew}
                                <span class="vtip_description" title="{$lang.autorenew_desc}"></span>
                            </td>
                            <td>
                                {if $details.autorenew=='1'}
                                    <span class="label On-label">{$lang.On}</span>
                                {else}
                                    <span class="label Off-label">{$lang.Off}</span>
                                {/if}
                                {foreach from=$widgets item=widg name=cst}
                                    {if $widg.name=='autorenew'}
                                        <span class="m-icon"><i class="icon-renewal"></i></span> 
                                        <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew">
                                            {assign var=widg_name value="`$widg.name`_widget"}
                                            {if $lang[$widg_name]}{$lang[$widg_name]}
                                            {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                            {elseif $widg.fullname}{$widg.fullname}
                                            {else}{$widg.name}
                                            {/if}
                                        </a>
                                        {break}
                                    {/if}
                                {/foreach}
                            </td>
                        </tr>
                    {/if}
                    {if $details.offerprotection}
                        <tr>
                            <td class="w30">
                                <div>{$lang.privacyprotection}<span class="vtip_description" title="{$lang.privacyprotection_desc}"></div>
                            </td>
                            <td>

                                {if $details.offerprotection.enabled}
                                    <span class="label On-Label">{$lang.On}</span>
                                {else}
                                    <span class="label Off-label">{$lang.Off}</span>
                                {/if}

                                {if $details.offerprotection.purchased}
                                    {foreach from=$widgets item=widg name=cst}
                                        {if $widg.name=='idprotection'}
                                            <span class="m-icon"><i class="icon-sh-password inline-block"></i></span> 
                                            <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#autorenew" class="roll-link">
                                                <span data-title="{assign var=widg_name value="`$widg.name`_widget"}
                                                      {if $lang[$widg_name]}{$lang[$widg_name]}
                                                      {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                      {elseif $widg.fullname}{$widg.fullname}
                                                      {else}{$widg.name}
                                                      {/if}">
                                                    {assign var=widg_name value="`$widg.name`_widget"}
                                                    {if $lang[$widg_name]}{$lang[$widg_name]}
                                                    {elseif $lang[$widg.name]}{$lang[$widg.name]}
                                                    {elseif $widg.fullname}{$widg.fullname}
                                                    {else}{$widg.name}
                                                    {/if}
                                                </span>
                                            </a>
                                            {break}
                                        {/if}
                                    {/foreach}
                                {else}
                                    <span class="m-icon"><i class="icon-sh-password inline-block"></i></span> 
                                    <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&make=domainaddons"><span>{$lang.addprivacy}</span></a>
                                        {/if}
                            </td>
                        </tr>
                    {/if}
                </table>

                <div class="separator-line"></div>

                <h2>{$lang.nameservers}</h2>
                <div class="table-box m15 overflow-h">
                    <div class="table-header">
                    </div>
                    <table class="table table-header-fix table-striped p-td">
                        <tr>
                            <th>{$lang.hostname}</th>
                            <th>{$lang.ipadd}</th>
                        </tr>
                        {foreach from=$details.nameservers item=ns name=namserver}
                            {if $ns!=''}
                                <tr>
                                    <td>{$ns}</td>
                                    <td>
                                        {if $details.nsips[$smarty.foreach.namserver.index]}{$details.nsips[$smarty.foreach.namserver.index]}
                                        {/if}
                                    </td>
                                </tr>
                            {/if}
                        {/foreach}
                        {foreach from=$widgets item=widg name=cst}
                            {if $widg.name=='nameservers'}
                                <tr>
                                    <td>
                                        <i class="icon-manage-ns"></i> 
                                        <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}#nameservers">
                                            {assign var=widg_name value="`$widg.name`_widget"}
                                            {if $lang[$widg_name]}
                                                {$lang[$widg_name]}
                                            {elseif $lang[$widg.name]}
                                                {$lang[$widg.name]}
                                            {elseif $widg.fullname}
                                                {$widg.fullname}
                                            {else}
                                                {$widg.name}
                                            {/if}
                                        </a>
                                    <td></td>
                                </tr>
                                {break}
                            {/if}
                        {/foreach}
                    </table>
                </div>

                {if $widget.appendaftertpl}
                    <div class="separator-line"></div>
                    <a name="{$widget.name}"></a>
                    <div class="widget">
                        {include file=$widget.appendaftertpl}
                    </div>
                {/if}

                {* eof: if widget replace *}

            {/if}

            {* eof: if details *}
        {/if}
    </div>
</div>