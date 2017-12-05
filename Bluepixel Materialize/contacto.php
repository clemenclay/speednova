<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from themearmada.com/demos/breakroom/contact.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Sep 2014 20:36:26 GMT -->
<?php include 'head.php'; ?> 

<body ng-app="contactApp" >
<?php include 'menu.php'; ?>
   <section id="content">  
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">Contacto</h2>
                </div>
                <div ng-controller="ContactController" class="row-fluid">
                
                
<div class="span4">
    <div class="boxed"> 
        <div style="padding:4px; display:flex">
        <i style="padding: 7px; margin-right: 24px;font-size: 33px;color: gainsboro;" class="icon-envelope-alt"></i>
        <div class="lead"> cp.nataliaruizdiaz@gmail.com</div>
        
        </div>
    
        <div style="padding:4px; display:none">
        <i style="padding: 7px; margin-right: 24px;font-size: 33px;color: gainsboro;" class="icon-phone"></i>
           <div class="lead">+54 11 555-5555</div>
        </div>
    </div>
</div>   
              
              
 
 
 
                
                
                <div class="span4">
<form ng-submit="submit(contactform)" name="contactform" method="post" action="" class="form-horizontal" role="form">
<div class="control-group" ng-class="{ 'has-error': contactform.inputName.$invalid && submitted }">
<input ng-model="formData.inputName" type="text" class="form-control" id="inputName" name="inputName" placeholder="Nombre" required>
</div>
<div class="control-group" ng-class="{ 'has-error': contactform.inputEmail.$invalid && submitted }">
<input ng-model="formData.inputEmail" type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Email" required>                       
</div>
<div class="control-group" ng-class="{ 'has-error': contactform.inputSubject.$invalid && submitted }">
<input ng-model="formData.inputSubject" type="text" class="form-control" id="inputSubject" name="inputSubject" placeholder="Asunto" required>
</div>
				</div>
                <div class="span4">
<div class="control-group" ng-class="{ 'has-error': contactform.inputMessage.$invalid && submitted }">
<textarea ng-model="formData.inputMessage" class="form-control" rows="9" id="inputMessage" name="inputMessage" placeholder="Mensaje..." required></textarea>
</div>
<div class="control-group">
<p style="margin-bottom:10px;float: left;" ng-class="result" style="padding: 15px; margin: 20px;">{{ resultMessage }}</p>
<button type="submit" class="waves-effect waves-yellow btn secondary-content" ng-disabled="submitButtonDisabled">
Enviar
</button>
              </div>             
</div>
</form>




                
                
                
            
                
                
                
            </div>
        </div>
    
</section>
</br>




<?php include 'bottom.php'; ?>



  
  <?php include 'footer.php'; ?>
 
 
  <!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->  
  <?php include 'js.php'; ?>
  
    
   
    </body>

<!-- Mirrored from themearmada.com/demos/breakroom/contact.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Sep 2014 20:36:26 GMT -->
</html>