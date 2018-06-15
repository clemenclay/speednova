<?php /* Smarty version 2.6.26, created on 2018-06-11 12:09:44
         compiled from productaddons.tpl */ ?>
<script type="text/javascript">loadelements.services=true;</script>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" <?php if ($this->_tpl_vars['currentfilter']): ?>class="searchon"<?php endif; ?>>
                                                                          <tr>
        <td ><h3><?php echo $this->_tpl_vars['lang']['productsandaddons']; ?>
</h3></td>
        <td></td>
    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=services&action=addcategory"  class="tstyled "><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</a> <br />
            <a href="?cmd=services"  class="tstyled"><?php echo $this->_tpl_vars['lang']['orpages']; ?>
</a>
            <a href="?cmd=productaddons"  class="tstyled <?php if ($this->_tpl_vars['action'] != 'categories' && $this->_tpl_vars['action'] != 'category' && $this->_tpl_vars['action'] != 'addcategory'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['manageaddons']; ?>
</a>
        </td>
        <td  valign="top"  class="bordered" rowspan="2"><div id="bodycont">
       	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.productaddons.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

            </div></td>
    </tr>
</table><script type="text/javascript">
    <?php echo '
    function showhid(el) {
        if ($(el).val()==\'Free\') {
            $(\'.prices\').hide();
        } else {
            $(\'.prices\').show();
        }
 
    }
    function un_c(el) {
        if ($(el).attr(\'class\')==\'catA\' && $(el).is(\':checked\'))  {
            $(\'.prodA\').attr(\'checked\',false);
        } else if ($(el).attr(\'class\')==\'prodA\' && $(el).is(\':checked\')) {
            $(\'.catA\').attr(\'checked\',false);
        }
    }
    function selectalladdons() {
        for (var i = 0; i < $(\'#listAlready\')[0].options.length; i++) {
            $(\'#listAlready\')[0].options[i].selected = true;
        }

    }
			
    '; ?>

</script>