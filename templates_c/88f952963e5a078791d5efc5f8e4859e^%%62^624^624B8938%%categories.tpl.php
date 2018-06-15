<?php /* Smarty version 2.6.26, created on 2018-06-11 12:32:42
         compiled from services/categories.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'services/categories.tpl', 58, false),)), $this); ?>

<div class="newhorizontalnav" id="newshelfnav">
    <div class="list-1">
        <ul>
            <li class="<?php if ($this->_tpl_vars['action'] == 'default'): ?>active<?php endif; ?> picked">
                <a href="?cmd=services"><span class="ico money"><?php echo $this->_tpl_vars['lang']['orpages']; ?>
</span></a>
            </li>
            <li class="<?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>active<?php endif; ?> last">
                <a href="?cmd=services&action=addcategory"><span class="ico formn"><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</span></a>
            </li>
        </ul>
    </div>
    <div class="list-2" style="min-height: 15px;">
        <?php if ($this->_tpl_vars['action'] == 'default'): ?>
            <div class="subm1 haveitems">
                <ul>
                    <li>
                        <a href="#archived" onclick="return HBServices.showArcived(), false" >Show Archived Categories</a>
                    </li>
                </ul>
            </div>
        <?php endif; ?>
    </div>
</div>

<div  id="addcategory" style="<?php if ($this->_tpl_vars['action'] != 'addcategory'): ?>display:none<?php endif; ?>">
    <div class="nicerblu">
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "services/category_add_edit.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    </div>
</div>
<div id="listproducts" <?php if ($this->_tpl_vars['action'] != 'default'): ?>style="display:none"<?php endif; ?>>
    <?php if ($this->_tpl_vars['categories']): ?>
        <form id="serializeit" method="post">

            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                <tbody>
                    <tr>
                        <th width="20"></th>
                        <th width="20%"><?php echo $this->_tpl_vars['lang']['Name']; ?>
</th>
                        <th width="120" ><?php echo $this->_tpl_vars['lang']['Products']; ?>
</th>
                        <th ><?php echo $this->_tpl_vars['lang']['ordertype']; ?>
</th>
                        <th width="160">&nbsp;</th>
                    </tr>
                </tbody>
            </table>
            <ul id="grab-sorter" style="width:100%">
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "services/ajax.categories.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </ul>
            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                <tbody>
                    <tr>
                        <th width="20"></th>
                        <th ><a class="editbtn" href="?cmd=services&action=addcategory"><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</a></th>

                    </tr>
                </tbody>
            </table>
            <?php echo smarty_function_securitytoken(array(), $this);?>

        </form>
    <?php else: ?>
        <div class="blank_state blank_services">
            <div class="blank_info">
                <h1><?php echo $this->_tpl_vars['lang']['orpage_blank1']; ?>
</h1>
                <div class="clear"><?php echo $this->_tpl_vars['lang']['orpage_blank1_desc']; ?>
</div>

                <a class="new_add new_menu" href="?cmd=services&action=addcategory"  style="margin-top:10px">
                    <span><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</span></a>
                <div class="clear"></div>

            </div>
        </div>
    <?php endif; ?>
</div>