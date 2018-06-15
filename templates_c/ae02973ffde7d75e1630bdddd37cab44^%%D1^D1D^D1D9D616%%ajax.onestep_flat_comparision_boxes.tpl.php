<?php /* Smarty version 2.6.26, created on 2018-06-14 09:57:00
         compiled from ajax.onestep_flat_comparision_boxes.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'price', 'ajax.onestep_flat_comparision_boxes.tpl', 153, false),array('modifier', 'dateformat', 'ajax.onestep_flat_comparision_boxes.tpl', 154, false),)), $this); ?>
<!-- Customize Plan -->
<div class="customize-plan">
    <h4>
        <div class="section-icon-bg">
            <div class="todo-icon fui-gear"></div>
        </div>
        <?php echo $this->_tpl_vars['lang']['productconfig']; ?>

    </h4>

    <div class="padding">
        <form id="cartform" action="" method="post">
            <?php if (( $this->_tpl_vars['product']['paytype'] != 'Free' && $this->_tpl_vars['product']['paytype'] != 'Once' ) || ( $this->_tpl_vars['product']['hostname'] ) && ! ( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] == '1' || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>

            <h6><?php echo $this->_tpl_vars['lang']['serverdetails']; ?>
</h6>
            <?php if (( $this->_tpl_vars['product']['paytype'] != 'Free' && $this->_tpl_vars['product']['paytype'] != 'Once' )): ?>

                <p><?php echo $this->_tpl_vars['lang']['pickcycle']; ?>
</p>
                <div class="billing-cycle span3">
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/price.tpl", 'smarty_include_vars' => array('allprices' => 'cycle')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                </div>

            <?php endif; ?>
            <?php if (( $this->_tpl_vars['product']['hostname'] ) && ! ( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] == '1' || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>
                <p><?php echo $this->_tpl_vars['lang']['hostname']; ?>
:</p>

                <div class="hostname-input">
                    <input name="domain" value="<?php echo $this->_tpl_vars['item']['domain']; ?>
" class="styled" size="50" onchange="if (typeof simulateCart == 'function')
                                    simulateCart();"/>
                </div>
            <?php endif; ?>
            <?php endif; ?>
                <?php if ($this->_tpl_vars['custom'] || $this->_tpl_vars['addons'] || $this->_tpl_vars['subproducts']): ?>
                    <h6 class="margin"><?php echo $this->_tpl_vars['lang']['serverconfiguration']; ?>
</h6>
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/onestep_forms.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                    <?php if ($this->_tpl_vars['addons']): ?>
                        <p class="config-subtitle"><?php echo $this->_tpl_vars['lang']['addons_single']; ?>
:</p>
                    <?php endif; ?>
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/onestep_addons.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                    <?php if ($this->_tpl_vars['subproducts']): ?>
                        <p class="config-subtitle"><?php echo $this->_tpl_vars['lang']['subproduct']; ?>
:</p>
                    <?php endif; ?>
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/onestep_subproducts.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                <?php endif; ?>
            </form>
            <?php if (( $this->_tpl_vars['cart_contents'][0]['domainoptions']['register'] ) == '1' && ( $this->_tpl_vars['allowregister'] || $this->_tpl_vars['allowtransfer'] || $this->_tpl_vars['allowown'] || $this->_tpl_vars['subdomain'] )): ?>
                <div class="clear"></div>
                <h6><?php echo $this->_tpl_vars['lang']['mydomains']; ?>
</h6>
                <div class="btn-group domain-tab">
                    <?php if ($this->_tpl_vars['allowregister']): ?>
                        <button rel="t1" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'register' || ! $this->_tpl_vars['contents'][2]): ?>active<?php endif; ?>" onclick="tabbme(this);"><?php echo $this->_tpl_vars['lang']['register']; ?>
</button>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['allowtransfer']): ?>
                        <button rel="t2" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'transfer'): ?>active<?php endif; ?>" onclick="tabbme(this);"><?php echo $this->_tpl_vars['lang']['transfer']; ?>
</button>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['allowown']): ?>
                        <button rel="t3" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'own' && ! $this->_tpl_vars['subdomain']): ?>active<?php endif; ?>" onclick="tabbme(this);"><?php echo $this->_tpl_vars['lang']['alreadyhave']; ?>
</button>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['subdomain']): ?>
                        <button rel="t4" class="btn <?php if ($this->_tpl_vars['contents'][2]['action'] == 'own' && $this->_tpl_vars['subdomain']): ?>active<?php endif; ?>" onclick="tabbme(this);"><?php echo $this->_tpl_vars['lang']['subdomain']; ?>
</button>
                    <?php endif; ?>
                </div>
                <div class="clear" style="text-align: left">
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/onestep_domains.tpl', 'smarty_include_vars' => array('bulktld_col' => 2)));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                </div>
            <?php endif; ?>

        </div>


    </div>
    <!-- End of Customize Plan -->



    <!-- What's inclued -->
    <div class="plan-included">
        <div class="padding">
            <h4>What's included</h4>
            <ul>
                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Free SiteBuilder
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Hosting Automation
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        DNS Management
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>

                <li>
                    <span>
                        <div class="icon-bg">
                            <div class="todo-icon fui-check"></div>
                        </div>
                        Order Pages
                    </span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </li>
            </ul>
        </div>
    </div>
    <!-- End of What's inclued -->


    <!-- Order Summary -->
    <div class="summary" id="orderSummary">
        <h4>
            <div class="section-icon-bg">
                <div class="todo-icon fui-list"></div>
            </div>
            <?php echo $this->_tpl_vars['lang']['ordersummary']; ?>

        </h4>

        <div class="table-bg">
            <div class="padding">
                <table class="table">
                    <tr>
                        <th><?php echo $this->_tpl_vars['lang']['Description']; ?>
</th>
                        <th width="90"><?php echo $this->_tpl_vars['lang']['price']; ?>
</th>
                    </tr>
                    <?php if ($this->_tpl_vars['product']): ?>
                        <tr>
                            <td>
                                <?php echo $this->_tpl_vars['contents'][0]['name']; ?>

                                <?php if ($this->_tpl_vars['contents'][0]['domain']): ?>(<?php echo $this->_tpl_vars['contents'][0]['domain']; ?>
)
                                <?php endif; ?>
                            </td>
                            <td>
                                <?php if ($this->_tpl_vars['contents'][0]['price'] == 0): ?>
                                    <?php echo $this->_tpl_vars['lang']['Free']; ?>

                                <?php elseif ($this->_tpl_vars['contents'][0]['prorata_amount']): ?>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                    (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                <?php else: ?>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['contents'][0]['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

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
                                <?php if ($this->_tpl_vars['cstom']['total'] > 0): ?>
                                    <tr>
                                        <td>
                                            <?php echo $this->_tpl_vars['cstom']['fullname']; ?>
  <?php if ($this->_tpl_vars['cstom']['qty'] >= 1): ?>x <?php echo $this->_tpl_vars['cstom']['qty']; ?>
<?php endif; ?>
                                        </td>

                                        <td>
                                            <?php if ($this->_tpl_vars['cstom']['price'] == 0): ?><?php echo $this->_tpl_vars['lang']['Free']; ?>

                                            <?php elseif ($this->_tpl_vars['cstom']['prorata_amount']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                            <?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                            <?php endif; ?>
                                            <?php if ($this->_tpl_vars['cstom']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['cstom']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                        <?php endforeach; endif; unset($_from); ?>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['contents'][3]): ?>
                        <?php $_from = $this->_tpl_vars['contents'][3]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['addon']):
?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['addon']; ?>
 <strong><?php echo $this->_tpl_vars['addon']['name']; ?>
</strong>
                                </td>
                                <td>
                                    <?php if ($this->_tpl_vars['addon']['price'] == 0): ?><strong><?php echo $this->_tpl_vars['lang']['Free']; ?>
</strong>
                                    <?php elseif ($this->_tpl_vars['addon']['prorata_amount']): ?><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong> (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                    <?php else: ?><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['addon']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['addon']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; endif; unset($_from); ?>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['contents'][2] && $this->_tpl_vars['contents'][2][0]['action'] != 'own'): ?>
                        <?php $_from = $this->_tpl_vars['contents'][2]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['kk'] => $this->_tpl_vars['domenka']):
?>
                            <tr>
                                <td>
                                    <?php if ($this->_tpl_vars['domenka']['action'] == 'register'): ?><?php echo $this->_tpl_vars['lang']['domainregister']; ?>

                                    <?php elseif ($this->_tpl_vars['domenka']['action'] == 'transfer'): ?><?php echo $this->_tpl_vars['lang']['domaintransfer']; ?>

                                    <?php endif; ?></strong> - <?php echo $this->_tpl_vars['domenka']['name']; ?>
 - <?php echo $this->_tpl_vars['domenka']['period']; ?>
 <?php echo $this->_tpl_vars['lang']['years']; ?>

                                </td>
                                <td>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endforeach; endif; unset($_from); ?>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['contents'][4]): ?>
                        <?php $_from = $this->_tpl_vars['contents'][4]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subprod']):
?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['subprod']['category_name']; ?>
 - <strong><?php echo $this->_tpl_vars['subprod']['name']; ?>
</strong>
                                </td>
                                <td>
                                    <?php if ($this->_tpl_vars['subprod']['price'] == 0): ?><strong><?php echo $this->_tpl_vars['lang']['Free']; ?>
</strong>
                                    <?php elseif ($this->_tpl_vars['subprod']['prorata_amount']): ?>
                                        <strong> <?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['prorata_amount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong>
                                        (<?php echo $this->_tpl_vars['lang']['prorata']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['prorata_date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
)
                                    <?php else: ?><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong>
                                    <?php endif; ?>
                                    <?php if ($this->_tpl_vars['subprod']['setup'] != 0): ?> + <?php echo ((is_array($_tmp=$this->_tpl_vars['subprod']['setup'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang']['setupfee']; ?>

                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; endif; unset($_from); ?>
                    <?php endif; ?>


                    <?php if (! empty ( $this->_tpl_vars['tax']['recurring'] )): ?>
                        <tr>
                            <td>
                                <?php echo $this->_tpl_vars['lang']['total_recurring']; ?>

                            </td>
                            <td>
                                <?php $_from = $this->_tpl_vars['tax']['recurring']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['rec']):
?>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['rec'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
<br/>
                                <?php endforeach; endif; unset($_from); ?>
                            </td>
                        </tr>
                    <?php elseif (! empty ( $this->_tpl_vars['subtotal']['recurring'] )): ?>
                        <tr>
                            <td>
                                <?php echo $this->_tpl_vars['lang']['total_recurring']; ?>

                            </td>
                            <td>
                                <?php $_from = $this->_tpl_vars['subtotal']['recurring']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['rec']):
?>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['rec'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
 <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
<br/>
                                <?php endforeach; endif; unset($_from); ?>
                            </td>
                        </tr>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['tax']): ?>
                        <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['discount']; ?>

                                </td>
                                <td>
                                    - <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['tax']['tax1'] && $this->_tpl_vars['tax']['taxed1'] != 0): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['tax']['tax1name']; ?>
 @ <?php echo $this->_tpl_vars['tax']['tax1']; ?>
%
                                </td>
                                <td>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['taxed1'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['tax']['tax2'] && $this->_tpl_vars['tax']['taxed2'] != 0): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['tax']['tax2name']; ?>
 @ <?php echo $this->_tpl_vars['tax']['tax2']; ?>
%
                                </td>
                                <td>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['taxed2'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['tax']['credit'] != 0): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['credit']; ?>

                                </td>
                                <td>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['credit'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endif; ?>
                    <?php elseif ($this->_tpl_vars['credit']): ?>
                        <?php if ($this->_tpl_vars['credit']['credit'] != 0): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['credit']; ?>

                                </td>
                                <td>
                                    <?php echo ((is_array($_tmp=$this->_tpl_vars['credit']['credit'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>

                        <?php endif; ?>

                        <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['discount']; ?>

                                </td>
                                <td>
                                    - <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>

                        <?php endif; ?>
                    <?php else: ?>
                        <?php if ($this->_tpl_vars['subtotal']['coupon']): ?>
                            <tr>
                                <td>
                                    <?php echo $this->_tpl_vars['lang']['discount']; ?>

                                </td>
                                <td>
                                    - <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['discount'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                                </td>
                            </tr>
                        <?php endif; ?>
                    <?php endif; ?>

                </table>
            </div>

            <div class="separator-line"></div>
            <div class="padding promo-code clearfix">
                <?php if (! $this->_tpl_vars['subtotal']['coupon']): ?>
                    <a class="pull-right" style="margin: 0px 5px 15px;" href="#" onclick="$(this).hide().next().show();
                        return false" title="Add coupon"> <i class="fui-plus"></i> Add coupon </a>
                    <div class="padding hostname-input" style="display: none">
                        <input class="span4" type="text" name="promocode" onchange="applyCoupon()" placeholder="<?php echo $this->_tpl_vars['lang']['usecoupon']; ?>
" style="width:190px">
                    </div>
                <?php else: ?>
                    <div class="promo-input">
                        <a class="pull-right" style="margin: 0px 5px 15px;" href="#"onclick="removeCoupon();
                            return false" title="<?php echo $this->_tpl_vars['lang']['remove_coupon']; ?>
"><?php echo $this->_tpl_vars['lang']['remove_coupon']; ?>
: <?php echo $this->_tpl_vars['subtotal']['coupon']; ?>
</a>
                    </div>
                <?php endif; ?>
            </div>
            <div class="padding">
                <p><?php echo $this->_tpl_vars['lang']['total_today']; ?>
</p>
                <h1>
                    <?php if ($this->_tpl_vars['tax']): ?>
                        <?php echo ((is_array($_tmp=$this->_tpl_vars['tax']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                    <?php elseif ($this->_tpl_vars['credit']): ?>
                        <?php echo ((is_array($_tmp=$this->_tpl_vars['credit']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                    <?php else: ?>
                        <?php echo ((is_array($_tmp=$this->_tpl_vars['subtotal']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>

                    <?php endif; ?></h1>
            </div>
        </div>
    </div>
    <!-- End of Order Summary -->

    <script type="text/javascript">bindSimulateCart();</script>