<style>
#logoAnimago{
width: 30px;
height: 30px;
display: block;
text-align: center;
overflow: hidden;
left: -33px;
top: 32px;
position: relative;
}
</style>


<script type="text/javascript">
	$(document).ready(function(){
		
		var imgHeight = 30;
var numImgs = 19;
var cont = 0;

var animation = setInterval(function(){
    var position =  -1 * (cont*imgHeight);
    $('#logoAnimago').find('img').css('margin-top', position);
    
    cont++;
    if(cont == numImgs){
        cont = 0;
    }
},45);
    

});
</script>


<section class="show animated fast fadeInUp" id="footer">
    <div class="container">
  		<div class="row-fluid pull-right" style=" width:190px">

<div style="height:50px;position: relative;bottom: 16px;">
    <div id="logoAnimago">
    	<img src="http://bluepixel.com.ar/logoAnimado/logo_pixel_bluepixel.png" alt="Logo Animado"/>
    </div>
  			<div class="logo-bluepixel-azul"></>
  	
</div>    
    	</div>
  	</div>
  </section>