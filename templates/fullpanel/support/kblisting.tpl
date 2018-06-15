{if $catlist }
    {foreach from=$catlist item=i}
        <div id="category_{$i.id}" class="page-contener{if $i.parent_cat} sub-category{/if}">
            <h3>
                <a href="{$ca_url}knowledgebase/category/{$i.id}/{$i.slug}">{$i.name}</a>
            </h3>
            {if $i.articles || $i.categories}
                {counter name=kblist print=false start=0 assign=kblist}
                <ul class="page">
                    {foreach from=$i.categories item=a}
                        {counter name=kblist}
                        <li>
                            <a class="category-link" href="{$ca_url}knowledgebase/category/{$a.id}/{$a.slug}" rel="category_{$a.id}">{$a.name|escape:'html':'utf-8'}</a>
                        </li>
                        {if $kblist%5==0}</ul><ul class="page" style="display:none">{/if}
                    {/foreach}
                    {foreach from=$i.articles item=a }
                        {counter name=kblist}
                        <li>
                            <a href="{$ca_url}knowledgebase/article/{$a.id}/{$a.slug}">{$a.title|escape:'html':'utf-8'}</a>
                        </li>
                        {if $kblist%5==0}</ul><ul class="page" style="display:none">{/if}
                    {/foreach}
                </ul>
            {/if}
            <div class="pagination c-pagination">
                <ul class="center-pagination">
                    {if $i.parent_cat!=0}
                        <li>
                            <a class="category-link" rel="category_{$i.parent_cat}" href="#{$i.parent_cat}" > <i class="icon-pagin-left"></i><i class="icon-pagin-left"></i> </a>
                        </li>
                    {/if}
                    {if $kblist>5}
                        <li><a class="page-link" href="#"><i class="icon-pagin-left"></i></a></li>
                        <li><a class="page-link" href="#"><i class="icon-pagin-right"></i></a></li>
                    {/if}
                </ul>
            </div>
        </div>
        {if $i.categories}
            {include file="support/kblisting.tpl" catlist=$i.categories}
        {/if}
    {/foreach}

{/if}