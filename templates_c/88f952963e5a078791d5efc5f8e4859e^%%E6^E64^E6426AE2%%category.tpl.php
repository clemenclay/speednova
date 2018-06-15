<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from services/category.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'services/category.tpl', 100, false),)), $this); ?>

<div class="newhorizontalnav" id="newshelfnav">
    <div class="list-1">
        <ul>
            <li class="<?php if ($this->_tpl_vars['action'] == 'default'): ?>active<?php endif; ?> picked">
                <a href="?cmd=services"><span class="ico money"><?php echo $this->_tpl_vars['lang']['orpages']; ?>
</span></a>
            </li>
            <li class="<?php if ($this->_tpl_vars['action'] == 'category' || $this->_tpl_vars['action'] == 'editcategory'): ?>active<?php endif; ?> picked">
                <a href="?cmd=services"><span class="ico money"><?php echo $this->_tpl_vars['category']['name']; ?>
</span></a>
            </li>
            <li class="<?php if ($this->_tpl_vars['action'] == 'product'): ?>active<?php endif; ?> last">
                <a href="?cmd=services&action=product&id=new&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
"><span class="ico formn"><?php echo $this->_tpl_vars['lang']['addnewproduct']; ?>
</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2" style="min-height: 15px;">
        <?php if ($this->_tpl_vars['action'] == 'category' || $this->_tpl_vars['action'] == 'editcategory'): ?>
            <div class="subm1 haveitems">
                <ul>
                    <li>
                        <a href="?cmd=services&action=editcategory&id=<?php echo $this->_tpl_vars['category']['id']; ?>
" onclick="return HBServices.editcat();"><?php echo $this->_tpl_vars['lang']['editthisorpage']; ?>
</a>
                    </li>

                    <?php if ($this->_tpl_vars['category']['visible'] == 0): ?>
                        <li>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&redirect=cat" 
                               >Show Category</a>
                        </li>
                    <?php elseif ($this->_tpl_vars['category']['visible'] == -1): ?>
                        <li>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&redirect=cat" 
                               >Restore Category</a>
                        </li>
                    <?php else: ?>
                        <li>
                            <a href="?cmd=services&action=toggle&state=hide&id=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&redirect=cat" 
                               >Hide Category</a>
                        </li>

                        <li>
                            <a href="?cmd=services&action=toggle&state=archive&id=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&redirect=cat" 
                               >Archive Category</a>
                        </li>
                    <?php endif; ?>


                    <li>
                        <a href="#archived" onclick="return HBServices.showArcived(), false" >Show Archived Products</a>
                    </li>
                </ul>
            </div>
        <?php endif; ?>
    </div>
</div>
<div class="nicerblu">


    <div id="cinfo1" <?php if ($this->_tpl_vars['action'] != 'editcategory'): ?>style="display:none"<?php endif; ?>>
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "services/category_add_edit.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    </div>

    <span class="tag-filter-container"></span>
    <a class="tag-filter-reset none btn btn-xs btn-primary" href="#">Show all</a>
</div>

<?php if ($this->_tpl_vars['products']): ?>
    <form id="serializeit">
        <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
            <tbody>
                <tr>
                    <th width="20"></th>
                    <th ><?php echo $this->_tpl_vars['lang']['Name']; ?>
</th>
                    <?php if ($this->_tpl_vars['category']['ptype'] != 'DomainsType'): ?>
                        <th width="130"><?php echo $this->_tpl_vars['lang']['Accounts']; ?>
</th>
                        <th width="100"><?php echo $this->_tpl_vars['lang']['stockcontrol']; ?>
</th>
                        <?php else: ?>
                        <th width="130"><?php echo $this->_tpl_vars['lang']['Domains']; ?>
</th>
                    <?php endif; ?>
                    <th width="140"></th>
                    <th width="150">&nbsp;</th>
                </tr>
            </tbody>
        </table>
        <ul id="grab-sorter" style="width:100%">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'services/ajax.category.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </ul>
        <!-- tags -->
        <div id="tagsBox" style="display: none;"><?php $_from = $this->_tpl_vars['alltags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tag']):
?><span class="tag"><?php echo $this->_tpl_vars['tag']; ?>
</span><?php endforeach; endif; unset($_from); ?></div>
        <?php echo '<script>
            HBTags.bindFilter(\'.entry\', \'.tag-filter-container\', \'.tag-filter-reset\');
            </script>'; ?>

            <!-- eof: tags -->

       <div class="blu">
           <a class="btn btn-success btn-sm" href="?cmd=services&action=product&id=new&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
"><?php echo $this->_tpl_vars['lang']['addnewproduct']; ?>
</a>
           <a class="btn btn-default btn-sm" href="?cmd=services&action=updateprices&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
">Bulk price update</a>
           <a class="btn btn-default btn-sm" href="?cmd=services&action=updatetags&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
">Bulk tags update</a>
       </div>

            <?php echo smarty_function_securitytoken(array(), $this);?>

        </form>
        <?php else: ?>
            <div class="blank_state blank_services">
                <div class="blank_info">
                    <h1><?php echo $this->_tpl_vars['lang']['orpage_blank2']; ?>
</h1>

                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><a class="new_add new_menu" href="?cmd=services&action=product&id=new&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
"  style="margin-top:5px"><span><?php echo $this->_tpl_vars['lang']['addnewproduct']; ?>
</span></a>
                            </td>
                            <td></td>
                        </tr>
                    </table>

                    <div class="clear"></div>

                </div>
            </div>

            <?php endif; ?>