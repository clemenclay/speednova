<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:07
         compiled from adminwidgets/wrap_dashboard.tpl */ ?>
<div class="box box-primary <?php echo $this->_tpl_vars['widget']['class']; ?>
 <?php if ($this->_tpl_vars['widget']['metadata']['collapsed']): ?>collapsed-box<?php endif; ?>" data-is-widget="true" data-widget-id="<?php echo $this->_tpl_vars['widget']['ns']; ?>
.<?php echo $this->_tpl_vars['widget']['key']; ?>
" <?php if ($this->_tpl_vars['widget']['metadata']['autorefresh']): ?>data-widget-autorefresh="<?php echo $this->_tpl_vars['widget']['metadata']['autorefresh']; ?>
"<?php endif; ?>>
    <div class="box-header" >

        <h3 class="box-title"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['widget']['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['widget']['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['widget']['name']; ?>
<?php endif; ?> <?php echo $this->_tpl_vars['widget']['header']; ?>
</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-sm btn-default box-widget-autorefresh" data-widget="autorefresh"><i class="fa fa-cog"></i></button>
            <button type="button" class="btn btn-sm btn-default box-widget-refresh" data-widget="refresh"><i class="fa fa-refresh"></i></button>
            <button type="button" class="btn btn-sm btn-default box-widget-expand" data-widget="expand"><i class="fa fa-expand"></i></button>
            <button type="button" class="btn btn-sm btn-default box-widget-collapse" data-widget="collapse"><i class="fa <?php if ($this->_tpl_vars['widget']['metadata']['collapsed']): ?>fa-plus<?php else: ?>fa-minus<?php endif; ?>"></i></button>
            <button type="button" class="btn btn-sm btn-default box-widget-remove" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <div class="box-body">
        <?php if ($this->_tpl_vars['widget']['template']): ?>
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['widget']['template'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        <?php elseif ($this->_tpl_vars['widget']['html']): ?>
            <?php echo $this->_tpl_vars['widget']['html']; ?>

        <?php endif; ?>
    </div>
    <?php if ($this->_tpl_vars['widget']['footer']): ?>
        <div class="box-footer clearfix no-border">
            <?php echo $this->_tpl_vars['widget']['footer']; ?>

        </div>
    <?php endif; ?>
</div>