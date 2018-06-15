



mainSlider = [];


function initSliderValue(that)
{
	var element = $('.main-slider-bg[data-number='+that.index+']');
	var move = that.value/that.step;
	var width = element.find('.middle-layer').width()-22;
	var steps = that.max/that.step;
	var stepWidth = width/steps;
	
	element.find('.bar').animate({'width': move*stepWidth}, 300);
	element.find('.slider-label').html(Math.floor(that.value/that.max*100)+'% <span><\/span>');
	element.find('.slider-label').animate({'left': move*stepWidth}, 300);
	
	element.parents('tr').find('.total').children().text(that.value);

    element.parents('tr').find('input').val(that.value).change();
	
}



function setFormType()
{
    var val = $('[name=form_type]').val();

    if(val == 1){
        ajax_update('index.php?cmd=login',{layer:'ajax'},'#clientForm',true);
    }else{
        ajax_update('index.php?cmd=signup',{layer:'ajax'},'#clientForm',true);
    }
}









$(document).ready(function(e) {
	
	
	$.each(mainSlider, function(index, value){
		initSliderValue(mainSlider[index]);
	});
	
	
	
	$('.btn-minus').click(function(){
		var tr = $(this).parents('tr');
		var index = tr.find('.main-slider-bg').attr('data-number');
		
		if(mainSlider[index].value > mainSlider[index].min){
			mainSlider[index].value = mainSlider[index].value - mainSlider[index].step;
			initSliderValue(mainSlider[index]);
		}
	});
	
	$('.btn-plus').click(function(){
		var tr = $(this).parents('tr');
		var index = tr.find('.main-slider-bg').attr('data-number');
		
		if(mainSlider[index].value < mainSlider[index].max){
			mainSlider[index].value = mainSlider[index].value + mainSlider[index].step;
			initSliderValue(mainSlider[index]);
		}
	});
	
	
	
	$('.orderpage-shadow a').click(function(){
		$('.product-content').slideToggle(500);
		
		return false;
	});
	

		
	$('#checkbox-tos').click(function(){
		if($(this).is(':checked'))
			$('.checkout-button').removeClass('disabled').removeAttr('disabled');
		else
			$('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
	})




    bindSimulateCart();
    setPayment($('#payment-method input:checked').val());

});






function tabbme(el) {
    $(el).parent().find('button').removeClass('active');
    $('#options div.slidme').hide().find('input[type=radio]').removeAttr('checked');
    $('#options div.'+$(el).attr('rel')).show().find('input[type=radio]').attr('checked','checked');
    $(el).addClass('active');
}

function _updateCart(data){
    data = parse_response(data);
    $('#orderSummary').html($(data).find('#orderSummary').html());
    $('#orderSummary').removeClass('half-opacity');
}

function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea','#cartforms, #topCart').filter(function(){
            if($(this).parents('#domoptions11, .toggle-slider.domains').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}
function bindSimulateCart(){
    $('[name=ostemplate], [name=domain], [name=cycle]','#cartforms, #topCart').filter(function(){
        return !$(this).parents('#domoptions11').length
    }).bind('change',function(){
            var attr = $(this).attr('onchange') == undefined && $(this).attr('onclick') == undefined;
            if(attr) simulateCart();
        });
}
function domainCheck() {
    /*
     This function handles domain form
     */
    var action = $("input[name=domain]:checked").val(),
        url = '?cmd=checkdomain&action=checkdomain&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val(),
        param = {
            layer:'ajax'
        },
        target = '#updater2';
    switch(action){
        case 'illregister':
            url+='&'+$('.tld_register').serialize();
            param.sld=$('#sld_register').val();
            break;
        case 'illtransfer':
            param.sld=$('#sld_transfer').val();
            param.tld=$('#tld_transfer').val();
            param.transfer='true';
            break;
        case 'illupdate':
            url='?cmd=cart&domain=illupdate';
            param.sld_update=$('#sld_update').val();
            param.tld_update=$('#tld_update').val();
            target = '#update';
            break;
        case 'illsub':
            url='?cmd=cart&domain=illsub';
            param.sld_subdomain=$('#sld_subdomain').val();
            target = '#update';
            break;
    }
    ajax_update(url,param,target);

    return false;
}


function applyCoupon() {
    $('#orderSummary').addClass('half-opacity');
    $.post('?cmd=cart&addcoupon=true',$('input[name=promocode]').serializeArray(), _updateCart);
    return false;
}

function removeCoupon() {
    $('#orderSummary').addClass('half-opacity');
    $.post('?cmd=cart',{
        removecoupon:'true'
    },_updateCart);
    return false;
}

function mainsubmit() {

    return true;
}

function setPayment(val)
{
    $('#gatewayform').show();
    $('input[name=gateway]').val(val);
    ajax_update('?cmd=cart&action=getgatewayhtml&gateway_id='+val, '', '#gatewayform',true);
}

	