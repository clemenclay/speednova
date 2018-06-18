<?php /* Smarty version 2.6.26, created on 2018-06-18 13:35:57
         compiled from adminwidgets/recentorders.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'dateformat', 'adminwidgets/recentorders.tpl', 17, false),array('modifier', 'price', 'adminwidgets/recentorders.tpl', 18, false),)), $this); ?>

        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table whitetable" style="">
            <tbody>
            <tr>
                <th></th>
                <th><?php echo $this->_tpl_vars['lang']['orderhash']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['clientname']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Date']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Total']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Status']; ?>
</th>
            </tr>
            <?php $_from = $this->_tpl_vars['recentorders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['order']):
        $this->_foreach['loop']['iteration']++;
?>
                <tr class=" "  >
                    <td width="10"><?php if ($this->_tpl_vars['order']['balance'] == 'Completed'): ?><div class="orderpaidflag"></div><?php endif; ?></td>
                    <td><a href="?cmd=orders&action=edit&id=<?php echo $this->_tpl_vars['order']['id']; ?>
&list=all"><?php echo $this->_tpl_vars['order']['number']; ?>
</a></td>
                    <td><a href="?cmd=clients&action=show&id=<?php echo $this->_tpl_vars['order']['client_id']; ?>
"  class="isclient isclient-<?php echo $this->_tpl_vars['order']['group_id']; ?>
"><?php echo $this->_tpl_vars['order']['name']; ?>
</a></td>
                    <td><?php echo ((is_array($_tmp=$this->_tpl_vars['order']['date_created'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>
                    <td><?php echo ((is_array($_tmp=$this->_tpl_vars['order']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['order']['currency_id']) : smarty_modifier_price($_tmp, $this->_tpl_vars['order']['currency_id'])); ?>
</td>
                    <td>
                        <span class="<?php echo $this->_tpl_vars['order']['status']; ?>
"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['order']['status']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['order']['status']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['order']['status']; ?>
<?php endif; ?></span>
                    </td>
                </tr>
            <?php endforeach; endif; unset($_from); ?>
            </tbody>
        </table>