<!-- Orderpage -->
<div class="orderpage">


{include file='cart_listboxes/header.tpl'}

<div class="row">
    <div class="span12">
        <h3><i class="icon-predefinied-plans"></i> {$lang.serverpricing}</h3>
        <div class="plan-conatiner">
        <div class="price-hover">
            <div class="plan-price-top">
                <p class="price-format"><span class="currency"></span><span class="currency-code"></span></p>
                <p class="cycle"></p>
            </div>
        </div>
        <ul class="plan-list">
            {foreach from=$products item=i name=loop key=k}
            {if $smarty.foreach.loop.index > 0}
                <div class="plan-separator"></div>
            {/if}
            <li>
                <div class="plan">
                    <i class="icon-selected-plan"></i>
                    <div class="plan-price-top">
                        <p class="price-format"><span class="currency">{$currency.sign}</span>{include file='common/price.tpl' product=$i hidecode=true hidesign=true showcycle=false} <span class="currency-code">{$currency.code}</span></p>
                        <p class="cycle">{include file='common/cycle.tpl' product=$i}</p>
                    </div>
                    <div class="visible-content">
                        <div class="hover-bg">
                            <p class="plan-title">{$i.name}</p>
                            <p class="plan-price">{include file='common/price.tpl' product=$i showcycle=false}</p>
                                {specs var="awords" string=$i.description}
                                {foreach from=$awords item=prod name=lla key=k}
                                    {foreach from=$prod item=feat name=desc key=ka}


                                        {if $smarty.foreach.desc.index == 1}
                                        {$feat}
                                        {/if}

                                    {/foreach}

                                {/foreach}
                                {assign var=awords value=false}
                            <a href="#" class="btn btn-select">Select</a>
                        </div>
                        <div class="included-text">
                            What's included
                        </div>
                    </div>

                </div>
            </li>
            {/foreach}

            </li>
        </ul>
        <div class="row">
            {foreach from=$products item=i name=loop key=k}
            <div class="plan-details span12">
                <div class="row">
                    <div class="span9">
                        <div class="padding">
                            <p>This plan includes:</p>
                            <ul class="clearfix">
                                {specs var="awords" string=$i.description}
                                {foreach from=$awords item=prod name=lla key=k}
                                    {if $prod.specs}
                                        {foreach from=$prod.specs item=feat name=plan key=ka}
                                            <li><i class="icon-red-ok"></i> {$feat[0]} {$feat[1]}</li>
                                        {/foreach}
                                    {/if}

                                {/foreach}
                                {assign var=awords value=false}
                            </ul>
                        </div>
                    </div>

                    <div class="plan-order">
                        <div class="padding">
                            <form method="post" action="" class="parentform">
                                <input type="hidden" name="action" value="add" />
                                <input type="hidden" name="id" value="{$i.id}" />
                                {if $i.paytype!='Once' && $i.paytype!='Free'}
                                    
                                    <select name="cycle"  onchange="changePrice($(this))">
                                        {price product=$i}
                                        <option value="@@cycle" @@selected data-value="@@price">@@line</option>
                                        {/price}
                                    </select>

                                {/if}

                                <p class="total-price-text">{$lang.total_today}</p>
                                <p class="total-price">{include file='common/price.tpl' product=$i showcycle=false}</p>
                                <a href="#" class="btn btn-block btn-order" onclick="$(this).parent().submit(); return false;">Order Now</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}



        </div>
        </div>
    </div>
</div>


<!-- Our Adventages -->

<div class="row advantages-container">
    <div class="span12">
        <h3><i class="icon-our-advantages"></i> Our Adventages</h3>
        <div class="row">

            <div class="span4">
                <i class="icon-automation"></i>
                <p class="advatages-title">{$opconfig.advantage1title}</p>
                <p class="advatages-text">{$opconfig.advantage1text}</p>
            </div>

            <div class="span4 ml-50">
                <i class="icon-payment"></i>
                <p class="advatages-title">{$opconfig.advantage2title}</p>
                <p class="advatages-text">{$opconfig.advantage2text}</p>
            </div>

            <div class="request-quote">
                <div class="padding">
                    <span>Need something</span>
                    <i class="icon-special"></i>
                    <p>We can help you adjust HostBill to your specific business concepts with professional custom development services.</p>
                    <a href="{$ca_url}tickets/new" class="btn btn-block btn-quote">Request a quote</a>
                </div>
            </div>
        </div>
    </div>
</div>



</div>
<!-- End of Orderpage -->
