<!-- Orderpage -->
<div class="orderpage">


{include file='cart_listwizard/header.tpl'}

<div class="row">
<div class="span9">
    <h3><i class="icon-plan-list"></i> {$lang.setupyourplan}</h3>

    <ul class="plan-list">
    {foreach from=$products item=i name=loop key=k}

        <li>
            <div class="plan">
                <div class="plan-top">
                    <div class="pull-right right-text">
                        <span>{include file='common/price.tpl' product=$i showcycle=false}</span>
                        <div class="order-form">
                            <form method="post" action="" class="parentform">
                                <input type="hidden" name="action" value="add" />
                                <input type="hidden" name="id" value="{$i.id}" />
                                <a href="#" class="plan-order" onclick="$(this).parent().submit(); return false;">{$lang.order}</a>
                            </form>
                        </div>
                    </div>
                    <p>{$i.name}</p>
                </div>

                <div class="plan-details clearfix">
                    <ul class="plan-features pull-left">
                        {specs var="awords" string=$i.description}
                        {foreach from=$awords item=prod name=lla key=k}
                            {if $prod.specs}
                                {foreach from=$prod.specs item=feat name=ll key=ka}
                                    <li {if $smarty.foreach.loop.first == 0}class="no-ml"{/if}> <p>{$feat[0]}</p> <span>{$feat[1]}</span></li>
                                {/foreach}
                            {/if}

                        {/foreach}
                        {assign var=awords value=false}
                    </ul>
                    <div class="more-details pull-left">
                        <a href="#">{$lang.more} <i class="icon-down-arrow"></i></a>
                    </div>
                </div>
                <div class="hidden-details">
                    {specs var="awords" string=$i.description}
                    {$awords[1].features}

                    {assign var=awords value=false}
                </div>
            </div>
        </li>

    {/foreach}

    </ul>
</div>

<!-- About Us -->
<div class="span3">
    <h3><i class="icon-about-us"></i> {$opconfig.featureheader}</h3>
    <p>{$opconfig.featuresdescr}</p>

    <ul class="included-list">
        {if $opconfig.feature1name}
        <li>
            <div class="included-item">
                <span>1</span>
                <div class="included-text">
                    <p>{$opconfig.feature1name}</p>
                    <span>{$opconfig.feature1descr}</span>

                </div>
            </div>
        </li>
        {/if}

        {if $opconfig.feature1name}
        <li>
            <div class="included-item">
                <span>2</span>
                <div class="included-text">
                    <p>{$opconfig.feature2name}</p>
                    <span>{$opconfig.feature2descr}</span>
                </div>
            </div>
        </li>
        {/if}

        {if $opconfig.feature1name}
        <li>
            <div class="included-item">
                <span>3</span>
                <div class="included-text">
                    <p>{$opconfig.feature3name}</p>
                    <span>{$opconfig.feature3descr}</span>
                </div>
            </div>
        </li>
        {/if}

        {if $opconfig.feature1name}
        <li>
            <div class="included-item">
                <span>4</span>
                <div class="included-text">
                    <p>{$opconfig.feature4name}</p>
                    <span>{$opconfig.feature4descr}</span>
                </div>
            </div>
        </li>
        {/if}
    </ul>

</div>
<!-- End of About Us -->
</div>



</div>
<!-- End of Orderpage -->
