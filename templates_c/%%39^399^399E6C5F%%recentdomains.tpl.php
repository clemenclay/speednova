<?php /* Smarty version 2.6.26, created on 2018-06-18 13:35:57
         compiled from adminwidgets/recentdomains.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'dateformat', 'adminwidgets/recentdomains.tpl', 15, false),)), $this); ?>

        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table table-fixed whitetable" style="">
            <tbody>
            <tr>
                <th><?php echo $this->_tpl_vars['lang']['Domain']; ?>
</th>
                <th width="40%"><?php echo $this->_tpl_vars['lang']['Action']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Success']; ?>
</th>
                <th><?php echo $this->_tpl_vars['lang']['Date']; ?>
</th>
            </tr>
            <?php $_from = $this->_tpl_vars['recentdomains']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['dom']):
        $this->_foreach['loop']['iteration']++;
?>
                <tr <?php if ($this->_foreach['loop']['iteration']%2 == 0): ?>class="odd <?php if ($this->_tpl_vars['dom']['notseen']): ?>notseen<?php endif; ?>"<?php else: ?>class="even <?php if ($this->_tpl_vars['dom']['notseen']): ?>notseen<?php endif; ?>"<?php endif; ?>>
                    <td><a href="?cmd=domains&action=edit&id=<?php echo $this->_tpl_vars['dom']['domain_id']; ?>
"><?php echo $this->_tpl_vars['dom']['name']; ?>
</a></td>
                    <td ><span class="text-overflow" title="<?php echo $this->_tpl_vars['dom']['action']; ?>
"><?php echo $this->_tpl_vars['dom']['action']; ?>
</span></td>
                    <td><?php if ($this->_tpl_vars['dom']['result'] == '1'): ?><?php echo $this->_tpl_vars['lang']['Yes']; ?>
<?php else: ?><font color="red"><?php echo $this->_tpl_vars['lang']['No']; ?>
</font><?php endif; ?></td>
                    <td><?php echo ((is_array($_tmp=$this->_tpl_vars['dom']['date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>
                </tr>
            <?php endforeach; endif; unset($_from); ?>
            </tbody>
        </table>