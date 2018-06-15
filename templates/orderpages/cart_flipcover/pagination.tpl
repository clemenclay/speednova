<div class="row nav-steps">
    <div class="span2">
        {if $step}
            <a href="{$ca_url}cart{if $step > 1}&step={$prevstep}{/if}"  class="btn btn-step"><i class="icon-step-prev"></i> {$lang.back}</a>
        {/if}
    </div>
    <div class="span2 right-txt offset8">
        <a href="#" class="btn btn-step"
           {if $step == 1}
           onclick="if($('#form2 input:checked').length>0 && ( $('#illregister_input').is(':checked') ||  $('#illtransfer_input').is(':checked')) ) $('#form2').submit(); else $('#form1').submit(); return false;"
           {elseif $step == 2}
           onclick="$('#cart3').submit(); return false;"
           {elseif $step == 3}
               onclick="$('#cart3').submit(); return false;"
           {elseif $step == 4}
               onclick="$('#subbmitorder').submit(); return false;"
            {/if}
                >Next <i class="icon-step-next"></i></a>
    </div>
</div>
