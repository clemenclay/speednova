<?php /* Smarty version 2.6.26, created on 2018-06-19 15:28:55
         compiled from ajax.default.tpl */ ?>
<?php if ($this->_tpl_vars['rss']): ?>
<?php $_from = $this->_tpl_vars['rss']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['feed']):
?>
<a href="<?php echo $this->_tpl_vars['feed']['link']; ?>
" title="<?php echo $this->_tpl_vars['feed']['title']; ?>
" target="_blank"><?php echo $this->_tpl_vars['feed']['title']; ?>
</a><br/>
<span style="color:#B0B0B0;font-size:11px;"><?php echo $this->_tpl_vars['feed']['pubDate']; ?>
</span><br/>
<?php echo $this->_tpl_vars['feed']['description']; ?>
<br/>
<?php endforeach; endif; unset($_from); ?>
<?php endif; ?>