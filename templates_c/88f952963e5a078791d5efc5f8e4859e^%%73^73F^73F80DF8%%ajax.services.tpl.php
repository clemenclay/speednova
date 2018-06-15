<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from ajax.services.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'price', 'ajax.services.tpl', 116, false),array('modifier', 'default', 'ajax.services.tpl', 118, false),array('function', 'securitytoken', 'ajax.services.tpl', 130, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'default' || $this->_tpl_vars['action'] == 'addcategory' || $this->_tpl_vars['action'] == 'editcategory' || $this->_tpl_vars['action'] == 'category'): ?>
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/tiny_mce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/jquery.tinymce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
<?php endif; ?>
<?php if (( $this->_tpl_vars['action'] == 'category' || $this->_tpl_vars['action'] == 'editcategory' ) && $this->_tpl_vars['category']): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'services/category.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php elseif ($this->_tpl_vars['action'] == 'default' || $this->_tpl_vars['action'] == 'addproduct' || $this->_tpl_vars['action'] == 'addcategory'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "services/categories.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php elseif ($this->_tpl_vars['action'] == 'newpageextra'): ?>

<?php elseif ($this->_tpl_vars['action'] == 'addonseditor'): ?>
    <?php if ($this->_tpl_vars['addons']['addons'] || $this->_tpl_vars['addons']['applied']): ?><?php if ($this->_tpl_vars['addons']['applied']): ?><div class="p5">

                <table border="0" cellpadding="6" cellspacing="0" width="100%" >

                    <?php $_from = $this->_tpl_vars['addons']['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['f']):
?>
                        <?php if ($this->_tpl_vars['f']['assigned']): ?><tr class="havecontrols">
                                <td width="16">
                                    <div class="controls"><a href="#" class="rembtn"  onclick="return removeadd('<?php echo $this->_tpl_vars['f']['id']; ?>
')"><?php echo $this->_tpl_vars['lang']['Remove']; ?>
</a></div></td>
                                <td align="left"><?php echo $this->_tpl_vars['lang']['Addon']; ?>
: <strong><?php echo $this->_tpl_vars['f']['name']; ?>
</strong>
                                </td>
                                <td align="right">
                                    <div class="controls fs11">
                                        <?php echo $this->_tpl_vars['lang']['goto']; ?>

                                        <a href="?cmd=productaddons&action=addon&id=<?php echo $this->_tpl_vars['f']['id']; ?>
" class="editbtn editgray" style="float:none" target="_blank"><?php echo $this->_tpl_vars['lang']['addonpage']; ?>
</a>
                                    </div>
                                </td>
                            </tr>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>
                </table>
            </div>
            <div style="padding:10px 4px">
                <?php if ($this->_tpl_vars['addons']['available']): ?>
                    <a href="#" class="new_control" onclick="$(this).hide();
                            $('#addnew_addons').ShowNicely();
                            return false;"  id="addnew_addon_btn">
                        <span class="addsth" ><?php echo $this->_tpl_vars['lang']['assign_new_addons']; ?>
</span>
                    </a>
                <?php endif; ?>
            </div>
        <?php else: ?>
            <div class="blank_state_smaller blank_forms">
                <div class="blank_info">
                    <h3><?php echo $this->_tpl_vars['lang']['offeraddons']; ?>
</h3>
                    <div class="clear"></div>
                    <br/>
                    <?php if ($this->_tpl_vars['addons']['available']): ?>
                        <a  href="#" class="new_control"  onclick="$('#addnew_addons').ShowNicely();
                                return false;" ><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['assign_new_addons']; ?>
</strong></span></a>
                                <?php else: ?>
                        <a href="?cmd=productaddons&action=addon&id=new"class="new_control"   target="_blank"><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['createnewaddon']; ?>
</strong></span></a>
                                <?php endif; ?>
                    <div class="clear"></div>
                </div>
            </div>
        <?php endif; ?>

        <?php if ($this->_tpl_vars['addons']['available']): ?>
            <div class="p6" id="addnew_addons" <?php if ($this->_tpl_vars['addons']['applied']): ?>style="display:none"<?php endif; ?>>
                <table  cellpadding="3" cellspacing="0">
                    <tr>
                        <td>
                            <?php echo $this->_tpl_vars['lang']['Addon']; ?>
: <select name="addon_id">
                                <?php $_from = $this->_tpl_vars['addons']['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['f']):
?>
                                    <?php if (! $this->_tpl_vars['f']['assigned']): ?>
                                        <option value="<?php echo $this->_tpl_vars['f']['id']; ?>
"><?php echo $this->_tpl_vars['f']['name']; ?>
</option>
                                    <?php endif; ?>
                                <?php endforeach; endif; unset($_from); ?>
                            </select>
                        </td>
                        <td >
                            <input type="button" value="<?php echo $this->_tpl_vars['lang']['Add']; ?>
" style="font-weight:bold" onclick="return addadd()"/>
                            <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> <a href="#" onclick="$('#addnew_addons').hide();
                                    $('#addnew_addon_btn').show(); return false;" class="editbtn"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a>
                        </td>
                    </tr>

                </table>
            </div>
        <?php endif; ?>
    <?php else: ?>

        <div class="blank_state_smaller blank_forms">
            <div class="blank_info">
                <h3><?php echo $this->_tpl_vars['lang']['noaddonsyet']; ?>
</h3>
                <div class="clear"></div>
            </div>
        </div>
    <?php endif; ?>
    <?php echo '
        <script type="text/javascript">
            $(\'#addonsditor_content .havecontrols\').hover(function () {
                $(this).find(\'.controls\').show();
            }, function () {
                $(this).find(\'.controls\').hide();
            });
        </script>
    '; ?>


<?php elseif ($this->_tpl_vars['action'] == 'product'): ?>

    <form action="" method="post" name="productedit" id="productedit" onsubmit="selectalladdons()" enctype="multipart/form-data">
        <input type="hidden" name="make" value="editproduct"/>
        <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['product']['id']; ?>
"/>

        <div>
            <?php if ($this->_tpl_vars['maintpl']): ?>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['maintpl'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            <?php else: ?>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'newservices.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            <?php endif; ?>
        </div>

        <script type="text/javascript">
                var zero_value = '<?php echo ((is_array($_tmp=0)) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false, false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false, false)); ?>
';
                var picked = <?php echo '{'; ?>

                    main: <?php echo ((is_array($_tmp=@$this->_tpl_vars['picked_tab'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
,
                    sub: <?php echo ((is_array($_tmp=@$this->_tpl_vars['picked_subtab'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>

            <?php echo '};'; ?>

        </script>

        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/services_product.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/gui.elements.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
js/gui.elements.css" type="text/css" />
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/tiny_mce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/jquery.tinymce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>


        <?php echo smarty_function_securitytoken(array(), $this);?>
</form>

<?php elseif ($this->_tpl_vars['action'] == 'updatetags'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'services/ajax.updatetags.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php elseif ($this->_tpl_vars['action'] == 'updateprices'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'services/ajax.updateprices.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>