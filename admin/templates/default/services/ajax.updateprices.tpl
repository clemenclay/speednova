
<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="active picked">
                <a href="#"><span class="ico money">Increase/reduce price</span></a>
            </li>
            <li class="last">
                <a href="#"><span class="ico plug">Set new prices</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2"><div class="haveitems" style="height: 0px;"></div></div>
</div>
<div class="nicerblu"  style="height: 10px;"></div>
<form id="serializeit" action="" method="post">
    <input type="hidden" name="make" value="bulk" />
    <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
        <tbody>
        <tr>
            <th width="20"><input type="checkbox" id="product_check"/></th>
            <th >{$lang.Name}</th>
            <th width="130">{$lang.Accounts}</th>
            <th width="30"></th>
            <th width="100">&nbsp;</th>
        </tr>
        </tbody>
    </table>
    <ul id="grab-sorter" style="width:100%">
        {include file='services/ajax.category.tpl' priceup=true}
    </ul>

    <div class="nicerblu">
        <table width="100%" cellspacing="0" cellpadding="6">
            <tbody class="section">
            <tr>
                <td width="60" align="right"><strong>Type</strong></td>
                <td>
                    <select class="inp" name="multip">
                        <option value="1">Increase</option>
                        <option value="-1">Decrease</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right"><strong>Amount</strong></td>
                <td>
                    <input class="inp" type="text" size="5" name="amount"/>
                    <select class="inp" name="type">
                        <option value="1">Fixed</option>
                        <option value="2">Percent</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Apply to:</td>
                <td>
                    {if in_array('DomainRegular', $supported_billingmodels) }
                        <label><input type="checkbox" name="include[]" checked="checked" value="register"/> Register</label>
                        <label><input type="checkbox" name="include[]" checked="checked" value="transfer"/> Transfer</label>
                        <label><input type="checkbox" name="include[]" checked="checked" value="renew"/> Renew</label>
                    {else}
                        <label><input type="checkbox" name="include[]" checked="checked" value="recurring"/> Recurring</label>
                        <label><input type="checkbox" name="include[]" checked="checked" value="setup"/> Setup</label>
                    {/if}
                </td>
            </tr>
            </tbody>
            <tbody class="section">
            <td valign="top" width="60" align="right"><strong>{$lang.Price}</strong></td>
            <td id="priceoptions">
                {foreach from=$supported_billingmodels item=bm name=boptloop}
                    {if $bm == 'Metered'}{continue}{/if}
                    <a href="#" class="billopt {if $smarty.foreach.boptloop.first && $bm == 'Free'}bfirst{/if}"  onclick='return switch_t2(this, "{$bm}");' id="bma_{$bm}">
                        {if $lang[$bm]}{$lang[$bm]}
                        {elseif $bm == "DomainRegular"}{$lang.Regular}
                        {else}{$bm}
                        {/if}
                    </a>
                    <input type="radio" value="{$bm}" name="paytype" {if $product.paytype==$bm}checked="checked"{/if}  id="{$bm}" style="display:none"/>
                {/foreach}
                <div id="bmcontainer">
                    {foreach from=$supported_billingmodels item=bm name=boptloop}
                        {if $bm == 'Metered'}{continue}{/if}
                        {include file="productbilling_`$bm`.tpl" product=$billing_product[$bm]}
                    {/foreach}
                </div>
            </td>
            </tbody>
            <tbody>
            <tr>
                <td align="right"></td>
                <td>
                    <input type="checkbox" name="accountupdate" value="1"/>
                    Update recurring prices of related domains/accounts
                </td>
            </tr>
            </tbody>
        </table>
        <div style="padding: 6px;">
            <a class="new_dsave new_menu" href="#" onclick="return updatePrices();"  >
                <span>Update price</span>
            </a>
            <div class="clear"></div>
        </div>
    </div>

    {securitytoken}
    {literal}
    <script type="text/javascript">
        {/literal}
        lang['Register'] = '{$lang.Register}';
        lang['Transfer'] = '{$lang.Transfer}';
        lang['Renew'] = '{$lang.Renew}';
        lang['Years'] = '{$lang.Years}';
        var zero_value = '{0|price:$currency:false:false}';
        {literal}

        function switch_t2(el, id) {
            $('#priceoptions .billopt').removeClass('checked');
            $(el).addClass('checked');
            $('input[name=paytype]').removeAttr('checked').prop('checked', false);
            $('input#' + id).attr('checked', 'checked').prop('checked', true);
            $('#bmcontainer').children().hide();
            $('#' + id + '_b').show();
            $('#hidepricingadd').click();
            return false;
        }
        function addopt() {
            console.log('serviceadd opt 2')
            var e = $('#' + $('#tbpricing select').val() + 'pricing');
            e.find('.inp').eq(0).val($('#newprice').val());
            e.find('.inp').eq(1).val($('#newsetup').val());
            e.find('.pricer_setup').html($('#newsetup').val());
            if ($('#newsetup').val() != zero_value)
                e.find('.pricer_setup').parent().parent().show();
            e.find('.pricer').html($('#newprice').val());
            e.show();
            $('#tbpricing select option:selected').hide();
            if ($('#tbpricing select option:visible').length < 1) {

            } else {
                $('#tbpricing select option:visible').eq(0).attr('selected', 'selected');
                $('#addpricing').show();
            }
            $('#tbpricing').hide();
            $('#newprice').val(zero_value);
            $('#newsetup').val(zero_value).hide();
            $('#newsetup1').show();
            return false;
        }
        function updatePrices() {
            if ($('.product_check:checked').length == 0) {
                alert('You have to select some products to update');
                return false;
            }
            $('#serializeit').append('<input type="hidden" name="action_type" value="' + ($('.list-1 li.active').index() == 0 ? 'update' : 'new') + '" />').submit();
            return false;
        }
        $('#Regular_b .controls .editbtn').click(function () {
            var e = $(this).parent().parent().parent();
            e.find('.e1').hide();
            e.find('.e2').show();
            return false;
        });
        $('#Regular_b .controls .delbtn').click(function () {
            var e = $(this).parent().parent().parent();
            e.find('.e2').hide();
            e.find('.e1').show();
            e.find('input').val(zero_value);
            e.hide();
            var id = e.attr('id').substr(0, 1);
            if ($('#tbpricing select option:visible').length < 1) {
                $('#addpricing').show();
            }
            $('#tbpricing select option[value=' + id + ']').show();
            return false;
        });
        $('#product_check').click(function () {
            if (this.checked) {
                $('.product_check').attr('checked', 'checked').prop('checked', true);
            } else
                $('.product_check').removeAttr('checked').prop('checked', false);
        });
        $('.product_check').click(function () {
            if ($('.product_check:not(:checked)').length == 0) {
                $('#product_check').attr('checked', 'checked').prop('checked', true);
            } else
                $('#product_check').removeAttr('checked').prop('checked', false);
        });
        $('#newshelfnav').TabbedMenu({
            elem: '.section',
            picker: '.list-1 li',
            aclass: 'active'
        });
        if ($('#bma_Regular').length)
            $('#bma_Regular').click();
        else
            $('#priceoptions a:first').click();
        $('#addpricingrow td:last-child:not(:first-child)').remove();
    </script>
    {/literal}
</form>