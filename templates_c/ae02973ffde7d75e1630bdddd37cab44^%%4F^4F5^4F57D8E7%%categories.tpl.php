<?php /* Smarty version 2.6.26, created on 2018-06-11 12:14:19
         compiled from cart_rotatebox/categories.tpl */ ?>
<div id="menu">
    <ul>
        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
        <?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?>
        <li><a href="javascript:void();" class="active"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
        <?php else: ?>
        <li><a href="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<?php echo $this->_tpl_vars['i']['slug']; ?>
/&amp;step=<?php echo $this->_tpl_vars['step']; ?>
<?php if ($this->_tpl_vars['addhosting']): ?>&amp;addhosting=1<?php endif; ?>"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
        <?php endif; ?>

        <?php if (! ($this->_foreach['cats']['iteration'] == $this->_foreach['cats']['total'])): ?><li class="separator"></li><?php endif; ?>
        
        <?php endforeach; endif; unset($_from); ?>
    </ul>
</div>

<div class="clearfix"></div>