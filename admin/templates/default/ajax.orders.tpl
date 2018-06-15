{if $action =='frauddetails'}
    {if $fraud_out}
        {include file="orders/step_FraudCheck.tpl"}
    {/if}
{elseif $action == 'getadvanced'}
    <a href="?cmd=orders&resetfilter=1"  {if $currentfilter}style="display:inline"{/if}  class="freseter">{$lang.filterisactive}</a>
    <form class="searchform filterform" action="?cmd=orders" method="post" onsubmit="return filter(this)">
        {include file="_common/filters.tpl"}
        {securitytoken}
    </form>
    <script type="text/javascript">bindFreseter();</script>
{elseif $action=='get_product'}
    {if $product}
        <tr>
            <td colspan="2"><h3>{$lang.productdetails}</h3></td>
        </tr>
        <tr>
            <td width="25%">{$lang.billingcycle}</td>
            <td>
                {if $product.paytype=='Free'}
                    <input type="hidden" name="cycle" value="Free" />{$lang.freeproduct}
                {elseif $product.paytype=='Once'}
                    <input type="hidden" name="cycle" value="Once" />
                    {$product.m|price:$currency} {$lang.Once} / {$product.m_setup|price:$currency} {$lang.setupfee}
                {else}
                    <select name="cycle">
                        {if $product.h!='0.00'}
                            <option value="h">{$product.h|price:$currency} {$lang.Hourly}</option>
                        {/if}
                        {if $product.d!='0.00'}        
                            <option value="d">{$product.d|price:$currency} {$lang.Daily}</option>
                        {/if}
                        {if $product.w!='0.00'}
                            <option value="w">{$product.w|price:$currency} {$lang.Weekly}</option>
                        {/if}
                        {if $product.m!='0.00'}        
                            <option value="m">{$product.m|price:$currency} {$lang.Monthly}</option>
                        {/if}
                        {if $product.q!='0.00'}        
                            <option value="q">{$product.q|price:$currency} {$lang.Quarterly}</option>
                        {/if}
                        {if $product.s!='0.00'}        
                            <option value="s">{$product.s|price:$currency} {$lang.SemiAnnually}</option>
                        {/if}
                        {if $product.a!='0.00'}        
                            <option value="a">{$product.a|price:$currency} {$lang.Annually}</option>
                        {/if}
                        {if $product.b!='0.00'}        
                            <option value="b">{$product.b|price:$currency} {$lang.Bienially}</option>
                        {/if}
                        {if $product.t!='0.00'}
                            <option value="t">{$product.t|price:$currency} {$lang.Triennially}</option>
                        {/if}
                        {if $product.p4!='0.00'}
                            <option value="p4">{$product.p4|price:$currency} {$lang.Quadrennially}</option>
                        {/if}
                        {if $product.p5!='0.00'}
                            <option value="p5">{$product.p5|price:$currency} {$lang.Quinquennially}</option>
                        {/if}
                    </select>
                {/if} 
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top" >{$lang.Addons}</td>
            <td>
                {if $addons}
                    {foreach from=$addons item=addon key=addon_id}
                        {if $addon_id!='categories'}
                            <input type="checkbox" name="addon[{$addon_id}]" value="1" /><strong>{$addon.name}</strong>{if $addon.description!=''} - {$addon.description}{/if}<br />
                            {/if}
                        {/foreach}
                    {else}
                        {$lang.noaddonsforproduct}
                    {/if}
            </td>
        </tr>
    {/if}

