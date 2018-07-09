<div id="login-page" class="">
    <div class="col s12 z-depth-4 card-panel">
      <form class="login-form">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login">
            <p class="center login-form-text">Material Design Admin Template</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="username" type="text">
            <label for="username" class="center-align">Username</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password">
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me">
              <label for="remember-me">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <a href="index.html" class="btn waves-effect waves-light col s12">Login</a>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="page-register.html">Register Now!</a></p>
          </div>
          <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="page-forgot-password.html">Forgot password ?</a></p>
          </div>          
        </div>

      </form>
    </div>
  </div>















<div class="row justify-content-md-center">
                    




    <div class="col-12 col-md-8 col-lg-6">

{if $action=='passreminder'}

<div class="card" id="loginbox_container">
    <div class="card-body">
      
     <!-- 
        <div class="wbox_header">{$lang.didyouforget} <a href="{$ca_url}clientarea/" class="right btn btn-mini"><i class="icon-chevron-left"></i> {$lang.login}</a><div class="clear"></div></div>
        <div  class="wbox_content">
            <div class="alert alert-info">{$lang.forgetintro}</div>

            {if $thanks}

-->
            {else}





            <!-- Material form login -->
    <form name="" action="" method="post">
    <p class="h4 text-center mb-4">Sign in</p>

    <!-- Material input email -->
    <div class="md-form">
        <i class="fa fa-envelope prefix grey-text"></i>
        <input name="email_remind" value="{$sub_email}" type="email" id="email_remind"  autocomplete="off" class="form-control">
        <label for="email_remind">{$lang.forgetenter}</label>
    </div>
    <!-- Material form login -->
                      
                  
                            <div class="form-actions">
                                <div class="right">
                                    <input type="submit" value="{$lang.sendmepass}" class="btn btn-info btn-large" />
                                </div>
                                <div class="clear"></div>
                            </div>
    {securitytoken}
    </form>
            {/if}
        </div>
    </div>
</div>


{else}
<div class="card" id="loginbox_container">
    <div class="card-body">
<!--   
        <div class="wbox_header">{$lang.restricted}</div>
        <div  class="wbox_content">
            <div class="alert alert-info">{$lang.restrictedarea}</div>

-->






<!-- Material form login -->
<form name="" action="" method="post">

    <p class="h4 text-center mb-4"><i style="font-size: 6em;" class="material-icons text-center mb-4">account_circle</i></p>

    <!-- Material input email -->
    <div class="md-form">
        <i class="material-icons prefix grey-text">alternate_email</i>  
        <input name="username" value="{$submit.username}" type="email" autocomplete="off" id="username" class="form-control">
        <label for="username">{$lang.email}</label>
    </div>

    <!-- Material input password -->
    <div class="md-form">
       <i class="material-icons prefix grey-text">vpn_key</i>
        <input name="password" type="password" autocomplete="off" id="password" class="form-control">
        <label  for="password">{$lang.password}</label>
    </div>

<!-- Material form login -->



                    {if $enableFeatures.logincaptcha =='on'}
                   <tr>   
                        <td align="left" colspan="2">
                            
                            <label for="captcha" class="styled">{$lang.captcha}</label>
                            <input name="captcha" type="text" class="styled"  style="width:98%"/>
                             <div style="white-space: nowrap; padding-top: 5px;">
                                 <span style="display: inline-block; width: 65%; white-space: normal;float:right">
                                     <small>{$lang.typethecharacters}<br /></small>
                                      <a href="#" onclick="return singup_image_reload();" >{$lang.refresh}</a>
                                 </span>
                                 <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#{$stamp}" /> 
                             </div>
                        </td>
                  </tr>
                  {/if}

                    <tr>
                        <td colspan="2">
                            <div class="form-actions">
                                <div class="left"  >
                                    <a href="{$ca_url}root&amp;action=passreminder" class="list_item">{$lang.passreminder}</a><br />
                                    <a href="{$ca_url}signup/" class="list_item">{$lang.createaccount}</a>
                                </div>
                                <div class="text-center">
                                    <input type="hidden" name="action" value="login"/>
                                    <button type="submit" value="" class="btn btn-info btn-large" style="font-weight:bold"><i class="icon-ok icon-white"></i> {$lang.login}</button>
                                </div>
                                <div class="clear"></div>
                            </div>

                        </td>
                    </tr>



                </table>{securitytoken}</form>
        </div>
    </div>
</div>


    </div>                  
</div>
{literal}
    <script>
       
        function singup_image_reload(){
            var d = new Date();    
            $('.capcha:first').attr('src', '?cmd=root&action=captcha#' + d.getTime());
            return false;
        }


        $("#alert-target").click(function () {
    toastr["info"]("I was launched via jQuery!")
});
    </script>

{/literal}

{/if}