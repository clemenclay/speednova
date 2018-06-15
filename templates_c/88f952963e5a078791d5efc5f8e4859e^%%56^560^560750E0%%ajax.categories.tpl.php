<?php /* Smarty version 2.6.26, created on 2018-06-11 12:32:43
         compiled from services/ajax.categories.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'basename', 'services/ajax.categories.tpl', 24, false),array('modifier', 'replace', 'services/ajax.categories.tpl', 24, false),array('modifier', 'capitalize', 'services/ajax.categories.tpl', 24, false),)), $this); ?>
<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cat'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cat']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cat']['iteration']++;
?>
    <li class="<?php if ($this->_tpl_vars['i']['visible'] == '0'): ?>ishidden<?php endif; ?> <?php if ($this->_tpl_vars['i']['visible'] == -1): ?>archived<?php endif; ?> entry" id="entry<?php echo $this->_tpl_vars['i']['id']; ?>
" >
        <div >
            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                <tr  class="havecontrols">
                    <td width="20">
                        <input type="hidden" name="sort[]" value="<?php echo $this->_tpl_vars['i']['id']; ?>
" /><div class="controls"><a class="sorter-handle" ><?php echo $this->_tpl_vars['lang']['move']; ?>
</a></div>
                    </td>
                    <td width="20%" class="name">
                        <a href="?cmd=services&action=category&id=<?php echo $this->_tpl_vars['i']['id']; ?>
" class="direct">
                            <?php if ($this->_tpl_vars['i']['visible'] == 1): ?><?php echo $this->_tpl_vars['i']['name']; ?>

                            <?php else: ?><em class="ishidden"><?php echo $this->_tpl_vars['i']['name']; ?>
 </em>
                            <?php endif; ?>
                        </a> 
                        <?php if ($this->_tpl_vars['i']['visible'] == '0'): ?>
                            <em class="hidden fs11"><?php echo $this->_tpl_vars['lang']['hidden']; ?>
</em>
                        <?php elseif ($this->_tpl_vars['i']['visible'] == -1): ?>
                            <em class="hidden fs11">Archived</em>
                        <?php endif; ?>
                    </td>
                    <td width="120"><a href="?cmd=services&action=category&id=<?php echo $this->_tpl_vars['i']['id']; ?>
" class="direct"><?php echo $this->_tpl_vars['i']['products']; ?>
</a></td>
                    <td >
                        <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['i']['otype']]): ?> <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['i']['otype']]; ?>

                        <?php else: ?><?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['i']['otype'])) ? $this->_run_mod_handler('basename', true, $_tmp) : basename($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, '_', ' ') : smarty_modifier_replace($_tmp, '_', ' ')))) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>

                        <?php endif; ?>
                    </td>
                    <td style="width: 200px; text-align: right">
                        <?php if ($this->_tpl_vars['i']['visible'] == '0'): ?>
                        <a class="vtip_description" title="This orderpage is hidden, customers will not see it in cart"></a>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center"><?php echo $this->_tpl_vars['lang']['Show']; ?>
</a>
                        <?php elseif ($this->_tpl_vars['i']['visible'] == '-1'): ?>

                            <a class="vtip_description" title="This orderpage is archived, its unavailable for clients and hidden from staff"></a>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center">Restore</a>
                        <?php elseif ($this->_tpl_vars['i']['visible'] == '-2'): ?>
                            <a class="vtip_description" title="This orderpage is private - its possible to access it in client portal only directly trough orderpage url"></a>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center">Restore</a>
                        <?php else: ?>
                            <a href="?cmd=services&action=toggle&state=archive&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" >Archive</a>

                            <a href="?cmd=services&action=toggle&state=private&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"
                               class="menuitm menu-auto ajax" >Make Private</a>

                            <a href="?cmd=services&action=toggle&state=hide&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" ><?php echo $this->_tpl_vars['lang']['Hide']; ?>
</a>
                        <?php endif; ?>
                    </td>
                    <td style="width: 80px; text-align: right">
                        <a href="?cmd=services&action=editcategory&id=<?php echo $this->_tpl_vars['i']['id']; ?>
" class="menuitm menu-auto"><span style="color: red"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</span></a>
                        <a href="?cmd=services&make=deletecat&id=<?php echo $this->_tpl_vars['i']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                           onclick="return confirm('<?php echo $this->_tpl_vars['lang']['deletecategoryconfirm']; ?>
');" class="menuitm menu-auto ajax"><span class="delsth"></span></a> 
                    </td>
                </tr>
            </table>
        </div>
    </li>
<?php endforeach; endif; unset($_from); ?>