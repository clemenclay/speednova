<?php /* Smarty version 2.6.26, created on 2018-06-11 12:31:36
         compiled from module_head.tpl */ ?>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb" <?php if ($this->_tpl_vars['currentfilter']): ?>class="searchon"<?php endif; ?>>
    <tr>
        <td colspan="2"><h3><?php if ($this->_tpl_vars['modname']): ?><?php echo $this->_tpl_vars['modname']; ?>
<?php else: ?><?php echo $this->_tpl_vars['lang']['modulemanagement']; ?>
<?php endif; ?></h3></td>
    </tr>
    <tr>
        <?php if ($this->_tpl_vars['showleftmenu'] || $this->_tpl_vars['cmd'] == 'managemodules'): ?>
        <td class="leftNav">
            <?php if ($this->_tpl_vars['cmd'] == 'managemodules'): ?>

                <a href="?cmd=managemodules&action=default" class="tstyled <?php if (( $this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'default' ) || $this->_tpl_vars['cmd'] != 'managemodules'): ?>selected<?php endif; ?>"><strong><?php echo $this->_tpl_vars['lang']['Home']; ?>
</strong></a><br />
                <a href="?cmd=managemodules&action=other" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'module' || $this->_tpl_vars['action'] == 'other'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['Plugins']; ?>
</a>
                <a href="?cmd=managemodules&action=payment" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'payment'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['paymentmodules']; ?>
</a>
                <a href="?cmd=managemodules&action=domain" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'domain'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['domainmodules']; ?>
</a>
                <a href="?cmd=managemodules&action=fraud" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'fraud'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['fraudmodules']; ?>
</a>
                <a href="?cmd=managemodules&action=hosting" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'hosting'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['hostingmodules']; ?>
</a>
                <a href="?cmd=managemodules&action=notification" class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'managemodules' && $this->_tpl_vars['action'] == 'notification'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['notificationmodules']; ?>
</a>
            <?php else: ?>
                <?php $_from = $this->_tpl_vars['HBaddons']['extras_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                    <a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
" class="tstyled <?php if ($this->_tpl_vars['ad']['id'] == $this->_tpl_vars['moduleid']): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a>
                <?php endforeach; endif; unset($_from); ?>

            <?php endif; ?>
        </td>
        <?php endif; ?>

        <td  valign="top"  class="bordered" rowspan="2">
            <div id="bodycont">


<?php if ($this->_tpl_vars['moduleid']): ?>
                <script >
                    var module_id = <?php echo $this->_tpl_vars['moduleid']; ?>
;
                </script>
<?php endif; ?>