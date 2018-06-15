<!-- Orderpage -->
<div class="orderpage" xmlns="http://www.w3.org/1999/html">


{include file='cart_listwizard/header.tpl'}


<div class="row">
    <div class="span8">
        <form action="" method="post" id="cart3">

            {if ($product.paytype!='Once' && $product.paytype!='Free') || $product.hostname}
            <h3>{$lang.config_options}</h3>
            <div class="product-configuration">
                <table class="table table-product-config">
                    {if $product.paytype!='Once' && $product.paytype!='Free'}
                    <tr>
                        <td class="text-col">{$lang.pickcycle}</td>
                        <td class="field-col">
                            {price product=$product}
                            <select name="cycle"   onchange="{if $custom}changeCycle('#cart3');{else}simulateCart('#cart3');{/if}" style="width:99%">
                                <option value="@@cycle" @@selected>@@line</option>
                            </select>
                            {/price}
                        </td>
                    </tr>
                    {/if}
                    {if $product.hostname}
                    <tr>
                        <td class="text-col">{$lang.hostname}*</td>
                        <td class="field-col"><input name="domain" value="{$item.domain}" class="styled" size="50" style="width:96%"/></td>
                    </tr>
                    {/if}
                </table>
            </div>
            {/if}


            {if $custom || $subproducts || $addons}
            <h3>{$lang.serviceconfiguration}</h3>
            <div class="server-configuration">
                <table class="table table-product-config">
                    {if $subproducts}
                        {foreach from=$subproducts item=a key=k}
                        <tr>
                            <td class="text-col"><input name="subproducts[{$k}]" type="checkbox" value="1" {if $selected_subproducts.$k}checked="checked"{/if}  onchange="simulateCart('#cart3');"/> {$a.name}</td>
                            <td class="field-col">
                                {price product=$a}
                                {if $a.paytype=='Free'}
                                    {$lang.free}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="free"/>
                                {elseif $a.paytype=='Once'}
                                    <input type="hidden" name="subproducts_cycles[{$k}]" value="once"/>
                                    @@line
                                {else}
                                    <select name="subproducts_cycles[{$k}]"   onchange="if ($('input[name=\'subproducts[{$k}]\']').is(':checked'))simulateCart('#cart3');">
                                        <option value="@@cycle" @@selected>@@line</option>
                                    </select>
                                {/if}
                                {/price}
                                <span class="prod-desc">{$a.description}</span>
                            </td>
                        </tr>
                        {/foreach}
                    {/if}

                    {if $addons}
                        {foreach from=$addons item=a key=k}
                        <tr>
                            <td class="text-col"><input name="addon[{$k}]" type="checkbox" value="1" {if $selected_addons.$k}checked="checked"{/if}  onchange="simulateCart('#cart3');"/>
                                {$a.name}</td>
                            <td class="field-col">
                                {price product=$a}
                            {if $a.paytype=='Free'}
                                {$lang.free}
                                <input type="hidden" name="addon_cycles[{$k}]" value="free"/>
                            {elseif $a.paytype=='Once'}
                                <input type="hidden" name="addon_cycles[{$k}]" value="once"/>
                                @@line
                            {else}
                                <select name="addon_cycles[{$k}]"   onchange="if ($('input[name=\'addon[{$k}]\']').is(':checked')) simulateCart('#cart3');">
                                    <option value="@@cycle" @@selected>@@line</option>
                                </select>
                            {/if}
                            {/price}
                                {if $a.description!=''}
                                    <p class="prod-desc">{$a.description}</p>
                                {/if}
                            </td>
                        </tr>
                        {/foreach}
                    {/if}


                    {if $custom}
                        {foreach from=$custom item=cf}
                        <tr class="cf-{$cf.type}">
                            <td class="text-col">{$cf.name} {if $cf.options & 1}*{/if}</td>
                            <td class="field-col">
                                {include file=$cf.configtemplates.cart}
                                {if $cf.description!=''}
                                    <p class="prod-desc">{$cf.description}</p>
                                {/if}
                            </td>
                        </tr>
                        {/foreach}
                    {/if}
                </table>
            </div>
            {/if}
            <input type="hidden" name="custom[-1]" value="dummy" />
            <input name='action' value='addconfig' type='hidden' />


        </form>
    </div>

    <div class="span4" id="cartSummary">
        {include file='cart_listwizard/cart_summary.tpl'}
    </div>
    </div>


{include file='cart_listwizard/pagination.tpl'}



</div>
<!-- End of Orderpage -->