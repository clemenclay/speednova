<?php /* Smarty version 2.6.26, created on 2018-06-19 16:25:00
         compiled from menus/menu.main.notlogged.tpl */ ?>
<ul class="nav nav-tabs">
    <li class="<?php if ($this->_tpl_vars['cmd'] == 'root'): ?><?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
"><?php echo $this->_tpl_vars['lang']['homepage']; ?>
</a></li>
    <li class="<?php if ($this->_tpl_vars['cmd'] == 'cart' || $this->_tpl_vars['cmd'] == 'checkdomain'): ?><?php endif; ?> dropdown">
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
    <li class="<?php if ($this->_tpl_vars['cmd'] == 'tickets' || $this->_tpl_vars['cmd'] == 'chat' || $this->_tpl_vars['cmd'] == 'knowledgebase' || $this->_tpl_vars['cmd'] == 'downloads' || $this->_tpl_vars['cmd'] == 'netstat' || $this->_tpl_vars['cmd'] == 'support'): ?><?php endif; ?> dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php if ($this->_tpl_vars['enableFeatures']['kb'] != 'off'): ?>knowledgebase/<?php else: ?>tickets/new/<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['support']; ?>
<b class="caret"></b></a>
        <div class="dropdown-menu">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'menus/menu.dropdown.support.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </div>
    </li>
    
    <li class="<?php if ($this->_tpl_vars['cmd'] == 'clientarea' || $this->_tpl_vars['cmd'] == 'dns'): ?><?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['clientarea']; ?>
</a></li>
    
    <?php if ($this->_tpl_vars['enableFeatures']['affiliates'] != 'off'): ?>
    <li class="<?php if ($this->_tpl_vars['cmd'] == 'affiliates'): ?><?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
affiliates/"><?php echo $this->_tpl_vars['lang']['affiliates']; ?>
</a></li>
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

