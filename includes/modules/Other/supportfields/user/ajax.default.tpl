{if $do=='getjs' && $fields}{literal}
(function ($) {
    var wrapper = $("<div></div>").attr('id','asker_fields').addClass("form-horizontal").css({
        padding:5,
        margin:"10px 0px",
        background:'#FFF'
    });
{/literal}
    {if $place=='newticket'}
    {foreach from=$fields item=field}
        wrapper.append({$field.html});
        
    {/foreach}
{literal}
    
    $('#ticketmessage').after(wrapper);
    
    var w = $('input,select,textarea,label',wrapper);
   // var x = $('input,select,textarea,label,.fileupload-buttonbar','#ticketsform').filter(':visible').not(w).hide();
    
{/literal}
     {foreach from=$fields item=field}

        {if $field.js}
            eval("{$field.js}");
        {/if}
    {/foreach}
    {elseif $place=='answeredticket'}
    {foreach from=$fields item=field}
        wrapper.append({$field.html});
    {/foreach}
{literal}

  wrapper.css('float','right');
$('#client_tab .slide').eq(0).append(wrapper);
wrapper.prev().addClass('left');
{/literal}

    {/if}
{literal}
wrapper.after("<div class='clear'></div>");
})(jQuery);
{/literal}{/if}