

_sliders = [];




$(document).ready(function(e) {
	
	
	$('#checkbox-tos').click(function(){
		if($(this).is(':checked'))
			$('.checkout-button').removeClass('disabled').removeAttr('disabled');
		else
			$('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
	});
	
	$('.plan-list li').click(function(){
		$('.plan-list li').removeClass('active');
		$(this).addClass('active');

        var pid = $(this).attr('data-value');
        changeProduct(pid);
	});


    var h = $('.plan-list').parent().height();
    $('.sketch-hardware').height(h);


});


function initSliders()
{
    $.each(_sliders, function(index, value){
        $('#slider-'+_sliders[index].index).slider({
            min: _sliders[index].min,
            max: _sliders[index].max,
            value: _sliders[index].value,
            step: _sliders[index].step,
            range: "min",
            animate: 300,
            orientation: "horizontal",
            slide: function(event, ui){
                $('.value-'+_sliders[index].index).text(ui.value);
                $('#slider-'+_sliders[index].index).next('input').val(ui.value);

                simulateCart();
            }
        });
    });

    for(var i = 0; i < 3; i++)
    {
        var val = $('#slider-'+i).slider("value");
        var text = $('#slider-'+i).parent().children('p').text();
        $('.value-'+i).text(val);
        $('.pc-block .value-'+i).parent().children('p').text(text);
    }
}


function changeProduct(pid) {
    $('#errors').slideUp('fast', function () {
        $(this).find('span').remove();
    });
    $('#update').addClass('half-opacity');
    $.post('?cmd=cart', {
        id: pid
    }, function (data) {
        var r = parse_response(data);
        $('#update').html(r);
        $('#update').removeClass('half-opacity');
    });
}


function tabbme(el) {
    $(el).parent().find('button').removeClass('active');
    $('#options div.slidme').hide().find('input[type=radio]').removeAttr('checked');
    $('#options div.'+$(el).attr('rel')).show().find('input[type=radio]').attr('checked','checked');
    $(el).addClass('active');
}

function applyCoupon() {
    ajax_update('?cmd=cart&addcoupon=true', {promocode: $('#couponcde').val()},'#update');
    return false;
}

function removeCoupon() {

    ajax_update('?cmd=cart',{
        removecoupon:'true'
    },'#update');
    return false;
}
function bindSimulateCart(){
    $('[name^=addon], [name^=subproduct], [name=ostemplate], [name=domain], [name=cycle]','#cartforms, .billing-method-field').filter(function(){
        return !$(this).parents('#domoptions11').length;
    }).unbind('change').bind('change',function(){
            var attr = $(this).attr('onchange') == undefined && $(this).attr('onclick') == undefined;
            if(attr) simulateCart();
        });
}
function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea','#cartforms, .billing-method-field').filter(function(){
            if($(this).parents('#domoptions11, .toggle-slider.domains').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.order-summary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), function(data){
        var resp = parse_response(data);
        $('#summarybox').html($(resp).find('#summarybox').html());
        bindSimulateCart();
        $('.order-summary').removeClass('half-opacity');
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

function pop_ccform(valu){
    $('#gateway_form').val(valu);
    $.post('?cmd=cart&action=getgatewayhtml&gateway_id='+valu, '', function(data){
        var data = parse_response(data);
        if(data.length){
            $('#gatewayform').html(data);
            $('#gatewayform').slideDown();
        }else $('#gatewayform').slideUp('fast', function(){
            $(this).html('')
        });
    });

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