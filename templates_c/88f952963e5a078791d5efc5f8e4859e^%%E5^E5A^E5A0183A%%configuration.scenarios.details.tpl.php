<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:37
         compiled from orders/configuration.scenarios.details.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'orders/configuration.scenarios.details.tpl', 47, false),)), $this); ?>
<?php if ($this->_tpl_vars['do'] == 'add'): ?>
<form action="" method="post">
    <input type="hidden" name="make" value="add"/>
    <table width="760" cellspacing="0" cellpadding="6" border="0">
        <tbody>
            <tr>
                <td width="205" align="right"><b>Scenario Name</b></td>
                <td><input type="text" name="name" class="inp" size="30" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="border:solid 1px #ddd;" class="whitetable">
                        <tbody>
                            <tr>
                                <th align="left" width="20"><b>On</b></th>
                                <th align="left" ><b>Step</b></th>
                                <th align="left" width="50"></th>
                                <th align="left" width="200"></th>
                            </tr>

                            <?php $_from = $this->_tpl_vars['defaults']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['scloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['scloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['step']):
        $this->_foreach['scloop']['iteration']++;
?>
                            <tr >
                                <td><input value="1" type="checkbox" name="steps[<?php echo $this->_tpl_vars['step']['name']; ?>
][enabled]" <?php if (! ( $this->_tpl_vars['step']['options'] & 8 )): ?>disabled="disabled" checked="checked"<?php else: ?><?php if ($this->_tpl_vars['step']['enabled']): ?>checked="checked"<?php endif; ?><?php endif; ?> /></td>
                                <td class="lastitm"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['step']['name']]; ?>
</td>
                                <td ><img src="templates/default/img/question-small-white.png" alt="" class="left"><a href="#" class="fs11" onclick="$('#description_<?php echo $this->_tpl_vars['step']['name']; ?>
').toggle();return false;">About</a></td>
                                <td class="lastitm"><input type="radio"  <?php if (! ( $this->_tpl_vars['step']['options'] & 1 )): ?>disabled="disabled"<?php endif; ?> <?php if ($this->_tpl_vars['step']['auto'] == '1'): ?>checked="checked"<?php endif; ?> name="steps[<?php echo $this->_tpl_vars['step']['name']; ?>
][auto]" value="1" /> Automated  
                                                           <input type="radio"  <?php if (! ( $this->_tpl_vars['step']['options'] & 2 )): ?>disabled="disabled"<?php endif; ?> <?php if ($this->_tpl_vars['step']['auto'] != '1'): ?>checked="checked"<?php endif; ?> name="steps[<?php echo $this->_tpl_vars['step']['name']; ?>
][auto]" value="0" /> Manual</td>

                            </tr>
                            <tr class="even">
                                <td colspan="4" style="display:none" class="fs11" id="description_<?php echo $this->_tpl_vars['step']['name']; ?>
"><?php echo $this->_tpl_vars['step']['description']; ?>
</td>

                            </tr>
                            <?php endforeach; endif; unset($_from); ?>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Add scenario" style="font-weight:bold" class="submitme" />
                </td>
            </tr>
        </tbody>

    </table>
    <?php echo smarty_function_securitytoken(array(), $this);?>

</form>
<?php elseif ($this->_tpl_vars['do'] == 'edit'): ?>
<form action="" method="post">
    <input type="hidden" name="make" value="edit"/>
    <table width="760" cellspacing="0" cellpadding="6" border="0">
        <tbody>
            <tr>
                <td width="205" align="right"><b>Scenario Name</b></td>
                <td><input type="text" name="name" class="inp" size="30" value="<?php echo $this->_tpl_vars['scenario']['name']; ?>
"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" cellspacing="0" cellpadding="3" border="0" style="border:solid 1px #ddd;" class="whitetable">
                        <tbody>
                            <tr>
                                <th align="left" width="20"><b>On</b></th>
                                <th align="left" ><b>Step</b></th>
                                <th align="left" width="50"></th>
                                <th align="left" width="200"></th>
                            </tr>

                            <?php $_from = $this->_tpl_vars['scenario']['steps']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['scloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['scloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['step']):
        $this->_foreach['scloop']['iteration']++;
