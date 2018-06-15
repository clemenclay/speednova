{foreach from=$c.items item=cit} 
    {literal}
        <script type="text/javascript">
            function idprotect_control(el) {
                var control = $('#idprotection'),
                    form = $('#idprotection_purchase');
                
                if ($(el).is(':checked')) {
                    control.val("1");
                    form.val("1").attr('name', form.data('name'));
                } else {
                    control.val("0");
                    form.val("1").removeAttr('name');
                }
                return false;
            }

        </script>
    {/literal}
    
    <span class="fs11">
        <input name="idprotection_control"  value="1" type="checkbox" {if $c.values[$cit.id] && $details.idprotection}checked="checked"{/if} onclick="idprotect_control(this)" />
        <input name="idprotection" id="idprotection" value="{$details.idprotection}"  type="hidden" />
        <input id="idprotection_purchase" {if $c.values[$cit.id]}name="custom[{$kk}][{$cit.id}]" value="1"{else}name=""{/if} type="hidden" data-name="custom[{$kk}][{$cit.id}]" />
    </span>
    {break}
{/foreach}
