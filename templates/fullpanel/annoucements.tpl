
{if ($action=='annoucement' || $action=='view') && $annoucement}
    <div class="white-container">
        <div class="padding">
            <div class="pull-right">
                <a href="{$ca_url}news/"class="btn btn-white"><i class="icon-pagin-left"></i> {$lang.back}</a>
            </div>

            <span class="date-h">{$lang.published} {$annoucement.date|dateformat:$date_format}</span>

            <h1 class="news-title">{$lang.annoucements|capitalize}: {$annoucement.title}</h1>

            <div class="news-body">
                <p>
                    {$annoucement.content|nl2br}
                </p>
            </div>
        </div>
    </div>
{elseif $action=='default'}
    <div class="white-container">
        <div class="padding">
            <h1>Welcome to news feed</h1>
            <div class="clearfix p15 page">
                {counter name=newslist print=false start=0 assign=newslist}
                {if $annoucements}
                    {foreach from=$annoucements item=annoucement name=announ}
                        {counter name=newslist}
                        <div class="news-feed">
                            <div class="news">
                                <div class="date">{$annoucement.date|dateformat:$date_format}</div>
                                <h4><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h4>
                                <p>
                                    {$annoucement.content}
                                </p>
                                <a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/" class="btn btn-white">{$lang.readall} <i class="icon-pagin-right"></i></a>
                            </div>
                        </div>
                        {if $newslist%4 == 0}</div><div class="clearfix p15 page" style="display:none">
                        {/if}
                    {/foreach}
                {else}
                    {$lang.nothing}
                {/if}
            </div>
            </article>

        {/if}


    </div>

