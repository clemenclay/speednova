

$(document).ready(function(e) {
	
	
	
	// ORDERPAGE
	
	var selectValue,
		$selectList;
		
		
	$('#checkbox-tos').click(function(){
		if($(this).is(':checked'))
			$('.checkout-button').removeClass('disabled').removeAttr('disabled');
		else
			$('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
	})

	
	
	
	/* Hide active custom lists */
	
	$('body').click(function(){
		$('.select-list').hide();
		$('.custom-select').removeClass('active');
	});
	$('body .select-arrow').click(function(e){
		e.stopPropagation();
	})


    $('.client-toggle .select-value').text($('.client-toggle .select-list li.active-client').text());
	
	/* Custom select list */
	$('.select-arrow').click(function(){
		
		$('.custom-select').removeClass('active');
		
		$selectList = $(this).parents('.custom-select');
		$selectList.addClass('active');
		
		
		$('.select-list').not($selectList.find('ul')).slideUp(250);
		
		$selectList.find('ul').slideToggle(250);
		
	})


    $('.custom-select li').click(function(){
        selectValue = $(this).text();
        $selectList.find('li').removeClass('active-client');
        $(this).addClass('active-client');
        $selectList.find('.select-value').text(selectValue);

        $selectList.find('ul').slideUp(250);


        if($('#new-client').hasClass('active-client')){
            ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);
        }else{
            ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);
        }
    });
	
	
	
	// Modal window 
	
	$('.modal-window').click(function(){
        var desc = $(this).parents('.plan').find('.modal-desc').html();
        var title = $(this).parents('.plan').find('.plan-name').html();

        $('#modal-window .modal-body').html(desc);
        $('#modal-window .modal-header h3').html(title);

		$('#modal-window').modal();
	})
	
	
	
	
	
	
	/* Plans */
	
	$('.plan').click(function(){
        var txt = $('.plan:not(.no-opacity):first').find('.btn-center').children('a').text();
		$('.plan').removeClass('no-opacity');
        $('.plan').find('.btn-center').children('a').text(txt);
		
		$(this).addClass('no-opacity');
		$(this).find('.btn-center').children('a').text('selected');

        changeProduct($(this));
		
		return false;
	});
	
	
	/* Slider */
	var $slider = $("#slider-1");
    if ($slider.length) {
      $slider.slider({
        min: 1,
        max: 1000,
        value: 250,
        orientation: "horizontal",
        range: "min"
      });
    }


    bindSimulateCart();
    equalHeight()
    setPayment($('#payment-method input:checked').val());

});



function changeProduct(that)
{

    $('#configer').addClass('half-opacity');
    var pid = $(that).find('input').val();
    if(pid==$('#pidi').val())
        return;
    $('#pidi').val(pid);

    $('#errors').slideUp('fast',function(){
        $(this).find('span').remove();
    });
    $('#load-img').show();
    $.post('?cmd=cart',{
        id: pid
    },function(data){
        var r = parse_response(data);
        $('#configer').removeClass('half-opacity');
        $('#configer').html(r);
    });
}



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
        form = $('input, select, textarea','#cartforms').filter(function(){
            if($(this).parents('#domoptions11, .toggle-slider.domains').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}
function bindSimulateCart(){
    $('[name=ostemplate], [name=domain], [name=cycle]','#cartforms').filter(function(){
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


function equalHeight(){
    var h = 0;
    $('.plan .plan-info').each(function(){
        if($(this).height() > h)
            h = $(this).height();
        console.log(h);
    }).height(h+10);
}