<div class="knowledgebase">

    <ul class="nav top-btns nav-pills">
        <li><a href="{$ca_url}clientarea/domains/"><i class="icon-dl-cross"></i></a></li>
    </ul>
    <div class="shared-hosting-menu">
        <h1>{$lang.domains} </h1>

        <div class="header">
            <p>{$lang.menu}</p>
        </div>
        <ul class="nav">
            {if $details.status=='Active'}
                <li {if !$widget}class="active"{/if}>
                    <a href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/">
                        <i class="icon-domain-details"></i>
                        {$lang.domdetails}
                        <span></span>
                    </a>
                </li>
                {foreach from=$widgets item=widg name=cst}
                    {if $widg.name!='reglock' && $widg.name!='nameservers'  && $widg.name!='autorenew' }
                        {if $widg.name=='idprotection' && $details.offerprotection && !$details.offerprotection.purchased}
                            {continue}
                        {/if}

                        <li {if $widget.name==$widg.name}class="active"{/if}>
                            <a  href="{$ca_url}clientarea/domains/{$details.id}/{$details.name}/&widget={$widg.name}{if $widg.id}&wid={$widg.id}{/if}#{$widg.name}">
                                <img class="icon" src="{$system_url}{$widg.location}/small.png" alt="" />
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
                    {/if}
                {/foreach}
                {if $custom}
                    {foreach from=$custom item=btn name=cst}
                        <li>
                            <a href="#" onclick="$('#cbtn_{$btn}').click();
                            return false;">
                                {$lang.$btn}
                                <span></span>
                            </a> 
                        </li>
                    {/foreach}
                {/if}
            {/if}
        </ul>
        {if $details.status!='Active'}
            <div class="sidebar-block">
                {if $details.status=='Pending' ||  $details.status=='Pending Registration'}
                    {$lang.domainpendinginfo}
                {elseif $details.status=='Pending Transfer'}
                    {$lang.domainpendingtransferinfo}
                {elseif $details.status=='Expired'}
                    {$lang.domainexpiredinfo}
                {elseif $details.status=='Cancelled' ||  $details.status=='Fraud'}
                    {$lang.domaincanceledinfo}
                {/if}
            </div>
        {/if}
    </div>
</div>