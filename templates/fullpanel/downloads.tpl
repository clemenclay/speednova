<div class="white-container white-bg">
    <div class="padding">
        {if $category}
            <div class="pull-right">
                <a  href="{$ca_url}downloads/" class="btn btn-white"><i class="icon-pagin-left"></i> {$lang.back}</a>
            </div>
        {/if}


        {if $action=='default'}
            {if $myfiles}
                <h1>{$lang.myfiles_down}</h1>
                <div class="downloads-main">
                    <ul class="downloads-list">
                        {foreach from=$myfiles item=i name=loop}
                            <li class="clearfix">
                                <div class="pull-right">
                                    <a class="btn btn-white" href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">
                                        {$lang.download} {if $i.size>0}({$i.size} KB)
                                        {/if}
                                    </a> 
                                </div>
                                <div class="pull-left">
                                    <a href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">{$i.name}</a>
                                    <p>{$i.description}</p>
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}

            {if $popular}
                <h1>{$lang.popular_down}</h1>
                <div class="downloads-main">
                    <ul class="downloads-list">
                        {foreach from=$popular item=i name=loop}
                            <li class="clearfix">
                                <div class="pull-right">
                                    <a class="btn btn-white" href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">
                                        {$lang.download} {if $i.size>0}({$i.size} KB)
                                        {/if}
                                    </a> 
                                </div>
                                <div class="pull-left">
                                    <a href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">{$i.name}</a>
                                    <p>{$i.description}</p>
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}

        {elseif $action=='category'}
            <h1>{$lang.downloads|capitalize}</h1>
            {if $category.description!=''}
                <p>{$category.description}</p>
            {/if}
            <p class="current-categories">{$lang.filesunder}</p>
            <div class="downloads-main">
                <ul class="downloads-list">
                    {foreach from=$files item=i name=loop}
                        <li class="clearfix">
                            <div class="pull-right">
                                <a class="btn btn-white" href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">
                                    {$lang.download} {if $i.size>0}({$i.size} KB)
                                    {/if}
                                </a> 
                            </div>
                            <div class="pull-left">
                                <a href="{$ca_url}roo&action=download&type=downloads&id={$i.id}">{$i.name}</a>
                                <p>{$i.description}</p>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>




        {/if}
        <!-- End of Support Container-->
    </div>
    <!-- End of Tab #1 -->
</div>
</article>