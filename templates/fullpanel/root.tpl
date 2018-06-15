{*

This file is rendered on main HostBill screen when browsed by user

*}
<div class="padding">

    <h1>{$lang.welcome}</h1>  

    <div class="options">
        <div class="root-item">
            <div class="root-item-bg">
                <div>
                    <a href="{$ca_url}cart/">
                        <div class="inner-bg">
                            <div>
                                <i class="icon-root-order"></i>
                            </div>
                        </div>
                    </a>

                </div>
            </div>
            <div class="item-info">
                <h3>{$lang.placeorder|capitalize}</h3>
                <p>{$lang.placeorder_desc}</p>
                <a href="{$ca_url}cart/" class="btn btn-green">View</a>
            </div>
        </div>

        <div class="root-item">
            <div class="root-item-bg">
                <div>
                    <a href="{$ca_url}clientarea/">
                        <div class="inner-bg">
                            <div>
                                <i class="icon-root-ca"></i>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="item-info">
                <h3>{$lang.clientarea|capitalize}</h3>
                <p>{$lang.clientarea_desc}</p>
                <a href="{$ca_url}clientarea/" class="btn btn-green">View</a>
            </div>
        </div>

        <div class="root-item">
            <div class="root-item-bg">
                <div>
                    <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/">
                        <div class="inner-bg">
                            <div>
                                <i class="icon-root-support"></i>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="item-info">
                <h3>{$lang.support|capitalize}</h3>
                <p>{$lang.support_desc}</p>
                <a href="{if $logged=='1'}{$ca_url}support{elseif $enableFeatures.kb!='off'}{$ca_url}knowledgebase{else}{$ca_url}tickets/new{/if}/" class="btn btn-green">View</a>
            </div>
        </div>


        <div class="separator"></div>
        {if $enableFeatures.news!='off' && $annoucements}
            <div class="lastest-news">
                <h2>{$lang.annoucements}</h2>
                {foreach from=$annoucements item=annoucement name=announ}
                    <div class="news">
                        <h3><a href="{$ca_url}news/view/{$annoucement.id}/{$annoucement.slug}/">{$annoucement.title}</a></h3>
                        <div class="date">{$annoucement.date|date_format}</div>
                        <p>{$annoucement.content}</p>
                    </div>

                    <div class="separator"></div>
                {/foreach}
                <div class="center">
                    <a href="{$ca_url}news/" class="btn btn-white">{$lang.newsarchive} <i class="icon-pagin-right"></i></a>
                </div>
            </div>
        {/if}
    </div>
</div>