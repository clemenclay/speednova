<div class="white-container white-bg">
    <div class="padding">
        {if $category.category.parent_cat || $article.cat_id}
            {foreach from=$path item=p key=key name=patloop}
                {if $category.category.parent_cat == $p.id || $article.cat_id == $p.id}
                    <div class="pull-right">
                        <a href="{$ca_url}knowledgebase/category/{$p.id}/{$p.slug}/" class="btn btn-white"><i class="icon-pagin-left"></i>{$lang.back}</a>
                    </div>
                    {break}
                {/if}
            {/foreach}
        {elseif $category.category || $action == 'search'}
            <div class="pull-right">
                <a href="{$ca_url}knowledgebase/" class="btn btn-white"><i class="icon-pagin-left"></i>{$lang.back}</a>
            </div>
        {/if}

        {if $action=='article'}
            {if $article}
                <h1>{$article.title|ucfirst}</h1>

                <p>{$article.body}</p>
            {/if}

        {elseif $action=='category'}
            {if $category.category.description}
                <h1>{$category.category.name}</h1>
                {$category.category.description}  
            {/if}
            <h1>{$lang.articlesun} {$category.category.name}</h1>

            {if $category.articles}
                <ul class="support-nav">
                    {foreach from=$category.articles item=i}
                        <li>
                            <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/">{$i.title}</a>
                        </li>
                    {/foreach}
                </ul>

            {else}
                <p>{$lang.nothing}</p>
            {/if}
        {elseif $action=='search'}
            <h1>{$lang.search_results}</h1>

            {if $results}
                <ul class="support-nav">
                    {foreach from=$results item=i}
                        <li>
                            <a href="{$ca_url}knowledgebase/article/{$i.id}/{$i.slug}/">{$i.title}</a>
                            <p>{$i.body|nl2br}</p>
                        </li>
                    {/foreach}
                </ul>
            {else}
                <p>{$lang.search_nothing}</p>
            {/if}

        {else}
            <h1>{$lang.welcomekb}</h1>

            <p>{$lang.kbwelcome}</p>
            <p>{$lang.stillcantfind}</a></p>
        {/if}
    </div>
</div>
<script type="text/javascript" src="{$template_dir}js/knowledgebase.js"></script>