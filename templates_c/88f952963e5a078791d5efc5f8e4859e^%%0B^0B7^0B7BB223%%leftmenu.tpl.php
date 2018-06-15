<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:37
         compiled from configuration/leftmenu.tpl */ ?>

            <a href="?cmd=configuration"  class="tstyled  <?php if ($this->_tpl_vars['action'] != 'cron'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['generalsettings']; ?>
</a>
            <a href="?cmd=configuration&action=cron"  class="tstyled <?php if ($this->_tpl_vars['action'] == 'cron' || $this->_tpl_vars['action'] == 'cronprofiles'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['cronprofiles']; ?>
</a>
            <a href="?cmd=security"  class="tstyled"><?php echo $this->_tpl_vars['lang']['securitysettings']; ?>
</a>
            <a href="?cmd=langedit"  class="tstyled"><?php echo $this->_tpl_vars['lang']['languages']; ?>
</a>