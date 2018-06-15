<?php /* Smarty version 2.6.26, created on 2018-06-11 12:14:19
         compiled from cart.progress.tpl */ ?>
<?php if ($this->_tpl_vars['step'] != 5 && $this->_tpl_vars['step'] != 0): ?>

<?php if ($this->_tpl_vars['step'] > 2 && ( ! $this->_tpl_vars['cart_contents'][2] || $this->_tpl_vars['cart_contents'][2][0]['action'] == 'hostname' )): ?>
<?php $this->assign('pclass', 'asw3'); ?>
<?php elseif ($this->_tpl_vars['step'] == 1 || ( $this->_tpl_vars['cart_contents'][2] && $this->_tpl_vars['cart_contents'][2][0]['action'] != 'own' )): ?> 
<?php $this->assign('pclass', 'asw5'); ?>
<?php elseif ($this->_tpl_vars['step'] > 1 && $this->_tpl_vars['cart_contents'][2][0]['action'] == 'own'): ?> 
<?php $this->assign('pclass', 'asw4'); ?>
<?php endif; ?>
	<center>
		<ul id="progress">
			
			
			<?php if ($this->_tpl_vars['pclass'] != 'asw3'): ?>		
			<li class="firstone <?php if ($this->_tpl_vars['step'] > 1): ?>fison2<?php endif; ?> <?php echo $this->_tpl_vars['pclass']; ?>
">			
				<?php echo $this->_tpl_vars['lang']['mydomains']; ?>

			<?php elseif ($this->_tpl_vars['pclass'] == 'asw3'): ?>
			<li class="firstone <?php if ($this->_tpl_vars['step'] > 3): ?>fison2<?php endif; ?>  <?php echo $this->_tpl_vars['pclass']; ?>
">		
					<?php echo $this->_tpl_vars['lang']['productconfig']; ?>

			<?php endif; ?>
			</li>
			
			
			
			<?php if ($this->_tpl_vars['pclass'] == 'asw5'): ?>	
				<li class="<?php echo $this->_tpl_vars['pclass']; ?>
 <?php if ($this->_tpl_vars['step'] == 2): ?>ison1<?php elseif ($this->_tpl_vars['step'] > 2): ?>ison2<?php endif; ?>">				
				<?php echo $this->_tpl_vars['lang']['productconfig2']; ?>

				</li>
			<?php elseif ($this->_tpl_vars['pclass'] == 'asw4'): ?>			
				<li class="<?php echo $this->_tpl_vars['pclass']; ?>
 <?php if ($this->_tpl_vars['step'] == 3): ?>ison1<?php elseif ($this->_tpl_vars['step'] > 3): ?>ison2<?php endif; ?> ">				
				<?php echo $this->_tpl_vars['lang']['productconfig']; ?>

				</li>						
			<?php endif; ?>
				
		<?php if ($this->_tpl_vars['pclass'] == 'asw5'): ?>	
			<li class="<?php if ($this->_tpl_vars['step'] == 3): ?>ison1<?php elseif ($this->_tpl_vars['step'] > 3): ?>ison2<?php endif; ?> <?php echo $this->_tpl_vars['pclass']; ?>
">				
				<?php echo $this->_tpl_vars['lang']['productconfig']; ?>

				</li>						
			<?php endif; ?>
			
			
			
			
			<li class="<?php echo $this->_tpl_vars['pclass']; ?>
 <?php if ($this->_tpl_vars['step'] == 4): ?>ison1<?php elseif ($this->_tpl_vars['step'] > 3): ?>ison2<?php endif; ?>">
			<?php echo $this->_tpl_vars['lang']['ordersummary']; ?>

			</li>
			
			<li class="lastone <?php echo $this->_tpl_vars['pclass']; ?>
">
			<?php echo $this->_tpl_vars['lang']['checkout']; ?>

			</li>
			
			
		
		</ul>
<div class="clear"></div> 
</center>
<?php endif; ?>

<?php if ($this->_tpl_vars['step'] > 0 && $this->_tpl_vars['step'] < 4): ?>
<style type="text/css"><?php echo '
#cont {
	width:630px !important;
}
/* ulli+description display fix*/
ul li dl dd, #product_description ol{
	display:none;
}
'; ?>
</style>
<?php endif; ?>