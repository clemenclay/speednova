<!-- Orderpage -->
<div id="orderpage" class="orderpage">


{include file='cart_folding_box/header.tpl'}



<div class="row">
<div class="span9">
<h2>{$lang.serverpricing}</h2>

<div class="row">


{foreach from=$products item=i name=loop key=k}
    <div class="span3 uc-container {if $smarty.foreach.loop.index == $opconfig.popular} popular-box{/if}">

        <div class="uc-initial-content">

            <div class="plan-wrapper">
                {if $smarty.foreach.loop.index == $opconfig.popular} <div class="popular"></div> {/if}
                <div class="plan-box">
                    <div class="hover-bg"><span class="plan-open"></span></div>
                    <div class="plan-info">
                        <div class="plan-top">
                            <div class="plan-color-0"></div>
                            <div class="plan-color-1"></div>
                            <div class="plan-color-2"></div>
                            <div class="plan-color-3"></div>
                            <div class="plan-color-4"></div>
                        </div>
                        <div class="padding">
                            <div class="cart-bg"></div>
                            <h2>{$i.name}</h2>
                            <div class="plan-description">
                                {specs var="awords" string=$i.description}
                                {foreach from=$awords item=prod name=lla key=k}
                                    {foreach from=$prod item=feat name=desc key=ka}


                                        {if $smarty.foreach.desc.index == 1}
                                            {$feat}
                                        {/if}

                                    {/foreach}

                                {/foreach}
                                {assign var=awords value=false}
                            </div>
                            <div class="plan-price-info">
                                {$lang.price}
                                <div class="price-format">
                                    <span class="currency-sign">{$currency.sign}</span>{include file='common/price.tpl' product=$i hidecode=true hidesign=true showcycle=false} <span class="currency-code">{$currency.code}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-bottom clearfix">
                        <a href="#" class="plan-details">See details</a>
                        <div class="plan-order">
                            <div class="order-arrow"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uc-final-content">
            <div class="fold-box">
                <div class="fold-header">
                    <p>{$i.name}</p>
                    <div class="fold-close">
                        <span></span>
                    </div>
                </div>
                <div class="fold-body">
                    <div class="padding">
                        <ul>
                            {specs var="awords" string=$i.description}
                            {foreach from=$awords item=prod name=lla key=k}
                                {if $prod.specs}
                                    {foreach from=$prod.specs item=feat name=plan key=ka}
                                        <li> <strong>{$feat[0]}</strong> {$feat[1]}</li>
                                    {/foreach}
                                {/if}

                            {/foreach}
                            {assign var=awords value=false}
                        </ul>
                    </div>
                </div>
                <div class="fold-bottom">
                    <div class="padding clearfix">
                        <div class="btn-wrapper">
                            <form method="post" action="" class="parentform">
                                <input type="hidden" name="action" value="add" />
                                <input type="hidden" name="id" value="{$i.id}" />
                                <a href="#" class="btn btn-order"  onclick="$(this).parent().submit(); return false;">{$lang.ordernow}</a>
                            </form>
                        </div>
                        <div class="fold-price">
                            {$lang.total_today}:
                            <div class="price-format">
                                <span class="currency-sign">{$currency.sign}</span>{include file='common/price.tpl' product=$i hidecode=true hidesign=true showcycle=false} <span class="currency-code">{$currency.code}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
{/foreach}



</div>

</div>

<!-- About Us -->
<div class="span3">
    <h2>Why us</h2>

    <ul class="included-list">
        <li>
            <div class="included-item">
                <span class="why-us-icon"></span>
                <div class="included-text">
                    <p>{$opconfig.whyusheader1}</p>

                    <span>{$opconfig.whyusdescription1}</span>
                </div>
            </div>
        </li>

        <li>
            <div class="included-item">
                <span class="why-us-icon"></span>
                <div class="included-text">
                    <p>{$opconfig.whyusheader2}</p>

                    <span>{$opconfig.whyusdescription2}</span>
                </div>
            </div>
        </li>

        <li>
            <div class="included-item">
                <span class="why-us-icon"></span>
                <div class="included-text">
                    <p>{$opconfig.whyusheader3}</p>

                    <span>{$opconfig.whyusdescription3}</span>
                </div>
            </div>
        </li>

        <li>
            <div class="included-item">
                <span class="why-us-icon"></span>
                <div class="included-text">
                    <p>{$opconfig.whyusheader4}</p>

                    <span>{$opconfig.whyusdescription4}</span>
                </div>
            </div>
        </li>
    </ul>

</div>
<!-- End of About Us -->
</div>



</div>
<!-- End of Orderpage -->