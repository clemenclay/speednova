<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}cart_rotatebox/css/main.css" />

<div id="container">
    {include file='cart_rotatebox/categories.tpl'}
    {include file='cart_rotatebox/header.tpl'}

    {if count($currencies)>1}
    <form action="" method="post" id="currform">
        <p align="right" style="margin-right:15px">
            <input name="action" type="hidden" value="changecurr">
            {$lang.Currency} <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                {foreach from=$currencies item=crx}
                <option value="{$crx.id}" {if !$selcur && $crx.id==0}selected="selected"{elseif $selcur==$crx.id}selected="selected"{/if}>{if $crx.code}{$crx.code}{else}{$crx.iso}{/if}</option>
                {/foreach}
            </select>
        </p>
    </form>
    {/if}

    <div id="box-wrapper">
        <div id="info">
            <div class="i">Disc Space</div>
            <div class="i">CPU</div>
            <div class="i">RAM</div>
            <div class="i">SiteBuilder</div>
        </div>

        <ul id="boxes">
            {foreach from=$products item=i name=loop key=k}
            {if $smarty.foreach.loop.index > 2}{break}{/if}

            <li class="scene {if $smarty.foreach.loop.index == $opconfig.highlighted}pink{else}blue{/if} {if $smarty.foreach.loop.index == 1}margin{/if}">
                <div class="single-box">
                    <div class="info">
                        <div class="header">
                            {$i.name}
                            <span><sup>{$currency.sign}</sup>{include file='common/price.tpl' product=$i hideall=true} <span class="currency">{$currency.iso}</span></span>
                            {if $smarty.foreach.loop.index == $opconfig.highlighted}<div class="green-badge"></div>{/if}
                        </div>

                        {specs var="awords" string=$i.description}
                        {foreach from=$awords item=prod name=lla key=k}
                            {if $prod.specs} 
                            {foreach from=$prod.specs item=feat name=ll key=ka}
                            <div class="{if $smarty.foreach.ll.index % 2 == 0}odd{else}even{/if}">{$feat[1]}</div>
                            {/foreach}
                            {/if}
                        {/foreach}
                        {assign var=awords value=false}

                        <div class="odd">
                            <a class="btn-green"><i class="ico-info"></i>{$lang.plandetails}</a>
                        </div>
                    </div>
                    <div class="details">
                        <div class="header">
                            {$i.name}
                            <span><sup>{$currency.sign}</sup>{include file='common/price.tpl' product=$i hideall=true} <span class="currency">{$currency.iso}</span></span>
                            {if $smarty.foreach.loop.index == $opconfig.highlighted}<div class="green-badge"></div>{/if}
                        </div>
                        <div class="odd smaller">
                            {specs var="awords" string=$i.description}
                            {foreach from=$awords item=prod name=lla key=k}

                            <strong>This plan best fits to:</strong>
                            {if $prod.features} 
                            {$prod.features}
                            {/if}

                            {/foreach}
                            {assign var=awords value=false}
                        </div>
                        <div class="even smaller">
                            {include file="common/cycle.tpl" product=$i}
                            <span class="price"><sup>{$currency.sign}</sup>{include file='common/price.tpl' product=$i hideall=true} <span class="currency">{$currency.iso}</span></span>
                        </div>
                        <div class="odd">
                            <form method="post" action="" class="parentform">
                                <input type="hidden" name="action" value="add" />
                                <input type="hidden" name="id" value="{$i.id}" />
                                <a href="#" class="btn-green order-btn" onclick="$(this).parent().submit();
                                        return false;">
                                    <i class="ico-cart"></i>{$lang.ordernow}
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </li>

            {/foreach}
        </ul>

    </div>


    <div class="clearfix"></div>

    <div id="footer">
        <h2>{$opconfig.footheader}</h2>

        <div class="clearfix"></div>

        <div class="badge-box box">
            <img src="{$orderpage_dir}cart_rotatebox/images/badge-ok.png" alt="" />
            <h3>{$opconfig.footer1head}</h3>
            <p>{$opconfig.footer1text}</p>
        </div>
        <div class="badge-box box margin">
            <img src="{$orderpage_dir}cart_rotatebox/images/badge-ok.png" alt="" />
            <h3>{$opconfig.footer2head}</h3>
            <p>{$opconfig.footer2text}</p>
        </div>
        <div class="badge-box box">
            <img src="{$orderpage_dir}cart_rotatebox/images/badge-ok.png" alt="" />
            <h3>{$opconfig.footer3head}</h3>
            <p>{$opconfig.footer3text}</p>
        </div>
    </div>

</div> 

