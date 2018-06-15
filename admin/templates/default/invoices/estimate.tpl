<div class="blu">  
    <div class="menubar">
        <a href="?cmd=estimates"  id="backto">
            <strong>&laquo; {$lang.backto} {$lang.Estimates}</strong>
        </a>

        <a class="setStatus menuitm menu-auto" id="hd1"  >
            <span class="morbtn">{$lang.Setstatus}</span></a>
        <a class="invoiced_ menuitm menu-auto {if $estimate.status=='Invoiced'}disabled{/if}" 
           href="?cmd=estimates&action=createinvoice&id={$estimate.id}&security_token={$security_token}" 
           {if $estimate.status=='Invoiced'}onclick="return false"{/if}>
            <span>{$lang.converttoinvoice}</span>
        </a>
        {if !$forbidAccess.deleteEstimates}
            <a class="deleteEstimate menuitm menu-auto"    ><span style="color:#FF0000">{$lang.Delete}</span></a>
            {/if}

        <a class="{if $estimate.status!='Invoiced'}sendEstimate{/if} invoiced_ menuitm menu-auto {if $estimate.status=='Invoiced'}disabled{/if}" 
           name="send" {if $estimate.status=='Invoiced'}onclick="return false"{/if} >
            <span style="font-weight:bold">{$lang.Send}</span>
        </a>
        <a class="menuitm setStatus menu-auto" id="hd2" onclick="return false;" href="#" ><span class="morbtn">{$lang.moreactions}</span></a>

        <ul id="hd1_m" class="ddmenu">
            <li class="act-status off-draft"><a href="Draft">{$lang.Draft}</a></li>
            <li class="act-status off-sent"><a href="Sent">{$lang.Sent}</a></li>
            <li class="act-status off-accepted"><a href="Accepted">{$lang.Accepted}</a></li>
            <li class="act-status off-invoiced"><a href="Invoiced">{$lang.Invoiced}</a></li>
            <li class="act-status off-dead"><a href="Dead">{$lang.Dead}</a></li>  

        </ul>
        <ul id="hd2_m" class="ddmenu">
            <li>
                <a href="?action=download&estimate={$estimate.id}" class="directly">{$lang.downloadpdf}</a>
            </li>
            {if count($currencies)>1}
                <li class="act-status off-invoiced">
                    <a href="ChangeCurrency">{$lang.ChangeCurrency}</a>
                </li>
            {/if}
            <li><a href="?cmd=estimates&action=duplicate&id={$estimate.id}" class="directly">{$lang.Duplicate}</a></li>

            <li><a href="EditDetails">{$lang.editdetails}</a></li>
        </ul>
    </div>
</div>
{if count($currencies)>1}
    <div id="change-currency" hidden bootbox data-title="Change currency">
        <form action="?cmd=estimates&action=edit&id={$estimate.id}" method="post" >
            <input type="hidden" name="make" value="currchange" />
            <div class="form-group">
                <label>{$lang.newcurrency}</label>
                <select name="new_currency_id" id="new_currency_id" class="form-control">
                    {foreach from=$currencies item=curr}
                        {if $curr.id!=$invoice.currency_id}
                            <option value="{$curr.id}">{if $curr.code}{$curr.code}{else}{$curr.iso}{/if}</option>
                        {/if}	
                    {/foreach}
                </select>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="exchange" value="1" id="calcex"/>
                    {$lang.calcexchange}
                </label>
            </div>
            <div class="form-group" hidden id="exrates">
                <label>{$lang.excurrency}</label>
                {foreach from=$currencies item=curr}
                    {if $curr.id!=$invoice.currency_id}
                        <input value="{$curr.rate}" name="cur_rate[{$curr.id}]" 
                               style="display:none" class="form-control" size="3"/>
                    {/if}	
                {/foreach}
            </div>

            {securitytoken}
        </form>
    </div>

{/if}