?>
                            <tr >
                                <td><input value="1" type="checkbox" name="steps[<?php echo $this->_tpl_vars['step']['id']; ?>
][enabled]" <?php if (! ( $this->_tpl_vars['step']['options'] & 8 )): ?>disabled="disabled" checked="checked"<?php else: ?><?php if ($this->_tpl_vars['step']['enabled']): ?>checked="checked"<?php endif; ?><?php endif; ?> /></td>
                                <td class="lastitm"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['step']['name']]; ?>
</td>
                                <td ><img src="templates/default/img/question-small-white.png" alt="" class="left"><a href="#" class="fs11" onclick="$('#description_<?php echo $this->_tpl_vars['step']['name']; ?>
').toggle();return false;">About</a></td>
                                <td class="lastitm"><input type="radio"  <?php if (! ( $this->_tpl_vars['step']['options'] & 1 )): ?>disabled="disabled"<?php endif; ?> <?php if ($this->_tpl_vars['step']['auto'] == '1'): ?>checked="checked"<?php endif; ?> name="steps[<?php echo $this->_tpl_vars['step']['id']; ?>
][auto]" value="1" /> Automated
                                <input type="radio"  <?php if (! ( $this->_tpl_vars['step']['options'] & 2 )): ?>disabled="disabled"<?php endif; ?> <?php if ($this->_tpl_vars['step']['auto'] != '1'): ?>checked="checked"<?php endif; ?> name="steps[<?php echo $this->_tpl_vars['step']['id']; ?>
][auto]" value="0" /> Manual</td>
                                <input type="hidden" name="steps[<?php echo $this->_tpl_vars['step']['id']; ?>
][options]" value="<?php echo $this->_tpl_vars['step']['options']; ?>
"/>
                            </tr>
                            <tr class="even">
                                <td colspan="4" style="display:none" class="fs11" id="description_<?php echo $this->_tpl_vars['step']['name']; ?>
"><?php echo $this->_tpl_vars['step']['description']; ?>
</td>

                            </tr>
                            <?php endforeach; endif; unset($_from); ?>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" style="font-weight:bold" class="submitme" />
                </td>
            </tr>
        </tbody>

    </table>
    <?php echo smarty_function_securitytoken(array(), $this);?>

</form>


<?php else: ?>

<table border="0" cellspacing="0" cellpadding="6" width="100%">
    <tr>
        <td width="33%" valign="top">
            <table width="100%" cellspacing="0" cellpadding="3" border="0" style="border:solid 1px #ddd;" class="whitetable">
                <tbody>
                    <tr>
                        <th align="left" colspan="2"><b>Available scenarios</b></th>
                    </tr>

                    <?php $_from = $this->_tpl_vars['scenarios']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['scloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['scloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['scenario']):
        $this->_foreach['scloop']['iteration']++;
?>
                    <tr <?php if (($this->_foreach['scloop']['iteration']-1)%2 == 0): ?>class="even"<?php endif; ?>>
                        <td><a href="?cmd=configuration&action=orderscenarios&do=edit&id=<?php echo $this->_tpl_vars['scenario']['id']; ?>
"><?php echo $this->_tpl_vars['scenario']['name']; ?>
</a></td>
                        <td width="20" class="lastitm">
                            <?php if ($this->_tpl_vars['scenario']['id'] != 1): ?> <a onclick="return confirm('Do you really want to delete this scenario?')" class="delbtn" href="?cmd=configuration&action=orderscenarios&make=delete&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&id=<?php echo $this->_tpl_vars['scenario']['id']; ?>
">Delete</a><?php endif; ?>
                        </td>
                    </tr>
                    <?php endforeach; endif; unset($_from); ?>
                </tbody>
            </table>
            <br/>
            <div>
                <a href="?cmd=configuration&action=orderscenarios&do=add" class=" new_control greenbtn"><span>Create new scenario</span></a>
            </div>

        </td>
        <td valign="top">
            <div class="blank_state blank_news" style="padding:30px 0px">
                <div class="blank_info">
                    <h1>Keep orders life cycle under control</h1>
                    Order scenarios allows you to set HostBill order processing steps to best suit your business model.<br />
                    You can choose and control which parts in order life cycle should happen automatically, and which requires staff review.<br />
                    Each order page can have different scenario set
                    <div class="clear"></div>
                </div>
            </div>
        </td>
    </tr>
</table>

<?php endif; ?>