<?php /* Smarty version 2.6.26, created on 2018-06-19 16:25:00
         compiled from notifications.tpl */ ?>
<div class="clear"></div>
<div id="errors" <?php if ($this->_tpl_vars['error']): ?>style="display:block"<?php endif; ?>>
     <div class="alert alert-error">
        <a class="close" >&times;</a>
        <?php if ($this->_tpl_vars['error']): ?>
        <?php $_from = $this->_tpl_vars['error']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['blad']):
?><?php echo $this->_tpl_vars['blad']; ?>
<br/><?php endforeach; endif; unset($_from); ?>
        <?php endif; ?>                </div>

</div>

<div id="infos"  <?php if ($this->_tpl_vars['info']): ?>style="display:block"<?php endif; ?>>

     <div class="alert alert-info">
        <a class="close" >&times;</a>
        <?php if ($this->_tpl_vars['info']): ?>
        <?php $_from = $this->_tpl_vars['info']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['infos']):
?><?php echo $this->_tpl_vars['infos']; ?>
<br/><?php endforeach; endif; unset($_from); ?>
        <?php endif; ?>
    </div>
</div>