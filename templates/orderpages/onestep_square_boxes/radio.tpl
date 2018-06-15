{foreach from=$cf.items item=cit name=its}
    <input name="{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}]"  value="{$cit.id}" {if $smarty.foreach.its.first}id="custom_field_{$cf.id}"{/if} type="radio"  {if $contents[1][$cf.id][$cit.id]}checked="checked"{/if} onclick="{if $cf.config.conditionals}change_field_{$cf.id}();{/if}if(typeof (simulateCart)=='function') simulateCart('{if $cf_opt_formId && $cf_opt_formId != ''}{$cf_opt_formId}{else}#cart3{/if}')" class="pconfig_ styled"/> <span>{$cit.name} {if $cit.price!=0}(
    {if $cit.fee!=0} {$cit.fee|price:$currency} {$lang[$cit.recurring]}{/if}
    {if $cit.setup!=0} {$cit.setup|price:$currency} {$lang.setupfee}{/if}
    ){/if}
    </span> <br/>{/foreach}

{if $cf.config.conditionals}
    <script type="text/javascript">
        {literal}
        function clear_cf_form(){
            var cf = $(this);
            if(cf.is('input[type=radio], input[type=checkbox]')){
                cf.prop('checked',false).removeAttr('checked').siblings('input').prop('checked',false).removeAttr('checked');
            }else cf.val('');
        }{/literal}
        var change_field_{$cf.id}= function() {literal}{
            var setvals={};{/literal}
            var newval = $("input[name='{if $cf_opt_name && $cf_opt_name != ''}{$cf_opt_name}{else}custom{/if}[{$cf.id}]']:checked").val();
            var cond = [];
            var block = [];

            {foreach from=$cf.config.conditionals item=cd name=cond}
            cond.push([{$cd.val}, '{$cd.action}', {$cd.target} {if $cd.targetval}, '{$cd.targetval}'{/if}]);
            {/foreach}
            {literal}
            var t = null;
            for(var i= 0; i<cond.length; i++){
                t = $('#custom_field_'+cond[i][2]);
                if(newval == cond[i][0]){
                    if(cond[i][1] == 'hide') t.each(clear_cf_form).parent().hide();
                    else if(cond[i][1] == 'show') t.parent().show();
                    else if(cond[i][1] == 'setval') setvals[t.attr('id')]=cond[i][3];
                    block[cond[i][2]]=1;
                }else if(block[cond[i][2]] == undefined){
                    if(cond[i][1] == 'hide') t.parent().show();
                    else if(cond[i][1] == 'show') t.each(clear_cf_form).parent().hide();
                }
            }

            for (var k in setvals) {
                var t= $('#'+k);
                t.val(setvals[k]);
                if(typeof (t.slider)=='function' && t.next().hasClass('slides')) {
                    t.next().slider('value',setvals[k]);
                    t.next().next().html(setvals[k]);
                }
            }
        };
        {/literal}
        setTimeout(change_field_{$cf.id},200);
    </script>{/if}