<?php /* Smarty version 2.6.26, created on 2018-06-15 08:44:56
         compiled from ajax/ajax.invoices.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'invoice', 'ajax/ajax.invoices.tpl', 10, false),array('modifier', 'price', 'ajax/ajax.invoices.tpl', 14, false),array('modifier', 'dateformat', 'ajax/ajax.invoices.tpl', 15, false),)), $this); ?>
<?php if ($this->_tpl_vars['invoices']): ?>
    <?php $_from = $this->_tpl_vars['invoices']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['invoice']):
        $this->_foreach['foo']['iteration']++;
?>
         <tr <?php if (($this->_foreach['foo']['iteration']-1)%2 == 0): ?>class="even"<?php endif; ?>>
              <?php if ($this->_tpl_vars['enableFeatures']['bulkpayments'] != 'off'): ?>
                <td align="left">
                    <input type="checkbox" value="<?php echo $this->_tpl_vars['invoice']['id']; ?>
" name="selected[]" <?php if ($this->_tpl_vars['invoice']['status'] != 'Unpaid' || $this->_tpl_vars['invoice']['merge_id']): ?>disabled="disabled"<?php endif; ?>>
                </td>
              <?php endif; ?>
              
              <td><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/invoice/<?php echo $this->_tpl_vars['invoice']['id']; ?>
/" target="_blank"><?php echo smarty_modifier_invoice($this->_tpl_vars['invoice']); ?>
</a></td>
              <td align="left">
                  <h5><span class="badge badge-<?php echo $this->_tpl_vars['invoice']['status']; ?>
"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['invoice']['status']]; ?>
</span></h5>
              </td>
              <td ><?php echo ((is_array($_tmp=$this->_tpl_vars['invoice']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['invoice']['currency_id']) : smarty_modifier_price($_tmp, $this->_tpl_vars['invoice']['currency_id'])); ?>
</td>
   <!--           <td align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['invoice']['date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>  -->
              <td class="d-none d-lg-block" align="left"><?php echo ((is_array($_tmp=$this->_tpl_vars['invoice']['duedate'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>
              <td align="center"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/invoice/<?php echo $this->_tpl_vars['invoice']['id']; ?>
/" target="_blank" class="btn-floating btn-sm waves-effect waves-light"><!--<?php echo $this->_tpl_vars['lang']['view']; ?>
--><i class="fa fa-eye ml-2"></i></a></td>
              <td class="" width="20"/>
        </tr>
    <?php endforeach; endif; unset($_from); ?>
<?php endif; ?>