{*

Clientarea dashboard - summary of owned services, due invoices, opened tickets

*}

<div class="padding">
    <!-- Two Columns -->
    <div class="clearfix">
        <!-- Left Column -->
        {include file="search_field.tpl"}
        <h1>{$lang.welcomeback}, {$login.firstname} {$login.lastname}</h1>
        
        <div class="separator"></div>
        <div class="left-60 clearfix">

            <h2>Your Services</h2>
            {clientservices}
            <ul class="nav nav-tabs service-tabs">
                <li class="active">
                    <a href="#all" data-target=".offer-all">All <div></div></a>
                </li>
                {if $offer_domains}
                    <li>
                        <a href="#domains" data-target=".offer-domains">{$lang.domains}<div></div></a>
                    </li>
                {/if}
                {foreach from=$offer item=offe}
                    {if $offe.total>0}
                        <li>
                            <a href="#{$offe.slug}" data-target=".offer-{$offe.id}"> {$offe.name}<div></div></a>
                        </li>
                    {/if}
                {/foreach}
            </ul>

            <div class="tab-container">
                <div class="tab-header">
                    <ul class="nav nav-pills services-info">
                        {foreach from=$offer item=offe}
                            {if $offe.total>0}
                                <li>
                                    <span class="label-sign" style="background:{$offe._color}">{$offe._label}</span> {$offe.name}
                                </li>
                            {/if}
                        {/foreach}
                        {if $offer_domains}
                            <li>
                                <span class="label-sign blue-label">D</span> {$lang.domains}
                            </li>
                        {/if}
                    </ul>
                    <p>Newest added services:</p>
                </div>
                <div class="tab-content overflow-hidden-relative">
                    <!-- Tab #1 -->
                    <div class="tab-pane active page-contener" id="all">
                        <table class="table services-table align-middle page">
                            {counter name=srlist print=false start=0 assign=srlist}
                            {foreach from=$client_services item=service}
                                {counter name=srlist}
                                <tr class="offer-all offer-{$service.category_id}">
                                    <td class="p-label"><span class="label-sign" style="background:{$service._color}">{$service._label}</span></td>
                                    <td>
                                        <a class="bold" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">{$service.name}</a>
                                        <p>{$service.domain}</p>
                                    </td>
                                    <td><span class="label-sign {$service.status}-label">{$lang[$service.status]}</span></td>
                                    <td>{$service.total|price:$currency}</td>
                                    <td>{$lang[$service.billingcycle]}</td>
                                    <td>
                                        <small>Next Due Date</small>
                                        <p>{$service.next_due}</p>
                                    </td>
                                    <td class="align-r w5">
                                        <a class="btn btn-white" href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><i class="icon-pagin-right"></i></a>
                                    </td>
                                </tr>
                                {if $srlist%5==0}
                                </table><table class="table services-table align-middle page" style="display:none">
                                {/if}
                            {/foreach}
                            {foreach from=$client_domains item=service}
                                {counter name=srlist}
                                <tr class="offer-all offer-domains">
                                    <td class="p-label"><span class="label-sign blue-label">D</span></td>
                                    <td>
                                        <a class="bold" href="{$ca_url}clientarea/domains/{$service.id}/{$service.name}/">{$service.name}</a>
                                        <p>{$service.domain}</p>
                                    </td>
                                    <td><span class="label-sign {$service.status}-label">{$lang[$service.status]}</span></td>
                                    <td>{$service.total|price:$currency}</td>
                                    <td>{$lang[$service.billingcycle]}</td>
                                    <td>
                                        <small>Next Due Date</small>
                                        <p>{$service.next_due}</p>
                                    </td>
                                    <td class="align-r w5">
                                        <a class="btn btn-white" href="{$ca_url}clientarea/domains/{$service.id}/{$service.name}/"><i class="icon-pagin-right"></i></a>
                                    </td>
                                </tr>
                                {if $srlist%5==0}
                                </table><table class="table services-table align-middle page" style="display:none">
                                {/if}
                            {/foreach}
                        </table>
                        {if $srlist > 5}
                            <div class="pagination c-pagination">
                                <ul>
                                    <li><a class="page-link" href="#"><i class="icon-pagin-left"></i></a></li>
                                    <li><a class="page-link" href="#"><i class="icon-pagin-right"></i></a></li>
                                </ul>
                            </div>
                        {/if}
                    </div>
                    <!-- End of Tab #1 -->
                </div>
            </div>
        </div>
        <!-- End of Left Column -->


        <!-- Right Column -->
        <div class="right-40 clearfix">
            <div class="padding">

                <h2>Your Account</h2>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#balance" data-toggle="tab">balance <div></div></a></li>
                </ul>
                <div class="tab-container">
                    <div class="tab-header">
                        <p>current account details:</p>
                    </div>
                    <div class="tab-content overflow-vis">

                        <div class="tab-pane active" >
                            <table class="table balance-table tab-table">
                                <tr>
                                    <td class="no-border">
                                        Invoices Due
                                        <p class="red-txt">{if $acc_balance}- {$acc_balance|price:$currency}{else}{0|price:$currency}{/if}</p>
                                    </td>
                                    <td class="no-border">
                                        your balance
                                        <p class="green-txt">{if $acc_credit}{$acc_credit|price:$currency}{else}{0|price:$currency}{/if}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        opened tickets
                                        <p class="red-txt">{clientstats type=ticketsopened tpl="%d" default=0}</p>
                                    </td>
                                    <td>
                                        tickets solved
                                        <p class="green-txt">{clientstats type=ticketsclosed tpl="%d" default=0}</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- End of Tab #2 -->

                    </div>
                </div>

                <ul class="nav nav-pills account-buttons">
                    <li><a class="green" href="{$ca_url}cart/"><i class="icon-btn-order"></i> <div>order more</div></a></li>
                        {if $enableFeatures.deposit!='off' }
                        <li>
                            <a href="{$ca_url}clientarea/addfunds/"><i class="icon-btn-funds"></i> <div>add funds</div></a>
                        </li>
                    {/if}
                    <li><a href="{$ca_url}clientarea/details/"><i class="icon-btn-edit"></i> <div>edit details</div></a></li>
                </ul>

            </div>
        </div>

        <!-- End of Right Column -->

        <!-- End of Two Columns -->
    </div>

    {if $dueinvoices}
        <div class="separator"></div>

        <!-- Invoices -->

        <div class="full-width-container clearfix dashboard-invoices">
            <div class="pull-right right-btns">
                {if $enableFeatures.bulkpayments!='off'}
                    <form method="post" action="index.php" style="display: inline-block">
                        <button type="submit" class="btn btn-green"> {$lang.paynowdueinvoices}</button>
                        <input type="hidden" name="action" value="payall"/>
                        <input type="hidden" name="cmd" value="clientarea"/>
                    </form>
                {/if}
                <a class="btn btn-white" href="{$ca_url}clientarea/invoices/">View All <i class="icon-pagin-right"></i></a>
            </div>
            <h2>{$lang.dueinvoices} <span class="red-txt">{$acc_balance|price:$currency}</span></h2>

            <table class="table full-table table-round-rows">
                <tr class="header-row">
                    <th class="w10 no-pl">{$lang.status} </th>
                    <th class="w60">{$lang.invoicenum}</th>
                    <th class="w15">{$lang.total} </th>
                    <th class="no-r-border w15">{$lang.duedate} </th>
                </tr>
                {foreach from=$dueinvoices item=invoice name=foo}
                    <tr class="empty-row">
                    </tr>
                    <tr>
                        <td class="no-pl"><span class="Unpaid-label">{$lang.Unpaid}</span></td>
                        <td>
                            <a href="{$ca_url}clientarea/invoice/{$invoice.id}/" target="_blank" class="blue-txt">
                                Invoice #{$invoice|@invoice}
                            </a>
                        </td>
                        <td>{$invoice.total|price:$invoice.currency_id}</td>
                        <td> {$invoice.duedate|dateformat:$date_format}</td>
                    </tr>
                {/foreach}
            </table>
        </div>
    {/if}  
    <!-- End of Invoices -->

    {if $openedtickets}
        <div class="separator"></div>

        <!-- Tickets -->

        <div class="full-width-container clearfix dashboard-support-tickets">
            <div class="pull-right right-btns">
                <a class="btn btn-green" href="{$ca_url}tickets/new/">{$lang.createnew}</a>
                <a class="btn btn-white" href="{$ca_url}tickets/">View All <i class="icon-pagin-right"></i></a>
            </div>
            <h2>{$lang.openedtickets|capitalize} </h2>

            <table class="table full-table table-round-rows">
                <tr class="header-row">
                    <th class="w10 no-pl">{$lang.status} </th>
                    <th class="w60">{$lang.subject} </th>
                    <th class="no-r-border w35">{$lang.department} </th>
                        {foreach from=$openedtickets item=ticket name=foo}
                    </tr>
                    <tr class="empty-row">
                    </tr>
                    <tr>
                        <td class="no-pl"><span class="Open-label">{$lang[$ticket.status]}</span></td>
                        <td><a class="blue-txt" href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject}</a></td>
                        <td> {$ticket.deptname}</td>
                    </tr>
                {/foreach}
            </table>
        </div>
    {/if}  
    <!-- End of Tickets -->
</div>


