<?php /* Smarty version 2.6.26, created on 2018-06-15 08:44:04
         compiled from clientarea/editdetails.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'clientarea/editdetails.tpl', 69, false),array('function', 'securitytoken', 'clientarea/editdetails.tpl', 80, false),)), $this); ?>
<h2><?php echo $this->_tpl_vars['lang']['details']; ?>
</h2>

<div class="card">
    <div class="card-body">
        
        <form action='' method='post' >
            <input type="hidden" name="make" value="details" />

            <table width="100%" border=0 class="table table-striped fullscreen" cellspacing="0">

                <tbody>

                    <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['field']):
        $this->_foreach['floop']['iteration']++;
?>
                    <?php if ($this->_tpl_vars['field']['field_type'] == 'Password'): ?><?php continue; ?><?php endif; ?>
                    <tr  <?php if ($this->_tpl_vars['field']['type'] == 'Company' && $this->_tpl_vars['fields']['type']): ?>class="<?php if ($this->_foreach['floop']['iteration']%2 == 0): ?>even<?php endif; ?> iscomp" style="<?php if (! $this->_tpl_vars['client']['company'] || $this->_tpl_vars['client']['type'] == 'Private'): ?>display:none<?php endif; ?>"
                                <?php elseif ($this->_tpl_vars['field']['type'] == 'Private' && $this->_tpl_vars['fields']['type']): ?>class="ispr <?php if ($this->_foreach['floop']['iteration']%2 == 0): ?>even<?php endif; ?> " style="<?php if ($this->_tpl_vars['client']['company'] == '1'): ?>display:none<?php endif; ?>"
                        <?php elseif ($this->_foreach['floop']['iteration']%2 == 0): ?>class="even" <?php endif; ?>>
                        <td align="right" width="160">
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
                        </td>
                        <td class="">
                            <?php if ($this->_tpl_vars['k'] == 'type'): ?>
                            <select  name="type" style="width: 80%;" onchange="<?php echo 'if ($(this).val()==\'Private\') {$(\'.iscomp\').hide();$(\'.ispr\').show();}else {$(\'.ispr\').hide();$(\'.iscomp\').show();}'; ?>
">
                                <option value="Private" <?php if ($this->_tpl_vars['client']['company'] == '0'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Private']; ?>
</option>
                                <option value="Company" <?php if ($this->_tpl_vars['client']['company'] == '1'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Company']; ?>
</option>
                            </select>
                            <?php elseif ($this->_tpl_vars['k'] == 'country'): ?>
                            <?php if (! ( $this->_tpl_vars['field']['options'] & 8 )): ?>
            <?php $_from = $this->_tpl_vars['countries']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?> <?php if ($this->_tpl_vars['k'] == $this->_tpl_vars['client']['country']): ?><?php echo $this->_tpl_vars['v']; ?>
<?php endif; ?><?php endforeach; endif; unset($_from); ?>
                            <?php else: ?>
                            <select name="country" style="width: 80%;" class="chzn-select">
            <?php $_from = $this->_tpl_vars['countries']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                <option value="<?php echo $this->_tpl_vars['k']; ?>
" <?php if ($this->_tpl_vars['k'] == $this->_tpl_vars['client']['country'] || ( ! $this->_tpl_vars['client']['country'] && $this->_tpl_vars['k'] == $this->_tpl_vars['defaultCountry'] )): ?> selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['v']; ?>
</option>

            <?php endforeach; endif; unset($_from); ?> <?php endif; ?>
                            </select>
                            <?php else: ?>
                            <?php if (! ( $this->_tpl_vars['field']['options'] & 8 )): ?>
                            <?php if ($this->_tpl_vars['field']['field_type'] == 'Password'): ?>
                            <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Check'): ?>
                            <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                            <?php if (in_array ( $this->_tpl_vars['fa'] , $this->_tpl_vars['client'][$this->_tpl_vars['k']] )): ?><?php echo $this->_tpl_vars['fa']; ?>
<br/><?php endif; ?>
                                    <?php endforeach; endif; unset($_from); ?>

                            <?php else: ?>
                            <?php echo $this->_tpl_vars['client'][$this->_tpl_vars['k']]; ?>
 <input type="hidden" value="<?php echo $this->_tpl_vars['client'][$this->_tpl_vars['k']]; ?>
" name="<?php echo $this->_tpl_vars['k']; ?>
"/>

                            <?php endif; ?>

                            <?php else: ?>
                            <?php if ($this->_tpl_vars['field']['field_type'] == 'Input'): ?>
                            <input type="text" value="<?php echo $this->_tpl_vars['client'][$this->_tpl_vars['k']]; ?>
" style="width: 80%;" name="<?php echo $this->_tpl_vars['k']; ?>
" class="styled"/>
                            <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Password'): ?>
                            <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Select'): ?>
                            <select name="<?php echo $this->_tpl_vars['k']; ?>
" style="width: 80%;">
                                <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                                <option <?php if ($this->_tpl_vars['client'][$this->_tpl_vars['k']] == $this->_tpl_vars['fa']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['fa']; ?>
</option>
                                <?php endforeach; endif; unset($_from); ?>
                            </select>
                            <?php elseif ($this->_tpl_vars['field']['field_type'] == 'Check'): ?>
                            <?php $_from = $this->_tpl_vars['field']['default_value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fa']):
?>
                            <input type="checkbox" name="<?php echo $this->_tpl_vars['k']; ?>
[<?php echo ((is_array($_tmp=$this->_tpl_vars['fa'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
]" value="1" <?php if (in_array ( $this->_tpl_vars['fa'] , $this->_tpl_vars['client'][$this->_tpl_vars['k']] )): ?>checked="checked"<?php endif; ?> /><?php echo $this->_tpl_vars['fa']; ?>
<br />
                            <?php endforeach; endif; unset($_from); ?>
                            <?php endif; ?>
                            <?php endif; ?>
                            <?php endif; ?>
                        </td>
                    </tr>

                    <?php endforeach; endif; unset($_from); ?>


            </table><?php echo smarty_function_securitytoken(array(), $this);?>

            
            <div class="form-actions">
                <center>
                    <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" class="btn btn-info btn-large" style="font-weight:bold"/>
                </center>
                </div>
        </form> 
    </div>
</div>