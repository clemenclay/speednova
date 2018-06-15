






$(document).ready(function(e) {

		
		
	$('#checkbox-tos').click(function(){
		if($(this).is(':checked'))
			$('.checkout-button').removeClass('disabled').removeAttr('disabled');
		else
			$('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
	})

	
	
	
	
	
	
	
	
	
	/* Slider */

	

	
	
	
	$('.next-plan').click(function(){
		var val = $slider.slider("value");
		if(val < plansNum ){
			$('.scroll-content').animate({'margin-left': (-val-1)*($('.plan-box').width()+8)}, 300);
			$slider.slider("value", val+1);
		}
	})
	
	$('.prev-plan').click(function(){
		var val = $slider.slider("value");
		if(val > 0){
			$('.scroll-content').animate({'margin-left': (-val+1)*($('.plan-box').width()+8)}, 300);
			$slider.slider("value", val-1);
		}
	})


    $("#compareSlider").find('.ui-slider-handle').text('Compare Plans').prepend("<div class='handle-mask'></div>");

    var wBox = $('.plan-box').width()+8;
    wBox = $('.plan-box').length*wBox;

    $('.scroll-content').width(wBox);

});




var $slider,
    plansNum = 0;



function initMainSlider()
{
    $slider = $("#compareSlider");
    plansNum = $('.plan-box').length-4;



    $slider.slider({
        min: 0,
        max: plansNum,
        value: 0,
        animate: 300,
        orientation: "horizontal",
        slide: function( event, ui ) {
            var num = ui.value;

            $('.scroll-content').animate({'margin-left': -num*($('.plan-box').width()+8)}, 300);
        }
    });

}




function simulateCart(forms) {
    $('.order-summary').addLoader();
    ajax_update('?cmd=cart&step='+_get('step')+'&'+$(forms).serialize(),{'simulate':'1'},'#cartSummary');
}
var step1 ={
    on_submit:function () {
        if($("input[value='illregister']").is(':checked')) {
            //own
            ajax_update('?cmd=checkdomain&action=checkdomain&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val()+'&'+$('.tld_register').serialize(),{
                layer:'ajax',
                sld:$('#sld_register').val()
            },'#updater',true);
        } else if ($("input[value='illtransfer']").is(':checked')) {
            //transfer
            ajax_update('?cmd=checkdomain&action=checkdomain&transfer=true&sld='+$('#sld_transfer').val()+'&tld='+$('#tld_transfer').val()+'&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val(),{
                layer:'ajax'
            },'#updater',true);
        } else if ($("input[value='illupdate']").is(':checked') || $("input[value='illsub']").is(':checked')) {

            return true;
        }
        return false;
    }
}

function changeCycle(forms) {
    $(forms).append('<input type="hidden" name="ccycle" value="true"/>').submit();
    return true;
}

function reform_ccform(html){
    $('#gatewayform').find('.wbox').removeAttr('class').prepend('<h3>'+$('#gatewayform .wbox_header strong').text()+'</h3><div class="contact-underline"></div>');
    $('#gatewayform .wbox_header').remove();
}

function pop_ccform(valu){
    $('#gateway_form').val(valu);
    $.post('?cmd=cart&action=getgatewayhtml&gateway_id='+valu, '', function(data){
        var data = parse_response(data);
        if(data.length){
            $('#gatewayform').html(data);
            reform_ccform();
            $('#gatewayform').slideDown();
        }else $('#gatewayform').slideUp('fast', function(){$(this).html('')});
    });
}

function setFormType()
{
    var val = $('[name=form_type]').val();

    if(val == 1){
        ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);
    }else{
        ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);
    }
}


function remove_domain(domain, msg) {
    $('.domain-row-'+domain).addClass('shownice');
    if(confirm(msg)) {
        $('.domain-row-'+domain).remove();
        $('#cartSummary').addLoader();
        ajax_update('?cmd=cart&step=2&do=removeitem&target=domain',{
            target_id:domain
        },'#cartSummary');
        if($('.domain-row').length<1) {
            window.location='?cmd=cart';
        }
    }

    $('.domain-row-'+domain).removeClass('shownice');
    return false;
}
function bulk_periods(s) {
    $('.dom-period').each(function(){
        $(this).val($(s).val());
    });
    $('.dom-period').eq(0).change();

}
function insert_singupform(el){
    $.get('?cmd=signup&contact&private',function(resp){
        resp = parse_response(resp);
        var pref = $(el).attr('name');
        //$(el).removeAttr('name').attr('rel', pref);
        $(resp).find('input, select, textarea').each(function(){
            $(this).attr('name', pref+'['+$(this).attr('name')+']');
        }).end().appendTo($(el).siblings('.sing-up'));
    });
}

	