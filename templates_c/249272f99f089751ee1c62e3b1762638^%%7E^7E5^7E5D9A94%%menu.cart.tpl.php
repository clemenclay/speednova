<?php /* Smarty version 2.6.26, created on 2018-06-19 16:25:00
         compiled from menus/menu.cart.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'checkcondition', 'menus/menu.cart.tpl', 1, false),array('modifier', 'price', 'menus/menu.cart.tpl', 19, false),)), $this); ?>
<?php if (((is_array($_tmp='config:ShopingCartMode')) ? $this->_run_mod_handler('checkcondition', true, $_tmp) : smarty_modifier_checkcondition($_tmp))): ?>
<div class="dropdown cart-dropdown">
    <button class="btn btn-success dropdown-toggle cart-dropdown-grp" data-toggle="dropdown">
        <i class="icon icon-shopping-cart icon-white"></i> <?php echo $this->_tpl_vars['lang']['cart']; ?>

        <span class="caret"></span>
    </button>
    <div class="dropdown-menu">
        <div class="cntn"><div class="row">
                <div class="span8">
                    <div class="row ">
                        <div class="span5">
                            <ul class="span5">
                                <?php if ($this->_tpl_vars['shoppingcart']): ?>
                                    <li class="nav-header span5"><?php echo $this->_tpl_vars['lang']['itemscart']; ?>
</li>
                                        <?php $_from = $this->_tpl_vars['shoppingcart']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['order']):
?>
                                            <?php if ($this->_tpl_vars['order']['product']): ?>
                                            <li>
                                                <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart&cart=edit&order=<?php echo $this->_tpl_vars['k']; ?>
">
                                                    <span class="counter"><?php echo ((is_array($_tmp=$this->_tpl_vars['order']['total']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</span>
                                                    <span class="text-overflow">
                                                        <?php echo $this->_tpl_vars['order']['product']['category_name']; ?>
 - <?php echo $this->_tpl_vars['order']['product']['name']; ?>

                                                        <?php if ($this->_tpl_vars['order']['product']['domain']): ?>(<?php echo $this->_tpl_vars['order']['product']['domain']; ?>
)
                                                        <?php endif; ?>
                                                    </span>
                                                </a> 
                                            </li>           
                                        <?php elseif ($this->_tpl_vars['order']['domains']): ?>
                                            <?php $_from = $this->_tpl_vars['order']['domains']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['kk'] => $this->_tpl_vars['domenka']):
?>
                                                <li>
                                                    <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart&cart=edit&order=<?php echo $this->_tpl_vars['k']; ?>
">
                                                        <span class="counter"><?php echo ((is_array($_tmp=$this->_tpl_vars['domenka']['price'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</span>
                                                        <span class="text-overflow">
                                                            <?php if ($this->_tpl_vars['domenka']['action'] == 'register'): ?><?php echo $this->_tpl_vars['lang']['domainregister']; ?>

                                                            <?php elseif ($this->_tpl_vars['domenka']['action'] == 'transfer'): ?><?php echo $this->_tpl_vars['lang']['domaintransfer']; ?>

                                                            <?php elseif ($this->_tpl_vars['domenka']['action'] == 'renew'): ?><?php echo $this->_tpl_vars['lang']['domainrenewal']; ?>

                                                            <?php endif; ?>
                                                            - <?php echo $this->_tpl_vars['domenka']['name']; ?>
 - <?php echo $this->_tpl_vars['domenka']['period']; ?>
 <?php echo $this->_tpl_vars['lang']['years']; ?>

                                                        </span>
                                                    </a> 
                                                </li>           
                                            <?php endforeach; endif; unset($_from); ?>
                                        <?php endif; ?>

                                    <?php endforeach; endif; unset($_from); ?>
                                <?php else: ?>
                                    <li class="nav-header span5"><?php echo $this->_tpl_vars['lang']['yourcartisempty']; ?>
</li>
                                    <li class="span5">&nbsp;</li>
                                    <li class="span5"><button class="btn btn-success" href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/"><i class="icon-shopping-cart icon-white"></i> <?php echo $this->_tpl_vars['lang']['placeorder']; ?>
</button></li>
                                    <?php endif; ?>
                            </ul>
                        </div>
                        <div class="span3">
                            <center>
                                <div class="iconwrap"><span class="iconfont-price-tag iconfont-size5 silver" style=""></span><br></div>
                                    <?php if ($this->_tpl_vars['shoppingcart']): ?>
                                    <p class="silver"></p>
                                    <button class="btn btn-success" href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/"><i class="icon-shopping-cart icon-white"></i> <?php echo $this->_tpl_vars['lang']['proceedtocart']; ?>
</button>
                                <?php endif; ?>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</div>
<?php endif; ?>