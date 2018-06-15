<?php /* Smarty version 2.6.26, created on 2018-06-14 09:57:00
         compiled from C:%5Cxampp%5Chtdocs%5Chostbill%5Ctemplates%5Cspeednova%5C/ajax.signup.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'htmlspecialchars', 'C:\\xampp\\htdocs\\hostbill\\templates\\speednova\\/ajax.signup.tpl', 24, false),array('modifier', 'escape', 'C:\\xampp\\htdocs\\hostbill\\templates\\speednova\\/ajax.signup.tpl', 59, false),)), $this); ?>
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin:15px 0px">
    <tr>
        <td valign="top" width="50%">
            <table cellpadding="0" cellspacing="0" width="100%" class="newchecker">
                <tbody>
                    <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['field']):
        $this->_foreach['floop']['iteration']++;
?>
                        <?php if ($this->_foreach['floop']['iteration'] > ( $this->_foreach['floop']['total']/2 )): ?><?php break; ?><?php endif; ?>
                        
                        <tr height="46"  <?php if ($this->_tpl_vars['field']['type'] == 'Company' && $this->_tpl_vars['fields']['type']): ?>class="iscomp" style="<?php if (! $this->_tpl_vars['submit']['type'] || $this->_tpl_vars['submit']['type'] == 'Private'): ?>display:none<?php endif; ?>"
                            <?php elseif ($this->_tpl_vars['field']['type'] == 'Private' && $this->_tpl_vars['fields']['type']): ?>class="ispr" style="<?php if ($this->_tpl_vars['submit']['type'] == 'Company'): ?>display:none<?php endif; ?>" <?php endif; ?>>
                            <td class="<?php if ($this->_foreach['floop']['iteration'] > 0): ?>bord<?php endif; ?>"> <label for="field_<?php echo $this->_tpl_vars['k']; ?>
" >
                                    <?php if ($this->_tpl_vars['k'] == 'type'): ?>
                                        <?php echo $this->_tpl_vars['lang']['clacctype']; ?>

                                    <?php elseif ($this->_tpl_vars['field']['options'] & 1): ?>
                                        <?php if ($this->_tpl_vars['k'] == 'password' && $this->_tpl_vars['action'] == 'edit'): ?>
                                            <?php echo $this->_tpl_vars['lang']['newpassword']; ?>

                                            <?php else: ?>
                                        <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['k']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['field']['name']; ?>
<?php endif; ?>
                                            <?php endif; ?>
                                    <?php else: ?>
                                        <?php echo $this->_tpl_vars['field']['name']; ?>

                                    <?php endif; ?>
                                    <?php if (( $this->_tpl_vars['field']['options'] & 2 ) && ! ( $this->_tpl_vars['k'] == 'password' && $this->_tpl_vars['action'] == 'edit' )): ?>*<?php endif; ?>
                                    <?php if ($this->_tpl_vars['field']['description']): ?><span class="vtip_description" title="<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['description'])) ? $this->_run_mod_handler('htmlspecialchars', true, $_tmp) : htmlspecialchars($_tmp)); ?>
"></span><?php endif; ?>
                                </label>
                                <?php if ($this->_tpl_vars['k'] == 'type'): ?>
                                    <select  id="field_<?php echo $this->_tpl_vars['k']; ?>
" name="type" style="width: 90%;" onchange="<?php echo 'if ($(this).val()==\'Private\') {$(\'.iscomp\').hide();$(\'.ispr\').show();}else {$(\'.ispr\').hide();$(\'.iscomp\').show();}'; ?>
">
                                        <option value="Private" <?php if ($this->_tpl_vars['submit']['type'] == 'Private'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Private']; ?>
</option>
                                        <option value="Company" <?php if ($this->_tpl_vars['submit']['type'] == 'Company'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Company']; ?>
</option>
                                    </select>
                                <?php elseif ($this->_tpl_vars['k'] == 'country'): ?>
                                    <select name="country" style="width: 90%;" id="field_<?php echo $this->_tpl_vars['k']; ?>
" class="chzn-select">
                                        <?php $_from = $this->_tpl_vars['countries']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                            <option value="<?php echo $this->_tpl_vars['k']; ?>
" <?php if ($this->_tpl_vars['k'] == $this->_tpl_vars['submit']['country'] || ( ! $this->_tpl_vars['submit']['country'] && $this->_tpl_vars['k'] == $this->_tpl_vars['defaultCountry'] )): ?> selected="Selected"<?php endif; ?>><?php echo $this->_tpl_vars['v']; ?>
</option>
                                        <?php endforeach; endif; unset($_from); ?>
                                    </select>
                                <?php else: ?>
                                    <?php if ($this->_tpl_vars['field']['field_type'] == 'Input'): ?>
                                        <?php if ($this->_tpl_vars['k'] == 'captcha'): ?>
                                            <div style="white-space: nowrap;">
                                                <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#<?php echo $this->_tpl_vars['stamp']; ?>
" /> 
                                                <span style="display: inline-block; width: 65%; white-space: normal;">
                                                    <?php echo $this->_tpl_vars['lang']['typethecharacters']; ?>
<br />
                                                    <a href="#" onclick="return singup_image_reload();" ><?php echo $this->_tpl_vars['lang']['refresh']; ?>
</a>
                                                </span>
                                            </div>
                                        <?php endif; ?>
                                        <input type="text" value="<?php echo $this->_tpl_vars['submit'][$this->_tpl_vars['k']]; ?>
" style="width: 90%;" name="<?php echo $this->_tpl_vars['k']; ?>
" class="" id="field_<?php echo $this->_tpl_vars['k']; ?>
" />
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Password'): ?>
                                        <input type="password" autocomplete="off" value="" style="width: 90%;" name="<?php echo $this->_tpl_vars['k']; ?>
" class="" id="field_<?php echo $this->_tpl_vars['k']; ?>
" />
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Select'): ?>
                                        <select name="<?php echo $this->_tpl_vars['k']; ?>
" style="width: 90%;" id="field_<?php echo $this->_tpl_vars['k']; ?>
" >
                                            <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                                                <option <?php if ($this->_tpl_vars['submit'][$this->_tpl_vars['k']] == $this->_tpl_vars['fa']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['fa']; ?>
</option>
                                            <?php endforeach; endif; unset($_from); ?>
                                        </select>
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Check'): ?>
                                        <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                                            <input type="checkbox" name="<?php echo $this->_tpl_vars['k']; ?>
[<?php echo ((is_array($_tmp=$this->_tpl_vars['fa'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
]" <?php if ($this->_tpl_vars['submit'][$this->_tpl_vars['k']][$this->_tpl_vars['fa']]): ?>checked="checked"<?php endif; ?> value="1" /><?php echo $this->_tpl_vars['fa']; ?>
<br />
                                        <?php endforeach; endif; unset($_from); ?>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; endif; unset($_from); ?>
                </tbody>
            </table>
        </td>
        <td valign="top" width="50%">
            <table cellpadding="0" cellspacing="0" width="100%" class="newchecker">
                <tbody>
                    <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['field']):
        $this->_foreach['floop']['iteration']++;
?>
                        <?php if ($this->_foreach['floop']['iteration'] <= ( $this->_foreach['floop']['total']/2 )): ?><?php continue; ?><?php endif; ?>
                        
                        <tr height="46" <?php if ($this->_tpl_vars['field']['type'] == 'Company' && $this->_tpl_vars['fields']['type']): ?>class="iscomp" style="<?php if (! $this->_tpl_vars['submit']['type'] || $this->_tpl_vars['submit']['type'] == 'Private'): ?>display:none<?php endif; ?>"
                            <?php elseif ($this->_tpl_vars['field']['type'] == 'Private' && $this->_tpl_vars['fields']['type']): ?>class="ispr" style="<?php if ($this->_tpl_vars['submit']['type'] == 'Company'): ?>display:none<?php endif; ?>" <?php endif; ?>>
                            <td class=""> 
                                <label for="field_<?php echo $this->_tpl_vars['k']; ?>
" >
                                    <?php if ($this->_tpl_vars['k'] == 'type'): ?>
                                        <?php echo $this->_tpl_vars['lang']['clacctype']; ?>

                                    <?php elseif ($this->_tpl_vars['field']['options'] & 1): ?>
                                        <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['k']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['field']['name']; ?>
<?php endif; ?>
                                    <?php else: ?>
                                        <?php echo $this->_tpl_vars['field']['name']; ?>

                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['field']['options'] & 2): ?>*<?php endif; ?>
                                    <?php if ($this->_tpl_vars['field']['description']): ?><span class="vtip_description" title="<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['description'])) ? $this->_run_mod_handler('htmlspecialchars', true, $_tmp) : htmlspecialchars($_tmp)); ?>
"></span><?php endif; ?>
                                </label>
                                <?php if ($this->_tpl_vars['k'] == 'type'): ?>
                                    <select  id="field_<?php echo $this->_tpl_vars['k']; ?>
"  name="type" style="width: 90%;" onchange="<?php echo 'if ($(this).val()==\'Private\') {$(\'.iscomp\').hide();$(\'.ispr\').show();}else {$(\'.ispr\').hide();$(\'.iscomp\').show();}'; ?>
">
                                        <option value="Private" <?php if ($this->_tpl_vars['submit']['type'] == 'Private'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Private']; ?>
</option>
                                        <option value="Company" <?php if ($this->_tpl_vars['submit']['type'] == 'Company'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Company']; ?>
</option>
                                    </select>
                                <?php elseif ($this->_tpl_vars['k'] == 'country'): ?>
                                    <select name="country" style="width: 90%;" id="field_<?php echo $this->_tpl_vars['k']; ?>
"  class="chzn-select">
                                        <?php $_from = $this->_tpl_vars['countries']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                            <option value="<?php echo $this->_tpl_vars['k']; ?>
" <?php if ($this->_tpl_vars['k'] == $this->_tpl_vars['submit']['country'] || ( ! $this->_tpl_vars['submit']['country'] && $this->_tpl_vars['k'] == $this->_tpl_vars['defaultCountry'] )): ?> selected="Selected"<?php endif; ?>><?php echo $this->_tpl_vars['v']; ?>
</option>

                                        <?php endforeach; endif; unset($_from); ?>
                                    </select>
                                <?php else: ?>
                                    <?php if ($this->_tpl_vars['field']['field_type'] == 'Input'): ?>
                                        <?php if ($this->_tpl_vars['k'] == 'captcha'): ?>
                                            <div style="white-space: nowrap;">
                                                <img class="capcha" style="width: 120px; height: 60px;" src="?cmd=root&action=captcha#<?php echo $this->_tpl_vars['stamp']; ?>
" /> 
                                                <span style="display: inline-block; width: 65%; white-space: normal;">
                                                    <?php echo $this->_tpl_vars['lang']['typethecharacters']; ?>
<br />
                                                    <a href="#" onclick="return singup_image_reload();" ><?php echo $this->_tpl_vars['lang']['refresh']; ?>
</a>
                                                </span>
                                            </div>
                                        <?php endif; ?>
                                        <input type="text" value="<?php echo $this->_tpl_vars['submit'][$this->_tpl_vars['k']]; ?>
" style="width: 90%;" name="<?php echo $this->_tpl_vars['k']; ?>
" class="" id="field_<?php echo $this->_tpl_vars['k']; ?>
" />
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Password'): ?>
                                        <input type="password" autocomplete="off" value="" style="width: 90%;" name="<?php echo $this->_tpl_vars['k']; ?>
" class="" id="field_<?php echo $this->_tpl_vars['k']; ?>
" />
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Select'): ?>
                                        <select name="<?php echo $this->_tpl_vars['k']; ?>
" style="width: 90%;" id="field_<?php echo $this->_tpl_vars['k']; ?>
" >
                                            <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                                                <option <?php if ($this->_tpl_vars['submit'][$this->_tpl_vars['k']] == $this->_tpl_vars['fa']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['fa']; ?>
</option>
                                            <?php endforeach; endif; unset($_from); ?>
                                        </select>
                                    <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Check'): ?>
                                        <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                                            <input type="checkbox" name="<?php echo $this->_tpl_vars['k']; ?>
[<?php echo ((is_array($_tmp=$this->_tpl_vars['fa'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
]" <?php if ($this->_tpl_vars['submit'][$this->_tpl_vars['k']][$this->_tpl_vars['fa']]): ?>checked="checked"<?php endif; ?> value="1" /><?php echo $this->_tpl_vars['fa']; ?>
<br />
                                        <?php endforeach; endif; unset($_from); ?>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; endif; unset($_from); ?>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/chosen.min.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
../common/js/singup.js"></script>


