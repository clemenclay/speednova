







$(document).ready(function(e) {
	
	var maxH = 0;
	$('.plan-box').each(function(index, element) {
        var h = $(this).height();

        if(h > maxH)
            maxH = h;

		$.data(this, 'top', $(this).height());

		$(this).find('.hover-bg').height(h).css('top', -h);
		$(this).find('.hover-bg').children().css('margin-top', h/2-22);
		
    });

    $('.uc-container').height(maxH);
	
	
	
	$('.plan-box').hover(function(){
            $(this).find('.hover-bg').css('opacity', 1);
			$(this).find('.hover-bg').animate({top: 0}, {duration:400, queue:false});
		}, function(){
			var orginal = $.data(this, 'top');
			
			$(this).find('.hover-bg').animate({top: orginal}, {duration:400, queue:false, complete: function(){
				$(this).css('top', -orginal);
			}
			});
	});
	
	
});
	
	
	
$(function() {

	var opened = false;

	$('.uc-container').each( function( i ) {

		var $item = $( this ), 
		direction;
		
		index = i%3;

		switch(index) {
			case 0 : direction = ['right','bottom']; break;
			case 1 : direction = ['left','bottom']; break;
			case 2 : direction = ['left','bottom']; break;
		}
		
		var pfold = $item.pfold( {
			folddirection : direction,
			speed : 300,
			onEndFolding : function() { opened = false; $('.uc-final-wrapper').hide(); },
		} );

		$item.find('.hover-bg').on( 'click', function() {

            $(this).css('opacity', 0);

			if( !opened ) {
				opened = true;
				pfold.unfold();
			}


		} ).end().find('.fold-close span').on( 'click', function() {
			pfold.fold();
			

		} );

	} );
	
});




function simulateCart(forms) {
    $('.order-summary').addLoader();
    ajax_update('?cmd=cart&step='+_get('step')+'&'+$(forms).serialize(),{'simulate':'1'},'#cartSummary');
}
var step1 ={
    on_submit:function () {
        if($("input[value='illregister']").is(':checked')) {
            //own
            ajax_update('?cmd=checkdomain&action=checkdomain&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val()+'&'+$('.tld_register').serialize(),{
                layer:'ajax',
                sld:$('#sld_register').val()
            },'#updater',true);
        } else if ($("input[value='illtransfer']").is(':checked')) {
            //transfer
            ajax_update('?cmd=checkdomain&action=checkdomain&transfer=true&sld='+$('#sld_transfer').val()+'&tld='+$('#tld_transfer').val()+'&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val(),{
                layer:'ajax'
            },'#updater',true);
        } else if ($("input[value='illupdate']").is(':checked') || $("input[value='illsub']").is(':checked')) {

            return true;
        }
        return false;
    }
}

function changeCycle(forms) {
    $(forms).append('<input type="hidden" name="ccycle" value="true"/>').submit();
    return true;
}

function reform_ccform(html){
    $('#gatewayform').find('.wbox').removeAttr('class').prepend('<h3>'+$('#gatewayform .wbox_header strong').text()+'</h3><div class="contact-underline"></div>');
    $('#gatewayform .wbox_header').remove();
}

function pop_ccform(valu){
    $('#gateway_form').val(valu);
    $.post('?cmd=cart&action=getgatewayhtml&gateway_id='+valu, '', function(data){
        var data = parse_response(data);
        if(data.length){
            $('#gatewayform').html(data);
            reform_ccform();
            $('#gatewayform').slideDown();
        }else $('#gatewayform').slideUp('fast', function(){$(this).html('')});
    });
}

function setFormType()
{
    var val = $('[name=form_type]').val();

    if(val == 1){
        ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);
    }else{
        ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);
    }
}


function remove_domain(domain, msg) {
    $('.domain-row-'+domain).addClass('shownice');
    if(confirm(msg)) {
        $('.domain-row-'+domain).remove();
        $('#cartSummary').addLoader();
        ajax_update('?cmd=cart&step=2&do=removeitem&target=domain',{
            target_id:domain
        },'#cartSummary');
        if($('.domain-row').length<1) {
            window.location='?cmd=cart';
        }
    }

    $('.domain-row-'+domain).removeClass('shownice');
    return false;
}
function bulk_periods(s) {
    $('.dom-period').each(function(){
        $(this).val($(s).val());
    });
    $('.dom-period').eq(0).change();

}
function insert_singupform(el){
    $.get('?cmd=signup&contact&private',function(resp){
        resp = parse_response(resp);
        var pref = $(el).attr('name');
        //$(el).removeAttr('name').attr('rel', pref);
        $(resp).find('input, select, textarea').each(function(){
            $(this).attr('name', pref+'['+$(this).attr('name')+']');
        }).end().appendTo($(el).siblings('.sing-up'));
    });
}
