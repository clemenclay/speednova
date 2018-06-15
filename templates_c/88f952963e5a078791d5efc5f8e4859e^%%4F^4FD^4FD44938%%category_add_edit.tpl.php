<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from services/category_add_edit.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'hbinput', 'services/category_add_edit.tpl', 14, false),array('function', 'hbwysiwyg', 'services/category_add_edit.tpl', 55, false),array('function', 'securitytoken', 'services/category_add_edit.tpl', 97, false),array('modifier', 'checkcondition', 'services/category_add_edit.tpl', 38, false),)), $this); ?>
<form action="" name="" method="post" enctype="multipart/form-data">
    <?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>
        <input type="hidden" name="make" value="addcategory" id="addcategory"/>
    <?php else: ?>
        <input type="hidden" name="make" value="editcategory"/>
        <input type="hidden" name="cat_id" id="category_id" value="<?php echo $this->_tpl_vars['category']['id']; ?>
"/>
    <?php endif; ?>

    <table border="0" cellpadding="6" cellspacing="0" width="100%">
        <tbody>
            <tr class="step0">
                <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Name']; ?>
:</strong></td>
                <td width="400">
                    <?php echo smarty_function_hbinput(array('value' => $this->_tpl_vars['category']['tag_name'],'style' => "font-size: 16px !important; font-weight: bold;",'class' => 'inp','size' => '60','name' => 'name','id' => 'categoryname'), $this);?>

                </td>
                <td></td>
            </tr>
        </tbody>
        <tbody id="hints">
            <tr >
                <td width="160" align="right" class="fs11"><?php echo $this->_tpl_vars['lang']['orderpageurl']; ?>
 </td>
                <td class="fs11" colspan="2">
                    <?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>
                        <span><?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['ca_url']; ?>
cart/</span><span class="changemeurl"><?php echo $this->_tpl_vars['category']['slug']; ?>
</span>
                    <?php else: ?>
                        <a href="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<?php echo $this->_tpl_vars['category']['slug']; ?>
/" target="_blank"><?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<span class="changemeurl"><?php echo $this->_tpl_vars['category']['slug']; ?>
</span>
                        </a>
                    <?php endif; ?>
                    <input  name="slug" type="text" class="" value="<?php echo $this->_tpl_vars['category']['slug']; ?>
" id="category_slug_edit" style="display:none" />
                    <a class="editbtn" onclick="return HBServices.editslug(this)" href="#"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a>
                </td>
            </tr>
        </tbody>
        <tbody id="template_descriptions" class="step1">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "services/ajax.templates.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </tbody>
        <tbody>
            <?php if (((is_array($_tmp="config:EnableQuote:on")) ? $this->_run_mod_handler('checkcondition', true, $_tmp) : smarty_modifier_checkcondition($_tmp))): ?>
                <tr class="step1">
                    <td width="160" align="right" valign="top" style="padding-top:12px;">
                        <strong>Order handler</strong>
                    </td>
                    <td valign="top">
                        <select name="options[order_handler]" class="inp" >
                            <option value="0">Regular order (default)</option>
                            <option <?php if (((is_array($_tmp="config:EnabledQuote:".($this->_tpl_vars['category']['id']))) ? $this->_run_mod_handler('checkcondition', true, $_tmp) : smarty_modifier_checkcondition($_tmp))): ?>selected="selected"<?php endif; ?> value="2">Generate draft (hide prices)</option>
                        </select>
                    </td>
                </tr>
            <?php endif; ?>
            <tr class="step1">
                <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
:</strong></td>
                <td colspan="2">
                    <?php if ($this->_tpl_vars['category']['description'] != ''): ?>
                        <?php echo smarty_function_hbwysiwyg(array('wrapper' => 'div','value' => $this->_tpl_vars['category']['tag_description'],'style' => "width:99%;",'class' => 'inp wysiw_editor','cols' => '100','rows' => '6','id' => 'prod_desc','name' => 'description','featureset' => 'simple'), $this);?>

                    <?php else: ?>
                        <a href="#" onclick="$(this).hide();
                                $('#prod_desc_c').show();
                                return false;"><strong><?php echo $this->_tpl_vars['lang']['adddescription']; ?>
</strong></a>
                        <div id="prod_desc_c" style="display:none"><?php echo smarty_function_hbwysiwyg(array('wrapper' => 'div','value' => $this->_tpl_vars['category']['tag_description'],'style' => "width:99%;",'class' => 'inp wysiw_editor','cols' => '100','rows' => '6','id' => 'prod_desc','name' => 'description','featureset' => 'simple'), $this);?>
</div>
                    <?php endif; ?>
                </td>
            </tr>
            <tr class="step1">
                <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Advanced']; ?>
:</strong></td>
                <td colspan="2">
                    <a href="#" onclick="$('#advanced_scenarios').show();
                            $(this).hide();
                            return false;"><?php echo $this->_tpl_vars['lang']['show_advanced']; ?>
</a>
                    <div id="advanced_scenarios" style="display:none">
                        <strong><?php echo $this->_tpl_vars['lang']['order_scenario']; ?>
:</strong> <a class="editbtn" href="?cmd=configuration&action=orderscenarios" target="_blank">[?]</a>
                        <select name="scenario" class="inp">
                            <?php $_from = $this->_tpl_vars['scenarios']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['scloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['scloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['scenario']):
        $this->_foreach['scloop']['iteration']++;
?>
                                <option value="<?php echo $this->_tpl_vars['scenario']['id']; ?>
" <?php if ($this->_tpl_vars['category']['scenario_id'] == $this->_tpl_vars['scenario']['id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['scenario']['name']; ?>
</option>
                            <?php endforeach; endif; unset($_from); ?>
                        </select>
                    </div>
                </td>
            </tr>
        </tbody>


    </table>

    <p align="center">
        <?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>
            <input type="submit" value="<?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
" class=" btn btn-primary" disabled="disabled" id="submitbtn"/>
            <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> <a href="?cmd=services"  class="editbtn"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a>
        <?php else: ?>
            <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" class="submitme" />
            <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> 
            <a href="?cmd=services"  class="editbtn" onclick="$('#cinfo1').toggle();
                    $('#cinfo0').toggle();
                    return false;"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a>
        <?php endif; ?>
    </p>
    <?php echo smarty_function_securitytoken(array(), $this);?>

</form>