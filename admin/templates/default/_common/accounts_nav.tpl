

<table border="0" cellpadding="2" cellspacing="0" >
    <tr>
        <td>
            <a href="?cmd=accounts&list={$currentlist}"><strong>&laquo; {$lang.backto} {$lang.accounts}</strong></a>&nbsp;
        </td>
        <td class="menubar">
            <a class="menuitm"   href="#" onclick="$('#formsubmiter').click();
                    return false" ><span ><strong>{$lang.savechanges}</strong></span></a>

            {if !$forbidAccess.deleteServices}
                <a class=" menuitm menu-auto" href="#" onclick="confirm1();
                        return false;"><span style="color:#FF0000">{$lang.Delete}</span>
                </a>
            {/if}
            <a class="setStatus menuitm menu-auto" id="hd1" onclick="return false;"   href="#" ><span class="morbtn">{$lang.moreactions}</span></a>
        </td>
        <td>
            <input type="checkbox" name="manual" value="1" {if $details.manual == '1'}checked="checked" {/if}  class="changeMode" style="display:none;"/> 
        </td>
    </tr>
</table>


<script type="text/javascript">
    {literal}
        function autosus(el) {
            if ($(el).is(':checked')) {
                $('#autosuspend_date').show();
            } else {
                $('#autosuspend_date').hide();
            }
        }
        function confirm1() {
            $('#confirm_ord_delete').trigger('show');
            return false;
        }
        function confirmsubmit2() {
            var add = '';
            if ($('#cc_hard').is(':checked'))
                add = '&harddelete=true';
            window.location.href = '?cmd=accounts&make=delete&action=edit&id=' + $('#account_id').val() + add + '&security_token=' + $('input[name=security_token]').val();
            return false;
        }
        function cancelsubmit2() {
            $('#confirm_ord_delete').hide().parent().css('position', 'inherit');
            return false;
        }
        function new_gateway(elem) {
            if ($(elem).val() == 'new') {
                window.location = "?cmd=managemodules&action=payment";
                $(elem).val(($("select[name='" + $(elem).attr('name') + "'] option:first").val()));
            }
        }
        function checkup() {
            if (!$('.changeMode').eq(0).is(':checked') && $('#product_id').eq(0).val() !={/literal}{$details.product_id}{literal} && $('select[name=status]').eq(0).val() != 'Pending' && $('select[name=status]').eq(0).val() != 'Terminated') {
                return confirm('{/literal}{$lang.upgrconf}{literal}');
            }
            return true;
        }
        function sh1xa(el, id) {
            $('#link_to_product').attr('href','?cmd=services&action=product&id='+id);
            if ($(el).eq(0).val() == id) {
                $('#upgrade_opt').hide();
            } else {
                $('#upgrade_opt').show();
            }
        }

    {/literal}
</script>