<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from menus/menu.dropdown.services.tpl */ ?>
<div class="cntn"><div class="row">
    <div class="span8">
        <div class="row ">

            <?php if ($this->_tpl_vars['offer_total'] > 0): ?>
            <div class="span5">
                <ul class="span5 servicesmenu">
                    <li class="nav-header span5"><?php echo $this->_tpl_vars['lang']['my_servicesinfo']; ?>
</li>
                    <?php $_from = $this->_tpl_vars['offer']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['offe']):
?>
	<?php if ($this->_tpl_vars['offe']['total'] > 0): ?>
                    <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/services/<?php echo $this->_tpl_vars['offe']['slug']; ?>
/" ><?php echo $this->_tpl_vars['offe']['name']; ?>
 <span class="counter"><?php echo $this->_tpl_vars['offe']['total']; ?>
</span></a></li>
	<?php endif; ?>
	<?php endforeach; endif; unset($_from); ?>
                    <?php if ($this->_tpl_vars['offer_domains']): ?>
                    <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/domains/" ><?php echo $this->_tpl_vars['lang']['domains']; ?>
 <span class="counter"><?php echo $this->_tpl_vars['offer_domains']; ?>
</span></a></li>
                    <?php endif; ?>
                </ul>

            </div>
            <?php else: ?>
            <div class="span5 introduction">
                <p class="silver"><?php echo $this->_tpl_vars['lang']['servicesintroduction']; ?>
</p>
                <button class="btn btn-success" href="index.php?/cart/"><i class="icon-shopping-cart icon-white"></i> <?php echo $this->_tpl_vars['lang']['proceedtocart']; ?>
</button>

            </div>
            <?php endif; ?>
            <div class="span3">
                <center>
                    <div class="iconwrap"><span style="" class="iconfont-gear iconfont-size5 silver"></span><br/></div>
                    <p class="silver"><?php echo $this->_tpl_vars['lang']['my_services']; ?>
</p>
                </center>
            </div>

        </div>
    </div>
</div></div>