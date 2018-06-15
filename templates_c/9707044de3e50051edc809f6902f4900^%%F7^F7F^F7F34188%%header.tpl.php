<?php /* Smarty version 2.6.26, created on 2018-06-14 09:54:04
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'header.tpl', 41, false),)), $this); ?>
<html lang="en" class="js flexbox flexboxlegacy canvas canvastext webgl touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths uk-touch wf-roboto-n5-active wf-roboto-n4-active wf-sourcecodepro-n7-active wf-sourcecodepro-n4-active wf-roboto-n3-active wf-roboto-n7-active wf-roboto-i4-active wf-active app_theme_h">
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<head>


		




<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">

<link href="<?php echo $this->_tpl_vars['template_dir']; ?>
css/custom.css" rel="stylesheet">

		






    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-32x32.png" sizes="32x32">

    <title>SpeedNova - Hosting Company</title>


</head>
    <body class="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
 tpl_speednova" >
        <div id="wrapper">
            



<header>
    
        <nav class="navbar navbar-expand-lg navbar-light white">
		<a href="<?php echo $this->_tpl_vars['ca_url']; ?>
"><img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img/logo_main.png" alt="" width="" height="" style="height: 53px;">
        <b><span style="color: #7d7d7d; margin-left: 4px;">Speed</span><span style="color: #e01f45;">Nova</span></b>
        
        </a>
            
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="navbarSupportedContent" style="">
                
              <ul class="navbar-nav mr-auto">


							
				
                 
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "mainmenu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> 
                </ul>
				
				

				
				
                <ul class="navbar-nav nav-flex-icons">
				
				
				
				
				
				<?php if ($this->_tpl_vars['languages']): ?>
				
				
				
				<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <?php $_from = $this->_tpl_vars['languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ling']):
?><?php if ($this->_tpl_vars['language'] == $this->_tpl_vars['ling']): ?><img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img/famfamfam/lang_<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
.gif"  alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
"/><?php endif; ?><?php endforeach; endif; unset($_from); ?>
                            </a>
                                                            <ul class="dropdown-menu">
								<?php $_from = $this->_tpl_vars['languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ling']):
?>
                                    <li id="lang_<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
" ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['cmd']; ?>
&action=<?php echo $this->_tpl_vars['action']; ?>
&languagechange=<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
"><img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img/famfamfam/lang_<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
.gif" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
"/> <?php echo ((is_array($_tmp=$this->_tpl_vars['lang'][$this->_tpl_vars['ling']])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</a></li>
                            	<?php endforeach; endif; unset($_from); ?>
                                </ul>
                        </li>

                            <?php endif; ?>
                          
				
				
				
				
				
                   <div class="btn-group">
                                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">

                                    <?php if ($this->_tpl_vars['logged'] == '1'): ?>
                                    <i class="icon-user icon-white"></i> <?php echo $this->_tpl_vars['login']['firstname']; ?>
 <?php echo $this->_tpl_vars['login']['lastname']; ?>

                                    <?php else: ?>
                                    <i class="icon-lock icon-white"></i> <?php echo $this->_tpl_vars['lang']['login']; ?>

                                    <?php endif; ?>
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu  pull-right">

                                    <?php if ($this->_tpl_vars['logged'] != '1'): ?>
                                    <li><a class="dropdown-item" href="<?php echo $this->_tpl_vars['ca_url']; ?>
signup/"><?php echo $this->_tpl_vars['lang']['createaccount']; ?>
</a></li>
                                    <li><a class="dropdown-item" href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['login']; ?>
</a></li>
                                    <?php else: ?>
                                    <li><a class="dropdown-item" href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/details/"><?php echo $this->_tpl_vars['lang']['manageaccount']; ?>
</a></li>
                                    <li><a class="dropdown-item" href="?action=logout"><?php echo $this->_tpl_vars['lang']['logout']; ?>
</a></li>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['adminlogged']): ?>
                                    <div class="dropdown-divider"></div>
                                    <li><a class="dropdown-item"  href="<?php echo $this->_tpl_vars['admin_url']; ?>
/index.php<?php if ($this->_tpl_vars['login']['id']): ?>?cmd=clients&amp;action=show&amp;id=<?php echo $this->_tpl_vars['login']['id']; ?>
<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['adminreturn']; ?>
</a></li>
                                    <?php endif; ?>

                                </ul>
                    </div>
                </ul>
            </div>
        </nav>
    
    </header>
	
	
	<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>		

<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/common.min.js"></script>
	
	
	<main>
	
	 <div class="container">
                           

                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "notifications.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>        

                        
                       






                <section id="<?php echo $this->_tpl_vars['cmd']; ?>
">
	<?php if ($this->_tpl_vars['cmd'] == 'cart'): ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "../orderpages/cart.sidemenu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php endif; ?>
                    <div id="cont" <?php if ($this->_tpl_vars['cmd'] == 'cart' && $this->_tpl_vars['step'] > 0 && $this->_tpl_vars['step'] < 4): ?>class="left"<?php endif; ?>>
					
					
         	