<?php /* Smarty version 2.6.26, created on 2018-06-11 13:46:55
         compiled from services/ajax.category.tpl */ ?>
<?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['prods'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['prods']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['prod']):
        $this->_foreach['prods']['iteration']++;
?>
    <li class="<?php if ($this->_tpl_vars['prod']['visible'] == '0'): ?>ishidden<?php endif; ?> <?php if ($this->_tpl_vars['prod']['visible'] == -1): ?>archived<?php endif; ?> entry" id="entry<?php echo $this->_tpl_vars['prod']['id']; ?>
" data-tags="<?php $_from = $this->_tpl_vars['prod']['tags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tag']):
?><?php echo $this->_tpl_vars['tag']; ?>
,<?php endforeach; endif; unset($_from); ?>">
        <div>
            <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                <tr  class="havecontrols">
                    <td width="20" class="name">
                        <?php if ($this->_tpl_vars['priceup']): ?>
                            <input type="checkbox" name="product[<?php echo $this->_tpl_vars['prod']['id']; ?>
]" value="<?php echo $this->_tpl_vars['prod']['id']; ?>
" class="product_check"/>
                        <?php else: ?>
                            <input type="hidden" name="sort[]" value="<?php echo $this->_tpl_vars['prod']['id']; ?>
" />
                            <div class="controls">
                                <a class="sorter-handle" ><?php echo $this->_tpl_vars['lang']['move']; ?>
</a>
                            </div>
                        <?php endif; ?>
                    </td>
                    <td >
                        <a href="?cmd=services&action=product&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
">
                            <?php if ($this->_tpl_vars['prod']['visible'] == 1): ?><?php echo $this->_tpl_vars['prod']['name']; ?>

                            <?php else: ?><em class="ishidden"><?php echo $this->_tpl_vars['prod']['name']; ?>
 </em>
                            <?php endif; ?>
                        </a> 
                        <?php if ($this->_tpl_vars['prod']['visible'] == '0'): ?>
                            <em class="ishidden fs11"><?php echo $this->_tpl_vars['lang']['hidden']; ?>
</em>
                        <?php elseif ($this->_tpl_vars['prod']['visible'] == -1): ?>
                            <em class="ishidden archived fs11">Archived</em>
                        <?php endif; ?>
                        <div class="right inlineTags">
                            <?php $_from = $this->_tpl_vars['prod']['tags']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tag']):
?>
                                <span><?php echo $this->_tpl_vars['tag']; ?>
</span>
                            <?php endforeach; endif; unset($_from); ?>
                        </div>
                    </td>
                    <td width="130" align="center" class="server-acc-stats">
                        <?php if ($this->_tpl_vars['category']['ptype'] == 'DomainsType' && $this->_tpl_vars['prod']['stats']['total']): ?>
                            <a title="Pending" target="_blank" href="?cmd=domains&filter[tld_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status]=Pending">
                                <span class="Pending"><?php echo $this->_tpl_vars['prod']['stats']['pending']; ?>
</span>
                            </a> /
                            <a target="_blank" title="Registered" href="?cmd=domains&filter[tld_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status][]=Active&filter[status][]=Pending Transfer&filter[status][]=Pending Registration">
                                <span class="Active"><?php echo $this->_tpl_vars['prod']['stats']['provisioned']; ?>
</span>
                            </a> /
                            <a target="_blank" title="Cancelled / Expired" href="?cmd=domains&filter[tld_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status][]=Expired&filter[status][]=Terminated&filter[status][]=Cancelled&filter[status][]=Fraud">
                                <span class="Cancelled"><?php echo $this->_tpl_vars['prod']['stats']['cancelled']; ?>
</span>
                            </a>
                        <?php elseif ($this->_tpl_vars['prod']['stats']['total']): ?>
                            <a title="Pending" target="_blank" href="?cmd=accounts&filter[product_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status]=Pending" >
                                <span class="Pending"><?php echo $this->_tpl_vars['prod']['stats']['pending']; ?>
</span>
                            </a> /
                            <a target="_blank" title="Provisioned (Active / Suspended)" href="?cmd=accounts&filter[product_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status][]=Active&filter[status][]=Suspended" >
                                <span class="Active"><?php echo $this->_tpl_vars['prod']['stats']['provisioned']; ?>
</span>
                            </a> /
                            <a target="_blank" title="Cancelled / Terminated" href="?cmd=accounts&filter[product_id]=<?php echo $this->_tpl_vars['prod']['id']; ?>
&filter[status][]=Terminated&filter[status][]=Cancelled&filter[status][]=Fraud" >
                                <span class="Cancelled"><?php echo $this->_tpl_vars['prod']['stats']['cancelled']; ?>
</span>
                            </a>
                        <?php else: ?>
                            0
                        <?php endif; ?>


                    </td>
                    <?php if ($this->_tpl_vars['category']['ptype'] != 'DomainsType'): ?>
                        <td width="90" class="server-acc-stats">
                            <?php if ($this->_tpl_vars['prod']['stock'] > 0): ?>
                                <?php echo $this->_tpl_vars['lang']['stock']; ?>
 <span title="Number of used accounts" class="<?php if ($this->_tpl_vars['prod']['qty'] < $this->_tpl_vars['prod']['stock']): ?>Active<?php else: ?>Pending<?php endif; ?>"><?php echo $this->_tpl_vars['prod']['qty']; ?>
</span> / <span title="Total available accounts"><?php echo $this->_tpl_vars['prod']['stock']; ?>
</span>
                            <?php else: ?>
                                <span class="smaller">-</span>
                            <?php endif; ?>
                        </td>
                    <?php endif; ?>

                    <td style="width: 140px; text-align: right">
                        <?php if ($this->_tpl_vars['prod']['visible'] == '0'): ?>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&cat=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center"><?php echo $this->_tpl_vars['lang']['Show']; ?>
</a>
                        <?php elseif ($this->_tpl_vars['prod']['visible'] == '-1'): ?>
                            <a href="?cmd=services&action=toggle&state=visible&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&cat=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" style="min-width: 30px; text-align: center">Restore</a>
                        <?php else: ?>
                            <a href="?cmd=services&action=toggle&state=archive&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&cat=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" >Archive</a>

                            <a href="?cmd=services&action=toggle&state=hide&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&cat=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                               class="menuitm menu-auto ajax" ><?php echo $this->_tpl_vars['lang']['Hide']; ?>
</a>
                        <?php endif; ?>
                    </td>

                    <td style="width: 150px; text-align: right">
                        <a class="menuitm menu-auto" href="?cmd=services&action=product&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
" class="editbtn"><span style="color: red"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</span></a>
                        <a class="menuitm menu-auto" href="?cmd=services&amp;make=duplicate&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"><?php echo $this->_tpl_vars['lang']['Duplicate']; ?>
</a>                           
                        <a class="menuitm menu-auto ajax" href="?cmd=services&make=deleteproduct&id=<?php echo $this->_tpl_vars['prod']['id']; ?>
&cat_id=<?php echo $this->_tpl_vars['category']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" 
                           onclick="return confirm('<?php echo $this->_tpl_vars['lang']['deleteproductconfirm']; ?>
');"><span class="delsth"></span></a> 
                    </td>
                </tr>
            </table>
        </div>
    </li>
<?php endforeach; endif; unset($_from); ?>