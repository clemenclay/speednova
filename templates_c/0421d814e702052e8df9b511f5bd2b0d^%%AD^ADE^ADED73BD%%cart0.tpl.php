<?php /* Smarty version 2.6.26, created on 2018-06-20 15:17:46
         compiled from cart0.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 'price', 'cart0.tpl', 58, false),array('modifier', 'price', 'cart0.tpl', 142, false),)), $this); ?>
<h3><?php echo $this->_tpl_vars['lang']['browseprod']; ?>
</h3>



<div style="padding:10px 0px;text-align:center;">
    <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
        <?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?> <strong><?php echo $this->_tpl_vars['i']['name']; ?>
</strong> <?php if (! ($this->_foreach['cats']['iteration'] == $this->_foreach['cats']['total'])): ?>|<?php endif; ?>
        <?php else: ?> <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<?php echo $this->_tpl_vars['i']['slug']; ?>
/&amp;step=<?php echo $this->_tpl_vars['step']; ?>
<?php if ($this->_tpl_vars['addhosting']): ?>&amp;addhosting=1<?php endif; ?>"><?php echo $this->_tpl_vars['i']['name']; ?>
</a> <?php if (! ($this->_foreach['cats']['iteration'] == $this->_foreach['cats']['total'])): ?>|<?php endif; ?>
        <?php endif; ?>
    <?php endforeach; endif; unset($_from); ?>
<?php if ($this->_tpl_vars['logged'] == '1'): ?> | <?php if ($this->_tpl_vars['current_cat'] == 'addons'): ?><strong><?php else: ?><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart&amp;step=<?php echo $this->_tpl_vars['step']; ?>
&amp;cat_id=addons"><?php endif; ?><?php echo $this->_tpl_vars['lang']['prodaddons']; ?>
<?php if ($this->_tpl_vars['current_cat'] == 'addons'): ?></strong><?php else: ?></a><?php endif; ?><?php endif; ?>



<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
    <?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat'] && $this->_tpl_vars['i']['description'] != ''): ?>
        <div style="text-align:left;margin-top:10px;"><?php echo $this->_tpl_vars['i']['description']; ?>
</div>
    <?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
</div>

<?php if ($this->_tpl_vars['current_cat'] != 'addons' && $this->_tpl_vars['current_cat'] != 'transfer' && $this->_tpl_vars['current_cat'] != 'register'): ?>
    <br />

    <?php if ($this->_tpl_vars['products']): ?>

        <?php if (count ( $this->_tpl_vars['currencies'] ) > 1): ?>
            <form action="" method="post" id="currform"><p align="right">
                    <input name="action" type="hidden" value="changecurr">
                    <?php echo $this->_tpl_vars['lang']['Currency']; ?>
 <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                        <?php $_from = $this->_tpl_vars['currencies']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['crx']):
?>
                            <option value="<?php echo $this->_tpl_vars['crx']['id']; ?>
" <?php if (! $this->_tpl_vars['selcur'] && $this->_tpl_vars['crx']['id'] == 0): ?>selected="selected"<?php elseif ($this->_tpl_vars['selcur'] == $this->_tpl_vars['crx']['id']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['crx']['code']): ?><?php echo $this->_tpl_vars['crx']['code']; ?>
<?php else: ?><?php echo $this->_tpl_vars['crx']['iso']; ?>
<?php endif; ?></option>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
                </p></form>
            <?php endif; ?>

        <div class="serv_head1">
            <table border="0" width="100%">
                <tr>
                    <td align="left"><?php echo $this->_tpl_vars['lang']['service']; ?>
</td>

                    <td width="15%" align="center"><?php echo $this->_tpl_vars['lang']['order']; ?>
</td>
                </tr>
            </table>
        </div>
        <?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
            <form name="" action="" method="post">
                <input name="action" type="hidden" value="add">
                <input name="id" type="hidden" value="<?php echo $this->_tpl_vars['i']['id']; ?>
">
                <div class="orderbox sh1a">
                    <div class="orderboxpadding nomrlc">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td width="75%">
                                        <strong><?php echo $this->_tpl_vars['i']['name']; ?>
</strong><?php if ($this->_tpl_vars['i']['description'] != ''): ?><br/><?php echo $this->_tpl_vars['i']['description']; ?>
<?php endif; ?><br/>
                                        <?php $this->_tag_stack[] = array('price', array('product' => $this->_tpl_vars['i'])); $_block_repeat=true;smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
                                        <?php if ($this->_tpl_vars['i']['paytype'] == 'Free'): ?>
                                            <input type="hidden" name="cycle" value="Free" />
                                            <?php echo $this->_tpl_vars['lang']['price']; ?>
: <strong> <?php echo $this->_tpl_vars['lang']['Free']; ?>
</strong>
                                        <?php elseif ($this->_tpl_vars['i']['paytype'] == 'Once'): ?>
                                            <input type="hidden" name="cycle" value="Once" />
                                            @@line
                                        <?php else: ?>
                                            <?php echo $this->_tpl_vars['lang']['pickcycle']; ?>

                                            <select name="cycle">
                                                <option value="@@cycle" @@selected>@@line</option>
                                            </select>
                                        <?php endif; ?>
                                        <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
                                    </td>
                                    <td width="25%" align="right">

                                        <input type="submit" value="<?php echo $this->_tpl_vars['lang']['ordernow']; ?>
" style="font-weight:bold;" class="padded btn"/>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>

        <?php endforeach; endif; unset($_from); ?>
    <?php else: ?>
        <center>

                        <?php echo $this->_tpl_vars['lang']['noservicesyet']; ?>

            <?php if ($this->_tpl_vars['adminlogged']): ?>
                <br><br>
                <span style="text-align: left; padding: 1em; border:solid 1px #FFFEb1; background:#FFFEd1; display:inline-block ">
                    <?php echo $this->_tpl_vars['lang']['noservicesyetadmin']; ?>

                    <?php if (! $this->_tpl_vars['categories']): ?><a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=configuration" target="_blank"><?php echo $this->_tpl_vars['lang']['Configuration']; ?>
</a> &#187;
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=services" target="_blank"><?php echo $this->_tpl_vars['lang']['productsandservices']; ?>
</a> &#187;
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=services&action=addcategory" target="_blank"><?php echo $this->_tpl_vars['lang']['addneworpage']; ?>
</a>
                    <?php else: ?> 
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=configuration" target="_blank"><?php echo $this->_tpl_vars['lang']['Configuration']; ?>
</a> &#187;
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=services" target="_blank"><?php echo $this->_tpl_vars['lang']['productsandservices']; ?>
</a> &#187;
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=services&action=category&id=<?php echo $this->_tpl_vars['current_cat']; ?>
" target="_blank"><?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?><?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?><?php echo $this->_tpl_vars['i']['name']; ?>
<?php endif; ?><?php endforeach; endif; unset($_from); ?></a> &#187;
                        <a href="<?php echo $this->_tpl_vars['admin_url']; ?>
/?cmd=services&action=product&id=new&cat_id=<?php echo $this->_tpl_vars['current_cat']; ?>
" target="_blank"><?php echo $this->_tpl_vars['lang']['addnewproduct']; ?>
</a>
                    <?php endif; ?>
                </span>	
            <?php endif; ?>
        </center>
    <?php endif; ?>

<?php elseif ($this->_tpl_vars['current_cat'] == 'addons'): ?>
    <br />

    <?php if ($this->_tpl_vars['addons']): ?>

        <?php if (count ( $this->_tpl_vars['currencies'] ) > 1): ?>
            <form action="" method="post" id="currform"><p align="right">
                    <input name="action" type="hidden" value="changecurr">
                    <?php echo $this->_tpl_vars['lang']['Currency']; ?>
 <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                        <?php $_from = $this->_tpl_vars['currencies']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['crx']):
?>
                            <option value="<?php echo $this->_tpl_vars['crx']['id']; ?>
" <?php if (! $this->_tpl_vars['selcur'] && $this->_tpl_vars['crx']['id'] == 0): ?>selected="selected"<?php elseif ($this->_tpl_vars['selcur'] == $this->_tpl_vars['crx']['id']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['crx']['code']): ?><?php echo $this->_tpl_vars['crx']['code']; ?>
<?php else: ?><?php echo $this->_tpl_vars['crx']['iso']; ?>
<?php endif; ?></option>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
                </p></form>
            <?php endif; ?>
            <?php $_from = $this->_tpl_vars['addons']['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['i']):
?>
            <form name="" action="" method="post">
                <input name="action" type="hidden" value="add">
                <input name="id" type="hidden" value="<?php echo $this->_tpl_vars['i']['id']; ?>
">
                <div class="orderbox">
                    <div class="orderboxpadding">
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td width="75%">
                                        <strong><?php echo $this->_tpl_vars['i']['name']; ?>
</strong><?php if ($this->_tpl_vars['i']['description'] != ''): ?><br /><?php echo $this->_tpl_vars['i']['description']; ?>
<?php endif; ?><br />

                                        <?php if ($this->_tpl_vars['i']['paytype'] == 'Free'): ?>
                                            <input type="hidden" name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="free" />
                                            <?php echo $this->_tpl_vars['lang']['price']; ?>
:<strong> <?php echo $this->_tpl_vars['lang']['Free']; ?>
</strong>

                                        <?php elseif ($this->_tpl_vars['i']['paytype'] == 'Once'): ?>
                                            <input type="hidden" name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="once" />
                                            <?php echo $this->_tpl_vars['lang']['price']; ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['m'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['once']; ?>
 / <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['m_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                        <?php else: ?>
                                            <select name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" >
                                                <?php if ($this->_tpl_vars['i']['h'] != 0): ?><option value="d" <?php if ($this->_tpl_vars['cycle'] == 'h'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['h'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['h']; ?>
<?php if ($this->_tpl_vars['i']['h_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['h_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>

                                                <?php if ($this->_tpl_vars['i']['d'] != 0): ?><option value="d" <?php if ($this->_tpl_vars['cycle'] == 'd'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['d'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['d']; ?>
<?php if ($this->_tpl_vars['i']['d_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['d_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['w'] != 0): ?><option value="w" <?php if ($this->_tpl_vars['cycle'] == 'w'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['w'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['w']; ?>
<?php if ($this->_tpl_vars['i']['w_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['w_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['m'] != 0): ?><option value="m" <?php if ($this->_tpl_vars['cycle'] == 'm'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['m'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['m']; ?>
<?php if ($this->_tpl_vars['i']['m_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['m_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['q'] != 0): ?><option value="q" <?php if ($this->_tpl_vars['cycle'] == 'q'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['q'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['q']; ?>
<?php if ($this->_tpl_vars['i']['q_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['q_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['s'] != 0): ?><option value="s" <?php if ($this->_tpl_vars['cycle'] == 's'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['s'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['s']; ?>
<?php if ($this->_tpl_vars['i']['s_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['s_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['a'] != 0): ?><option value="a" <?php if ($this->_tpl_vars['cycle'] == 'a'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['a'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['a']; ?>
<?php if ($this->_tpl_vars['i']['a_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['a_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['b'] != 0): ?><option value="b" <?php if ($this->_tpl_vars['cycle'] == 'b'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['b'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['b']; ?>
<?php if ($this->_tpl_vars['i']['b_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['b_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['t'] != 0): ?><option value="t" <?php if ($this->_tpl_vars['cycle'] == 't'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['t'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['t']; ?>
<?php if ($this->_tpl_vars['i']['t_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['t_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['p4'] != 0): ?><option value="p4" <?php if ($this->_tpl_vars['cycle'] == 'p4'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['p4'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['p4']; ?>
<?php if ($this->_tpl_vars['i']['p4_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['p4_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                                <?php if ($this->_tpl_vars['i']['p4'] != 0): ?><option value="p5" <?php if ($this->_tpl_vars['cycle'] == 'p5'): ?> selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['p5'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['p5']; ?>
<?php if ($this->_tpl_vars['i']['p5_setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['i']['p5_setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>
<?php endif; ?></option><?php endif; ?>
                                            </select>

                                        <?php endif; ?> 
                                        <br /> <?php echo $this->_tpl_vars['lang']['applyto']; ?>

                                        <select name="account_id">
                                            <?php $_from = $this->_tpl_vars['i']['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['a']):
?>
                                                <?php if ($this->_tpl_vars['addons']['packages'][$this->_tpl_vars['a']]): ?>
                                                    <?php $_from = $this->_tpl_vars['addons']['packages'][$this->_tpl_vars['a']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['b']):
?>
                                                        <option value="<?php echo $this->_tpl_vars['b']['id']; ?>
" <?php if ($this->_tpl_vars['s_account'] == $this->_tpl_vars['b']['id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['b']['name']; ?>
</option>
                                                    <?php endforeach; endif; unset($_from); ?>
                                                <?php endif; ?>
                                            <?php endforeach; endif; unset($_from); ?>
                                        </select>

                                    </td>
                                    <td width="25%" align="right">

                                        <input type="submit" value="<?php echo $this->_tpl_vars['lang']['ordernow']; ?>
" style="font-weight:bold;" class="padded btn"/>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>

        <?php endforeach; endif; unset($_from); ?>

    <?php else: ?>
        <?php echo $this->_tpl_vars['lang']['nothing']; ?>

    <?php endif; ?>

<?php elseif ($this->_tpl_vars['current_cat'] == 'transfer' || $this->_tpl_vars['current_cat'] == 'register'): ?>

<?php endif; ?>