<div class="knowledgebase">
    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}clientarea/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="shared-hosting-menu">
        <h1>{$service.name}</h1>
        <p>{if $service.domain}{$service.domain}{else}{$service.catname}{/if}</p>

        <ul>
            <li {if !$widget}class="active"{/if}>
                <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">
                    <i class="icon-domain-details"></i> 
                    {$lang.servicedetails} <span></span>
                </a>
            </li>
            {if $service.status=='Active'}
                {foreach from=$widgets item=widg}
                    <li {if $widget.name==$widg.name}class="active"{/if}>
                        <a  href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}">
                            <img class="icon" src="{$system_url}{$widg.config.smallimg}" alt="" />
                            {assign var=widg_name value="`$widg.name`_widget"}
                            {if $lang[$widg_name]}
                                {$lang[$widg_name]}
                            {elseif $lang[$widg.name]}
                                {$lang[$widg.name]}
                            {elseif $widg.fullname}
                                {$widg.fullname}
                            {else}
                                {$widg.name}
                            {/if}
                            <span></span>
                        </a>
                    </li>
                {/foreach}
            {/if}
        </ul>
    </div>
</div>