<div id="ticketbody">
    <h1>
        <span style="padding:0px;">
            {$lang.estimatehash}{$estimate.id}
        </span>
        <span class="{$estimate.status}" id="estimate_status" data-status="{$estimate.status}">
            {$lang[$estimate.status]}
        </span>
        <span class="clear"></span>
    </h1>
    <input type="hidden" id="estimate_id" name="invoice_id" value="{$estimate.id}" />
    <input type="hidden" id="currency_id" name="inv_currency_id" value="{$estimate.currency_id}" />
    <input type="hidden" id="client_id" name="client_id" value="{$estimate.client_id}" />

    <div id="client_nav">
        <!--navigation-->
        <a class="nav_el nav_sel left" href="#">{$lang.estimatedetails}</a>
        {include file="_common/quicklists.tpl"}
        <div class="clear"></div>
    </div>

    <div class="ticketmsg ticketmain" id="client_tab">
        <div class="slide" style="display:block">
            <div class="left" >
                <strong class="clientmsg" id="curr_det">
                    {$lang.Client}: 
                    <a href="?cmd=clients&action=show&id={$estimate.client_id}">
                        {$estimate.client.lastname} {$estimate.client.firstname}
                    </a>
                    <a href="#" class="editbtn" id="changeowner">{$lang.Change}</a>
                    &nbsp;&nbsp;&nbsp;
                </strong> 
                <span id="client_container"></span>
            </div>
            <div class="right replybtn tdetail">
                <strong>
                    <a href="#">
                        <span class="a1">{$lang.editdetails}</span>
                        <span class="a2">{$lang.hidedetails}</span>
                    </a>
                </strong>
            </div>

            {if $estimate.status == 'Paid'}
                <div class="right">
                    {$lang.Paid}: {$estimate.datepaid|dateformat:$date_format}
                    &nbsp;&nbsp;&nbsp;
                </div>
            {/if}

            <div class="clear"></div>
            <div id="detcont">
                {include file='invoices/estimate_details.tpl'}
            </div>
        </div>
        {include file="_common/quicklists.tpl" _placeholder=true}
    </div>

    {include file='invoices/items_form.tpl' invoice=$estimate}

    {if $estimate.hash}
        <p align="right" style="color:#999999; {if $estimate.status=='Dead' || $estimate.status=='Draft'}display:none;{/if}" id="clientlink" >
            <strong>{$lang.clientlink}</strong> {$system_url}?action=estimate&amp;id={$estimate.hash}
        </p>
    {/if}

    {include file='_common/noteseditor.tpl'}
</div>


<div class="blu"> 
    <div class="menubar">
        <a href="?cmd=estimates&list={$currentlist}"  id="backto">
            <strong>&laquo; {$lang.backto} {$lang.Estimates}</strong>
        </a>

        <a class="setStatus menuitm menu-auto" id="hd1"  ><span class="morbtn">{$lang.Setstatus}</span></a>
        <a class="invoiced_ menuitm menu-auto {if $estimate.status=='Invoiced'}disabled{/if}" 
           href="?cmd=estimates&action=createinvoice&id={$estimate.id}&security_token={$security_token}" 
           {if $estimate.status=='Invoiced'}onclick="return false"{/if}>
            <span>{$lang.converttoinvoice}</span>
        </a>
        {if !$forbidAccess.deleteEstimates}
            <a class="deleteEstimate menuitm menu-auto" ><span style="color:#FF0000">{$lang.Delete}</span></a>
            {/if}

        <a class="{if $estimate.status!='Invoiced'}sendEstimate{/if} invoiced_ menuitm menu-auto  {if $estimate.status=='Invoiced'}disabled{/if}" 
           name="send" {if $estimate.status=='Invoiced'}onclick="return false"{/if} >
            <span style="font-weight:bold">{$lang.Send}</span>
        </a>
        <a class="menuitm setStatus menu-auto" id="hd2" onclick="return false;" href="#" ><span class="morbtn">{$lang.moreactions}</span></a>
    </div>
</div>
{if $ajax}
    <script type="text/javascript">bindEvents(); bindEstimatesEvents();</script>
{/if}






