<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from services.tpl */ ?>
<script type="text/javascript">
    loadelements.services = true;
</script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jquery.dragsort-0.3.10.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/services.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/hbtags.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" <?php if ($this->_tpl_vars['currentfilter']): ?>class="searchon"<?php endif; ?>>
    <tr>
        <td ><h3><?php echo $this->_tpl_vars['lang']['productsandservices']; ?>
</h3></td>
        <td>

            <?php if ($this->_tpl_vars['action'] == 'product'): ?>
                <div class="breadcrumbs">

                <a href="?cmd=services"  class="tload2"><?php echo $this->_tpl_vars['lang']['orpages']; ?>
</a>
                    &raquo; <a href="?cmd=services&action=category&id=<?php echo $this->_tpl_vars['product']['category_id']; ?>
"  class="tload2">
                        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c']):
?><?php if ($this->_tpl_vars['c']['id'] == $this->_tpl_vars['product']['category_id']): ?><?php echo $this->_tpl_vars['c']['name']; ?>
<?php endif; ?><?php endforeach; endif; unset($_from); ?>
                    </a>
                    &raquo; <strong><?php if (! $this->_tpl_vars['product']['name']): ?><?php echo $this->_tpl_vars['lang']['addnewproduct']; ?>
<?php else: ?><?php echo $this->_tpl_vars['product']['name']; ?>
<?php endif; ?>

                </div>
            <?php endif; ?>
        </td>
    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=services&action=addcategory"  class="tstyled btn btn-success <?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>selected<?php endif; ?>"  ><strong><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</strong></a> <br />
            <a href="?cmd=services"  class="tstyled <?php if ($this->_tpl_vars['action'] == 'default' || $this->_tpl_vars['action'] == 'category' || $this->_tpl_vars['action'] == 'editcategory' || $this->_tpl_vars['action'] == 'product'): ?>selected<?php endif; ?> defclass"><?php echo $this->_tpl_vars['lang']['orpages']; ?>
</a>
            <a href="?cmd=productaddons"  class="tstyled"><?php echo $this->_tpl_vars['lang']['manageaddons']; ?>
</a>
        </td>
        <td  valign="top"  class="bordered" rowspan="2"><div id="bodycont">
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.services.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
        </td>
    </tr>
</table>
