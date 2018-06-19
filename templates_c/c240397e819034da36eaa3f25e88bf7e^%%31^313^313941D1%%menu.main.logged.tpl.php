<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from menus/menu.main.logged.tpl */ ?>
<ul class="nav nav-tabs">
    <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['dashboard']; ?>
</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/"><?php echo $this->_tpl_vars['lang']['order']; ?>
<b class="caret"></b></a>
        <div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.cart.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div>

    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['services']; ?>
<b class="caret"></b></a>
        <div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.services.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['account']; ?>
<b class="caret"></b></a>
        <div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.account.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div>
    </li>


    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $this->_tpl_vars['ca_url']; ?>
support/"><?php echo $this->_tpl_vars['lang']['support']; ?>
<b class="caret"></b></a>
        <div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.support.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div>
    </li>


    <?php if ($this->_tpl_vars['enableFeatures']['affiliates'] != 'off'): ?>
    <li class="<?php if ($this->_tpl_vars['clientdata']['is_affiliate']): ?>dropdown<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
affiliates/" <?php if ($this->_tpl_vars['clientdata']['is_affiliate']): ?>class="dropdown-toggle" data-toggle="dropdown"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['affiliates']; ?>
<?php if ($this->_tpl_vars['clientdata']['is_affiliate']): ?><b class="caret"></b><?php endif; ?></a>
       <?php if ($this->_tpl_vars['clientdata']['is_affiliate']): ?><div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.affiliates.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div><?php endif; ?>
    </li>
	<?php endif; ?>

    <?php $_from = $this->_tpl_vars['HBaddons']['client_mainmenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['ad']['link']; ?>
/" ><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
    <?php endforeach; endif; unset($_from); ?>
</ul>

