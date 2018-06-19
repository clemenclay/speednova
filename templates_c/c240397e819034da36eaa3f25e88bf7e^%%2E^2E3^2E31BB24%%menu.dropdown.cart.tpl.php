<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from menus/menu.dropdown.cart.tpl */ ?>
<div class="cntn"><div class="row">
    <div class="span8">
        <div class="row ">
            <div class="span5">
                <ul class="span5">
                    <li class="nav-header span5"><?php echo $this->_tpl_vars['lang']['placeorder']; ?>
</li>
                    <?php $_from = $this->_tpl_vars['orderpages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['op']):
?>
                        <li><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<?php echo $this->_tpl_vars['op']['slug']; ?>
/"><?php echo $this->_tpl_vars['op']['name']; ?>
</a></li>
                    <?php endforeach; endif; unset($_from); ?>


                </ul>
            </div>
            <div class="span3">
                <center>
                    <div class="iconwrap"><span style="" class="iconfont-cloud iconfont-size5 silver"></span><br/></div>
                    <p class="silver"><?php echo $this->_tpl_vars['lang']['checkoffersphrase']; ?>
</p>
                    <button href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/" class="btn btn-success"><i class="icon-shopping-cart icon-white"></i> <?php echo $this->_tpl_vars['lang']['proceedtocart']; ?>
</button>
                </center>
            </div>
        </div>
    </div>
</div></div>