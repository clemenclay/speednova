<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from themearmada.com/demos/breakroom/contact.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Sep 2014 20:36:26 GMT -->
<?php include 'head.php'; ?>

<body ng-app="contactApp" >
<div id="pagina">
<?php include 'menu.php'; ?>

   <section id="content">  
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="default-text-primary-color center-align">Contacto</h2>
                </div>
                <div ng-controller="ContactController" class="row-fluid">
                
                

              
              
 
 
 
                
                
                <div class="span4">
<form ng-submit="submit(contactform)" name="contactform" method="post" action="" class="form-horizontal" role="form">

<div class="input-field" ng-class="{ 'has-error': contactform.inputName.$invalid && submitted }">
<input ng-model="formData.inputName" type="text" class="form-control" id="inputName" name="inputName" required>
    <label for="inputName" data-error="wrong" data-success="right" class="">Nombre</label>
</div>

<div class="input-field" ng-class="{ 'has-error': contactform.inputEmail.$invalid && submitted }">
    <input ng-model="formData.inputEmail" type="email" class="form-control" id="inputEmail" name="inputEmail" required>
    <label for="inputEmail" data-error="wrong" data-success="right" class="">Email</label>
</div>

<div class="input-field" ng-class="{ 'has-error': contactform.inputSubject.$invalid && submitted }">
<input ng-model="formData.inputSubject" type="text" class="form-control" id="inputSubject" name="inputSubject" required>
    <label for="inputSubject" data-error="wrong" data-success="right" class="">Asunto</label>
</div>
				</div>
                <div class="span4">

<div class="input-field" ng-class="{ 'has-error': contactform.inputMessage.$invalid &amp;&amp; submitted }">
    <textarea ng-model="formData.inputMessage" class="materialize-textarea ng-invalid ng-invalid-required" rows="9" id="inputMessage" name="inputMessage" required=""></textarea>
    <label for="inputMessage" class="">Mensaje...</label>
</div>


<div class="control-group">
<p style="margin-bottom:10px;float: left;" ng-class="result" style="padding: 15px; margin: 20px;">{{ resultMessage }}</p>
<button type="submit" class="btn waves-effect waves-light" ng-disabled="submitButtonDisabled">
Enviar
    <i class="material-icons right">send</i>
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


</div>
    </body>

<!-- Mirrored from themearmada.com/demos/breakroom/contact.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Sep 2014 20:36:26 GMT -->
</html>