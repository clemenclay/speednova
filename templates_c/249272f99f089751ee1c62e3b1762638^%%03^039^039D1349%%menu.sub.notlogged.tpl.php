<?php /* Smarty version 2.6.26, created on 2018-06-19 16:25:00
         compiled from menus/menu.sub.notlogged.tpl */ ?>
<?php if ($this->_tpl_vars['cmd'] == 'root' && $this->_tpl_vars['infopages']): ?>

<ul class="nav nav-pills pa1">
    <?php $_from = $this->_tpl_vars['infopages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['paged']):
?>
    <li <?php if ($this->_tpl_vars['page'] && $this->_tpl_vars['page']['title'] == $this->_tpl_vars['paged']['title']): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
page/<?php echo $this->_tpl_vars['paged']['url']; ?>
/" ><?php echo $this->_tpl_vars['paged']['title']; ?>
</a></li>
	<?php endforeach; endif; unset($_from); ?>

    <?php $_from = $this->_tpl_vars['HBaddons']['client_submenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['ad']['link']; ?>
/" ><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
    <?php endforeach; endif; unset($_from); ?>
</ul>

<?php elseif ($this->_tpl_vars['cmd'] == 'tickets' || $this->_tpl_vars['cmd'] == 'knowledgebase' || $this->_tpl_vars['cmd'] == 'support' || $this->_tpl_vars['cmd'] == 'downloads' || $this->_tpl_vars['cmd'] == 'netstat'): ?>

<ul class="nav nav-pills pa1">

    <li <?php if ($this->_tpl_vars['cmd'] == 'support'): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
support/"  <?php if ($this->_tpl_vars['cmd'] == 'support'): ?>class='active'<?php endif; ?>><?php echo $this->_tpl_vars['lang']['supporthome']; ?>
</a></li>
    <li <?php if ($this->_tpl_vars['cmd'] == 'tickets'): ?>class='active'<?php endif; ?>><a href="<?php if ($this->_tpl_vars['logged'] == '1'): ?><?php echo $this->_tpl_vars['ca_url']; ?>
tickets<?php else: ?><?php echo $this->_tpl_vars['ca_url']; ?>
tickets/new/<?php endif; ?>"  ><?php echo $this->_tpl_vars['lang']['mytickets']; ?>
</a></li>
	<?php if ($this->_tpl_vars['enableFeatures']['kb'] != 'off'): ?>
    <li <?php if ($this->_tpl_vars['cmd'] == 'knowledgebase'): ?>class="active"<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
knowledgebase/"  ><?php echo $this->_tpl_vars['lang']['knowledgebase']; ?>
</a></li>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['enableFeatures']['downloads'] != 'off'): ?>
    <li  <?php if ($this->_tpl_vars['cmd'] == 'downloads'): ?>class="active"<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
downloads/" ><?php echo $this->_tpl_vars['lang']['downloads']; ?>
</a></li>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['enableFeatures']['netstat'] != 'off'): ?>
    <li  <?php if ($this->_tpl_vars['cmd'] == 'netstat'): ?>class="active"<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
netstat/" ><?php echo $this->_tpl_vars['lang']['netstat']; ?>
</a></li>
	<?php endif; ?>


</ul>

<?php elseif ($this->_tpl_vars['cmd'] == 'cart' || $this->_tpl_vars['cmd'] == 'checkdomain'): ?>
<ul class="nav nav-pills pa1">
    <li  <?php if ($this->_tpl_vars['cmd'] == 'cart'): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/" ><?php echo $this->_tpl_vars['lang']['placeorder']; ?>
</a></li>
    <?php if ($this->_tpl_vars['enableFeatures']['domains'] != 'off' && $this->_tpl_vars['domaincategories']): ?>
    <?php $_from = $this->_tpl_vars['domaincategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
    <li  <?php if ($this->_tpl_vars['cmd'] == 'checkdomain' && $this->_tpl_vars['domain_cat'] == $this->_tpl_vars['cat']['id']): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
checkdomain/<?php echo $this->_tpl_vars['cat']['slug']; ?>
/" ><?php echo $this->_tpl_vars['cat']['name']; ?>
</a></li>
    <?php endforeach; endif; unset($_from); ?>
    <?php endif; ?>

</ul>

<?php endif; ?>





<div class="clear"></div>