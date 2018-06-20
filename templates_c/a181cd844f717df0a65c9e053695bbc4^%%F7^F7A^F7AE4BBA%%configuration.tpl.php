<?php /* Smarty version 2.6.26, created on 2018-06-20 15:23:08
         compiled from configuration.tpl */ ?>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb">
    <tr>
        <td colspan="2"><h3><?php echo $this->_tpl_vars['lang']['sysconfig']; ?>
</h3></td>
    </tr>
    <tr>
        <td class="leftNav">
            <a href="?cmd=configuration"  class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'configuration' && $this->_tpl_vars['action'] == 'default'): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['generalsettings']; ?>
</a>
            <a href="?cmd=configuration&action=cron"  class="tstyled <?php if ($this->_tpl_vars['cmd'] == 'configuration' && ( $this->_tpl_vars['action'] == 'cron' || $this->_tpl_vars['action'] == 'cronprofiles' )): ?>selected<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['cronprofiles']; ?>
</a>
            <a href="?cmd=security"  class="tstyled"><?php echo $this->_tpl_vars['lang']['securitysettings']; ?>
</a>
			<a href="?cmd=langedit"  class="tstyled"><?php echo $this->_tpl_vars['lang']['languages']; ?>
</a> 
        </td>
        <td  valign="top"  class="bordered"><div id="bodycont"> 
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.configuration.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
        </td>
    </tr>
</table>