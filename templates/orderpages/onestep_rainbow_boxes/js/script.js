

_slider = [];
_normalSlider = [];



$(document).ready(function(e) {

    var maxH = 0;


    $('#checkbox-tos').click(function(){
        if($(this).is(':checked'))
           $('[name=tos]').attr('checked', 'checked');
        else
            $('[name=tos]').removeAttr('checked');
    })


    $.each(_slider, function(index, value){
        initCircularSlider(index);
        initHorizontalSlider(index);
    });


    $.each(_normalSlider, function(index, value){
        $('#slider-'+_normalSlider[index].index).slider({
            min: _normalSlider[index].min,
            max: _normalSlider[index].max,
            value: _normalSlider[index].value,
            step: _normalSlider[index].step,
            range: "min",
            animate: 300,
            orientation: "horizontal",
            change: function(event, ui){
                $('#slider-'+_normalSlider[index].index).prev('p').children('strong').text(ui.value);
                $('#slider-'+_normalSlider[index].index).parents('.cf-slider').find('input').val(ui.value).change();
            }
        });
    });


    $('.slider-box ').each(function(){

        var h = $(this).children().children('p').height();

        if(h > maxH)
            maxH = h;

    }).children().children('p').height(maxH);
	

	
	
	$('#domainTab a').click(function(e) {
        e.preventDefault();
		$(this).tab('show');
        $(this).parents('#clientInfo').prev().find('tr').not('.iscomp').show();

		return false;
    });



    bindSimulateCart();
    checkAffix();
    
    $(document).delegate('#updater2 input[type=submit]', 'click', function(){
        submitDomains();
        return false;
    });

});

function submitDomains() {
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $('#domoptions11').addClass('half-opacity');
    var form = $('input, select, textarea','#updater2');
    $.post('index.php?cmd=cart', form.serializeArray(), function(data){
        $('#domoptions11').removeClass('half-opacity');
        $('#domoptions11').html($(data).find('#domoptions11'))
        _updateCart(data);
    });

    return false;
}

function initCircularSlider(index)
{
    var archtype = Raphael("circular-slider-"+index, 150, 150);
    archtype.customAttributes.arc = function (xloc, yloc, value, total, R) {
        var alpha = 360 / total * value,
            a = (90 - alpha) * Math.PI / 180,
            x = xloc + R * Math.cos(a),
            y = yloc - R * Math.sin(a),
            path;
        if (total == value) {
            path = [
                ["M", xloc, yloc - R],
                ["A", R, R, 0, 1, 1, xloc - 0.01, yloc - R]
            ];
        } else {
            path = [
                ["M", xloc, yloc - R],
                ["A", R, R, 0, +(alpha > 180), 1, x, y]
            ];
        }
        return {
            path: path
        };
    };

    var my_arc = archtype.path().attr({
        "stroke": "#fff",
        "stroke-width": 10,
        arc: [75, 75, 0, 100, 60]
    }).rotate(180, 75, 75);


    var value = _slider[index].value/_slider[index].max*100;

    my_arc.attr({
        arc: [75, 75, value, 100, 60]
    });



    _slider[index].obj =  my_arc;

    _slider[index].glow =  my_arc.glow({
        "opacity": 0.2,
    });
}


function initHorizontalSlider(index)
{
    $('#main-slider-'+index).slider({
        min: _slider[index].min,
        max: _slider[index].max,
        value: _slider[index].value,
        step: _slider[index].step,
        range: "min",
        animate: 300,
        orientation: "horizontal",
        slide: function(event, ui){

            $('.value-'+index).find('span').text(ui.value);

            var value = ui.value/_slider[index].max*100;

            _slider[index].obj.attr({
                arc: [75, 75, value, 100, 60]
            });

            _slider[index].glow.remove();

            _slider[index].glow = _slider[index].obj.glow({
                "opacity": 0.2,
            })


        },
        change: function(event, ui){
            $('#main-slider-'+index).parents('.slider-box').find('input').val(ui.value).change();
        }
    });
}


function setAction(el)
{
    var href = $(el).attr('href');
    $('tab-pane').find('input[name=domain]').removeAttr('checked');
    $(href).find('input[name=domain]').attr('checked','checked');
}

function _updateCart(data){
    data = parse_response(data);
    $('#orderSummary').html($(data).find('#orderSummary').html());
    $('#orderSummary').removeClass('half-opacity');

    $.each(_normalSlider, function(index, value){
        $('#slider-'+_normalSlider[index].index).prev('p').html($(data).find('#slider-'+_normalSlider[index].index).prev('p').html());
    });

    bindSimulateCart();
    checkAffix();
}

function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea','#cartforms, #topCart, #billingCycle').filter(function(){
            if($(this).parents('#domoptions11').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('#orderSummary').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}
function bindSimulateCart(){
    $('[name=ostemplate], [name=domain], [name=cycle]','#cartforms, #topCart, #billingCycle').filter(function(){
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
    $('#domoptions11').addClass('half-opacity');
    $.post(url, param, function(data) {
        $(target).html(parse_response(data));
        $('#domoptions11').removeClass('half-opacity');
    });

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

function checkAffix()
{

    var cartHeight = $('#cartSummary').height();

    if(cartHeight > $(window).height()){
        $('#cartSummary').addClass('static-affix');
    }else{
        var topOffset = $('#topCart').position().top;


        $('#cartSummary').removeClass('static-affix');

        if(!$('body').hasClass('tpl_nextgen')){
            $('#cartSummary').affix({
                offset: {
                    top: topOffset
                }
            });
        }else{
            $('#cartSummary').css('position', 'absolute');
        }
    }


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


function mainsubmit() {

    return true;
}

function setFormType(val)
{

    if(val == 1)
        ajax_update('index.php?cmd=login',{layer:'ajax'},'#clientForm',true);
    else
        ajax_update('index.php?cmd=signup',{layer:'ajax'},'#clientForm', true);

}
