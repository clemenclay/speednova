<?php /* Smarty version 2.6.26, created on 2018-06-19 16:06:58
         compiled from ajax.onestep_triple_box.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 'price', 'ajax.onestep_triple_box.tpl', 69, false),array('modifier', 'price', 'ajax.onestep_triple_box.tpl', 199, false),array('modifier', 'dateformat', 'ajax.onestep_triple_box.tpl', 354, false),array('function', 'counter', 'ajax.onestep_triple_box.tpl', 348, false),)), $this); ?>

<div class="row orderpage-config">
    <div class="span8">
    <form id="cartforms" action="" method="post">
    <input type="hidden" name="subproducts[0]" value="0" />
    <input type="hidden" name="addon[0]" value="0" />
        <div>
            <h2 class="no-ml"><?php echo $this->_tpl_vars['lang']['productconfig']; ?>
</h2>
            <h3 class="no-ml"><?php echo $this->_tpl_vars['lang']['config_then_checkout']; ?>
!</h3>

            <div class="row">


                <div class="<?php if ($this->_tpl_vars['addons']): ?>span4 <?php else: ?> span8 <?php endif; ?>">

                    <?php if (( $this->_tpl_vars['product']['paytype'] != 'Free' && $this->_tpl_vars['product']['paytype'] != 'Once' ) || ( $this->_tpl_vars['product']['hostname'] ) && ! ( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] == '1' || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>

                    <div class="configuration-box">
                        <div class="configuration-header">
                            <h4><?php echo $this->_tpl_vars['lang']['serverdetails']; ?>
</h4>
                        </div>
                        <div class="configuration-body">
                            <?php if (( $this->_tpl_vars['product']['paytype'] != 'Free' && $this->_tpl_vars['product']['paytype'] != 'Once' )): ?>
                            <p><?php echo $this->_tpl_vars['lang']['pickcycle']; ?>
</p>
                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/price.tpl", 'smarty_include_vars' => array('allprices' => 'cycle')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                            <?php endif; ?>
                        </div>
                    </div>

                    <?php endif; ?>



                    <?php if (( $this->_tpl_vars['product']['hostname'] ) && ! ( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] == '1' || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>

                        <div class="configuration-box">

                            <div class="configuration-header">
                                <h4><?php echo $this->_tpl_vars['lang']['hostname']; ?>
</h4>
                            </div>
                            <div class="configuration-body">
                                <p><?php echo $this->_tpl_vars['lang']['hostname']; ?>
</p>
                                <input name="domain" value="<?php echo $this->_tpl_vars['item']['domain']; ?>
" class="styled" size="50" onchange="if(typeof simulateCart == 'function') simulateCart();"/>
                            </div>
                        </div>

                    <?php endif; ?>


                </div>



                    
                    <?php if ($this->_tpl_vars['addons']): ?>
                        <div class="<?php if (( $this->_tpl_vars['product']['paytype'] != 'Free' && $this->_tpl_vars['product']['paytype'] != 'Once' ) || $this->_tpl_vars['product']['hostname']): ?>span4 <?php else: ?> span8 <?php endif; ?>">

                        <div class="configuration-box">

                            <div class="configuration-header">
                                <h4>Addons</h4>
                            </div>
                            <div class="configuration-body">
                                <?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['a']):
?>
                                    <p class="no-opacity checkbox-fix"><input name="addon[<?php echo $this->_tpl_vars['k']; ?>
]" onchange="if (typeof(simulateCart)=='function')simulateCart();"  type="checkbox" value="1" <?php if ($this->_tpl_vars['contents'][3][$this->_tpl_vars['k']]): ?>checked="checked"<?php endif; ?>/> <span> <?php echo $this->_tpl_vars['a']['name']; ?>
</span></p>

                                    <?php $this->_tag_stack[] = array('price', array('product' => $this->_tpl_vars['a'])); $_block_repeat=true;smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
                                    <?php if ($this->_tpl_vars['a']['paytype'] == 'Free'): ?>
                                        <span class="product-cycle cycle-free"><?php echo $this->_tpl_vars['lang']['free']; ?>
</span>
                                        <input type="hidden" name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="free"/>
                                    <?php elseif ($this->_tpl_vars['a']['paytype'] == 'Once'): ?>
                                        <span class="product-price cycle-once">@@price</span>
                                        <span class="product-cycle cycle-once"><?php echo $this->_tpl_vars['lang']['once']; ?>
</span>
                                        <?php if ($this->_tpl_vars['a']['m_setup'] != 0): ?><span class="product-setup cycle-once">@@setupline</span>
                                        <?php endif; ?>
                                        <input type="hidden" name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="once"/>
                                    <?php else: ?>
                                        <select name="addon_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" >
                                            <option value="@@cycle" @@selected>@@line</option>
                                        </select>
                                    <?php endif; ?>
                                    <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
                                    <span class="prod-desc"><?php echo $this->_tpl_vars['a']['description']; ?>
</span>
                                <?php endforeach; endif; unset($_from); ?>

                            </div>
                        </div>
                        </div>
                    <?php endif; ?>


                </div>

                <div class="row">



                    
                    <?php if ($this->_tpl_vars['custom']): ?>

                    <div class="<?php if ($this->_tpl_vars['subproducts']): ?>span4<?php else: ?>span8<?php endif; ?>">
                        <div class="configuration-box">

                            <div class="configuration-header">
                                <h4>Other</h4>
                            </div>
                            <div class="configuration-body">
                            <?php $_from = $this->_tpl_vars['custom']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cf']):
?>
                                <?php if ($this->_tpl_vars['cf']['items']): ?>
                                    <p><?php echo $this->_tpl_vars['cf']['name']; ?>
 <?php if ($this->_tpl_vars['cf']['options'] & 1): ?>*<?php endif; ?></p>
                                    <div class="option-val cf-<?php echo $this->_tpl_vars['cf']['type']; ?>
">
                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['cf']['configtemplates']['cart'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                        <span class="prod-desc"><?php echo $this->_tpl_vars['cf']['description']; ?>
</span>
                                    </div>

                                <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                            </div>
                        </div>
                    </div>
                    <?php endif; ?>



                        
                        <?php if ($this->_tpl_vars['subproducts']): ?>
                        <div class="<?php if ($this->_tpl_vars['custom']): ?>span4<?php else: ?>span8<?php endif; ?>">

                            <div class="configuration-box">

                                <div class="configuration-header">
                                    <h4>Subproduct</h4>
                                </div>
                                <div class="configuration-body">
                                    <?php $_from = $this->_tpl_vars['subproducts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['a']):
?>
                                        <p class="no-opacity checkbox-fix"><input name="subproducts[<?php echo $this->_tpl_vars['k']; ?>
]" onchange="if (typeof(simulateCart)=='function')simulateCart('#cart0');"  type="checkbox" value="1" <?php if ($this->_tpl_vars['contents'][4][$this->_tpl_vars['k']]): ?>checked="checked"<?php endif; ?>/> <span><?php echo $this->_tpl_vars['a']['category_name']; ?>
 - <?php echo $this->_tpl_vars['a']['name']; ?>
</span></p>
                                            <?php $this->_tag_stack[] = array('price', array('product' => $this->_tpl_vars['a'])); $_block_repeat=true;smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
                                            <?php if ($this->_tpl_vars['a']['paytype'] == 'Free'): ?>
                                            <span class="product-cycle cycle-free"><?php echo $this->_tpl_vars['lang']['free']; ?>
</span>
                                            <input type="hidden" name="subproducts_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="free"/>
                                        <?php elseif ($this->_tpl_vars['a']['paytype'] == 'Once'): ?>
                                            <span class="product-price cycle-once">@@price</span>
                                            <span class="product-cycle cycle-once"><?php echo $this->_tpl_vars['lang']['once']; ?>
</span>
                                            <?php if ($this->_tpl_vars['a']['m_setup'] != 0): ?><span class="product-setup cycle-once">@@setupline<<' + '@</span>
                                            <?php endif; ?>
                                            <input type="hidden" name="subproducts_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" value="once"/>
                                        <?php else: ?>
                                            <select name="subproducts_cycles[<?php echo $this->_tpl_vars['k']; ?>
]" >
                                                <option value="@@cycle" @@selected>@@line</option>
                                            </select>
                                        <?php endif; ?>
                                        <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_price($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
                                        <span class="prod-desc"><?php echo $this->_tpl_vars['a']['description']; ?>
</span>
                                    <?php endforeach; endif; unset($_from); ?>

                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                </div>


                                <?php if (( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] ) == '1' && ( $this->_tpl_vars['allowregister'] || $this->_tpl_vars['allowtransfer'] || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>
                 <div class="row">
                 <div class="span8">

                        <div class="configuration-box">
                            <div class="configuration-header">
                                <h4>Domains</h4>
                            </div>
                            <div class="configuration-body">


                                <div class="btn-group">
                                    <?php if ($this->_tpl_vars['allowregister']): ?>
                                        <button rel="t1" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'register' || ! $this->_tpl_vars['contents'][2]): ?>active<?php endif; ?>" onclick="tabbme(this); return false;"><?php echo $this->_tpl_vars['lang']['register']; ?>
</button>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['allowtransfer']): ?>
                                        <button rel="t2" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'transfer'): ?>active<?php endif; ?>" onclick="tabbme(this);  return false;"><?php echo $this->_tpl_vars['lang']['transfer']; ?>
</button>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['allowown']): ?>
                                        <button rel="t3" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'own' && ! $this->_tpl_vars['subdomain']): ?>active<?php endif; ?>" onclick="tabbme(this); return false;"><?php echo $this->_tpl_vars['lang']['alreadyhave']; ?>
</button>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['subdomain']): ?>
                                        <button rel="t4" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'own' && $this->_tpl_vars['subdomain']): ?>active<?php endif; ?>" onclick="tabbme(this);  return false;"><?php echo $this->_tpl_vars['lang']['subdomain']; ?>
</button>
                                    <?php endif; ?>
                                </div>

                                <?php if ($this->_tpl_vars['contents'][2]): ?>
                                    <div id="domoptions22">
                                        <?php $_from = $this->_tpl_vars['contents'][2]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['kk'] => $this->_tpl_vars['domenka']):
?>
                                            <?php if ($this->_tpl_vars['domenka']['action'] != 'own' && $this->_tpl_vars['domenka']['action'] != 'hostname'): ?>
                                                <strong><?php if ($this->_tpl_vars['domenka']['action'] == 'register'): ?><?php echo $this->_tpl_vars['lang']['domainregister']; ?>
<?php elseif ($this->_tpl_vars['domenka']['action'] == 'transfer'): ?><?php echo $this->_tpl_vars['lang']['domaintransfer']; ?>
<?php endif; ?></strong> - <?php echo $this->_tpl_vars['domenka']['name']; ?>
 - <?php echo $this->_tpl_vars['domenka']['period']; ?>
 <?php echo $this->_tpl_vars['lang']['years']; ?>

                                                <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
<br />
                                            <?php else: ?>
                                                <?php echo $this->_tpl_vars['domenka']['name']; ?>
<br />
                                            <?php endif; ?>
                                            <?php if ($this->_tpl_vars['domenka']['custom']): ?>
                                                <form class="cartD" action="" method="post">
                                                    <table class="styled" width="100%" cellspacing="" cellpadding="6" border="0">
                                                        <?php $_from = $this->_tpl_vars['domenka']['custom']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cf']):
?>
                                                            <?php if ($this->_tpl_vars['cf']['items']): ?>
                                                                <tr>
                                                                    <td class="configtd" >
                                                                        <label for="custom[<?php echo $this->_tpl_vars['cf']['id']; ?>
]" class="styled"><?php echo $this->_tpl_vars['cf']['name']; ?>
<?php if ($this->_tpl_vars['cf']['options'] & 1): ?>*<?php endif; ?></label>
                                                                        <?php if ($this->_tpl_vars['cf']['description'] != ''): ?><div class="fs11 descr" style=""><?php echo $this->_tpl_vars['cf']['description']; ?>
</div>
                                                                        <?php endif; ?>
                                                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['cf']['configtemplates']['cart'], 'smarty_include_vars' => array('cf_opt_formId' => ".cartD",'cf_opt_name' => 'custom_domain')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                                    </td>
                                                                </tr>
                                                            <?php endif; ?>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                    </table>
                                                </form>
                                            <?php endif; ?>
                                        <?php endforeach; endif; unset($_from); ?>
                                        <br>
                                        <a href="#" class="btn" onclick="$('#domoptions22').hide();$('#domoptions11').show();return false;"><?php echo $this->_tpl_vars['lang']['change']; ?>
</a>
                                    </div>
                                <?php endif; ?>
                                <div <?php if ($this->_tpl_vars['contents'][2]): ?>style="display:none"<?php endif; ?> id="domoptions11">
                                    <input type="hidden" value="<?php echo $this->_tpl_vars['cart_contents'][0]['id']; ?>
" id="product_id" name="product_id" />
                                    <input type="hidden" name="make" value="checkdomain" />
                                    <div id="options">
                                        <?php if ($this->_tpl_vars['allowregister']): ?>
                                            <div id="illregister" class="t1 slidme">
                                                <input type="radio" name="domain" value="illregister" style="display: none;" checked="checked"/>
                                                <div class="domain-input-bulk domain-input left" id="multisearch">
                                                    <textarea name="sld_register" id="sld_register" style="resize: none"></textarea>
                                                </div>

                                                <div class="domain-tld-bulk domain-tld" style="margin-left:10px;width:260px;float:left">
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="" class="fs11">
                                                        <?php $_from = $this->_tpl_vars['tld_reg']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ttld'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ttld']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tldname']):
        $this->_foreach['ttld']['iteration']++;
?>
                                                            <?php if (! ($this->_foreach['ttld']['iteration'] <= 1) && ($this->_foreach['ttld']['iteration']-1) % 3 == 0): ?></tr>
                                                            <?php endif; ?>
                                                            <?php if (! ($this->_foreach['ttld']['iteration'] == $this->_foreach['ttld']['total']) && ($this->_foreach['ttld']['iteration']-1) % 3 == 0): ?><tr>
                                                            <?php endif; ?>
                                                            <td width="33%"><input type="checkbox" name="tld[]" value="<?php echo $this->_tpl_vars['tldname']; ?>
" <?php if (($this->_foreach['ttld']['iteration'] <= 1)): ?>checked="checked"<?php endif; ?> class="tld_register"/>
                                                                <?php echo $this->_tpl_vars['tldname']; ?>

                                                            </td>
                                                            <?php if (($this->_foreach['ttld']['iteration'] == $this->_foreach['ttld']['total'])): ?></tr>
                                                            <?php endif; ?>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                        <tr></tr>
                                                    </table>
                                                </div>
                                                <div class="clear"></div>
                                                <p class="align-right domain-check-bulk">
                                                    <input type="submit" value="<?php echo $this->_tpl_vars['lang']['check']; ?>
" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                                </p>
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['allowtransfer']): ?>
                                            <div id="illtransfer" style="<?php if ($this->_tpl_vars['allowregister']): ?>display: none;<?php endif; ?>"  class="t2 slidme align-center form-horizontal">
                                                <input type="radio" style="display: none;" value="illtransfer" name="domain" <?php if (! $this->_tpl_vars['allowregister']): ?>checked="checked"<?php endif; ?>/>
                                                www.
                                                <input type="text" value="" size="40" name="sld_transfer" id="sld_transfer" class="styled domain-input"/>
                                                <select name="tld_transfer" id="tld_transfer" class="span2 domain-tld">
                                                    <?php $_from = $this->_tpl_vars['tld_tran']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tldname']):
?>
                                                        <option><?php echo $this->_tpl_vars['tldname']; ?>
</option>
                                                    <?php endforeach; endif; unset($_from); ?>
                                                </select>
                                                <input type="submit" value="<?php echo $this->_tpl_vars['lang']['check']; ?>
" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['allowown']): ?>
                                            <div id="illupdate" style="<?php if ($this->_tpl_vars['allowregister'] || $this->_tpl_vars['allowtransfer']): ?>display: none;<?php endif; ?>"  class="t3 slidme align-center form-horizontal">
                                                <input type="radio" style="display: none;" value="illupdate" name="domain" <?php if (! $this->_tpl_vars['allowregister'] && ! $this->_tpl_vars['allowtransfer']): ?>checked="checked"<?php endif; ?>/>
                                                www.
                                                <input type="text" value="" size="40" name="sld_update" id="sld_update" class="styled domain-input"/>
                                                .
                                                <input type="text" value="" size="7" name="tld_update" id="tld_update" class="styled span2 domain-tld"/>  <input type="submit" value="<?php echo $this->_tpl_vars['lang']['check']; ?>
" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['subdomain']): ?>
                                            <div id="illsub" style="<?php if ($this->_tpl_vars['allowregister'] || $this->_tpl_vars['allowtransfer'] || $this->_tpl_vars['allowown']): ?>display: none;<?php endif; ?>"  class="t4 slidme align-center form-horizontal">
                                                <input type="radio" style="display: none;" value="illsub" name="domain"  <?php if (! ( $this->_tpl_vars['allowregister'] || $this->_tpl_vars['allowtransfer'] || $this->_tpl_vars['allowown'] )): ?>checked="checked"<?php endif; ?>/>
                                                www.
                                                <input type="text" value="" size="40" name="sld_subdomain" id="sld_subdomain" class="styled domain-input"/>
                                                <?php echo $this->_tpl_vars['subdomain']; ?>
 <input type="submit" value="<?php echo $this->_tpl_vars['lang']['check']; ?>
" class="btn domain-check" onclick="domainCheck(); return false;"/>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                </div>
                                <div id="updater2"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "ajax.checkdomain.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> </div>

                            </div>
                        </div>
                    </div>
                    </div>
                    <?php endif; ?>
    </form>


                    
                    <?php if ($this->_tpl_vars['gateways']): ?>
                    <div class="row">
                    <div class="span8">
                        <div class="configuration-box">
                            <div class="configuration-header">
                                <h4><?php echo $this->_tpl_vars['lang']['choose_payment']; ?>
</h4>
                            </div>
                            <div class="configuration-body">
                            <div <?php if ($this->_tpl_vars['tax'] && $this->_tpl_vars['tax']['total'] == 0): ?>style="display:none"<?php elseif ($this->_tpl_vars['credit'] && $this->_tpl_vars['credit']['total'] == 0): ?>style="display:none"<?php elseif ($this->_tpl_vars['subtotal']['total'] == 0): ?>style="display:none"<?php endif; ?> class="payment-methods">
                                <ul class="radio-fields" id="payment-method">
                                    <?php $_from = $this->_tpl_vars['gateways']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['payloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['payloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['mid'] => $this->_tpl_vars['module']):
        $this->_foreach['payloop']['iteration']++;
?>
                                        <li><input onclick="setPayment($(this).val());" type="radio" name="gateway2" value="<?php echo $this->_tpl_vars['mid']; ?>
" <?php if ($this->_tpl_vars['submit'] && $this->_tpl_vars['submit']['gateway'] == $this->_tpl_vars['mid'] || $this->_tpl_vars['mid'] == $this->_tpl_vars['paygateid']): ?>checked="checked"<?php elseif (($this->_foreach['payloop']['iteration'] <= 1)): ?>checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['module']; ?>
 </li>
                                    <?php endforeach; endif; unset($_from); ?>
                                </ul>
                            </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['gateways']): ?>
                            <div id="gatewayform" <?php if ($this->_tpl_vars['tax'] && $this->_tpl_vars['tax']['total'] == 0): ?>style="display:none"<?php elseif ($this->_tpl_vars['credit'] && $this->_tpl_vars['credit']['total'] == 0): ?>style="display:none"<?php elseif ($this->_tpl_vars['subtotal']['total'] == 0): ?>style="display:none"<?php endif; ?>>
                                <?php echo $this->_tpl_vars['gatewayhtml']; ?>

                            </div>
                        <?php endif; ?>
                            </div>
                        </div>
                    </div>
                    </div>


            </div>
        </div>

    <!-- Order Summary -->
    <div class="span4" id="orderSummary">
        <div>
            <h2 class="no-ml">Order Summary</h2>
            <h3 class="no-ml"><?php echo $this->_tpl_vars['opconfig']['ordersummary']; ?>
</h3>

            <div class="order-summary">
                <div class="summary-bg">
                    <table class="table">
                        <tr>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>


                        <?php echo smarty_function_counter(array('name' => 'alter','print' => false,'start' => 1,'assign' => 'alter'), $this);?>

                        <?php if ($this->_tpl_vars['product']): ?>
                            <tr>
                                <td class="desc-col"><?php echo $this->_tpl_vars['contents'][0]['category_name']; ?>
 - <strong><?php echo $this->_tpl_vars['contents'][0]['name']; ?>
 <?php if ($this->_tpl_vars['contents'][0]['domain']): ?>(<?php echo $this->_tpl_vars['contents'][0]['domain']; ?>
)<?php endif; ?></strong></td>
                                <td class="price-col">
                                    <?php if ($this->_tpl_vars['contents'][0]['price'] == 0): ?><?php echo $this->_tpl_vars['lang']['Free']; ?>

                                    <?php elseif ($this->_tpl_vars['contents'][0]['prorata_amount']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                    <?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['contents'][0]['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endif; ?>

                                                <?php if ($this->_tpl_vars['cart_contents'][1]): ?>
                            <?php $_from = $this->_tpl_vars['cart_contents'][1]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cstom2']):
?>
                                <?php $_from = $this->_tpl_vars['cstom2']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cstom']):
?>
                                    <tr>
                                        <td class="desc-col">
                                            <?php if ($this->_tpl_vars['cstom']['type'] == 'slider' || $this->_tpl_vars['cstom']['type'] == 'qty'): ?>
                                                <strong><?php echo $this->_tpl_vars['cstom']['fullname']; ?>
</strong> <?php if ($this->_tpl_vars['cstom']['qty'] >= 1): ?> <span class="green-val"> <?php echo $this->_tpl_vars['cstom']['qty']; ?>
</span><?php endif; ?>
                                            <?php elseif ($this->_tpl_vars['cstom']['type'] == 'select' || $this->_tpl_vars['cstom']['type'] == 'radio'): ?>
                                                <?php echo $this->_tpl_vars['cstom']['name']; ?>

                                                <strong><?php echo $this->_tpl_vars['cstom']['sname']; ?>
</strong>
                                            <?php else: ?>
                                                <strong><?php echo $this->_tpl_vars['cstom']['name']; ?>
</strong>
                                            <?php endif; ?>
                                        </td>
                                        <td class="price-col">
                                            <?php if ($this->_tpl_vars['cstom']['price'] == 0): ?><?php echo $this->_tpl_vars['lang']['Free']; ?>

                                            <?php elseif ($this->_tpl_vars['cstom']['prorata_amount']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                            <?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                            <?php endif; ?>

                                            <?php if ($this->_tpl_vars['cstom']['recurring'] == 'once' && $this->_tpl_vars['cstom']['price'] > 0): ?><?php echo $this->_tpl_vars['lang']['once']; ?>

                                            <?php endif; ?>

                                            <?php if ($this->_tpl_vars['cstom']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php echo smarty_function_counter(array('name' => 'alter'), $this);?>

                                <?php endforeach; endif; unset($_from); ?>
                            <?php endforeach; endif; unset($_from); ?>
                        <?php endif; ?>


                                                <?php if ($this->_tpl_vars['contents'][3]): ?>
                            <?php $_from = $this->_tpl_vars['contents'][3]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['addon']):
?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['lang']['addon']; ?>
 <strong><?php echo $this->_tpl_vars['addon']['name']; ?>
</strong></td>
                                    <td class="price-col">
                                        <?php if ($this->_tpl_vars['addon']['price'] == 0): ?><?php echo $this->_tpl_vars['lang']['Free']; ?>

                                        <?php elseif ($this->_tpl_vars['addon']['prorata_amount']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                        <?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['addon']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                        <?php endif; ?>
                                        <span class="font-normal">
                                        <?php if ($this->_tpl_vars['addon']['recurring']): ?><?php $this->assign('recurring', $this->_tpl_vars['addon']['recurring']); ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['recurring']]; ?>

                                        <?php elseif ($this->_tpl_vars['addon']['price'] > 0): ?><?php echo $this->_tpl_vars['lang']['once']; ?>

                                        <?php endif; ?>
                                        </span>
                                    </td>
                                </tr>
                                <?php echo smarty_function_counter(array('name' => 'alter'), $this);?>

                            <?php endforeach; endif; unset($_from); ?>
                        <?php endif; ?>

                                                <?php if ($this->_tpl_vars['contents'][4]): ?>
                            <?php $_from = $this->_tpl_vars['contents'][4]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subprod']):
?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['subprod']['category_name']; ?>
 <strong><?php echo $this->_tpl_vars['subprod']['name']; ?>
</strong></td>
                                    <td class="price-col">
                                        <?php if ($this->_tpl_vars['subprod']['price'] == 0): ?><?php echo $this->_tpl_vars['lang']['Free']; ?>

                                        <?php elseif ($this->_tpl_vars['subprod']['prorata_amount']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                        <?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                        <?php endif; ?>

                                        <?php if ($this->_tpl_vars['subprod']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                        <?php endif; ?>
                                        <span class="font-normal">
                                        <?php if ($this->_tpl_vars['subprod']['recurring']): ?><?php $this->assign('recurring', $this->_tpl_vars['subprod']['recurring']); ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['recurring']]; ?>

                                        <?php elseif ($this->_tpl_vars['subprod']['price'] > 0): ?><?php echo $this->_tpl_vars['lang']['once']; ?>

                                        <?php endif; ?>
                                        </span>
                                    </td>
                                </tr>
                                <?php echo smarty_function_counter(array('name' => 'alter'), $this);?>

                            <?php endforeach; endif; unset($_from); ?>
                        <?php endif; ?>

                                                <?php if ($this->_tpl_vars['contents'][2] && $this->_tpl_vars['contents'][2][0]['action'] != 'own'): ?>
                            <?php $_from = $this->_tpl_vars['contents'][2]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['kk'] => $this->_tpl_vars['domenka']):
?>
                                <tr>
                                    <td class="desc-col">

                                        <?php if ($this->_tpl_vars['domenka']['action'] == 'register'): ?><?php echo $this->_tpl_vars['lang']['domainregister']; ?>

                                        <?php elseif ($this->_tpl_vars['domenka']['action'] == 'transfer'): ?><?php echo $this->_tpl_vars['lang']['domaintransfer']; ?>

                                        <?php endif; ?>

                                        <strong>
                                            <?php echo $this->_tpl_vars['domenka']['name']; ?>

                                        </strong>
                                    </td>
                                    <td class="price-col">
                                        <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['domenka']['period']; ?>
&nbsp;<?php echo $this->_tpl_vars['lang']['years']; ?>

                                        <?php if ($this->_tpl_vars['domenka']['dns']): ?>&raquo; <?php echo $this->_tpl_vars['lang']['dnsmanage']; ?>
 (+ <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['dns'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
)<br/>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['domenka']['idp']): ?>&raquo; <?php echo $this->_tpl_vars['lang']['idprotect']; ?>
(+ <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['idp'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
)<br/>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['domenka']['email']): ?>&raquo; <?php echo $this->_tpl_vars['lang']['emailfwd']; ?>
 (+ <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['email'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
)<br/>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                                <?php echo smarty_function_counter(array('name' => 'alter'), $this);?>

                            <?php endforeach; endif; unset($_from); ?>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['tax']): ?>
                            <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['lang']['discount']; ?>
</td>
                                    <td class="price-col">- <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['tax']['tax1'] && $this->_tpl_vars['tax']['taxed1'] != 0): ?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['tax']['tax1name']; ?>
 @ <?php echo $this->_tpl_vars['tax']['tax1']; ?>
%  </td>
                                    <td class="price-col"><?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['taxed1'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['tax']['tax2'] && $this->_tpl_vars['tax']['taxed2'] != 0): ?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['tax']['tax2name']; ?>
 @ <?php echo $this->_tpl_vars['tax']['tax2']; ?>
%  </td>
                                    <td class="price-col"><?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['taxed2'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['tax']['credit'] != 0): ?>
                                <tr>
                                    <td class="desc-col"><strong><?php echo $this->_tpl_vars['lang']['credit']; ?>
</strong> </td>
                                    <td class="price-col"><?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['credit'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                        <?php elseif ($this->_tpl_vars['credit']): ?>
                            <?php if ($this->_tpl_vars['credit']['credit'] != 0): ?>
                                <tr>
                                    <td class="desc-col"><strong><?php echo $this->_tpl_vars['lang']['credit']; ?>
</strong> </td>
                                    <td class="price-col"><?php echo ((is_array($_tmp=$this->_tpl_vars['credit']['credit'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['lang']['discount']; ?>
</td>
                                    <td class="price-col">- <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                        <?php else: ?>
                            <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                                <tr>
                                    <td class="desc-col"><?php echo $this->_tpl_vars['lang']['discount']; ?>
</td>
                                    <td class="price-col">- <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</td>
                                </tr>
                            <?php endif; ?>
                        <?php endif; ?>
                        <?php if (! empty ( $this->_tpl_vars['tax']['recurring'] ) || ! empty ( $this->_tpl_vars['subtotal']['recurring'] )): ?>
                            <tr>
                                <td class="desc-col"><?php echo $this->_tpl_vars['lang']['total_recurring']; ?>
</td>
                                <td class="price-col">
                                    <?php if (! empty ( $this->_tpl_vars['tax']['recurring'] )): ?>
                                        <?php $_from = $this->_tpl_vars['tax']['recurring']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['rec']):
?>
                                            <div class="recurring"><?php echo ((is_array($_tmp=$this->_tpl_vars['rec'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <span class="font-normal"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
</span></div>
                                        <?php endforeach; endif; unset($_from); ?>
                                    <?php elseif (! empty ( $this->_tpl_vars['subtotal']['recurring'] )): ?>
                                        <?php $_from = $this->_tpl_vars['subtotal']['recurring']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['rec']):
?>
                                            <div class="recurring"><?php echo ((is_array($_tmp=$this->_tpl_vars['rec'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <span class="font-normal"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
</span></div>
                                        <?php endforeach; endif; unset($_from); ?>
                                    <?php endif; ?>
                                </td>
                                <?php echo smarty_function_counter(array('name' => 'alter'), $this);?>

                            </tr>
                        <?php endif; ?>
                    </table>

                    <div class="total-summary">
                        <p class="total-text"><?php echo $this->_tpl_vars['lang']['total_today']; ?>
:</p>
                        <p class="total-price">
                            <?php if ($this->_tpl_vars['tax']): ?>
                                <?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                            <?php elseif ($this->_tpl_vars['credit']): ?>
                                <?php echo ((is_array($_tmp=$this->_tpl_vars['credit']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                            <?php else: ?>
                                <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                            <?php endif; ?></p>
                    </div>

                </div>
                <div class="promo-code">
                    <?php if (! $this->_tpl_vars['subtotal']['coupon']): ?>
                            <p><?php echo $this->_tpl_vars['lang']['usecoupon']; ?>
</p>
                            <div class="input-append">
                                <input class="span3" type="text" name="promocode">
                                <a href="#" onclick="applyCoupon(); return false;">
                                    <i class="icon-coupon-arrow"></i>
                                </a>
                            </div>
                    <?php else: ?>
                        <div class="promo-input">
                            <a href="#"onclick="removeCoupon(); return false" title="<?php echo $this->_tpl_vars['lang']['remove_coupon']; ?>
"><?php echo $this->_tpl_vars['lang']['remove_coupon']; ?>
: <?php echo $this->_tpl_vars['subtotal']['coupon']; ?>
</a>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Order Summary -->
</div>

<!-- End of Product Configuration -->