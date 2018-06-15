<div class="knowledgebase ">
    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}news/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    {news}
    <div class="lastest-news overflow-hidden-relative">
        <h1>lastest news</h1>
        <div class="page-contener">
            <ul class="news-list page">
                {counter name=kblist print=false start=0 assign=kblist}
                {foreach from=$annoucements item=annoucement name=announ}
                    {counter name=kblist}
                    <li class="clearfix">
                        <div class="border">
                            <span class="blue-txt pull-left">{$annoucement.date|dateformat:$date_format}</span>
                            <div>
                                <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a>
                            </div>
                        </div>
                    </li>
                    {if $kblist%10 == 0}</ul><ul class="news-list page" style="display:none">
                    {/if}
                {/foreach}
            </ul>

            <div class="pagination c-pagination">
                <ul class="center-pagination">
                    {if $kblist>10}
                        <li>
                            <a class="page-link" href="#"><i class="icon-pagin-left"></i></a>
                        </li>
                        <li>
                            <a class="page-link" href="#"><i class="icon-pagin-right"></i></a>
                        </li>
                    {/if}
                </ul>
            </div>
        </div>
    </div>
</div>