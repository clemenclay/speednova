<?php /* Smarty version 2.6.26, created on 2018-06-20 17:54:26
         compiled from login.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'login.tpl', 161, false),)), $this); ?>


<div class="login_page_wrapper">
        <div class="md-card" id="login_card">
            <div class="md-card-content large-padding" id="login_form">
                <div class="login_heading">
                    <div class="user_avatar"></div>
                </div>
                <form>
                    <div class="uk-form-row">
                        <label for="login_username">Username</label>
                        <input class="md-input" type="text" id="login_username" name="login_username" />
                    </div>
                    <div class="uk-form-row">
                        <label for="login_password">Password</label>
                        <input class="md-input" type="password" id="login_password" name="login_username" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <a href="index.html" class="md-btn md-btn-primary md-btn-block md-btn-large">Sign In</a>
                    </div>
                    <div class="uk-grid uk-grid-width-1-3 uk-grid-small uk-margin-top">
                        <div><a href="#" class="md-btn md-btn-block md-btn-facebook" data-uk-tooltip="<?php echo '{pos:\'bottom\'}'; ?>
" title="Sign in with Facebook"><i class="uk-icon-facebook uk-margin-remove"></i></a></div>
                        <div><a href="#" class="md-btn md-btn-block md-btn-twitter" data-uk-tooltip="<?php echo '{pos:\'bottom\'}'; ?>
" title="Sign in with Twitter"><i class="uk-icon-twitter uk-margin-remove"></i></a></div>
                        <div><a href="#" class="md-btn md-btn-block md-btn-gplus" data-uk-tooltip="<?php echo '{pos:\'bottom\'}'; ?>
" title="Sign in with Google+"><i class="uk-icon-google-plus uk-margin-remove"></i></a></div>
                    </div>
                    <div class="uk-margin-top">
                        <a href="#" id="login_help_show" class="uk-float-right">Need help?</a>
                        <span class="icheck-inline">
                            <input type="checkbox" name="login_page_stay_signed" id="login_page_stay_signed" data-md-icheck />
                            <label for="login_page_stay_signed" class="inline-label">Stay signed in</label>
                        </span>
                    </div>
                </form>
            </div>
            <div class="md-card-content large-padding uk-position-relative" id="login_help" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_b uk-text-success">Can't log in?</h2>
                <p>Here’s the info to get you back in to your account as quickly as possible.</p>
                <p>First, try the easiest thing: if you remember your password but it isn’t working, make sure that Caps Lock is turned off, and that your username is spelled correctly, and then try again.</p>
                <p>If your password still isn’t working, it’s time to <a href="#" id="password_reset_show">reset your password</a>.</p>
            </div>
            <div class="md-card-content large-padding" id="login_password_reset" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_a uk-margin-large-bottom">Reset password</h2>
                <form>
                    <div class="uk-form-row">
                        <label for="login_email_reset">Your email address</label>
                        <input class="md-input" type="text" id="login_email_reset" name="login_email_reset" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <a href="index.html" class="md-btn md-btn-primary md-btn-block">Reset password</a>
                    </div>
                </form>
            </div>
            <div class="md-card-content large-padding" id="register_form" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_a uk-margin-medium-bottom">Create an account</h2>
                <form>
                    <div class="uk-form-row">
                        <label for="register_username">Username</label>
                        <input class="md-input" type="text" id="register_username" name="register_username" />
                    </div>
                    <div class="uk-form-row">
                        <label for="register_password">Password</label>
                        <input class="md-input" type="password" id="register_password" name="register_password" />
                    </div>
                    <div class="uk-form-row">
                        <label for="register_password_repeat">Repeat Password</label>
                        <input class="md-input" type="password" id="register_password_repeat" name="register_password_repeat" />
                    </div>
                    <div class="uk-form-row">
                        <label for="register_email">E-mail</label>
                        <input class="md-input" type="text" id="register_email" name="register_email" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <a href="index.html" class="md-btn md-btn-primary md-btn-block md-btn-large">Sign Up</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="uk-margin-top uk-text-center">
            <a href="#" id="signup_form_show">Create an account</a>
        </div>
    </div>






























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



<script>
$( "body" ).addClass( "login_page" );
</script>



'; ?>

    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/login_page.min.css" />

    <script src="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/js/pages/login.min.js"></script>


    <script>
        <?php echo '
        
        // check for theme
        if (typeof(Storage) !== "undefined") {
            var root = document.getElementsByTagName( \'html\' )[0],
                theme = localStorage.getItem("altair_theme");
            if(theme == \'app_theme_dark\' || root.classList.contains(\'app_theme_dark\')) {
                root.className += \' app_theme_dark\';
            }
        }

        '; ?>

    </script>


<?php endif; ?>