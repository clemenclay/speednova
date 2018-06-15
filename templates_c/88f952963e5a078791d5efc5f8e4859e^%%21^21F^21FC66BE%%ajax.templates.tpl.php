<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from services/ajax.templates.tpl */ ?>
<tr>
    <td align="right"  valign="top" style="padding-top:12px;"><strong><?php echo $this->_tpl_vars['lang']['ordertype']; ?>
</strong></td>
    <td valign="top">
        <div id="template_wizard">
            <select name="ptype"  class="inp template" style="font-weight:bold;font-size:14px !important; height: auto;">
                <?php if ($this->_tpl_vars['action'] == 'addcategory'): ?>
                    <option value="0" selected="selected"><?php echo $this->_tpl_vars['lang']['selectone']; ?>
</option>
                <?php endif; ?>
                <?php $_from = $this->_tpl_vars['ptypes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['lptype']):
?>
                    <option value="<?php echo $this->_tpl_vars['lptype']['id']; ?>
" <?php if ($this->_tpl_vars['category']['ptype_id'] == $this->_tpl_vars['lptype']['id'] || ( ! $this->_tpl_vars['category']['ptype_id'] && $this->_tpl_vars['ptype'] == $this->_tpl_vars['lptype']['id'] )): ?>selected="selected"<?php endif; ?>>
                        <?php $this->assign('descr', '_hosting'); ?>
                        <?php $this->assign('bescr', $this->_tpl_vars['lptype']['lptype']); ?>
                        <?php $this->assign('baz', ($this->_tpl_vars['bescr']).($this->_tpl_vars['descr'])); ?>
                        <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>

                        <?php else: ?><?php echo $this->_tpl_vars['lptype']['type']; ?>

                        <?php endif; ?>
                    </option>
                <?php endforeach; endif; unset($_from); ?>
            </select>
            <?php if ($this->_tpl_vars['countinactive']): ?><div class="fs11 tabb" >Note: There are <b><?php echo $this->_tpl_vars['countinactive']; ?>
</b> inactive order types, you can enable them by activating related
                    <a href="?cmd=managemodules&action=hosting" target="_blank">hosting modules</a>
                </div>
            <?php endif; ?>
        </div>
    </td>
    <?php if ($this->_tpl_vars['action'] != 'addcategory'): ?>
        <td rowspan="3" class="gallery" valign="top">
            <?php $_from = $this->_tpl_vars['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['lop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['lop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['t']):
        $this->_foreach['lop']['iteration']++;
?>
                <div id="oo_<?php echo $this->_tpl_vars['t']['hash']; ?>
" style="display:none" class="gal_slide">
                    <?php if ($this->_tpl_vars['t']['thumb']): ?>
                        <div class="gal_itm">
                            <img src="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['t']['thumb']; ?>
" class="thumb" />
                            <?php if ($this->_tpl_vars['t']['img']): ?> <a class="preview" href="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['t']['img']; ?>
" target="_blank"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</a>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['t']['config']): ?><a class="edit" href="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['t']['img']; ?>
" onclick="return HBServices.customize()">Customize</a>
                            <?php endif; ?>
                        </div>
                    <?php endif; ?>
                    <h1 class="hh1">
                        <?php if ($this->_tpl_vars['t']['typespecific']): ?>
                            <?php if ($this->_tpl_vars['t']['name']): ?><?php echo $this->_tpl_vars['t']['name']; ?>

                            <?php else: ?><?php echo $this->_tpl_vars['lang']['typespecificcheckout']; ?>

                            <?php endif; ?>
                        <?php elseif ($this->_tpl_vars['t']['name']): ?><?php echo $this->_tpl_vars['t']['name']; ?>

                        <?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['t']['template']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['t']['template']]; ?>

                        <?php else: ?><?php echo $this->_tpl_vars['t']['template']; ?>

                        <?php endif; ?>
                    </h1>
                    <?php echo $this->_tpl_vars['t']['description']; ?>

                </div>
            <?php endforeach; endif; unset($_from); ?>
        </td>
    </tr>
    <tr>
        <td width="160" align="right" valign="top" style="padding-top:20px;">
            <strong><?php echo $this->_tpl_vars['lang']['ordertemplate']; ?>
</strong>
        </td>
        <td valign="top" style="padding-top:10px;font-size:13px">
            <div class="shownice" style="padding:10px 0px;margin-bottom:5px"> 
                <b>
                    To buy latest templates visit: 
                    <a class="external" target="_blank" href="https://hostbillapp.com/apps/" >Here</a> 
                </b>
            </div>
            Or choose existing: 
            <div id="wiz_options">
                <ul class="opage-list">
                    <?php $_from = $this->_tpl_vars['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['lop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['lop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['templ'] => $this->_tpl_vars['t']):
        $this->_foreach['lop']['iteration']++;
?>
                        <li <?php if ($this->_tpl_vars['t']['hash'] == $this->_tpl_vars['selected']['hash']): ?>class="activated"<?php endif; ?> >
                            <input type="radio" name="otype" value="<?php echo $this->_tpl_vars['t']['file']; ?>
" id="o_<?php echo $this->_tpl_vars['t']['hash']; ?>
" />
                            <img src="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['t']['thumb']; ?>
" class="thumb" />
                            <label for="o_<?php echo $this->_tpl_vars['templ']; ?>
" <?php if ($this->_tpl_vars['t']['custom'] == true): ?>class="tpl-custom"<?php endif; ?>>
                                <?php if ($this->_tpl_vars['t']['custom'] == true): ?>
                                    <?php if ($this->_tpl_vars['t']['name']): ?><?php echo $this->_tpl_vars['t']['name']; ?>

                                    <?php else: ?><?php echo $this->_tpl_vars['lang']['typespecificcheckout']; ?>

                                    <?php endif; ?>
                                <?php elseif ($this->_tpl_vars['t']['name']): ?><?php echo $this->_tpl_vars['t']['name']; ?>

                                <?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['templ']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['templ']]; ?>

                                <?php else: ?><?php echo $this->_tpl_vars['templ']; ?>

                                <?php endif; ?>
                            </label>
                        </li>
                    <?php endforeach; endif; unset($_from); ?>
                </ul>
            </div>
        </td>
    </tr>
    <?php if ($this->_tpl_vars['premade']): ?>
        <tr>
            <td align="right"><strong><?php echo $this->_tpl_vars['lang']['premadeproducts']; ?>
</strong></td>
            <td colspan="2" id="subwiz_opt">
                <span><input type="radio" name="premade" value="0" id="premade00" onclick="HBServices.prswitch('x', this);"/> <label for="premade00"><?php echo $this->_tpl_vars['lang']['none']; ?>
</label> </span>
                    <?php $_from = $this->_tpl_vars['premade']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['fpremade'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fpremade']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['pr']):
        $this->_foreach['fpremade']['iteration']++;
?>
                    <span <?php if (($this->_foreach['fpremade']['iteration'] <= 1)): ?>class="active"<?php endif; ?>>
                        <input type="radio" name="premade" value="<?php echo $this->_tpl_vars['pr']['file']; ?>
" id="premade<?php echo $this->_tpl_vars['k']; ?>
"  <?php if (($this->_foreach['fpremade']['iteration'] <= 1)): ?>checked="checked"<?php endif; ?> onclick="HBServices.prswitch('<?php echo $this->_tpl_vars['k']; ?>
', this);"/>
                        <label for="premade<?php echo $this->_tpl_vars['k']; ?>
"><?php echo $this->_tpl_vars['pr']['name']; ?>
</label>
                    </span>
                <?php endforeach; endif; unset($_from); ?>
            </td>
        </tr>
        <tr>
            <td align="right"></td>
            <td colspan="2">
                <?php $_from = $this->_tpl_vars['premade']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['fpremade'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fpremade']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['pr']):
        $this->_foreach['fpremade']['iteration']++;
?>
                    <div class="pr_desc" <?php if (! ($this->_foreach['fpremade']['iteration'] <= 1)): ?> style="display:none" <?php endif; ?> id="pr_desc<?php echo $this->_tpl_vars['k']; ?>
">
                        <?php echo $this->_tpl_vars['pr']['description']; ?>

                    </div>
                <?php endforeach; endif; unset($_from); ?>
            </td>
        </tr>
    <?php endif; ?>
<?php endif; ?>