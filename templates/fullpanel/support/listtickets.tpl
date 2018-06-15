<div id="ticketview">
</div>
<div class="white-container support-ticket">
    <div class="padding">
        <div class="pull-right ticket-m3">

            <div class="search-box clearfix">
                <div class="pull-right">
                    <form action="{$ca_url}tickets/" method="post">
                    <button name="resetfilter=1" type="submit"><i class="icon-search"></i></button>
                    <input type="text" name="filter[subject]" value="{$currentfilter.subject}" placeholder="{$lang.filtertickets}">
                </div>
            </div>

            <a href="{$ca_url}tickets/new/" class="btn btn-green">{$lang.createnew}</a>

        </div>
        <h2> {$lang.tickets|capitalize}</h2>

        <table class="table full-table table-round-rows table-row-link">
            <tr class="header-row">
                <th class="w15"><a href="{$ca_url}tickets/&orderby=status|ASC" class="sortorder">{$lang.status} <i class="icon-sort"></i> </a></th>
                <th class="w45"><a href="{$ca_url}tickets/&orderby=subject|ASC" class="sortorder">{$lang.subject} <i class="icon-sort"></i> </a></th>
                <th class="w20"><a href="{$ca_url}tickets/&orderby=name|ASC" class="sortorder">{$lang.department} <i class="icon-sort"></i> </a></th>
                <th class="no-r-border w20"><a href="{$ca_url}tickets/&orderby=date|ASC" class="sortorder">{$lang.date} <i class="icon-sort"></i> </a></th>
            </tr>
            <tbody id="updater">
                {include file='ajax.tickets.tpl'}
            </tbody>
        </table>
        <div class="bottom-options clearfix">
            <div class="pull-right">
                {if $totalpages}
                    <div class="pagination c-pagination">
                        <ul rel="{$totalpages}">
                            <li><a href="#{$lang.previous}">{$lang.previous}</a></li>
                            <li><a href="#{$lang.next}">{$lang.next}</a></li>
                        </ul>
                    </div>
                {/if}
            </div>

        </div>
        {securitytoken}
    </div>
</div>
<script type="text/javascript" src="{$template_dir}js/tickets.js"></script>