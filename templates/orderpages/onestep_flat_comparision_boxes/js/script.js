
// W wierszu 84 w pliku bootstrap-select.js wyrzuciłem właściwość min-height, przez co w selectcie przy billing cycle nie ma nadmiaru pustego pola.



String.prototype.repeat = function(num) {
    return new Array(num + 1).join(this);
};


$(window).load(function(e){
	
	// Terms of Service checkbox
	var tos = 0;
	
	$('label[for=tos]').click(function(){
		tos++;
		if(tos%2 == 1){
			$('.checkout-button-fix button').removeClass('disabled').removeAttr('disabled');
		}else
			$('.checkout-button-fix button').addClass('disabled').attr('disabled', 'disabled');
	})

});

$(document).ready(function(e) {
	
	
	
	// ORDERPAGE

	  
  
	var left;


	
	
	// Select predefinied plan 
	$('.plan a').click(function(){
        var buttonTxt = $('.plan a:not(.btn-selected):first').text();
		$('.plan').removeClass('active');
		$('.plan a').removeClass('btn-selected').text(buttonTxt);
		
		$(this).addClass('btn-selected').text('Selected');
		$(this).parent().addClass('active');
        changeProduct();
		
		return false;
	})



    // Client Toggle

    $(".client-toggle select").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});

    $('.client-toggle li').click(function(){
        if($('#registered-client').is(':selected')){
            ajax_update('index.php?cmd=signup',{layer:'ajax'},'#updater',true);
            $('#updater').removeClass('login-table');
        }else{
            $('#updater').addClass('login-table');
            ajax_update('index.php?cmd=login',{layer:'ajax'},'#updater',true);
        }
    })
	

});



function changeProduct() {
    /*
     Change product, and load its configuration options
     */
    $('#configer').addClass('half-opacity');
    var pid = $('.plans .active input').val();
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

function simulateCart(forms, domaincheck) {
    /*
     Sends configuration data on each change made in forms and updates order prices/summary tab
     */
    $('#load-img').show();
    $('.summary').addClass('half-opacity');
    var urx = '?cmd=cart&';
    if(domaincheck) urx += '_domainupdate=1&';
    ajax_update(urx,$('#cartform').serializeArray(),'#configer');
}


function bindSimulateCart(){
    
    $('input, select','#cartform').bind('change',function(e){
        var attr = $(this).attr('onchange') == undefined && $(this).attr('onclick') == undefined;
        if(attr) simulateCart();
    });
}


function on_submit() {
    /*
     This function handles domain form
     */
    if($("input[value='illregister']").is(':checked')) {
        ajax_update('index.php?cmd=checkdomain&action=checkdomain&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val()+'&'+$('.tld_register').serialize(),{
            layer:'ajax',
            sld:$('#sld_register').val()
        },'#updater2',true);
    } else if ($("input[value='illtransfer']").is(':checked')) {
        ajax_update('index.php?cmd=checkdomain&action=checkdomain&transfer=true&sld='+$('#sld_transfer').val()+'&tld='+$('#tld_transfer').val()+'&product_id='+$('#product_id').val()+'&product_cycle='+$('#product_cycle').val(),{
            layer:'ajax'
        },'#updater2',true);
    } else if ($("input[value='illupdate']").is(':checked')) {
        ajax_update('index.php?cmd=cart&domain=illupdate&sld_update='+$('#sld_update').val()+'&tld_update='+$('#tld_update').val(),{
            layer:'ajax'
        },'#configer');
        $('#load-img').show();
    } else if ($("input[value='illsub']").is(':checked')) {
        ajax_update('index.php?cmd=cart&domain=illsub&sld_subdomain='+$('#sld_subdomain').val(),{
            layer:'ajax'
        },'#configer');
        $('#load-img').show();
    }

    return false;
}
function onsubmit_2() {
    /*
     Handle second step of domain bulk register
     */
    $('#load-img').show();
    ajax_update('index.php?cmd=cart&'+$('#domainform2').serialize(),{
        layer:'ajax'
    },'#configer');
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

function _updateCart(data){
    data = parse_response(data);
    $('#orderSummary').html($(data).filter('#orderSummary').html());
    $('#orderSummary').removeClass('half-opacity');
}