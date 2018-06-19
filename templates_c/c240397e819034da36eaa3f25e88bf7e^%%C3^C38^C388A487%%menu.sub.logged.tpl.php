<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from menus/menu.sub.logged.tpl */ ?>
<?php if (( $this->_tpl_vars['cmd'] == 'root' || $this->_tpl_vars['cmd'] == 'page' ) && $this->_tpl_vars['infopages']): ?>
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

<?php elseif ($this->_tpl_vars['cmd'] == 'affiliates' && $this->_tpl_vars['affiliate']): ?>

<ul class="nav nav-pills pa1">
    <li <?php if ($this->_tpl_vars['action'] == 'default'): ?>class='active'<?php endif; ?>><a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['cmd']; ?>
/"><?php echo $this->_tpl_vars['lang']['affiliatecenter']; ?>
</a></li>
    <li <?php if ($this->_tpl_vars['action'] == 'commissions'): ?>class='active'<?php endif; ?>><a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['cmd']; ?>
/commissions/"><?php echo $this->_tpl_vars['lang']['mycommisions']; ?>
</a></li>
    <li <?php if ($this->_tpl_vars['action'] == 'vouchers' || $this->_tpl_vars['action'] == 'addvoucher'): ?>class='active'<?php endif; ?>><a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['cmd']; ?>
/vouchers/"><?php echo $this->_tpl_vars['lang']['myvouchers']; ?>
</a></li>
    <li <?php if ($this->_tpl_vars['action'] == 'payouts'): ?>class='active'<?php endif; ?>><a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php echo $this->_tpl_vars['cmd']; ?>
/payouts/"><?php echo $this->_tpl_vars['lang']['payouts']; ?>
</a></li>
</ul>

<?php elseif ($this->_tpl_vars['cmd'] == 'clientarea' || $this->_tpl_vars['cmd'] == 'dns' || $this->_tpl_vars['cmd'] == 'profiles'): ?>

<?php if ($this->_tpl_vars['action'] != 'details' && $this->_tpl_vars['action'] != 'password' && $this->_tpl_vars['action'] != 'ccard' && $this->_tpl_vars['action'] != 'addfunds' && $this->_tpl_vars['action'] != 'ipaccess' && $this->_tpl_vars['action'] != 'invoices' && $this->_tpl_vars['action'] != 'history' && $this->_tpl_vars['action'] != 'emails' && $this->_tpl_vars['cmd'] != 'profiles' && $this->_tpl_vars['action'] != '_default' && $this->_tpl_vars['action'] != 'default'): ?>
<ul class="nav nav-pills pa1">
    <li  <?php if ($this->_tpl_vars['cmd'] == 'clientarea' && $this->_tpl_vars['action'] == 'default'): ?>class='active'<?php endif; ?>><a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['summary']; ?>
</a></li>

            <?php if ($this->_tpl_vars['offer']): ?>
                    <?php $_from = $this->_tpl_vars['offer']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['o']):
?>
    <li  <?php if ($this->_tpl_vars['action'] == 'services' && $this->_tpl_vars['cid'] == $this->_tpl_vars['o']['id'] || $this->_tpl_vars['service']['category_id'] == $this->_tpl_vars['o']['id']): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/services/<?php echo $this->_tpl_vars['o']['slug']; ?>
/"  ><?php echo $this->_tpl_vars['o']['name']; ?>
 </a></li>
                    <?php endforeach; endif; unset($_from); ?>
            <?php endif; ?>


             <?php if ($this->_tpl_vars['enableFeatures']['domains'] != 'off'): ?>
    <li <?php if ($this->_tpl_vars['cmd'] == 'clientarea' && $this->_tpl_vars['action'] == 'domains'): ?>class='active'<?php endif; ?>><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/domains/" ><?php echo $this->_tpl_vars['lang']['mydomains']; ?>
</a></li>
    <?php endif; ?>
</ul>
<?php else: ?>
<div class="divider"></div>
<?php endif; ?>

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