<div class="search-box clearfix pull-right">
    <div class="pull-right">
        <form id="ca_search" action="{$ca_url}" method="POST" >
            <button type="submit"><i class="icon-search"></i></button>
            <input type="text" name="query" placeholder="{if $domaincat}{$lang.domains}{else}{$lang.knowledgebase}{/if}">
            <div class="btn-group">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <span class="caret"></span>
                </a>
                
                <input type="hidden" value="{if $domaincat}{$domaincat}{else}knowledgebase{/if}" />
                <ul class="dropdown-menu c-dropdown-menu">
                    {if $enableFeatures.domains && $enableFeatures.domains!='off' && $domaincat}
                        <li>
                            <a class="active" href="#{$domaincat}">{$lang.domains}</a><span></span>
                        </li>
                    {/if}
                    {if $enableFeatures.kb && $enableFeatures.kb!='off'}
                        <li>
                            <a {if !$domaincat}class="active"{/if} href="#knowledgebase">{$lang.knowledgebase}</a><span></span>
                        </li>
                    {/if}
                    {if $enableFeatures.support && $enableFeatures.support!='off'}
                        <li>
                            <a href="#tickets">{$lang.tickets}</a><span></span>
                        </li>
                    {/if}
                </ul>
            </div>
        </form>
    </div>
</div>
