/* 
 * Do not change or add entries here.
 * To add custom script use js/script.js file
 */
function changeProduct(pid) {
    $('#errors').slideUp('fast', function() {
        $(this).find('span').remove();
    });

    $('#updater').addClass('ajax');
    $.post('?cmd=cart', {
        id: pid
    }, function(data) {
        var r = parse_response(data);
        $('#updater').html(r);
        $('#updater').removeClass('ajax');
        bindSimulateCart();
    });
    return false;
}




function setAction(el)
{
    var href = $(el).attr('href');
    $('.tab-pane').find('input[name=domain]').removeAttr('checked').prop('checked', false).parents('.tab-pane').hide();
    $(href).find('input[name=domain]').attr('checked', 'checked').prop('checked', true).parents('.tab-pane').show();
    $('#domoptions22').hide();
}

function _updateCart(data) {
    data = parse_response(data);
    $('#orderSummary').html($(data).find('#orderSummary').html());
    $('#orderSummary').removeClass('half-opacity');
}

function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea', '#cartforms, #billing-box, #domoptions22').filter(function() {
            return !$(this).parents('#domoptions11, .toggle-slider.domains').length || $(this).parents('#domoptions22').length
        });
    var data = form.serializeArray();
    for(var i in data){
        if(data[i].name == 'domain' && !data[i].value.length)
            delete data[i];
    }
    if (domaincheck)
        urx += '&_domainupdate=1&';
   
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, data, _updateCart);
}

function submitDomains() {
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post('index.php?cmd=cart', $('input, select, textarea','#updater2').serializeArray(), function(data){
        console.log($(data).find('#domainTab'))
        $('#domain-section').html($(data).find('#domain-section').html());
        _updateCart(data);
    });
    return false;
}

function bindSimulateCart() {
    $('input, select, [name=ostemplate], [name=domain], [name=cycle]', '#cartforms').filter(function() {
        var self = $(this);
        return !self.parents('#domoptions11').length && self.attr('onchange') == undefined && self.attr('onclick') == undefined
    }).bind('change', function() {
        var self = $(this),
            cycles = self.attr('name').match(/(\w+)_cycles\[(\d+)\]/);
        if(cycles){
            var check =  $('input[name="' + cycles[1] +'['  + cycles[2] + ']"]');
            if(check && check.is(':checked') == false)
                return false;
        }
        simulateCart();
    });
}
function domainCheck() {
    /*
     This function handles domain form
     */
    var action = $("input[name=domain]:checked").val(),
        url = '?cmd=checkdomain&action=checkdomain&product_id=' + $('#product_id').val() + '&product_cycle=' + $('#product_cycle').val(),
        param = {
            layer: 'ajax'
        },
    target = '#updater2';
    switch (action) {
        case 'illregister':
            url += '&' + $('.tld_register').serialize();
            param.sld = $('#sld_register').val();
            break;
        case 'illtransfer':
            param.sld = $('#sld_transfer').val();
            param.tld = $('#tld_transfer').val();
            param.transfer = 'true';
            break;
        case 'illupdate':
            url = '?cmd=cart&domain=illupdate';
            param.sld_update = $('#sld_update').val();
            param.tld_update = $('#tld_update').val();
            target = '#updater';
            break;
        case 'illsub':
            url = '?cmd=cart&domain=illsub';
            param.sld_subdomain = $('#sld_subdomain').val();
            target = '#updater';
            break;
    }
    $('#domoptions11').addClass('half-opacity');
    $.post(url, param, function(data) {
        $(target).html(parse_response(data));
        $('#domoptions11').removeClass('half-opacity');
    });

    return false;
}


function applyCoupon() {
    $('#orderSummary').addClass('half-opacity');
    $.post('?cmd=cart&addcoupon=true', $('input[name=promocode]').serializeArray(), _updateCart);
    return false;
}

function removeCoupon() {
    $('#orderSummary').addClass('half-opacity');
    $.post('?cmd=cart', {
        removecoupon: 'true'
    }, _updateCart);
    return false;
}

function mainsubmit() {
    $('#payment-method input').clone().hide().appendTo('#orderform')
    return true;
}

function pop_ccform(valu) {
    $('#gateway_form').val(valu);
    $.post('?cmd=cart&action=getgatewayhtml&gateway_id=' + valu, '', function(data) {
        var data = parse_response(data);
        if (data.length) {
            $('#gatewayform').html(data);
            $('#gatewayform').slideDown();
        } else
            $('#gatewayform').slideUp('fast', function() {
                $(this).html('')
            });
    });
}

function setFormType()
{
    var val = $('[name=form_type]').val();

    if (val == 1) {
        ajax_update('index.php?cmd=login', {layer: 'ajax'}, '#clientForm', true);
    } else {
        ajax_update('index.php?cmd=signup', {layer: 'ajax'}, '#clientForm', true);
    }
}

$(document).delegate('#updater2 input[type=submit]', 'click', function(){
    submitDomains();
    return false;
});