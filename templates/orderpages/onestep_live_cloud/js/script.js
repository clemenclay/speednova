$(document).ready(function (e) {

    var world = document.getElementById('world'),
        viewport = document.getElementById('viewport'),
        worldXAngle = 0, //Math.floor(Math.random() * (-15 + 1)),
        worldYAngle = 0, //Math.floor(Math.random() * (20 + 1)),
        worlXmod = 1,
        worlYmod = 1,
        d = 0;

    var objects = [],
        layers = [];


    function generate() {
        objects = [];
        if (world.hasChildNodes()) {
            while (world.childNodes.length >= 1) {
                world.removeChild(world.firstChild);
            }
        }
        for (var j = 0; j < 5; j++) {
            objects.push(createCloud());
        }
    }

    var randomMinX = -350,
        randomMaxX = 310,
        randomMinY = -200,
        randomMaxY = -50;

    function createCloud() {

        var div = document.createElement('div');
        div.className = 'cloudBase';
        var x = Math.floor(Math.random() * (randomMaxX - randomMinX + 1)) + randomMinX;
        var y = Math.floor(Math.random() * (randomMaxY - randomMinY + 1)) + randomMinY;
        var z = 128 - (Math.random() * 300);
        var t = 'translateX( ' + x + 'px ) translateY( ' + y + 'px ) translateZ( ' + z + 'px )';
        div.style.webkitTransform = t;
        div.style.MozTransform = t;
        div.style.oTransform = t;
        world.appendChild(div);

        //var t = 'translateZ( ' + d + 'px ) rotateX( ' + worldXAngle + 'deg) rotateY( ' + worldYAngle + 'deg)';
        //world.style.webkitTransform = t;
        //world.style.MozTransform = t;
        //world.style.oTransform = t;

        for (var j = 0; j < 5 + Math.round(Math.random() * 10); j++) {
            var cloud = document.createElement('div');
            cloud.style.opacity = 0;
            cloud.style.opacity = .8;
            cloud.className = 'cloudLayer';

            var x = 256 - (Math.random() * 500);
            var y = 256 - (Math.random() * 400);
            var z = 100 - (Math.random() * 200);
            var a = Math.random() * 360;
            var s = .25 + Math.random();
            x *= .2;
            y *= .2;
            cloud.data = {
                x: x,
                y: y,
                z: z,
                a: a,
                s: s,
                speed: .1 * Math.random()
            };
            var t = 'translateX( ' + x + 'px ) translateY( ' + y + 'px ) translateZ( ' + z + 'px ) rotateZ( ' + a + 'deg ) scale( ' + s + ' )';
            cloud.style.webkitTransform = t;
            cloud.style.MozTransform = t;
            cloud.style.oTransform = t;

            div.appendChild(cloud);
            layers.push(cloud);
        }

        return div;
    }


    function update() {
        updateView()
        for (var j = 0; j < layers.length; j++) {
            var layer = layers[ j ];
            layer.data.a += layer.data.speed;
            var t = 'translateX( ' + layer.data.x + 'px ) translateY( ' + layer.data.y + 'px ) \
                translateZ( ' + layer.data.z + 'px ) \
                rotateY( ' + (-worldYAngle) + 'deg ) \
                rotateX( ' + (-worldXAngle) + 'deg ) \
                rotateZ( ' + layer.data.a + 'deg ) \
                scale( ' + layer.data.s + ')';
            layer.style.webkitTransform = t;
            layer.style.MozTransform = t;
            layer.style.oTransform = t;
        }

        requestAnimationFrame(update);

    }

    function updateView() {
        worlYmod = Math.abs(worldYAngle) >= 20 ? -worlYmod : worlYmod;
        //worlXmod = Math.abs(worldXAngle) >= 30 ? -worlXmod : worlXmod;

        worldYAngle = (worldYAngle + worlYmod * 0.03 * Math.random())
        worldXAngle = (worldXAngle + worlXmod * 0.03 * Math.random())
        
        var t = 'translateZ( ' + d + 'px ) rotateX( ' + worldXAngle + 'deg) rotateY( ' + worldYAngle + 'deg)';
        world.style.webkitTransform = t;
        world.style.MozTransform = t;
        world.style.oTransform = t;
    }

    if (!$.browser.msie) {
        update();
        generate();
    }

    $('#checkbox-tos').each(function () {
        var tos = $(this),
            checkout = $('.checkout-button');
            
        tos.on('update click',function () {
            if (tos.is(':checked'))
                checkout.removeClass('disabled').removeAttr('disabled');
            else
                checkout.addClass('disabled').attr('disabled', 'disabled');
        })
        tos.trigger('update')
    })

    /* Slider */

    var plansNum = $('.plan-list li').length;
    var distance = ($('#main-slider').width() - plansNum * 100) / plansNum;


    $('.plan-list li').each(function (index, element) {
        if (index == 0)
            var left = 0;
        else
            var left = distance + distance / (plansNum - 1);

        $(this).css('margin-left', left);
    });


    function setActiveGear(index)
    {
        $('.gear-img').removeClass('speed-x1').removeClass('speed-x2').removeClass('speed-x3');
        $('.gear-img').addClass('speed-x' + index);
    }

    var PageInitialized = false;
    $('#main-slider').slider({
        min: 0,
        max: plansNum - 1,
        step: 1,
        value: 0,
        orientation: "horizontal",
        range: "min",
        animate: true,
        slide: function (event, ui) {
            var val = ui.value;
        },
        change: function (event, ui) {
            var val = ui.value;
            var price = $('.plan-list li:eq(' + val + ')').find('.plan-cycle').text();
            $('.slider-label-body').children().text(price);

            $('.plan-list li').removeClass('active');
            $('.plan-list li:eq(' + val + ')').addClass('active');

            var id = $('.plan-list li:eq(' + val + ')').attr('data-value');
            if (PageInitialized)
                changeProduct(id);

            $('.whats-included').hide();
            $('.whats-included:eq(' + val + ')').show();

            if (!$.browser.msie) {
                var speed = ui.value / (plansNum / 3);
                speed = Math.floor(speed) + 1;
                setActiveGear(speed);
            }
        }
    }).addClass('main-slider');

    $('#main-slider .ui-slider-handle').append('<div class="slider-label-body"><p></p></div>');

    $('.plan-list li').click(function () {
        $('#main-slider').slider('value', $(this).index());
    })

    $('#main-slider').slider('value', $('.plan-list li.active').index());

    $('#billing-box').on('click', 'li', function () {
        var self = $(this);
        changeCycle(self.data('cycle'));

        $('#billing-box li').removeClass('active');

        $('.active-bg').animate({
            left: self.position().left,
            width: self.innerWidth()
        }, 250, function () {
            self.addClass('active');
        });
        return false;
    });

    reloadProductCycle();
    PageInitialized = true;
});

