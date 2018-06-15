<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}clientarea/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="search-box clearfix">
        <div class="center-search">
            <form method="post" action="{$ca_url}knowledgebase/search/">
            <button type="submit"><i class="icon-search"></i></button>
            <input type="text" name="query" placeholder="{$lang.search_article}" value="{$query}">
            </form>
        </div>
    </div>
    <div class="shared-hosting-menu">
        <p class="current-categories">current categories</p>
        <div class="support-tab tab-auto no-p overflow-hidden-relative">
            {if $categories}
                {assign value=$categories var=catlist}
            {elseif $category.categories}
                {assign value=$category.categories var=catlist}
            {elseif $categories.categories}
                {assign value=$categories.categories var=catlist}
            {/if}
            {include file="support/kblisting.tpl" }
        </div>
    </div>
</div>