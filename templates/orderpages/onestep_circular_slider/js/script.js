
smallSlider = [];
lastInserted = 0;

sliderColors = ["#6c7afc", "#5eb741", "#ff8303"];



$(document).ready(function(e) {
	

	// Terms of Service checkbox
	
	$('#checkbox-tos').click(function(){
		if($(this).is(':checked'))
			$('.checkout-button').removeClass('disabled').removeAttr('disabled');
		else
			$('.checkout-button').addClass('disabled').attr('disabled', 'disabled');
	})


    // Billing cycle 'slider'

    $(document).on('click', '.billing-cycle-box > li', function(){

        var width = $(this).innerWidth();
        var pos = $(this).position();
        var element = $(this);


        $('.active-bg').animate({'left': pos.left, 'width': width}, 250, function(){
            $('.billing-cycle-box > li').removeClass('active');
            element.addClass('active');

            var cycle = $('.billing-cycle-box > li.active').attr('rel');
             changeCycle(cycle);
        });
    });








    if(smallSlider.length > 0)
	    createSmallSliders(smallSlider);












    $(document).on('click', '.slider-less', function(){
		
		var id = $(this).parents('.left-slider-box').find('.left-slider-gradient').data('slider');
		
		smallSlider[id].value = smallSlider[id].value - smallSlider[id].step;
		
		
		if(smallSlider[id].value < smallSlider[id].min)
			smallSlider[id].value = smallSlider[id].min
			
			
		var value = smallSlider[id].value/smallSlider[id].max * 100;

			
		smallSlider[id].obj.attr({
			arc: [65, 65, value, 100, 50]
		})

        $('#custom_field_'+smallSlider[id].id).val(smallSlider[id].value).change();
		$(this).parents('.left-slider-box').find('.value').html(smallSlider[id].value);
	})


	
	
	$(document).on('click', '.slider-more', function(){

		
		var id = $(this).parents('.left-slider-box').find('.left-slider-gradient').data('slider');
		
		smallSlider[id].value = smallSlider[id].value + smallSlider[id].step;
		
		
		if(smallSlider[id].value > smallSlider[id].max)
			smallSlider[id].value = smallSlider[id].max
			
			
		var value = smallSlider[id].value/smallSlider[id].max * 100;

			
		smallSlider[id].obj.attr({
			arc: [65, 65, value, 100, 50]
		})



        $('#custom_field_'+smallSlider[id].id).val(smallSlider[id].value).change();
		$(this).parents('.left-slider-box').find('.value').html(smallSlider[id].value);

	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// Main Slider

	var $container = $('.main-slider-path');
    var $slider = $('.main-slider-handle');
	
	var sliderSettings = {
		sliderWidth: $slider.width(),
		sliderHeight: $slider.height(),
		min: 240,
		max: 120,
		radius: $container.width()/2,
		deg: 0,
        active: 0
	}
	
	
	
     
	var step = sliderSettings.min/($('.slider-pin').length-1);
	var points = $('.slider-pin');
    var mdown = false;
	
	
	var pins = [];
	var leftPins = [];
	var rightPins = [];
	
	
	setPins();
	
	
	function setPins()
	{
		var currentPlace = 240;
		var pin_pos;
		var labelW;
		
		
		

		points.each(function(i) {
			
			if(currentPlace >= 360)
				currentPlace = currentPlace-360;
				
			if(currentPlace >= sliderSettings.min && currentPlace <= 360){
				labelW = $('.pin-'+i).children('span').width();
				$('.pin-'+i).children('span').css({'left': -labelW, 'text-align': 'right'});
			}else{
				$('.pin-'+i).children('span').css({'left': 25, 'text-align': 'left'});
			}
				
			pin_pos = getPinPos(currentPlace);
			$('.pin-'+i).css({'left': pin_pos.x, 'top': pin_pos.y});//.data('index', i);
			
			if(currentPlace < 240)
				rightPins.push({'pos': currentPlace, 'index': i});
			else
				leftPins.push({'pos': currentPlace, 'index': i});
				
				
			pins[i] = currentPlace;
			
			currentPlace = currentPlace + step;
		});
		
		
		var activePin = $('.slider-pin.active');
		
		if(activePin.length > 0){
			var index = activePin.index();
			sliderSettings.deg = pins[activePin.index()];
            setClickedPlan(activePin);
		}else{
			$('.slider-pin:first').addClass('active');
			sliderSettings.deg = pins[0];
		}

		
		
		setHandle(sliderSettings.deg);
		setActivePlan();
		
		
		
		
			
	}
	
	function setActivePlan()
	{
		
		
		if(sliderSettings.deg <= 118 && sliderSettings.deg > 0){
			$('.slider-pin').removeClass('active');
			$('.pin-'+(rightPins[0].index)).addClass('active');
			
			
			for(var i = rightPins.length-1; i >= 0; i--)
			{
				if(sliderSettings.deg >= rightPins[i].pos+step/2){
					$('.slider-pin').removeClass('active');
					$('.pin-'+(rightPins[i].index+1)).addClass('active');
					
					break;
				}
			}
		}else if(sliderSettings.deg >= 240){
			$('.slider-pin').removeClass('active');
			$('.pin-'+(leftPins[0].index)).addClass('active');
			

			for(var i = leftPins.length-1; i >= 0; i--)
			{
				if(sliderSettings.deg >= leftPins[i].pos+step/2){
					$('.slider-pin').removeClass('active');	
					$('.pin-'+(leftPins[i].index+1)).addClass('active');
					
					break;
				}
			}
		}

        sliderSettings.active = $('.slider-pin.active').find('.slider-label').attr('rel');
		

	}
	
	
	
	function setHandle(deg)
	{	
		
		
		
		var gradientH, gradientW;
		
		
		if(deg >= 180 && deg <= sliderSettings.min)
			deg = sliderSettings.min;
		else if(deg < 180 && deg >= sliderSettings.max)
			deg = sliderSettings.max;
		
		
		
		$('.main-slider-mask').css('top', 150);
		
		
		// Height of Gradient 
		
		if(deg <= sliderSettings.max)
			gradientH = 270;
		else 
			gradientH = $container.height()-$slider.position().top;
		
		
		// Width of Gradient
		
		if(deg > sliderSettings.min && deg <= 300 )
			gradientW = $slider.position().left+55;
		else 
			gradientW = $slider.position().left+25;
		
		
		if(deg > 60 && deg < sliderSettings.max)
			gradientW = $slider.position().left+25;

		if(deg > 80 && deg < sliderSettings.min){
			gradientW = 360;
			$('.main-slider-mask').css('top', $slider.position().top+20);
			
		}
		
		
		
		
		
		$('.main-slider-gradient').height(gradientH).width(gradientW);
		
		
		
		var wwX = Math.round(sliderSettings.radius* Math.sin(deg*Math.PI/180));
		var wwY = Math.round(sliderSettings.radius*  -Math.cos(deg*Math.PI/180));	
		
		var qqL = wwX + sliderSettings.radius - sliderSettings.sliderWidth/2;
		var qqT = wwY + sliderSettings.radius - sliderSettings.sliderHeight/2;
		
		
		$slider.css({'left': qqL, 'top': qqT});

		
	}
	
	
	
	
	function getPinPos(deg)
	{
			rad = sliderSettings.radius+32;
			var wwX = Math.round(rad* Math.sin(deg*Math.PI/180));
			var wwY = Math.round(rad*  -Math.cos(deg*Math.PI/180));			
	
			
			var qqL = wwX+sliderSettings.radius-sliderSettings.sliderWidth/2;
			var qqT = wwY+sliderSettings.radius-sliderSettings.sliderHeight/2;
			
			var current_pin = {x: qqL, y: qqT};
			
			return current_pin;
	}
	
	
	
	
	function slide(e){
		
		if(mdown){
			
			
			var posX = e.pageX - $('.main-slider-path').offset().left, 
			posY = e.pageY - $('.main-slider-path').offset().top;
			
			var atan = Math.atan2(posX-sliderSettings.radius, posY-sliderSettings.radius);
			sliderSettings.deg = -atan/(Math.PI/180) + 180;
			
			setHandle(sliderSettings.deg);
			
			setActivePlan();
		}
	
	}
	
	
	$slider.mousedown(function(e) {
        e.originalEvent.preventDefault();
		mdown = true;
        $(document).bind('mousemove', slide).bind('mouseup',function(e){
			mdown = false;
            textOnCloud();
            changeProduct(sliderSettings.active);
        });
    })





    $('.slider-pin').click(function(){
        setClickedPlan($(this));
    })


    function setClickedPlan(current) {


        $('.slider-pin').removeClass('active');
        current.addClass('active');

        sliderSettings.deg = pins[current.index()];

        var gradientH, gradientW;






        // Height of Gradient

        var wwX = Math.round(sliderSettings.radius* Math.sin(sliderSettings.deg*Math.PI/180));
        var wwY = Math.round(sliderSettings.radius*  -Math.cos(sliderSettings.deg*Math.PI/180));

        var qqL = wwX+sliderSettings.radius-sliderSettings.sliderWidth/2;
        var qqT = wwY+sliderSettings.radius-sliderSettings.sliderHeight/2;

        $slider.css({'left': qqL, 'top': qqT});





        if(sliderSettings.deg <= sliderSettings.max+2)
            gradientH = 270;
        else
            gradientH = $container.height()-current.position().top-10;


        // Width of Gradient
        $('.main-slider-mask').css('top', 150);
        $('.main-slider-gradient').css('height', 0);


        if(sliderSettings.deg > sliderSettings.min && sliderSettings.deg <= 300 )
            gradientW = $slider.position().left+50;
        else
            gradientW = $slider.position().left+30;


        if(sliderSettings.deg >= 40 && sliderSettings.deg < sliderSettings.max)
            gradientW = $slider.position().left+25;

        if(sliderSettings.deg > 80 && sliderSettings.deg <= sliderSettings.min){
            gradientW = 360;
            $('.main-slider-mask').css('top', current.position().top+20);

        }





        $('.main-slider-gradient').height(gradientH).width(gradientW);

        sliderSettings.active = $('.slider-pin.active').find('.slider-label').attr('rel');
        textOnCloud();
        changeProduct(sliderSettings.active);

    }

});


function textOnCloud()
{
    var text = $('.slider-pin.active').find('strong').text();
    var price = $('.slider-pin.active p:last').text();

    $('#plan-name').text(text);
    $('#plan-price').text(price);
}


function changeCycle(cycle)
{

    $('select[name=cycle]').val(cycle);
    simulateCart();

}



function reloadProductCycle()
{
    $('select[name=cycle] option').each(function(index, element) {
        var li = '<li>'+$(this).text()+'</li>';
        $('.billing-cycle-box').append(li);

        if($(this).is(':selected')){
            $('.billing-cycle-box li').eq(index).addClass('active');

            var activeLi = $('.billing-cycle-box > li.active');
            var liPos = activeLi.position().left;
            var liWidth = activeLi.innerWidth();
            $('.active-bg').animate({'left': liPos, 'width': liWidth}, 250);
        }

        $('.billing-cycle-box li').eq(index).attr('rel', $(this).attr('value'));

    });

}



function changeProduct(pid) {
    if($('#product_id').val() == pid || pid == lastInserted)
        return;
    $('#errors').slideUp('fast', function () {
        $(this).find('span').remove();
    });

    lastInserted = pid;

    smallSlider = [];

    $.post('?cmd=cart', {
        id: pid
    }, function (data) {
        var r = parse_response(data);
        $('#update').html(r);
        $('#update').removeClass('ajax');
        if(smallSlider.length > 0)
            createSmallSliders(smallSlider);
        bindSimulateCart();
    });
}



function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    var urx = '?cmd=cart',
        form = $('input, select, textarea','#cartforms, .left-slider-box, .billing-cycle').filter(function(){
            if($(this).parents('#domoptions11, .toggle-slider.domains').length) return false;
            return true
        });
    if(domaincheck) urx += '&_domainupdate=1&';
    $('.ajax-overlay:last').show();
    $('.order-summary-table').addClass('half-opacity');
    $.post(urx, form.serializeArray(), _updateCart);
}



function bindSimulateCart(){
    $('[name=ostemplate], [name=domain], [name=cycle]').filter(function(){
        return !$(this).parents('#domoptions11').length
    }).bind('change',function(){
            var attr = $(this).attr('onchange') == undefined && $(this).attr('onclick') == undefined;
            if(attr) simulateCart();
        });
}

function _updateCart(data){
    data = parse_response(data);
    $('#orderSummary').html($(data).find('#orderSummary').html());
    $('#planIncludes').html($(data).find('#planIncludes').html());
    bindSimulateCart();
}

function tabbme(el) {
    $(el).parent().find('button').removeClass('active');
    $('#options div.slidme').hide().find('input[type=radio]').removeAttr('checked');
    $('#options div.'+$(el).attr('rel')).show().find('input[type=radio]').attr('checked','checked');
    $(el).addClass('active');
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

function submitDomains() {
    /*
     Handle second step of domain
     */
    $('.ajax-overlay:last').show();
    ajax_update('index.php?cmd=cart&'+$('input, select, textarea','#updater2').serialize(),{
        layer:'ajax'
    },'#update');
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


function applyCoupon() {
    $.post('?cmd=cart&addcoupon=true',$('#promoform').serializeArray(), _updateCart);
    return false;
}


function clientForm(login){
    if($(login).val() == '1'){
        ajax_update('?cmd=login',{
            layer:'ajax'
        },'#clientform',true);
        $('#clientform').removeClass('new-client').addClass('existing-client');
    }else{
        ajax_update('?cmd=signup',{
            layer:'ajax'
        },'#clientform',true);
        $('#clientform').addClass('new-client').removeClass('existing-client');
    }
    $('.client-toggle .active-toggle').removeClass('active-toggle').siblings().addClass('active-toggle');
}


function mainsubmit(formel) {
    return true;
}


function createSmallSliders(slider)
{

    $.each(slider, function(index, value){

        var def = 75;

        var value = slider[index].value/slider[index].max*100;





        var archtype = Raphael("small-slider-"+slider[index].index, 130, 130);
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
            "stroke": sliderColors[index],
            "stroke-width": 15,
            arc: [65, 65, def, 100, 50]
        }).rotate(180);

        smallSlider[index].obj = my_arc;

        my_arc.attr({
            arc: [65, 65, value, 100, 50]
        })


    })
}

	