function setFormType() {
    var val = $('[name=form_type]').val();
    if (val == 1) {
        ajax_update('index.php?cmd=login', {layer: 'ajax'}, '#clientForm', true);
    } else {
        ajax_update('index.php?cmd=signup', {layer: 'ajax'}, '#clientForm', true);
    }
}

function totalToday() {
    $('.setup-total-box span').text($('.total-summary .total-price').text());
}

function reloadProductCycle() {
    var box = $('#billing-box .billing-cycle-box'),
        options = '<div class="active-bg"></div>',
        selected = $('#updater select[name=cycle]')[0].selectedIndex,
        cycleW = 0;

    $('#updater select[name=cycle] option').each(function (index) {
        var self = $(this);
        options += '<li data-cycle="' + self.val() + '">' + self.text() + '</li>';
    });

    box.html(options);
    var lis = box.children('li');
    lis.each(function (index, element) {
        cycleW += $(this).innerWidth();
    })

    box.width(cycleW);
    box.parent().children('p').toggle(lis.length > 1)


    var li = lis.eq(selected);
    if (li.length) {
        li.addClass('active');
        $('.active-bg').css({
            left: li.position().left,
            width: li.innerWidth()
        });
    }
}

function changeCycle(cycle) {
    $('select[name=cycle]').val(cycle);
    changeProduct($('.plan-list .active').data('value'), cycle);
}

function changeProduct(pid, cycle) {
    $('#errors').slideUp('fast', function () {
        $(this).find('span').remove();
    });
    var data = {
        id: pid,
    };
    if (cycle !== undefined) {
        data.cycle = cycle;
    }
    $('#updater').addClass('half-opacity');
    $.post('?cmd=cart', data, _updateProduct);
}


function tabbme(el) {
    $(el).parent().find('button').removeClass('active');
    $('#options div.slidme').hide().find('input[type=radio]').removeAttr('checked');
    $('#options div.' + $(el).attr('rel')).show().find('input[type=radio]').attr('checked', 'checked');
    $(el).addClass('active');
}

function _updateProduct(data) {

    var r = parse_response(data);
    $('#updater').html(r);
    $('#updater').removeClass('half-opacity');

    reloadProductCycle();
    totalToday();
    bindSimulateCart();

}

function _updateCart(data) {
    data = parse_response(data);
    $('#orderSummary').html($(data).find('#orderSummary').html());
    $('#orderSummary').removeClass('half-opacity');
    totalToday();
}

function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea', '#cartforms, #billing-box').filter(function () {
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
    $('input, [name=ostemplate], [name=domain], [name=cycle]', '#cartforms').filter(function () {
        return !$(this).parents('#domoptions11').length
    }).bind('change', function () {
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
            target = '#update';
            break;
        case 'illsub':
            url = '?cmd=cart&domain=illsub';
            param.sld_subdomain = $('#sld_subdomain').val();
            target = '#update';
            break;
    }
    ajax_update(url, param, target);

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

    return true;
}

function pop_ccform(valu) {
    $('#gateway_form').val(valu);
    $.post('?cmd=cart&action=getgatewayhtml&gateway_id=' + valu, '', function (data) {
        var data = parse_response(data);
        if (data.length) {
            $('#gatewayform').html(data);
            $('#gatewayform').slideDown();
        } else
            $('#gatewayform').slideUp('fast', function () {
                $(this).html('')
            });
    });
}
	