<?php /* Smarty version 2.6.26, created on 2018-06-18 17:58:50
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'header.tpl', 48, false),)), $this); ?>
<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    
    
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-32x32.png" sizes="32x32">

    <title>Altair Admin v2.9.2</title>

    <!-- additional styles for plugins -->
        <!-- weather icons -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/weather-icons/css/weather-icons.min.css" media="all">
        <!-- metrics graphics (charts) -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/metrics-graphics/dist/metricsgraphics.css">
        <!-- chartist -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/chartist/dist/chartist.min.css">
    
    <!-- uikit -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/uikit/css/uikit.almost-flat.min.css" media="all">

    <!-- flag icons -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/icons/flags/flags.min.css" media="all">

    <!-- style switcher -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/style_switcher.min.css" media="all">
    
    <!-- altair admin -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/main.min.css" media="all">

    <!-- themes -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/themes/themes_combined.min.css" media="all">

</head>   
    


    <body class="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
 tpl_nextgen" >
        <div id="wrapper">
            <div class="container">

                <div id="headpart">
                    <div id="mainpart">

                        <div class="right headersection">


                            
                            <?php if ($this->_tpl_vars['languages']): ?>
                            <div class="btn-group">
                                <button class="btn  dropdown-toggle" data-toggle="dropdown">
                                    <?php $_from = $this->_tpl_vars['languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ling']):
?><?php if ($this->_tpl_vars['language'] == $this->_tpl_vars['ling']): ?><img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img/famfamfam/lang_<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
.gif"  alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['ling'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
"/><?php endif; ?><?php endforeach; endif; unset($_from); ?>
                                    <span class="caret"></span></button>
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
                            </div>
                            <?php endif; ?>

<!--
                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "menus/menu.cart.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
-->

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
                                    <li><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
signup/"><?php echo $this->_tpl_vars['lang']['createaccount']; ?>
</a></li>
                                    <li><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['login']; ?>
</a></li>
                                    <?php else: ?>
                                    <li><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/details/"><?php echo $this->_tpl_vars['lang']['manageaccount']; ?>
</a></li>
                                    <li><a href="?action=logout"><?php echo $this->_tpl_vars['lang']['logout']; ?>
</a></li>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['adminlogged']): ?>
                                    <li class="divider"></li>
                                    <li><a  href="<?php echo $this->_tpl_vars['admin_url']; ?>
/index.php<?php if ($this->_tpl_vars['login']['id']): ?>?cmd=clients&amp;action=show&amp;id=<?php echo $this->_tpl_vars['login']['id']; ?>
<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['adminreturn']; ?>
</a></li>
                                    <?php endif; ?>

                                </ul>
                            </div>

                        </div>

                        <h1><?php echo $this->_tpl_vars['business_name']; ?>
</h1>
                        <div class="clear"></div>


                    </div>
                </div>
<!--
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "mainmenu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>


	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "submenu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>


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

-->