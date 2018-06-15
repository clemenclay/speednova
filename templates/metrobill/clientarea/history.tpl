{*

Browse logs related to client

*}

<article class="affiliates-container">
        <div class="account-info-container">
            <div class="pull-right">
                <div class="content-search">
                    <input type="text" placeholder="Search e-mails...">
                    <button type="submit" class="btn btn-flat-primary btn-small">Go</button>
                </div>
            </div>
            <h4>{$lang.myhistory}</h4>
            <p>{$lang.accountlogssectionhistory}</p>

            <div class="table-box m15 overflow-h">
                <div class="table-header">
                </div>
                <a href="{$ca_url}clientarea&action=history" id="currentlist" style="display:none" updater="#updater"></a>
                <input type="hidden" id="currentpage" value="0" />
                <table class="table table-bordered table-striped ">
                	<thead>
                        <tr>
                            <th><a href="{$ca_url}clientarea&action=history&orderby=date|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.date}</a></th>
                            <th class="w60"><a href="{$ca_url}clientarea&action=history&orderby=description|ASC" class="sortorder"><i class="icon-sort"></i>{$lang.Description}</a></th>
                            <th><a href="{$ca_url}clientarea&action=history&orderby=result|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.status}</a></th>
                            <th class="w10"></th>
                        </tr>
                    </thead>
                    <tbody id="updater">
                        {include file='ajax/ajax.history.tpl'}
                    </tbody>
                </table>
            </div>
            {if $totalpages > 1}
                <div class="bottom-options clearfix">
                    <div class="pagination flat-ui-pagination clearfix">
                        <ul rel="{$totalpages}">
                            <li class="pull-left"><a href="#{$lang.previous}">{$lang.previous}</a></li>
                            <li class="pull-right"><a href="#{$lang.next}">{$lang.next}</a></li>
                        </ul>
                    </div>
                </div>
            {/if}
        </div>
</article>