{elseif $action=='whois'}
    {if $available}
        <span style="color:green">{$lang.Available} !</span>
    {else}
        <span style="color:red">{$lang.Notavailable} 
            <a href="http://{$domain_name}" target="_blank">www</a> 
            <a href="{$system_url}?cmd=checkdomain&action=whois&domain={$domain_name}" 
               onclick="window.open(this.href, 'WHOIS', 'width=500, height=500, scrollbars=1');
                       return false">whois</a>
        </span>
    {/if}
{elseif $action=='getperiod'}
    {if $period}
        <select name="domain_period">
            {foreach from=$period item=years}
                <option value="{$years}" {if $years == $submit.domain_period}selected="selected" {/if}>{$years}{if $years == 1} {$lang.Year}{else} {$lang.Years}{/if}</option>
            {/foreach}
        </select>  
    {else}
        {$lang.cantgetperiods}.
    {/if}
{elseif $action=='clientorders'}
    <div class="blu clearfix">

        <div class="pull-right">
            {include file='ajax.filterquicktool.tpl' client_id=$client_id loadid='ordersfilter' href="?cmd=orders&action=getadvanced"}
            <a href="?cmd=orders&action=add&related_client_id={$client_id}" class="btn btn-primary btn-xs" target="_blank"><i class="fa fa-plus"></i> {$lang.neworder}</a>
        </div>

    </div>
    {if $orders}
        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="glike hover">
            <tbody>
                <tr>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="id">ID</a></th>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="number">{$lang.orderhash}</a></th>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="date_created">{$lang.Date}</a></th>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="total">{$lang.Total}</a></th>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="module">{$lang.paymethod}</a></th>
                    <th>{$lang.paymentstatus}</th>
                    <th><a href="?cmd=orders&action=clientorders&id={$client_id}" class="sortorder" data-orderby="status">{$lang.Status}</a></th>
                </tr>
            </tbody>
            <tbody>

                {foreach from=$orders item=order}
                    <tr>
                        <td><a href="?cmd=orders&action=edit&id={$order.id}">{$order.id}</a></td>
                        <td><a href="?cmd=orders&action=edit&id={$order.id}">{$order.number}</a></td>         
                        <td>{$order.date_created|dateformat:$date_format}</td>
                        <td>{$order.total|price:$order.currency_id}</td>
                        <td>{if $order.total<0}{$lang.amountcredited}{else}{$order.module}{/if}</td>
                        <td><span class="{$order.balance}">{$lang[$order.balance]}</span></td>
                        <td><span class="{$order.status}">{$lang[$order.status]}</span></td>

                    </tr>
                {/foreach}
            </tbody>
        </table>
        {if $totalpages}

            <center class="blu paginercontainer" >
                <strong>{$lang.Page} </strong>
                {section name=foo loop=$totalpages}
                    <a href='?cmd=orders&action=clientorders&id={$client_id}&page={$smarty.section.foo.iteration-1}' class="npaginer
                       {if $smarty.section.foo.iteration-1==$currentpage}
                           currentpage
                       {/if}"
                       >{$smarty.section.foo.iteration}</a>

                {/section}
            </center>
            <script> $('.paginercontainer', 'div.slide:visible').infinitepages();
                FilterModal.bindsorter('{$orderby.orderby}', '{$orderby.type}');</script>

        {/if}
    {else}
        <p style="text-align: center">{$lang.nothingtodisplay}</p>
    {/if}
{elseif $action=='getextended'}
    {if $extended}
        <table width="100%" cellspacing="1" cellpadding="1" border="0">
            <tr>
                <td colspan="2">
                    <h3>{$lang.extendedattribs}</h3>
                </td>
            </tr>
            {foreach from=$extended item=attribute}
                <tr>
                    <td width="25%">{$attribute.description}</td><td>         
                        {if $attribute.type == "input"}
                            <input type="text" name="domain_extended[{$attribute.name}]" size="20" value="{$fields.extended[$attribute.name]}"/>
                        {elseif $attribute.type == "select"}
                            <select name="domain_extended[{$attribute.name}]">
                                {foreach from=$attribute.option item=value}
                                    <option value="{$value.value}" {if $value.value == $fields.extended[$attribute.name]} selected="selected"{/if} >{$value.title}</option>
                                {/foreach}
                            </select>
                        {elseif $attribute.type == "checkbox"}
                            <input type="checkbox"  name="domain_extended[{$attribute.name}]" value="1" {if $fields.extended[$attribute.name] == "1"}checked="checked" {/if}/>
                        {/if}
                        <br />
                    </td>
                </tr>
            {/foreach}
        </table>
    {/if}
{elseif $action=="draft"}
    {if $orders}
        {foreach from=$orders item=order}
            <tr>
                <td><input type="checkbox" class="check" value="{$order.id}" name="selected[]"/></td>
                <td><a href="?cmd=orders&action=createdraft&id={$order.id}">{$order.id}</a></td>
                <td>{if $order.client_id}<a href="?cmd=clients&action=show&id={$order.client_id}">{$order.firstname} {$order.lastname}</a>{else} -{/if}</td>
                <td>{$order.date_created|dateformat:$date_format}</td>
                <td>{if $order.currency_id}{$order.total|price:$order.currency_id}{else}{$order.total|price:$currency}{/if}</td>
                <td>{if $order.module}{$order.module}{else}-{/if}</td>
                <td><span class="{$order.status}">{$lang[$order.status]}</span></td>
                <td><a href="?cmd={$cmd}&action={$action}&make=delete&id={$order.id}&security_token={$security_token}" onclick="return confirm('{$lang.deleteorderconfirm}');" class="delbtn">Delete</a></td>
            </tr>
        {/foreach}
    {elseif $action=="createdraft"}
        {include file='orders/add.tpl'}
    {else}
        <tr><td colspan="11"><p align="center" >{$lang.Click} <a href="?cmd=orders&action=createdraft" >{$lang.here}</a> to create new draft.</p></td></tr>
    {/if}
{else}
    {if $orders}
        {foreach from=$orders item=order}
            <tr>
                <td><input type="checkbox" class="check" value="{$order.id}" name="selected[]"/></td>
                <td><a href="?cmd=orders&action=edit&id={$order.id}&list={$currentlist}">{$order.id}</a></td>
                <td><a href="?cmd=orders&action=edit&id={$order.id}&list={$currentlist}">{$order.number}</a></td>
                <td><a href="?cmd=clients&action=show&id={$order.client_id}">{$order.firstname} {$order.lastname}</a></td>
                <td>{$order.date_created|dateformat:$date_format}</td>
                <td>{$order.total|price:$order.currency_id}</td>
                <td>
                    {if $order.total<0}
                        <span class="fs11">{$lang.amountcredited}</span>
                    {elseif $order.invcredit>0 && $order.invcredit>=$order.invsubtotal2}
                        {$lang.paidbybalance}
                    {else}
                        {$order.module|default:"`$lang.none`"} 
                        {if $order.invcredit>0}<span class="fs11">+ {$lang.paidbybalance}</span>{/if}
                    {/if}
                </td>
                <td><span class="{$order.balance}">{$lang[$order.balance]}</span></td>
                <td><span class="{$order.status}">{$lang[$order.status]}</span></td>
                <td>
                    {if !$forbidAccess.deleteOrders}
                        <a href="?cmd=orders&make=delete&id={$order.id}&security_token={$security_token}" onclick="return confirm('{$lang.deleteorderconfirm}');" class="delbtn">Delete</a>
                    {/if}
                </td>
            </tr>
        {/foreach}
    {elseif $action=="createdraft"}
        {include file='orders/add.tpl'}
    {else}
        <tr><td colspan="11"><p align="center" >{$lang.Click} <a href="?cmd=orders&action=add">{$lang.here}</a> {$lang.toplaceneworder}</p></td></tr>
    {/if}
{/if}