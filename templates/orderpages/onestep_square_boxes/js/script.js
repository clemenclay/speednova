

function clientForm()
{
    if($('#new-client').hasClass('active'))
        ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);
    else
        ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);
}


$(document).ready(function(e) {
	

	
	var selectValue,
		$selectList;
	
	
	/* Hide active custom lists */
	
	$('body').click(function(){
		$('.select-list').hide();
		$('.custom-select').removeClass('active');
	});
	$('body .select-button').click(function(e){
		e.stopPropagation();
	})
	
	
	/* Client toggle  */



	$('.select-button').click(function(){
		$('.custom-select').removeClass('active');
		
		$selectList = $(this).parent();
		$selectList.addClass('active');
		
		$('.select-list').not($selectList.find('ul')).slideUp(250);
		
		$selectList.find('ul').slideToggle(350);
		
		$selectList.find('li').click(function(){
            selectValue = $(this).data('value');
            $selectList.find('select').val(selectValue).change();
			$selectList.find('.select-value').text($(this).text());
            $(this).parent().find('li').removeClass('active');
            $(this).addClass('active');

            if($selectList.find('li').is('#registered'))
                clientForm();

            $selectList.find('ul').slideUp(250);
		})

	})


	/* Promotional code */
	$('.promotional-code a').click(function(){
            $(this).nextAll('input').slideToggle(250);
            return false;
	});

	/* Plans */
	
	$('.plan').click(function(){
		$('.plan').removeClass('active');
		$('.plan').find('a').text(or_lang['order']);
		
		$(this).addClass('active');
		$(this).find('a').text(or_lang['selected']);

        changeProduct($(this));
		return false;
	});
	




    bindSimulateCart();
    setPayment($('.payment-method input:checked').val());

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

function domainCheck() {
    /*
     This function handles domain form
     */
    var action = $("input[name=domain]:checked").val(),
        url = '?cmd=checkdomain&action=checkdomain&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val(),
        param = {
            layer:'ajax'
        },
        target = '#register-updater';
    switch(action){
        case 'illregister':
            url+='&'+$('.tld_register').serialize();
            param.sld=$('#sld_register').val();
            target = '#register-updater';
            break;
        case 'illtransfer':
            param.sld=$('#sld_transfer').val();
            param.tld=$('#tld_transfer').val();
            param.transfer='true';
            target = '#transfer-updater';
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
            if($(this).parents('#domoptions11').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}

function addHostname() {
    var urx = '?cmd=cart',
    form = $('input[name=domain]');
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

function setAction(el)
{
    var href = $(el).attr('href');
    $('tab-pane').find('input[name=domain]').removeAttr('checked');
    $(href).find('input[name=domain]').attr('checked','checked');
}

function customSelect()
{
    $('.config select, .billing-cycle select').each(function(index, element) {

        $(this).hide().wrap('<div class="custom-select">');
        $(this).find('option').each(function(index, element) {
            $('<li data-value="'+$(this).val()+'">'+$(this).text()+'</li>').insertBefore($(this).parent());
        });
        $(this).parent().parent().find('li').wrapAll('<ul class="select-list">');
        $('<div class="select-value">'+$(this).children('option:selected').text()+'</div>').insertAfter($(this));
        $('<div class="select-button"><i class="icon-select-list"></i></div>').insertAfter($(this));
    });
}


function customRadio()
{
    var className;
    $('.cf-radio').each(function(index, element) {
        $(this).find('input').each(function(index, element) {
            if($(this).is(':checked'))
                className = 'active';
            else
                className = '';

            $('<li><div class="custom-radio" data-value="'+$(this).val()+'"><div class="radio-field '+className+'"><i class="icon-ok icon-white"></i></div><span>'+$(this).next().text()+'</span></div></li>').insertBefore($(this).parent());
        });
        $(this).parent().find('li').wrapAll('<ul class="radio-list clearfix">');
        $('<span class="prod-desc">'+$(this).find('.prod-desc').text()+'</span>').insertAfter($(this));
        $(this).hide();
    });
}


function customCheckbox()
{
    var className;
    $('.cf-checkbox').each(function(index, element) {
        $(this).find('input').each(function(index, element) {
            if($(this).is(':checked'))
                className = 'active';
            else
                className = '';

            $('<li><div class="custom-checkbox" data-value="'+$(this).val()+'"><div class="checkbox-field '+className+'"><i class="icon-ok icon-white"></i></div><span>'+$(this).next().text()+'</span></div></li>').insertBefore($(this).parent());
        });
        $(this).parent().find('li').wrapAll('<ul class="checkbox-list clearfix">');
        $('<span class="prod-desc">'+$(this).find('.prod-desc').text()+'</span>').insertAfter($(this));
        $(this).hide();
    });
}


/* Custom select list */
$(document).on('click', '.select-button', function(){

    $('.custom-select').removeClass('active');

    $selectList = $(this).parent();
    $selectList.addClass('active');

    $('.select-list').not($selectList.find('ul')).slideUp(250);

    $selectList.find('ul').slideToggle(350);



    $selectList.find('li').click(function(){
        selectValue = $(this).data('value');
        $selectList.find('select').val(selectValue).change();
        $selectList.find('.select-value').text($(this).text());

        $selectList.find('ul').slideUp(250);

    });

});


/* Custom radio  */
$(document).on('click', '.custom-radio', function(){

    var radioList = $(this).parents('ul');

    radioList.find('.radio-field').removeClass('active');
    $(this).find('.radio-field').addClass('active');

    var radioValue = $(this).data('value');
    radioList.parent().find('input[value='+radioValue+']').prop('checked', true).trigger('click');

});


/* Custom checkbox */
$(document).on('click', '.custom-checkbox', function(){
    var span = $(this).find('.checkbox-field');

    var checkboxIndex = $('.custom-checkbox').index($(this));

    if(span.hasClass('active')){
        span.removeClass('active');
        $(this).parents('.config').find('input:eq('+checkboxIndex+')').prop('checked', false);
        $(this).parent().find('.checkout-center').find('button').addClass('disabled').attr('disabled');
        $(this).find('input[name=tos]').prop('checked', false);
    }else{
        span.addClass('active');
        $(this).parents('.config').find('input:eq('+checkboxIndex+')').prop('checked', true);
        $(this).parent().find('.checkout-center').find('button').removeClass('disabled').removeAttr('disabled');
        $(this).find('input[name=tos]').prop('checked', true);
    }

    simulateCart('#cart3');


})

function setPayment(val)
{
    $('#gatewayform').show();
    $('input[name=gateway]').val(val);
    ajax_update('?cmd=cart&action=getgatewayhtml&gateway_id='+val, '', '#gatewayform',true);
}

function tabpane()
{
    var href = $('.hostname li a ').attr('href');
    $('.hostname li:first ').addClass('active');
    $(href).addClass('active');
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