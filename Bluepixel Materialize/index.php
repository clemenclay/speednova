<!DOCTYPE html>
<html lang="en">
<?php include 'head.php'; ?> 

<body>
        
   <?php include 'menu.php'; ?>


<section id="content">




  <!-- Carousel -->
  <div class="carousel carousel-slider center" data-indicators="true">
<!--    <div class="carousel-fixed-item center">-->
<!--      <a class="btn waves-effect white grey-text darken-text-2">button</a>-->
<!--    </div>-->
    <div class="carousel-item home-material2" href="#one!">


        <h1>Material Design Responsive Pricing Tables</h1>
        <div class="pricing-table">

            <div class="pricing-item">
                <div class="pricing-title">
                    BÁSICO
                </div>
                <div class="pricing-value">R$19.<span class="smallText">90</span>
                    <span class="undertext">/Mês</span>
                </div>
                <ul class="pricing-features">
                    <li><span class="keywords">1GB</span> Armazenamento</li>
                    <li>Banda <span class="keywords">ilimitada</span></li>
                    <li><span class="keywords">10 Contas</span> de email</li>
                    <li><span class="keywords">50gb</span> Transferência</li>
                </ul>
                <div class="button">Comprar</div>
            </div>

            <div class="pricing-item pricing-featured">
                <div class='selected'>Recomendado</div>
                <div class="pricing-title">
                    PRO
                </div>
                <div class="pricing-value">R$39.<span class="smallText">90</span>
                    <span class="undertext">/Mês</span>
                </div>
                <ul class="pricing-features">
                    <li><span class="keywords">5GB</span> Armazenamento</li>
                    <li>Banda <span class="keywords">ilimitada</span></li>
                    <li><span class="keywords">100 Contas</span> de email</li>
                    <li><span class="keywords">100gb</span> Transferência</li>
                </ul>
                <div class="button">Comprar</div>
            </div>
            <div class="pricing-item pricing-featured">
                <div class='selected'>Recomendado</div>
                <div class="pricing-title">
                    PRO
                </div>
                <div class="pricing-value">R$39.<span class="smallText">90</span>
                    <span class="undertext">/Mês</span>
                </div>
                <ul class="pricing-features">
                    <li><span class="keywords">5GB</span> Armazenamento</li>
                    <li>Banda <span class="keywords">ilimitada</span></li>
                    <li><span class="keywords">100 Contas</span> de email</li>
                    <li><span class="keywords">100gb</span> Transferência</li>
                </ul>
                <div class="button">Comprar</div>
            </div>

        </div>
<!--      <h2>First Panel</h2>-->
<!--      <p class="white-text">This is your first panel</p>-->
    </div>
<!--    <div class="carousel-item amber white-text" href="#two!">-->
<!--      <h2>Second Panel</h2>-->
<!--      <p class="white-text">This is your second panel</p>-->
<!--    </div>-->
<!--    <div class="carousel-item green white-text" href="#three!">-->
<!--      <h2>Third Panel</h2>-->
<!--      <p class="white-text">This is your third panel</p>-->
<!--    </div>-->
<!--    <div class="carousel-item blue white-text" href="#four!">-->
<!--      <h2>Fourth Panel</h2>-->
<!--      <p class="white-text">This is your fourth panel</p>-->
<!--    </div>-->
  </div><!-- /.carousel -->
  
</section>  


 <!-- 
  <div class="textoInicio animated fadeInDown">
  <div>
  
<h1>Natalia Ruiz Diaz. Contador Publico (UBA).</h1>

<h2>Asesoramiento Contable, Fiscal y Laboral a Empresas, Autónomos y Monotributistas.</h2>

<h3>

Mi misión es atender rápida y adecuadamente el requerimiento del cliente.<br />
Se realiza el trabajo en forma directa con la seriedad y ética profesional que cada caso amerita.<br />
Todas las consultas serán bien recibidas.

</h3>




</div>
<a style="padding: 7px 22px !important; border-bottom: none !important;" class="btn-main" href="servicios.php"><i class="icon-chevron-right"></i> VER SERVICIOS</a>
<br />
</div>
  -->
  
  <!--Bottom Section-->
  <?php include 'bottom.php'; ?>
  
  
 <?php include 'footer.php'; ?>
 
 
  <!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->  
  <?php include 'js.php'; ?>
  
    

  <script>
        $('.carousel.carousel-slider').carousel({fullWidth: true},setTimeout(autoplay, 4500000000000000000000));
        function autoplay() {
            $('.carousel').carousel('next');
            setTimeout(autoplay, 4500000000000000000);
        }
 </script>

    </body>


</html>