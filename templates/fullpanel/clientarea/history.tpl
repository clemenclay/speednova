{*

Browse logs related to client

*}

<div class="white-container white-bg">
    <div class="padding">
        <div class="account-info-container">
            <div class="pull-right">
                <div class="content-search">
                    <i class="icon-search"></i>
                    <input type="text" placeholder="Search e-mails...">
                    <button type="submit" class="btn btn-green btn-rds">Go</button>
                </div>
            </div>
            <h2>{$lang.myhistory}</h2>
            <p>{$lang.accountlogssectionhistory}</p>

            <div class="table-box m15 overflow-h">
                <div class="table-header">
                </div>
                <a href="{$ca_url}clientarea&action=history" id="currentlist" style="display:none" updater="#updater"></a>
                <input type="hidden" id="currentpage" value="0" />
                <table class="table table-header-fix table-striped p-td">
                    <tr>
                        <th><a href="{$ca_url}clientarea&action=history&orderby=date|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.date}</a></th>
                        <th class="w60"><a href="{$ca_url}clientarea&action=history&orderby=description|ASC" class="sortorder"><i class="icon-sort"></i>{$lang.Description}</a></th>
                        <th><a href="{$ca_url}clientarea&action=history&orderby=result|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.status}</a></th>
                        <th class="w10"></th>
                    </tr>
                    <tbody id="updater">
                        {include file='ajax/ajax.history.tpl'}
                    </tbody>
                </table>
            </div>
            {if $totalpages}
                <div class="bottom-options clearfix">
                    <div class="pull-right">
                        <div class="pagination c-pagination">
                            <ul rel="{$totalpages}">
                                <li><a href="#{$lang.previous}">{$lang.previous}</a></li>
                                <li><a href="#{$lang.next}">{$lang.next}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>