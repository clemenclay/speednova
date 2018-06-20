<?php /* Smarty version 2.6.26, created on 2018-06-20 11:27:52
         compiled from adminwidgets/mytickets.tpl */ ?>

        <table cellspacing="0" cellpadding="3" border="0" width="100%" class="table whitetable"  style="">
            <tbody>
            <tr>
                <th ><?php echo $this->_tpl_vars['lang']['Subject']; ?>
</th>
                <th width="130"><?php echo $this->_tpl_vars['lang']['Submitter']; ?>
</th>
                <th width="90"><?php echo $this->_tpl_vars['lang']['Status']; ?>
</th>
                <th width="90">Last Reply</th>
            </tr>
            <?php $_from = $this->_tpl_vars['mytickets']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['ticket']):
        $this->_foreach['loop']['iteration']++;
?>
                <tr  class="<?php if ($this->_tpl_vars['ticket']['admin_read'] == '0'): ?>unread<?php endif; ?>" >
                    <td>
                        <a class="subject" href="?cmd=tickets&action=view&list=all&num=<?php echo $this->_tpl_vars['ticket']['ticket_number']; ?>
" ><?php echo $this->_tpl_vars['ticket']['tsubject']; ?>
</a>
                            <?php if ($this->_tpl_vars['ticket']['owner_id']): ?><div style="font-size:80%;padding-left:10px;">&#8594; Assigned To: <?php echo $this->_tpl_vars['ticket']['firstname']; ?>
 <?php echo $this->_tpl_vars['ticket']['lastname']; ?>
</div>
                            <?php else: ?><div style="font-size:80%;padding-left:10px;opacity:0.6" >&#8594; Not Assigned</div><?php endif; ?>
                    </td>
                    <td>
                        <?php if ($this->_tpl_vars['ticket']['client_id'] != '0'): ?><a href="?cmd=clients&action=show&id=<?php echo $this->_tpl_vars['ticket']['client_id']; ?>
" class="isclient isclient-<?php echo $this->_tpl_vars['ticket']['group_id']; ?>
"><?php endif; ?><?php echo $this->_tpl_vars['ticket']['name']; ?>
<?php if ($this->_tpl_vars['ticket']['client_id'] != '0'): ?></a><?php endif; ?>
                    </td>
                    <td>
                        <span class="<?php echo $this->_tpl_vars['ticket']['status']; ?>
"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['ticket']['status']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['ticket']['status']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['ticket']['status']; ?>
<?php endif; ?></span>
                    </td>
                    <td><?php echo $this->_tpl_vars['ticket']['lastreply']; ?>
</td>
                </tr>
            <?php endforeach; endif; unset($_from); ?>
            </tbody>
        </table>