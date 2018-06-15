







$(document).ready(function(e) {
	
	var currentPos;
	var currentIndex;
	
	$('.visible-content').hover(function(){
		if($('.plan').hasClass('active')){
			$('.price-hover').children().css('left', -200);
		}else{
			$('.price-hover').children().remove();
			$(this).prev().clone().appendTo('.price-hover');
			$('.price-hover').children().css('left', currentPos);
			
			currentIndex = $(this).index('.visible-content');
			$('.plan-details:eq('+currentIndex+')').slideDown(150)
			
			var left = $(this).parent().position().left;
			var width = $(this).parent().width();
			var priceWidth = $('.price-hover .plan-price-top').width();
			
			currentPos = left-(priceWidth-width)/2;
			
			$('.price-hover .plan-price-top').animate({left: currentPos}, 150);
		}
		
		}, function(){
			if(!$('.plan').hasClass('active'))
				$('.plan-details:eq('+currentIndex+')').slideUp(150)
	})
	
	
	
	$('.btn-select').click(function(){
		var plan = $(this).parents('.plan');
		if(plan.hasClass('active')){
			plan.removeClass('active');
		}else{
			$('.plan').removeClass('active');
			$('.plan-details:eq('+$(this).index('.btn-select')+')').siblings().slideUp();
			plan.addClass('active');
			$('.price-hover').children().css('left', -200);
			$('.plan-details:eq('+$(this).index('.btn-select')+')').slideDown(150)
		}
		
		return false;
	})



    descriptionHeight()
	
});

function descriptionHeight(){
    var h = 0;

    $('.hover-bg ul').each(function(){
        if($(this).height() > h)
            h = $(this).height();

    }).height(h);

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



function changePrice(that) {
    var text = that.find('option:selected').attr('data-value');
    that.parent().find('.total-price').text(text);
}