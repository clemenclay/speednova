<?php /* Smarty version 2.6.26, created on 2018-06-19 16:11:47
         compiled from login.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'login.tpl', 47, false),)), $this); ?>
<div class="row justify-content-md-center">
                    




    <div class="col-12 col-md-8 col-lg-6">

<?php if ($this->_tpl_vars['action'] == 'passreminder'): ?>

<div class="card" id="loginbox_container">
    <div class="card-body">
      
     <!-- 
        <div class="wbox_header"><?php echo $this->_tpl_vars['lang']['didyouforget']; ?>
 <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/" class="right btn btn-mini"><i class="icon-chevron-left"></i> <?php echo $this->_tpl_vars['lang']['login']; ?>
</a><div class="clear"></div></div>
        <div  class="wbox_content">
            <div class="alert alert-info"><?php echo $this->_tpl_vars['lang']['forgetintro']; ?>
</div>

            <?php if ($this->_tpl_vars['thanks']): ?>

-->
            <?php else: ?>





            <!-- Material form login -->
    <form name="" action="" method="post">
    <p class="h4 text-center mb-4">Sign in</p>

    <!-- Material input email -->
    <div class="md-form">
        <i class="fa fa-envelope prefix grey-text"></i>
        <input name="email_remind" value="<?php echo $this->_tpl_vars['sub_email']; ?>
" type="email" id="email_remind"  autocomplete="off" class="form-control">
        <label for="email_remind"><?php echo $this->_tpl_vars['lang']['forgetenter']; ?>
</label>
    </div>
    <!-- Material form login -->
                      
                  
                            <div class="form-actions">
                                <div class="right">
                                    <input type="submit" value="<?php echo $this->_tpl_vars['lang']['sendmepass']; ?>
" class="btn btn-info btn-large" />
                                </div>
                                <div class="clear"></div>
                            </div>
    <?php echo smarty_function_securitytoken(array(), $this);?>

    </form>
            <?php endif; ?>
        </div>
    </div>
</div>


<?php else: ?>
<div class="card" id="loginbox_container">
    <div class="card-body">
<!--   
        <div class="wbox_header"><?php echo $this->_tpl_vars['lang']['restricted']; ?>
</div>
        <div  class="wbox_content">
            <div class="alert alert-info"><?php echo $this->_tpl_vars['lang']['restrictedarea']; ?>
</div>

-->






<!-- Material form login -->
<form name="" action="" method="post">

    <p class="h4 text-center mb-4"><i style="font-size: 6em;" class="material-icons text-center mb-4">account_circle</i></p>

    <!-- Material input email -->
    <div class="md-form">
        <i class="material-icons prefix grey-text">alternate_email</i>  
        <input name="username" value="<?php echo $this->_tpl_vars['submit']['username']; ?>
" type="email" autocomplete="off" id="username" class="form-control">
        <label for="username"><?php echo $this->_tpl_vars['lang']['email']; ?>
</label>
    </div>

    <!-- Material input password -->
    <div class="md-form">
       <i class="material-icons prefix grey-text">vpn_key</i>
        <input name="password" type="password" autocomplete="off" id="password" class="form-control">
        <label  for="password"><?php echo $this->_tpl_vars['lang']['password']; ?>
</label>
    </div>

<!-- Material form login -->



                    <?php if ($this->_tpl_vars['enableFeatures']['logincaptcha'] == 'on'): ?>
                   <tr>   
                        <td align="left" colspan="2">
                            
                            <label for="captcha" class="styled"><?php echo $this->_tpl_vars['lang']['captcha']; ?>
</label>
                            <input name="captcha" type="text" class="styled"  style="width:98%"/>
                             <div style="white-space: nowrap; padding-top: 5px;">
                                 <span style="display: inline-block; width: 65%; white-space: normal;float:right">
                                     <small><?php echo $this->_tpl_vars['lang']['typethecharacters']; ?>
<br /></small>
                                      <a href="#" onclick="return singup_image_reload();" ><?php echo $this->_tpl_vars['lang']['refresh']; ?>
</a>
                                 </span>
                                 <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#<?php echo $this->_tpl_vars['stamp']; ?>
" /> 
                             </div>
                        </td>
                  </tr>
                  <?php endif; ?>

                    <tr>
                        <td colspan="2">
                            <div class="form-actions">
                                <div class="left"  >
                                    <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
root&amp;action=passreminder" class="list_item"><?php echo $this->_tpl_vars['lang']['passreminder']; ?>
</a><br />
                                    <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
signup/" class="list_item"><?php echo $this->_tpl_vars['lang']['createaccount']; ?>
</a>
                                </div>
                                <div class="text-center">
                                    <input type="hidden" name="action" value="login"/>
                                    <button type="submit" value="" class="btn btn-info btn-large" style="font-weight:bold"><i class="icon-ok icon-white"></i> <?php echo $this->_tpl_vars['lang']['login']; ?>
</button>
                                </div>
                                <div class="clear"></div>
                            </div>

                        </td>
                    </tr>



                </table><?php echo smarty_function_securitytoken(array(), $this);?>
</form>
        </div>
    </div>
</div>


    </div>                  
</div>
<?php echo '
    <script>
       
        function singup_image_reload(){
            var d = new Date();    
            $(\'.capcha:first\').attr(\'src\', \'?cmd=root&action=captcha#\' + d.getTime());
            return false;
        }


        $("#alert-target").click(function () {
    toastr["info"]("I was launched via jQuery!")
});
    </script>

'; ?>


<?php endif; ?>