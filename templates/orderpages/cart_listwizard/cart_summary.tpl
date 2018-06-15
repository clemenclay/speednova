

    <h3>{$lang.cartsum1} </h3>

    <div class="order-summary">
        <div class="summary-bg">

            {if !$step}
                <p>{$lang.yourcartisempty}</p>
            {else}
            <table class="table">
                <tr>
                    <th width="140px">{$lang.Description}</th>
                    <th>{$lang.price}</th>
                </tr>
                {if $cart_contents[0]}
                    <tr>
                        <td class="desc-col">{$cart_contents[0].category_name} - {$cart_contents[0].name}
                            {assign var=tit value=$cart_contents[0].recurring}
                            {if $cart_contents[0].price!=0}<br />{$lang[$tit]}
                            {/if}
                            {if $cart_contents[0].setup!=0}
                                <br/>
                                {$lang.setupfee}
                            {/if}</td>
                        <td class="price-col">{if $cart_contents[0].price!=0}
                                <br/>
                                {$cart_contents[0].price|price:$currency:true:false:false}
                            {else}
                                {$lang.Free}
                            {/if}
                            {if $cart_contents[0].setup!=0}
                                <br/>
                                {$cart_contents[0].setup|price:$currency}
                            {/if}</td>
                    </tr>
                {/if}
                {if $cart_contents[1]}
                    {foreach from=$cart_contents[1] item=cstom2}
                        {foreach from=$cstom2 item=cstom}
                            {if $cstom.total>0}
                                <tr>
                                    <td class="desc-col">{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</td>
                                    <td class="price-col">{$cstom.total|price:$currency:true:false:false}</td>
                                </tr>
                            {/if}
                        {/foreach}
                    {/foreach}
                {/if}
                {foreach from=$cart_contents[4] item=subprod}
                    <tr>
                        <td class="desc-col">{$subprod.category_name} - {$subprod.name}
                            {assign var=tit value=$subprod.recurring}
                            {if $subprod.price!=0}<br />{$lang[$tit]}
                            {/if}
                            {if $subprod.setup!=0}
                                <br/>
                                {$lang.setupfee}
                            {/if}</td>
                        <td class="price-col">{if $subprod.price!=0}
                                <br/>
                                {$subprod.price|price:$currency:true:false:false}
                            {else}
                                {$lang.Free}
                            {/if}
                            {if $subprod.setup!=0}
                                <br/>
                                {$subprod.setup|price:$currency}
                            {/if}</td>
                    </tr>
                {/foreach}
                {foreach from=$cart_contents[3] item=addon}
                    <tr>
                        <td class="desc-col">
                            {$lang.addon} {$addon.name}
                            {assign var=tit value=$addon.recurring}
                            {if $addon.price!=0}<br />{$lang[$tit]}
                            {/if}
                            {if $addon.setup!=0}
                                <br/>
                                {$lang.setupfee}
                            {/if}</td>


                        <td class="price-col">
                            {if $addon.price!=0}
                                <br/>
                                {$addon.price|price:$currency:true:false:false}
                            {else}
                                {$lang.Free}
                            {/if}
                            {if $addon.setup!=0}
                                <br/>
                                {$addon.setup|price:$currency}
                            {/if}</td>
                    </tr>
                {/foreach}

                {if $cart_contents[2] && $cart_contents[2][0].name!='yep'}
                    {foreach from=$cart_contents[2] item=domenka key=kk}
                        {if $domenka.action!='own'  && $domenka.action!='hostname'}
                            <tr>
                                <td class="desc-col">
                                    {if $domenka.action=='register'}{$lang.domainregister}
                                    {elseif $domenka.action=='transfer'}{$lang.domaintransfer}
                                    {elseif $domenka.action=='renew'}{$lang.domainrenewal}
                                    {/if}
                                    {$domenka.period} {$lang.years}
                                    <br />{$domenka.name}
                                    {if $domenka.forms}
                                        {foreach from=$domenka.forms item=cstom2 name=domainfo}
                                            {foreach from=$cstom2 item=cstom}
                                                {if $cstom.total>0}
                                                    <br /><small>{$cstom.sname} {if $cstom.qty>=1}x {$cstom.qty}{/if}</small>
                                                {/if}
                                            {/foreach}
                                        {/foreach}
                                    {/if}
                                </td>


                                <td class="price-col">
                                    {$domenka.price|price:$currency:true:false:false}
                                    {if $domenka.forms}
                                        {foreach from=$domenka.forms item=cstom2 name=domainfo}
                                            {foreach from=$cstom2 item=cstom}
                                                {if $cstom.total>0}
                                                    <br />{$cstom.total|price:$currency:true:false:false}
                                                {/if}
                                            {/foreach}
                                        {/foreach}
                                    {/if}</td>
                            </tr>
                        {/if}
                    {/foreach}
                {/if}
                {if $step > 3}
                    {if $tax}
                        <tr>
                            <td class="desc-col">{$lang.subtotal}</td>
                            <td class="price-col">{$tax.subtotal|price:$currency:true:false:false}</td>
                        </tr>
                        {if $tax.tax1 && $tax.taxed1!=0}
                            <tr>
                                <td class="desc-col">{$tax.tax1name} @ {$tax.tax1}%</td>
                                <td class="price-col">{$tax.taxed1|price:$currency:true:false:false}</td>
                            </tr>
                        {/if}
                        {if $tax.tax2  && $tax.taxed2!=0}
                            <tr>
                                <td class="desc-col">{$tax.tax2name} @ {$tax.tax2}%</td>
                                <td class="price-col">{$tax.taxed2|price:$currency:true:false:false}</td>
                            </tr>
                        {/if}
                        {if $tax.credit!=0}
                            <tr>
                                <td class="desc-col">{$lang.credit}</td>
                                <td class="price-col">{$tax.credit|price:$currency:true:false:false}</td>
                            </tr>
                        {/if}
                    {elseif $credit}
                        {if  $credit.credit!=0}
                            <tr>
                                <td class="desc-col">{$lang.credit}</td>
                                <td class="price-col">{$credit.credit|price:$currency:true:false:false}</td>
                            </tr>
                        {/if}
                            <tr>
                                <td class="desc-col">{$lang.subtotal}</td>
                                <td class="price-col">{$subtotal.total|price:$currency:true:false:false}</td>
                            </tr>
                    {else}
                            <tr>
                                <td class="desc-col">{$lang.subtotal}</td>
                                <td class="price-col">{$subtotal.total|price:$currency:true:false:false}</td>
                            </tr>
                    {/if}

                    {if !empty($tax.recurring)}
                        <tr>
                            <td class="desc-col">
                                {$lang.total_recurring}
                                {foreach from=$tax.recurring item=rec key=k}
                                    <br />{$lang.$k}
                                {/foreach}
                            </td>
                            <td class="price-col">
                                {foreach from=$tax.recurring item=rec key=k}
                                    <br/>{$rec|price:$currency:true:false:false}
                                {/foreach}</td>
                        </tr>
                    {elseif !empty($subtotal.recurring)}
                        <tr>
                            <td class="desc-col">
                                {$lang.total_recurring}
                                {foreach from=$subtotal.recurring item=rec key=k}
                                    <br />{$lang.$k}
                                {/foreach}
                            </td>
                            <td class="price-col">
                                {foreach from=$subtotal.recurring item=rec key=k}
                                    <br/>{$rec|price:$currency:true:false:false}
                                {/foreach}
                            </td>
                        </tr>
                {/if}
            {/if}
        {/if}
        {if $subtotal.coupon}
            <tr>
                <td class="desc-col">{$lang.discount}</td>
                <td class="price-col"> - {$subtotal.discount|price:$currency:true:false:false}</td>
            </tr>
        {/if}


            </tbody>
        </table>


        <div class="total-summary">
            <p class="total-text">{$lang.total_today}</p>
            <p class="total-price">
                {if $tax}
                    {$currency.sign}{$tax.total|price:$currency:false}
                {elseif $credit}
                    {$currency.sign}{$credit.total|price:$currency:false}
                {else}
                    {$currency.sign}{$subtotal.total|price:$currency:false}
                {/if}
            </p>
        </div>

        </div>

        <div class="promo-code">
            <p>{$lang.usecoupon}</p>
                <form action="" method="post" id="promoform" onsubmit="{if $step >1 }return applyCoupon();{else}{/if}">
                    <input type="hidden" name="step" value="{$step}" />
                    <input type="text" class="styled span3" name="promocode"/>
                    <input type="submit" value="&raquo;" style="font-weight:bold" class="padded btn"/>
                </form>
            </div>
        </div>

