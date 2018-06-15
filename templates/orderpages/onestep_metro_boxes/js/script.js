
var active = false;

$(document).ready(function(e) {

    $('#checkbox-tos').click(function() {
        if ($(this).is(':checked'))
            $('.checkout-button').removeClass('disabled').removeAttr('disabled');
        else
            $('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
    })


    $('.plan-box').each(function(index, element) {
        var h = $(this).height();
        $(this).find('.hidden-info').height(h);
        animateOut($(this));
    });

    $('.plan-box').hover(function() {
        if (!active) {
            animateIn($(this));
        }

    }, function() {
        if (!active) {
            animateOut($(this));
        }
    });


    $('.plan-box').find('a').click(function(e) {
        var that = $(this).parents('.plan-box');
        var ref = $('.plan-box.active');

        $('.plan-box').removeClass('active');
        that.addClass('active');
        active = true;

        var pid = $(this).attr('data-value');
        changeProduct(pid)


        e.stopImmediatePropagation();
        animateOut(ref);
        animateIn(that);

        return false;
    });



    $('#factsCarousel').carousel({
        interval: 5000
    })


    $('#domainTab a').click(function() {
        $(this).tab('show');
        return false;
    });



});


function animateIn(that)
{
    var bodyH = that.find('.plan-body').innerHeight();
    var headerH = that.find('.plan-header').innerHeight();
    var h3 = that.find('h3').height();
    var priceH = that.find('h3').next().height();

    that.find('.header-hover').animate({'height': headerH + bodyH}, {
        duration: 300,
        queue: false,
    });
    that.find('.header-hover').next().animate({'top': headerH - (h3 + priceH + 5)}, 300);

    that.find('.text-fade').fadeIn(500);

    if (that.hasClass('left-hover')) {
        that.find('.hidden-info').css('display', 'block').animate({'right': 300, 'left': 'auto'}, 300);
    } else {
        that.find('.hidden-info').css('display', 'block').animate({'left': 300}, 300);
    }


    that.find('.plan-body').find('.padding').css('opacity', 0.7);

}


function animateOut(that)
{
    that.find('.header-hover').next().animate({'top': 0}, {
        duration: 300,
        queue: false,
        complete: function() {
            $(this).prev().animate({'height': 0}, 300);
        }});

    that.find('.text-fade').fadeOut(500);

    if (that.hasClass('left-hover')) {
        that.find('.hidden-info').animate({'right': 0}, 300, function() {
            $(this).css('display', 'none');
        });
    } else {
        that.find('.hidden-info').animate({'left': 0}, 300, function() {
            $(this).css('display', 'none');
        });
    }


    $('.plan-box .plan-body .padding').css('opacity', 1);
}



function changeProduct(pid) {
    $('#errors').slideUp('fast', function() {
        $(this).find('span').remove();
    });


    $.post('?cmd=cart', {
        id: pid
    }, function(data) {
        var r = parse_response(data);
        $('#updater').html(r);
        $('#updater').removeClass('ajax');
        bindSimulateCart();
    });

    $('html, body').animate({
        scrollTop: $("#updater").offset().top - 100
    }, 500);

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
        form = $('input, select, textarea', '#cartforms, #billing-box').filter(function() {
        if ($(this).parents('#domoptions11, .toggle-slider.domains').length)
            return false;
        return true
    });
    if (domaincheck)
        urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}
function bindSimulateCart() {
    $('input, [name=ostemplate], [name=domain], [name=cycle]', '#cartforms').filter(function() {
        return !$(this).parents('#domoptions11').length
    }).bind('change', function() {
        var attr = $(this).attr('onchange') == undefined && $(this).attr('onclick') == undefined;
        if (attr)
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