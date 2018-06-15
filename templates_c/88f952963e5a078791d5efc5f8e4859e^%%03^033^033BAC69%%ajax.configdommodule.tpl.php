<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from ajax.configdommodule.tpl */ ?>
 <?php if ($this->_tpl_vars['product']['app_id']): ?><input type="hidden" value="<?php echo $this->_tpl_vars['product']['app_id']; ?>
" name="app_id" />
 <?php elseif ($this->_tpl_vars['product']['module']): ?>
<div id="prod_serverform" <?php if ($this->_tpl_vars['modconfig'] && ! $this->_tpl_vars['modconfig']['config']): ?>style="display: none"<?php endif; ?>  class="sectionheadblue prod_serverform">
                             <div style="font-size: 14px"><strong>Enter App details</strong></div>
                             <input name="addserver" value="<?php if ($this->_tpl_vars['server_values']['addserver'] || ! $this->_tpl_vars['servers']): ?>1<?php else: ?>0<?php endif; ?>" type="hidden" />

                        <table border="0" cellpadding="0" cellspacing="6" width="100%" style="margin-bottom:10px;">

                            <?php $_from = $this->_tpl_vars['modconfig']['config']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['conf']):
?>
                        <tr >

                            <?php $this->assign('name', $this->_tpl_vars['k']); ?>
                            <?php $this->assign('name2', $this->_tpl_vars['modconfig']['module']); ?>
                            <?php $this->assign('baz', ($this->_tpl_vars['name2']).($this->_tpl_vars['name'])); ?>
                             <td align="right" width="165"><strong><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</strong></td>
                            <?php if ($this->_tpl_vars['conf']['type'] == 'input'): ?>

                                     <td ><input type="text" name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" class="inp toserialize"/></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'password'): ?>
                                   <td ><input type="password" autocomplete="off" name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
"  class="inp toserialize"/></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'check'): ?>
                                  <td ><input name="option[<?php echo $this->_tpl_vars['k']; ?>
]" type="checkbox" value="1" class="toserialize" <?php if ($this->_tpl_vars['conf']['value'] == '1'): ?>checked="checked"<?php endif; ?> style="margin:0px"  /></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'select'): ?>
                                <td ><select name="option[<?php echo $this->_tpl_vars['k']; ?>
]"  class="inp toserialize" >
                                    <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['selectopt']):
?>
                                            <option <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['selectopt']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['selectopt']; ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                    </select> </td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'textarea'): ?>
                                 <td >
 <span style="vertical-align:top"><textarea name="option[<?php echo $this->_tpl_vars['k']; ?>
]" rows="5" cols="60" style="margin:0px" class="toserialize"><?php echo $this->_tpl_vars['conf']['value']; ?>
</textarea></span></td>
                            <?php endif; ?>

                        </tr>
                    <?php endforeach; endif; unset($_from); ?>
                            <tr><td></td><td>
                           <a href="#" class="new_control greenbtn" onclick="return saveProductFull();" ><span class="disk" >Save app settings</span></a>
                                <span style="margin-left: 30px"><a onclick="return testDomConnection()" id="testing_button" href="#" class="new_control"><span class="wizard"><?php echo $this->_tpl_vars['lang']['test_configuration']; ?>
</span></a></span>
                                </td></tr>
                        </table>
                        </div>
 <div id="loadable" style="text-align:center;padding:5px 0px;display: none"></div>
 <script type="text/javascript">
            <?php echo '
                function testDomConnection() {
                    $(\'#loadable\').html(\'<img src="ajax-loading.gif" />\').show();
                    var fields = $(\'form#productedit .toserialize\').serialize();
                    ajax_update(\'index.php?cmd=servers&action=test_connection&\'+fields,{module_id:$(\'#modulepicker\').val()},\'#loadable\');
                    return false;
                }
            '; ?>

            </script>
<?php endif; ?>