




$(document).ready(function(e) {

    var planBoxHeight = 0;


    $('.plan-box a').click(function(){
        $('.plan-box').removeClass('active');
        $(this).parents('.plan-box').addClass('active');

        $('.configuration-row').slideDown('1000');

        changeProduct($(this).parents('.plan-box'));

        return false;
    });




    $('#checkbox-tos').click(function(){
        if($(this).is(':checked'))
            $('.checkout-button').removeClass('disabled').removeAttr('disabled');
        else
            $('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
    })




    function setPlansHeight()
    {
        $('.plan-box').each(function(index, element) {
            if($(this).height() > planBoxHeight)
                planBoxHeight = $(this).height();
        });


        $('.predefinied-plans').css('min-height', planBoxHeight+20);
    }




    setPlansHeight();
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
    }).bind('change', function(){
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
            target = '#updater';
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



function changeProduct(that)
{

    $('#updater').addClass('half-opacity');
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
        $('#updater').removeClass('half-opacity');
        $('#updater').html(r);
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



	