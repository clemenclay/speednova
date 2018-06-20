<?php /* Smarty version 2.6.26, created on 2018-06-20 19:37:41
         compiled from adminwidgets/recentaccfailures.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'dateformat', 'adminwidgets/recentaccfailures.tpl', 20, false),)), $this); ?>
        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table table-fixed whitetable" style="">
            <tbody>
            <tr>
                <th><?php echo $this->_tpl_vars['lang']['Account']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Action']; ?>
</th>
                <th width="40%"><?php echo $this->_tpl_vars['lang']['Error']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Date']; ?>
</th>
            </tr>
            <?php $_from = $this->_tpl_vars['accountfailures']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['acc']):
        $this->_foreach['loop']['iteration']++;
?>
                <tr   <?php if ($this->_foreach['loop']['iteration']%2 == 0): ?>class="odd <?php if ($this->_tpl_vars['acc']['notseen']): ?>notseen<?php endif; ?>"<?php else: ?>class="even <?php if ($this->_tpl_vars['acc']['notseen']): ?>notseen<?php endif; ?>"<?php endif; ?> >
                    <td>
                        <a href="?cmd=accounts&action=edit&id=<?php echo $this->_tpl_vars['acc']['account_id']; ?>
">
                            <?php if ($this->_tpl_vars['acc']['domain']): ?><?php echo $this->_tpl_vars['acc']['domain']; ?>

                            <?php else: ?><em>#<?php echo $this->_tpl_vars['acc']['account_id']; ?>
 <small>( <?php echo $this->_tpl_vars['lang']['emptyhost']; ?>
 )</small></em>
                            <?php endif; ?>
                        </a>
                    </td>
                    <td ><?php echo $this->_tpl_vars['acc']['action']; ?>
</td>
                    <td width="40%"><span class="text-overflow" title="<?php echo $this->_tpl_vars['acc']['error']; ?>
"><?php echo $this->_tpl_vars['acc']['error']; ?>
</span></td>
                    <td><?php echo ((is_array($_tmp=$this->_tpl_vars['acc']['date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>
                </tr>
            <?php endforeach; endif; unset($_from); ?>
            </tbody>
        </table>