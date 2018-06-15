<!-- Orderpage -->
<div id="orderpage" class="orderpage">


{include file='cart_chart_table/header.tpl'}

<!-- Compare Slider -->
<div class="row">
    <div class="span12 compare-plans-container">
        <div class="padding">
            <div class="charts">
                <div class="charts-line"></div>
            </div>

            <div class="slider-field">
                <div class="compare-min">
                    <i class="icon-compare-left-arrow"></i>
                    <p>Min</p>
                </div>

                <div id="compareSlider">
                </div>

                <div class="compare-max">
                    <p>Max</p>
                    <i class="icon-compare-right-arrow"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Compare Slider -->



<!-- Plans -->

<div class="row predefinied-plans">
    <div class="span12 clearfix">
        <div class="plan-included">
            <div class="header">
                <span>Our <p>plans</p></span>
            </div>
            <ul class="list-items">
                {specs var="awords" string=$products[0].description}
                {foreach from=$awords item=prod name=lla key=k}
                    {if $prod.specs}
                        {foreach from=$prod.specs item=feat name=plan key=ka}
                            <li {if $smarty.foreach.plan.index%2 != 0}class="darker-bg"{/if}><p>{$feat[0]}</p></li>
                        {/foreach}
                    {/if}
                {/foreach}
                {assign var=awords value=false}
            </ul>
        </div>

        <div class="scroll-pane">
            <div class="scroll-content">
                {counter name=vsliderc print=false assign=vslider start=0}
                {foreach from=$products item=i name=loop key=k}
                <div class="plan-box {if $smarty.foreach.loop.index == 0} no-ml{/if} {if $smarty.foreach.loop.index == $opconfig.popular} popular{/if}">
                    {if $smarty.foreach.loop.index == $opconfig.popular}
                        <div class="popular-ribbon"></div>
                    {/if}
                    <div class="plan-bg">
                        <div class="header">
                            <p class="plan-name">{$i.name}</p>
                            <p class="plan-price"><span class="currency-sign">{$currency.sign}</span>{include file='common/price.tpl' product=$i hidecode=true hidesign=true showcycle=false} <span class="currency-code">{$currency.code}</span></p>
                            <div class="btn-center">
                                <form method="post" action="" class="parentform">
                                    <input type="hidden" name="action" value="add" />
                                    <input type="hidden" name="id" value="{$i.id}" />
                                    <a href="#" class="btn btn-select" onclick="$(this).parent().submit(); return false;">Select</a>
                                </form>
                            </div>
                        </div>
                        <ul class="list-items">
                            {specs var="awords" string=$i.description}
                            {foreach from=$awords item=prod name=lla key=k}
                                {if $prod.specs}
                                    {foreach from=$prod.specs item=feat name=plan key=ka}
                                        <li {if $smarty.foreach.plan.index%2 != 0 }class="darker-bg"{/if}><p> {$feat[1]}</p></li>
                                    {/foreach}
                                {/if}
                            {/foreach}
                            {assign var=awords value=false}
                        </ul>
                    </div>
                </div>
                {counter name=vsliderc}
                {/foreach}



            </div>
        </div>


    </div>
</div>
<script type="text/javascript">initMainSlider();</script>

<!-- End of Plans -->

{if $vslider > 4}
<div class="row">
    <div class="span12 plan-nav">
        <div class="prev-plan">
            <span><i class="icon-plan-arrow-left"></i></span>
            <p>Previous plan </p>
        </div>

        <div class="next-plan">
            <p>Next plan</p>
            <span><i class="icon-plan-arrow-right"></i></span>
        </div>
    </div>
</div>
{/if}

<div class="orderpage-shadow">
</div>


<!-- Product features -->
<div class="row product-features">
    <h3>{$opconfig.whyusheader}</h3>
    <p>{$opconfig.whyusdescription}</p>
    <div class="span4">
        <p class="advatages-title">{$opconfig.advantage1title}</p>
        <p class="advatages-text">{$opconfig.advantage1text}</p>
    </div>

    <div class="span4">
        <p class="advatages-title">{$opconfig.advantage2title}</p>
        <p class="advatages-text">{$opconfig.advantage2text}</p>
    </div>

    <div class="span4">
        <p class="advatages-title">{$opconfig.advantage3title}</p>
        <p class="advatages-text">{$opconfig.advantage3text}</p>
    </div>
</div>
<!-- End of Product features -->




</div>
<!-- End of Orderpage -->