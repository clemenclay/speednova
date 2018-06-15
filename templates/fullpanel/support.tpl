<div class="padding">
    <!-- Two Columns -->
    {if $enableFeatures.kb!='off' || $enableFeatures.downloads!='off'}
        <div class="clearfix">
            {if $enableFeatures.kb!='off'}
                <!-- Left Column -->
                <div class="{if $enableFeatures.downloads!='off'}left-60{/if} clearfix">
                    <h2>{$lang.knowledgebase}</h2>
                    <div class="tab-container support-main">
                        <div class="tab-header">
                            <p>Popular categories:</p>
                        </div>
                        <div class="tab-content overflow-hidden-relative">
                            <div class="tab-pane active page-contener">
                                <ul class="knowledgebase-list page">
                                    {foreach from=$topkb item=kb name=kblist}
                                        <li>
                                            <a href="{$ca_url}knowledgebase/category/{$kb.id}/">{$kb.name}</a>
                                        </li>
                                        {if !$smarty.foreach.kblist.first && !$smarty.foreach.kblist.last && $smarty.foreach.kblist.index%5==0}
                                        </ul><ul class="page knowledgebase-list" style="display:none">
                                        {/if}
                                    {foreachelse}
                                        <li>
                                            {$lang.nothing}
                                        </li>
                                    {/foreach}
                                </ul>
                                <div class="pagination c-pagination clearfix">
                                    <div class="pull-right">
                                        <a href="{$ca_url}knowledgebase/"  class="btn btn-white">Knowledgebase Center <i class="icon-pagin-right"></i></a>
                                    </div>
                                    <ul>
                                        {if $smarty.foreach.kblist.total>5}
                                            <li><a class="page-link" href="#"><i class="icon-pagin-left"></i></a></li>
                                            <li><a class="page-link" href="#"><i class="icon-pagin-right"></i></a></li>
                                                {/if}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Left Column -->
            {/if}
            {if $enableFeatures.downloads!='off'}
                <!-- Right Column -->
                <div class="{if $enableFeatures.kb!='off'}right-40{/if} clearfix">
                    <div class="padding">

                        <h2>Downloads</h2>
                        <div class="tab-container support-main">
                            <div class="tab-header">
                                <p>Popular categories:</p>
                            </div>
                            <div class="tab-content overflow-hidden-relative">
                                <div class="tab-pane active page-contener">
                                    
                                    <ul class="knowledgebase-list page">
                                        {foreach from=$topdw item=kb name=kblist}
                                            <li>
                                                <a href="{$ca_url}knowledgebase/category/{$kb.id}/">{$kb.name}</a>
                                            </li>
                                            {if !$smarty.foreach.kblist.first && !$smarty.foreach.kblist.last && $smarty.foreach.kblist.index%5==0}
                                            </ul><ul class="page knowledgebase-list" style="display:none">
                                            {/if}
                                        {foreachelse}
                                            <li>
                                                {$lang.nothing}
                                            </li>
                                        {/foreach}

                                    </ul>
                                    <div class="pagination c-pagination clearfix">
                                        <div class="pull-right">
                                            <a href="{$ca_url}downloads/" class="btn btn-white">Downloads Center <i class="icon-pagin-right"></i></a>
                                        </div>
                                        <ul>
                                            {if $smarty.foreach.kblist.total>5}
                                                <li><a class="page-link" href="#"><i class="icon-pagin-left"></i></a></li>
                                                <li><a class="page-link" href="#"><i class="icon-pagin-right"></i></a></li>
                                                    {/if}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            {/if}
        </div>
        <div class="separator"></div>
    {/if}
    <!-- Support Tickets -->
    <div class="full-width-container clearfix mb-20">
        <div class="pull-right right-btns">
            <a class="btn btn-green" href="{$ca_url}tickets/new/">Open New Ticket</a>
            <a class="btn btn-white" href="{$ca_url}tickets/">View All <i class="icon-pagin-right"></i></a>
        </div>
        <h2>Opened Support Tickets</h2>

        <table class="table full-table">
            <tr class="header-row">
                <th class="w10"><div class="relative"><div class="bg-left"></div></div>Status </th>
            <th class="w60">subject <a href="#"><div class="caret"></div></a></th>
            <th class="no-r-border w35"><div class="relative"><div class="bg-right"></div></div>department </th>
            </tr>
            {foreach from=$openedtickets item=ticket name=foo}
                <tr class="empty-row">
                </tr>
                <tr>
                    <td class="no-pl"><div class="relative"><div class="bg-left"></div></div><span class="{$ticket.status}-label">{$lang[$ticket.status]}</span></td>
                    <td><a class="blue-txt" href="{$ca_url}tickets/view/{$ticket.ticket_number}/">{$ticket.subject}</a></td>
                    <td><div class="relative"><div class="bg-right"></div></div> {$ticket.deptname}</td>
                </tr>
            {foreachelse}
                <tr>
                    <td colspan="3">{$lang.nothing}</td>
                </tr>
            {/foreach}
        </table>
    </div>

    <!-- End of Support Tickets -->

    {if $enableFeatures.netstat!='off'}
        <!-- Server Status -->
        {include file="netstat.tpl" wrapped=true}
        <script type="text/javascript">ajax_update('{$ca_url}netstat/', null, '#netstat_update');</script>
        <!-- End of Server Status -->
    {/if}
</div>