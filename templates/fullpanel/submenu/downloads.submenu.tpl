<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}downloads/"><i class="icon-dl-cross"></i></a></li>
    </ul>
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
            {if $catlist }
                <div class="page-contener">
                    <ul class="page">
                        {counter name=kblist print=false start=0 assign=kblist}
                        {foreach from=$catlist item=i}
                            {counter name=kblist}
                            <li>
                                <a href="{$ca_url}downloads/category/{$i.id}/{$i.slug}" rel="category_{$i.id}">{$i.name|escape:'html':'utf-8'} {$kblist} {$kblist%5}</a>
                            </li>
                            {if $kblist%5 == 0}</ul><ul class="page" style="display:none">
                            {/if}
                        {/foreach}

                    </ul>
                    <div class="pagination c-pagination">
                        <ul class="center-pagination">
                            {if $kblist>5}
                                <li><a class="page-link" href="#"><i class="icon-pagin-left"></i></a></li>
                                <li><a class="page-link" href="#"><i class="icon-pagin-right"></i></a></li>
                                    {/if}
                        </ul>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>

