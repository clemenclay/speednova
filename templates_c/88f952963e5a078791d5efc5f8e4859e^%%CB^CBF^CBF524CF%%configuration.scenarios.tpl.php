<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:37
         compiled from orders/configuration.scenarios.tpl */ ?>
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="content_tb">
    <tr>
        <td colspan="2">
            <h3><?php echo $this->_tpl_vars['lang']['sysconfig']; ?>
</h3>
        </td>
    </tr>
    <tr>
        <td class="leftNav">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'configuration/leftmenu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </td>
        <td  valign="top"  class="bordered">
            <div id="bodycont" style="">
                <div class="newhorizontalnav"  id="newshelfnav">
                    <div class="list-1">
                        <ul>
                            <li><a href="?cmd=configuration&picked_tab=0"><?php echo $this->_tpl_vars['lang']['generalconfig']; ?>
</a></li>
                            <li class="active picked"><a href="?cmd=configuration&picked_tab=1"><?php echo $this->_tpl_vars['lang']['Ordering']; ?>
</a></li>
                            <li><a href="?cmd=configuration&picked_tab=2"><?php echo $this->_tpl_vars['lang']['Support']; ?>
</a></li>
                            <li ><a href="?cmd=configuration&picked_tab=3"><?php echo $this->_tpl_vars['lang']['Billing']; ?>
</a></li>
                            <li><a href="?cmd=configuration&picked_tab=4"><?php echo $this->_tpl_vars['lang']['Mail']; ?>
</a></li>
                            <li><a href="?cmd=configuration&picked_tab=5"><?php echo $this->_tpl_vars['lang']['CurrencyName']; ?>
 &amp; <?php echo $this->_tpl_vars['lang']['taxconfiguration']; ?>
</a></li>
                            <li><a href="?cmd=configuration&picked_tab=6"><?php echo $this->_tpl_vars['lang']['Other']; ?>
</a></li>
                        </ul>
                    </div>
                    <div class="list-2">
                        <div class="subm1 haveitems">
                            <ul >
                                <li ><a href="?cmd=configuration&picked_tab=1"><span><?php echo $this->_tpl_vars['lang']['General']; ?>
</span></a></li>
                                <li class="picked"><a href="?cmd=configuration&action=orderscenarios"><span><?php echo $this->_tpl_vars['lang']['orderscenarios']; ?>
</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="nicerblu" id="ticketbody">
                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'orders/configuration.scenarios.details.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
            </div>
        </td></tr></table>