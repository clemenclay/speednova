{*

Browse email history

*}
<div class="white-container white-bg">
    <div class="padding">

        {if $email}
            <div class="pull-right">
                <p>{$lang.sent} {$email.date|dateformat:$date_format}</p>
            </div>
            <h2>{$email.subject}</h2>
            <div class="p19">
                <p >{$email.message|httptohref}</p>
            </div>

        {else}
            <div class="account-info-container">
                <div class="pull-right">
                    <div class="content-search">
                        <i class="icon-search"></i>
                        <input type="text" placeholder="Search e-mails...">
                        <button type="submit" class="btn btn-green btn-rds">Go</button>
                    </div>
                </div>
                <h2>{$lang.emhistory}</h2>
                <p>{$lang.email_info}</p>

                <div class="table-box m20 overflow-h">
                    <div class="table-header">
                    </div>
                    <a href="{$ca_url}clientarea&amp;action=emails" id="currentlist" style="display:none" updater="#updater"></a>
                    <input type="hidden" id="currentpage" value="0" />
                    <table class="table table-header-fix table-striped p-td">
                        <tr>
                            <th class="w80"><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=subject|ASC" class="sortorder"><i class="icon-sort"></i>{$lang.subject}</a></th>
                            <th><a href="{$ca_url}clientarea&amp;action=emails&amp;orderby=date|ASC"  class="sortorder"><i class="icon-sort"></i>{$lang.date_sent}</a></th>
                        </tr>
                        <tbody id="updater">
                            {include file='ajax/ajax.emails.tpl'}
                        </tbody>
                    </table>
                </div> 
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
        {/if}
    </div>
</div>