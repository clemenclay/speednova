<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from newdomains.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'newdomains.tpl', 532, false),)), $this); ?>
<input type="hidden" name="type" value="<?php echo $this->_tpl_vars['product']['type']; ?>
">

<input type="hidden" value="1" name="visible" id="prod_visibility" />
<input type="hidden" value="<?php echo $this->_tpl_vars['product']['category_id']; ?>
" name="category_id" />
<input type="hidden" value="<?php echo $this->_tpl_vars['product']['id']; ?>
" name="product_id_"  id="product_id"/>

<table width="100%" cellspacing="0" cellpadding="10" border="0" >
    <tr>
        <td colspan="2" style="padding:0px;">
            <div class="newhorizontalnav" id="newshelfnav">
                <div class="list-1">
                    <ul>
                        <li>
                            <a href="#"><span class="ico money"><?php echo $this->_tpl_vars['lang']['general_tab']; ?>
</span></a>
                        </li>
                        <li >
                            <a href="#"><span class="ico plug"><?php echo $this->_tpl_vars['lang']['registrar_tab']; ?>
</span></a>
                        </li>
                        <li>
                            <a href="#"><span class="ico gear"><?php echo $this->_tpl_vars['lang']['automation_tab']; ?>
</span></a>
                        </li>
                        <li>
                            <a href="#"><span class="ico gear"><?php echo $this->_tpl_vars['lang']['Emails']; ?>
</span></a>
                        </li>
                        <li>
                            <a href="#" ><span class="ico "><?php echo $this->_tpl_vars['lang']['forms_tab']; ?>
</span></a>
                        </li>
                        <li class="last">
                            <a href="#"><span class="ico formn"><?php echo $this->_tpl_vars['lang']['widgets_tab']; ?>
</span></a>
                        </li>

                    </ul>
                </div>
                <div class="list-2">
                    <div class="subm1 haveitems">
                        <ul >
                            <li >
                                <a href="#" onclick="$(this).hide();
                                        $('#change_orderpage').ShowNicely().show();
                                        return false"><span ><?php echo $this->_tpl_vars['lang']['change_orderpage']; ?>
</span></a>
                            </li>
                        </ul>
                        <div class="right" style="color:#999999;padding-top:5px">
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="subm1" style="display:none"></div>
                    <div class="subm1 haveitems" style="display:none">
                        <ul >
                            <li>
                                <a  href="#"  onclick="return assignNewTask(<?php echo $this->_tpl_vars['product_id']; ?>
, 'domains');" ><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['addcustomautomation']; ?>
</strong></span></a>
                            </li>
                            <?php if ($this->_tpl_vars['otherproducts']): ?> 
                                <li><a  href="#"   id="premadeautomationswitch" onclick="$('#premadeautomation').show();
                                        $(this).hide();
                                        return false"><span class="addsth" ><?php echo $this->_tpl_vars['lang']['copyautomation']; ?>
</span></a>
                                </li>
                            <?php endif; ?>
                        </ul>
                    </div>
                    <div class="subm1" style="display:none"></div>
                    <div class="subm1 <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>haveitems<?php endif; ?>" style="display:none">
                        <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>
                            <ul >
                                <li><a  href="#"  onclick="return addCustomFieldForm(<?php echo $this->_tpl_vars['product_id']; ?>
);" ><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['assign_custom_opt']; ?>
</strong></span></a>
                                </li>
                                <li ><a href="?cmd=configfields&product_id=<?php echo $this->_tpl_vars['product_id']; ?>
&action=previewfields"  onclick="return previewCustomForm($(this).attr('href'))" <?php if (! $this->_tpl_vars['config']): ?>style="display:none"<?php endif; ?> id="preview_forms_shelf"><span class="zoom"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</span></a></li>
                                <li>
                                    <a href="#" onclick="$(this).hide();
                                            $('#importforms').show();
                                            return false" id='importformsswitch' ><?php echo $this->_tpl_vars['lang']['importformfields']; ?>
</a>
                                </li>
                            </ul>
                        <?php endif; ?>
                    </div>

                    <div class="subm1 <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>haveitems<?php endif; ?>" style="display:none">
                        <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>
                            <ul >
                                <li>
                                    <a href="#" onclick="return HBWidget.addCustomWidgetForm();"><span ><b><?php echo $this->_tpl_vars['lang']['assign_custom_widg']; ?>
</b></span></a>
                                </li>

                                <?php if (count ( $this->_tpl_vars['widgets'] ) > 1): ?>
                                    <li>
                                        <a href="#" onclick="return HBWidget.enableAllWidgets();"><span ><?php echo $this->_tpl_vars['lang']['enable_all_widgets']; ?>
</span></a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="return HBWidget.disableAllWidgets();"><span ><?php echo $this->_tpl_vars['lang']['disable_all_widgets']; ?>
</span></a>
                                    </li>
                                <?php endif; ?>

                                <li>
                                    <a href="#" onclick="return HBWidget.refreshWidgetView();"><span >Refresh available functions</span></a>
                                </li>
                            </ul>
                        <?php endif; ?>
                    </div>

                </div>
            </div>
        </td>
    </tr>
    <tr>

        <td valign="top" class="nicers" style="border:none;" colspan="2">
            <table width="100%" cellspacing="0" cellpadding="6">
                <tbody  class="sectioncontent">

                    <tr >
                        <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['dom_ext']; ?>
</strong> 
                            <?php if ($this->_tpl_vars['product']['id'] == 'new'): ?><a href="#" class="vtip_description" title="To add multiple TLD with same options & pricing at once, just enter extensions separated by comma, like:<br /> .com, .net, .eu, .co.uk<br />HostBill will automaticaly create multiple products"></a><?php endif; ?>
                        </td>
                        <td class="editor-container">
                            <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>
                                <div class="org-content havecontrols" ><span style=" font-size: 16px !important; font-weight: bold;" class="iseditable"><?php echo $this->_tpl_vars['product']['name']; ?>
</span> <a href="#" class="editbtn controls iseditable"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a></div>
                                <div class="editor"><input type="text" class="inp" style=" font-size: 16px !important; font-weight: bold;" name="name" size="50" value="<?php echo $this->_tpl_vars['product']['name']; ?>
">
                                </div>
                            <?php else: ?>
                                <input type="text" class="inp" style=" font-size: 16px !important; font-weight: bold;" name="name" size="50" value="<?php echo $this->_tpl_vars['product']['name']; ?>
">
                            <?php endif; ?>
                            <input type="hidden" name="description" value="" />
                        </td> 
                    </tr>

                    <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>
                        <tr style="display:none" id="change_orderpage"><td align="right"><strong><?php echo $this->_tpl_vars['lang']['OrderPage']; ?>
</strong></td><td>
                                <select name="change_orderpage" onchange="this.form.submit()">
                                    <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ord_pg']):
?>
                                        <option value="<?php echo $this->_tpl_vars['ord_pg']['id']; ?>
" <?php if ($this->_tpl_vars['ord_pg']['id'] == $this->_tpl_vars['product']['category_id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['ord_pg']['name']; ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                </select>
                            </td>
                        </tr>
                    <?php endif; ?>

                    <tr>
                        <td valign="top" width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Price']; ?>
</strong></td>
                        <td id="priceoptions">
                            <?php $_from = $this->_tpl_vars['supported_billingmodels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['boptloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['boptloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['bm']):
        $this->_foreach['boptloop']['iteration']++;
?>
                                <a href="#" class="billopt <?php if ($this->_tpl_vars['bm'] == 'Free'): ?>bfirst<?php endif; ?> <?php if ($this->_tpl_vars['product']['paytype'] == $this->_tpl_vars['bm']): ?>checked<?php endif; ?>"  <?php if ($this->_tpl_vars['product']['paytype'] != $this->_tpl_vars['bm']): ?>style="display:none"<?php endif; ?> onclick='return switch_t2(this, "<?php echo $this->_tpl_vars['bm']; ?>
");'><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['bm']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['bm']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['bm']; ?>
<?php endif; ?></a>
                                <input type="radio" value="<?php echo $this->_tpl_vars['bm']; ?>
" name="paytype" <?php if ($this->_tpl_vars['product']['paytype'] == $this->_tpl_vars['bm']): ?>checked="checked"<?php endif; ?>  id="<?php echo $this->_tpl_vars['bm']; ?>
" style="display:none"/>
                            <?php endforeach; endif; unset($_from); ?>

                            <a href="#" class="editbtn" onclick="$(this).hide();
                                    $(this).parent().find('.billopt').show();
                                    return false;"><?php echo $this->_tpl_vars['lang']['Change']; ?>
</a>


                            <?php $_from = $this->_tpl_vars['supported_billingmodels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['boptloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['boptloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['bm']):
        $this->_foreach['boptloop']['iteration']++;
?>
                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "productbilling_".($this->_tpl_vars['bm']).".tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                            <?php endforeach; endif; unset($_from); ?>

                        </td>
                    </tr>

                    <tr  class="stockcontrol" <?php if ($this->_tpl_vars['product']['stock'] != '1'): ?>style="display:none"<?php endif; ?>>
                        <td valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['stockcontrol']; ?>
</strong></td>
                        <td><input type="checkbox" name="stock" value="1" <?php if ($this->_tpl_vars['product']['stock'] == '1'): ?>checked="checked"<?php endif; ?> onclick="if (this.checked)
                                    $('#sstoc').show();
                                else
                                    $('#sstoc').hide();"/></td>
                    </tr>
                    <tr id="sstoc" class="stockcontrol" <?php if ($this->_tpl_vars['product']['stock'] != '1'): ?>style="display:none"<?php endif; ?>>
                        <td align="right"><?php echo $this->_tpl_vars['lang']['quantityinstock']; ?>
</td>
                        <td ><input type="text" value="<?php echo $this->_tpl_vars['product']['qty']; ?>
" size="4" name="qty" class="inp"/>
                        </td>
                    </tr>

                    <?php if ($this->_tpl_vars['product']['id'] != 'new'): ?>
                        <tr>
                            <td align="right"><strong>Tags</strong></td>
                            <td><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'services/tags.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></td>
                        </tr>
                    <?php endif; ?>
                </tbody>

                <tbody class="sectioncontent" style="display:none">
                    <tr>
                        <td colspan="2" style="padding:0px !important">
                            <table border="0" width="100%" cellpadding="6" cellspacing="0">
                                <tr>
                                    <td align="right" width="160"><strong><?php echo $this->_tpl_vars['lang']['third_party_app']; ?>
</strong><br />
                                    </td>
                                    <td>
                                        <select name="module" onchange="loadDomainModule(this)" id="modulepicker" class="inp modulepicker" style="width:200px;">
                                            <option value="0" <?php if ($this->_tpl_vars['product']['module'] == '0'): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['lang']['none']; ?>
</option>
                                            <?php $_from = $this->_tpl_vars['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['mod']):
?>
                                                <?php if ($this->_tpl_vars['mod']['id'] != '-1'): ?>
                                                    <option value="<?php echo $this->_tpl_vars['mod']['id']; ?>
" <?php if ($this->_tpl_vars['product']['module'] == $this->_tpl_vars['mod']['id']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['mod']['module']; ?>
</option>
                                                <?php endif; ?>
                                            <?php endforeach; endif; unset($_from); ?>
                                            <option value="new" style="font-weight:bold">Show non-activated registrars</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td ></td>
                                    <td id="app_picker"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.configdommodule.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>                                        
                                    </td></tr>
                                <tr>
                                    <td align="right" width="160" valign="top"></td>
                                    <td align="left" >

                                        <table border="0" cellspacing="0" cellpadding="6" width='800' >
                                            <tbody  id='doma-settings' >
                                                <tr>
                                                    <td width="160"><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 1</strong></td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['ns'][0]; ?>
"  name='ns[0]'/>
                                                    </td>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 IP 1</strong> <?php echo $this->_tpl_vars['lang']['optional']; ?>
</td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['nsip'][0]; ?>
"  name='nsip[0]'/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 2</strong></td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['ns'][1]; ?>
"  name='ns[1]'/>
                                                    </td>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 IP 2</strong> <?php echo $this->_tpl_vars['lang']['optional']; ?>
</td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['nsip'][1]; ?>
"  name='nsip[1]'/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 3</strong></td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['ns'][2]; ?>
"  name='ns[2]'/>
                                                    </td>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 IP 3</strong> <?php echo $this->_tpl_vars['lang']['optional']; ?>
</td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['nsip'][2]; ?>
"  name='nsip[2]'/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 4</strong></td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['ns'][3]; ?>
"  name='ns[3]'/>
                                                    </td>
                                                    <td><strong><?php echo $this->_tpl_vars['lang']['Nameserver']; ?>
 IP 4</strong> <?php echo $this->_tpl_vars['lang']['optional']; ?>
</td>
                                                    <td>
                                                        <input class="inp" value="<?php echo $this->_tpl_vars['product']['nsip'][3]; ?>
"  name='nsip[3]'/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div style="padding:10px 5px;" class="fs11">
                                            Those NS will be used during registration unless client provides own settings. Nameservers can also be overidden by purchasing hosting+domain.
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" width="160"><strong><?php echo $this->_tpl_vars['lang']['requireepp']; ?>
</strong></td>
                                    <td align="left"><input type="checkbox" name="epp" value="1" <?php if ($this->_tpl_vars['product']['epp'] == '1'): ?>checked="checked"<?php endif; ?>/></td>
                                </tr>
                                <tr>
                                    <td align="right" width="160"><strong>Remove accented characters</strong> <a href="#" class="vtip_description" title="Checking this option will remove accented characters from contact data during registration or transfers"></a></td>
                                    <td align="left"><input type="checkbox" name="asciimode" value="1" <?php if ($this->_tpl_vars['product']['asciimode'] == '1'): ?>checked="checked"<?php endif; ?>/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <tbody id="billingsopt" class="sectioncontent" style="display:none">
                    <tr>
                        <td colspan="2" style="padding:0px">
                            <table class="editor-container" cellspacing="0" cellpadding="6" width="100%">
                                <tr id="premadeautomation" style="display:none">
                                    <td colspan="2">
                                        <?php if ($this->_tpl_vars['otherproducts']): ?> 
                                            <div style="margin-bottom: 15px;"  class="p6">
                                                <table cellspacing="0" cellpadding="3" style="margin-bottom:5px;">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Copy from: 
                                                                <select name="copy_from" class="submitme">
                                                                    <?php $_from = $this->_tpl_vars['otherproducts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['oth']):
?>
                                                                        <option value="<?php echo $this->_tpl_vars['oth']['id']; ?>
"><?php echo $this->_tpl_vars['oth']['catname']; ?>
 - <?php echo $this->_tpl_vars['oth']['name']; ?>
</option>
                                                                    <?php endforeach; endif; unset($_from); ?>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="hidden" id="copyautomation" value="0" name="copyautomation" />
                                                                <input type="button" value="Use it" style="font-weight:bold" onclick="$('#copyautomation').val(1);
                                                                        return saveProductFull();">
                                                                <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> <a href="#" onclick="$('#premadeautomation').hide();
                                                                        $('#premadeautomationswitch').show();
                                                                        return false;" class="editbtn"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <span class="pdescriptions fs11" ><?php echo $this->_tpl_vars['lang']['configspeedup']; ?>
. It will also copy registrar settings</span>
                                            </div>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" id="tasklistloader">
                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.tasklist.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                    </td>
                                </tr>

                                <tr> 
                                    <td align="right" valign="top" width="200"><strong><?php echo $this->_tpl_vars['lang']['auto_register']; ?>
</strong></td>
                                    <td id="automateoptions" class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoRegisterDomain'] == 'off'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoRegisterDomain]" value="off" onclick="$('#autosetup_opt').hide();" 
                                               id="autooff"/>
                                        <label  for="autooff"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>

                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoRegisterDomain'] == 'on'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoRegisterDomain]" value="on" onclick="$('#autosetup_opt').ShowNicely();" 
                                               id="autoon"/>
                                        <label  for="autoon"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>
                                                                                        <div class="p5" id="autosetup_opt" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoRegisterDomain'] == 'off'): ?>display:none;<?php endif; ?>" >
                                            <input type="radio" value="1" name="config[AutoRegisterDomainType]" 
                                                   <?php if ($this->_tpl_vars['configuration']['AutoRegisterDomainType'] == 1): ?> checked="checked"<?php endif; ?>>
                                            <?php echo $this->_tpl_vars['lang']['whenorderplaced']; ?>

                                            <br>
                                            <input type="radio" value="0" name="config[AutoRegisterDomainType]" 
                                                   <?php if ($this->_tpl_vars['configuration']['AutoRegisterDomainType'] == 0): ?> checked="checked"<?php endif; ?>>
                                            After receiving payment
                                        </div>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td width="200"  valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['auto_transfer']; ?>
</strong></td>
                                    <td class="automate-options">

                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoTransferDomain'] == 'off'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoTransferDomain]" value="off" onclick="$('#unsuspension_options').hide();" 
                                               id="unsuspend_off"/><label  for="unsuspend_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoTransferDomain'] == 'on'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoTransferDomain]" value="on" onclick="$('#unsuspension_options').ShowNicely();" 
                                               id="unsuspend_on"/><label  for="unsuspend_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                        <div class="p5" id="unsuspension_options" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoTransferDomain'] == 'off'): ?>display:none;<?php endif; ?>" >
                                            <input type="radio" value="1" name="config[AutoTransferDomainType]" 
                                                   <?php if ($this->_tpl_vars['configuration']['AutoTransferDomainType'] == 1): ?> checked="checked"<?php endif; ?>>
                                            <?php echo $this->_tpl_vars['lang']['whenorderplaced']; ?>

                                            <br>
                                            <input type="radio" value="0" name="config[AutoTransferDomainType]" 
                                                   <?php if ($this->_tpl_vars['configuration']['AutoTransferDomainType'] == 0): ?> checked="checked"<?php endif; ?>>
                                            After receiving payment
                                            <div class="clear"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr >
                                    <td width="200" style="vertical-align: top; text-align: right"><strong><?php echo $this->_tpl_vars['lang']['auto_renew']; ?>
</strong></td>
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoRenewDomain'] == 'off'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoRenewDomain]" value="off" onclick="$('#renewal_options').hide();" 
                                               id="renew_off"/><label  for="renew_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoRenewDomain'] == 'on'): ?>checked="checked"<?php endif; ?> 
                                               name="config[EnableAutoRenewDomain]" value="on" onclick="$('#renewal_options').ShowNicely();" 
                                               id="renew_on"/><label  for="renewa_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>
                                                                                        <div class="p5" id="renewal_options" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoRenewDomain'] == 'off'): ?>display:none;<?php endif; ?>" >
                                            <input type="radio" <?php if ($this->_tpl_vars['configuration']['RenewOnOrder'] == 'on'): ?>checked="checked"<?php endif; ?> 
                                                   name="config[RenewOnOrder]" value="on"  />
                                            When renewal order is placed
                                            <br />
                                            <input type="radio" <?php if ($this->_tpl_vars['configuration']['RenewOnOrder'] != 'on'): ?>checked="checked"<?php endif; ?> 
                                                   name="config[RenewOnOrder]" value=""  />
                                            After receiving payment
                                            <div class="clear"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr >
                                    <td width="200" style="vertical-align: top; text-align: right">
                                        <strong>Generate Renewal Order</strong>
                                    </td>
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['RenewInvoice'] == 0): ?>checked="checked"<?php endif; ?> name="config[RenewInvoice]" value="0" onclick="$('#_InvoiceGeneration').hide();" id="igen_off"/>
                                        <label  for="igen_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['RenewInvoice'] == 1): ?>checked="checked"<?php endif; ?> name="config[RenewInvoice]" value="1" onclick="$('#_InvoiceGeneration').ShowNicely();" id="igen_on"/>
                                        <label  for="igen_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                        <div class="p5" id="_InvoiceGeneration" style="<?php if ($this->_tpl_vars['configuration']['RenewInvoice'] == 0): ?>display:none;<?php endif; ?>" >
                                            Generate renewal orders
                                            <input type="text" size="3" value="<?php echo $this->_tpl_vars['configuration']['InvoiceGeneration']; ?>
" name="config[InvoiceGeneration]" class="inp"/> 
                                            <?php echo $this->_tpl_vars['lang']['InvoiceGenerationDomains2']; ?>
.
                                            <div class="clear"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td style="vertical-align: top; text-align: right"><strong>Advanced due date settings </strong></td>          
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['AdvancedDueDate'] == 'off'): ?>checked="checked"<?php endif; ?>   name="config[AdvancedDueDate]" value="off"  onclick="$('#advanceddue_options').hide();" id="advanceddue_off"/><label  for="advanceddue_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['AdvancedDueDate'] == 'on'): ?>checked="checked"<?php endif; ?>  name="config[AdvancedDueDate]" onclick="$('#advanceddue_options').ShowNicely();" id="advanceddue_on"/><label  for="advanceddue_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                        <div class="p5" id="advanceddue_options" style="<?php if ($this->_tpl_vars['configuration']['AdvancedDueDate'] == 'off'): ?>display:none;<?php endif; ?>" >

                                            <?php echo $this->_tpl_vars['lang']['InvoiceExpectDays']; ?>
 <input type="text" size="3" class="inp" value="<?php echo $this->_tpl_vars['configuration']['InvoiceExpectDays']; ?>
" name="config[InvoiceExpectDays]"/> <?php echo $this->_tpl_vars['lang']['InvoiceUnpaidReminder2']; ?>

                                            <br/><br/>

                                            <?php echo $this->_tpl_vars['lang']['InitialDueDays']; ?>
 <input type="text" size="3" class="inp" value="<?php echo $this->_tpl_vars['configuration']['InitialDueDays']; ?>
" name="config[InitialDueDays]"/> <?php echo $this->_tpl_vars['lang']['InitialDueDays2']; ?>

                                            <br/><br/>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="vertical-align: middle; text-align: right"><strong>Domain grace period <a style="" class="vtip_description" title="Number of days after domain expired customer can renew it for"></a></strong></td>
                                    <td class="automate-options">
                                        <input type="text" size="3" class="inp" value="<?php echo $this->_tpl_vars['configuration']['DomainGracePeriod']; ?>
" name="config[DomainGracePeriod]"/>
                                    </td>
                                </tr>

                                <?php if ($this->_tpl_vars['custom_automation']): ?>
                                    <tr >
                                        <td colspan="2">
                                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['custom_automation'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                        </td>
                                    </tr>
                                <?php endif; ?>

                                <tr class="odd">
                                    <td  align="right" valign="top">
                                        <strong><?php echo $this->_tpl_vars['lang']['domrenewal_notice']; ?>
</strong>
                                    </td>
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['product']['email_reminder'] == '0'): ?>checked="checked"<?php endif; ?> name="c_12" value="off" onclick="$('#reminder_options').hide();
                                                $('#email_reminder_mail').val(0);" id="reminder_off"/><label  for="reminder_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['product']['email_reminder'] != '0'): ?>checked="checked"<?php endif; ?> name="c_12" value="on" onclick="$('#reminder_options').ShowNicely();" id="reminder_on"/><label  for="reminder_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>
                                        <div class="p5" id="reminder_options" style="<?php if ($this->_tpl_vars['product']['email_reminder'] == '0'): ?>display:none;<?php endif; ?>" >

                                            <strong><?php echo $this->_tpl_vars['lang']['domain_expiring_mail']; ?>
</strong>
                                            <div class="clear"></div>
                                            <table border="0" cellspacing="0" cellpadding="3" style="margin-top:5px;">
                                                <tr><td> <input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['1DomainReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/>
                                                        <input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['1DomainReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['1DomainReminder']; ?>
"<?php endif; ?> name="config[1DomainReminder]" /><?php echo $this->_tpl_vars['lang']['daysbeforerenewal']; ?>
</td></tr>

                                                <tr class="reminder2" ><td ><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['2DomainReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/> <input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['2DomainReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['2DomainReminder']; ?>
"<?php endif; ?> name="config[2DomainReminder]" /> <?php echo $this->_tpl_vars['lang']['daysbeforerenewal']; ?>
</td></tr>
                                                <tr class="reminder3" ><td ><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['3DomainReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/> <input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['3DomainReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['3DomainReminder']; ?>
"<?php endif; ?> name="config[3DomainReminder]" /> <?php echo $this->_tpl_vars['lang']['daysbeforerenewal']; ?>
</td></tr>
                                                <tr class="reminder4" ><td ><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['4DomainReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/> <input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['4DomainReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['4DomainReminder']; ?>
"<?php endif; ?> name="config[4DomainReminder]"/> <?php echo $this->_tpl_vars['lang']['daysbeforerenewal']; ?>
</td></tr>
                                                <tr class="reminder5" ><td ><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['5DomainReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/> <input type="text" size="3" class="config_val inp" <?php if ($this->_tpl_vars['configuration']['5DomainReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['5DomainReminder']; ?>
"<?php endif; ?> name="config[5DomainReminder]" /> <?php echo $this->_tpl_vars['lang']['daysbeforerenewal']; ?>
</td></tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td width="200" align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['new_SendPaymentReminderEmails']; ?>
</strong></td>
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'off'): ?>checked="checked"<?php endif; ?>   name="config[SendPaymentReminderEmails]" value="off"  onclick="$('#remindere_options').hide();" id="remindere_off"/><label  for="remindere_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'on'): ?>checked="checked"<?php endif; ?>  name="config[SendPaymentReminderEmails]" onclick="$('#remindere_options').ShowNicely();" id="remindere_on"/><label  for="remindere_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                        <div class="p5" id="remindere_options" style="<?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'off'): ?>display:none;<?php endif; ?>" >


                                            <?php echo $this->_tpl_vars['lang']['InvoiceUnpaidReminder']; ?>
 <span><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['InvoiceUnpaidReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)" />
                                                <input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['InvoiceUnpaidReminder'] <= 0): ?> value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['InvoiceUnpaidReminder']; ?>
"<?php endif; ?> name="config[InvoiceUnpaidReminder]"/> </span> <?php echo $this->_tpl_vars['lang']['InvoiceUnpaidReminder2']; ?>

                                            <br/><br/>

                                            <?php echo $this->_tpl_vars['lang']['1OverdueReminder']; ?>

                                            <span>
                                                <input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['1OverdueReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)" /><input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['1OverdueReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['1OverdueReminder']; ?>
"<?php endif; ?> name="config[1OverdueReminder]"/>
                                            </span>
                                            <span>
                                                <input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['2OverdueReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)" /><input type="text" size="3" class="config_val inp" <?php if ($this->_tpl_vars['configuration']['2OverdueReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['2OverdueReminder']; ?>
"<?php endif; ?> name="config[2OverdueReminder]"/>
                                            </span>
                                            <span>
                                                <input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['3OverdueReminder'] > 0): ?>checked="checked"<?php endif; ?> onclick="check_i(this)" /><input type="text" size="3" class="config_val  inp" <?php if ($this->_tpl_vars['configuration']['3OverdueReminder'] <= 0): ?>value="0" disabled="disabled"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['3OverdueReminder']; ?>
"<?php endif; ?> name="config[3OverdueReminder]"/>
                                            </span>
                                            <?php echo $this->_tpl_vars['lang']['1OverdueReminder2']; ?>

                                            <div style="margin:10px 0px 0px;">

                                                <table id="reminder_table" class="table-striped" cellpadding="4"><tbody>

                                                    <?php $_from = $this->_tpl_vars['configuration']['InvoiceCustomReminder']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                                        <tr id="reminder_<?php echo $this->_tpl_vars['k']; ?>
" >
                                                            <td>Send: </td>
                                                            <td width="180"><select name="config[InvoiceCustomReminder][<?php echo $this->_tpl_vars['k']; ?>
][mail]" class="form-control">
                                                                    <?php $_from = $this->_tpl_vars['emails']['Invoice']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['mail']):
?><option value="<?php echo $this->_tpl_vars['mail']['id']; ?>
" <?php if ($this->_tpl_vars['v']['mail'] == $this->_tpl_vars['mail']['id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['mail']['tplname']; ?>
</option><?php endforeach; endif; unset($_from); ?>
                                                                </select></td>
                                                            <td width="50"><input class="form-control" type="text" name="config[InvoiceCustomReminder][<?php echo $this->_tpl_vars['k']; ?>
][days]" value="<?php echo $this->_tpl_vars['v']['days']; ?>
"/></td>
                                                            <td>days</td>
                                                            <td width="80"><select name="config[InvoiceCustomReminder][<?php echo $this->_tpl_vars['k']; ?>
][type]" class="form-control">
                                                                    <option value="before" <?php if ($this->_tpl_vars['v']['type'] == 'before'): ?>selected="selected"<?php endif; ?>>before</option>
                                                                    <option value="after" <?php if ($this->_tpl_vars['v']['type'] == 'after'): ?>selected="selected"<?php endif; ?>>after</option>
                                                                </select></td>
                                                            <td>due date</td>
                                                            <td><a class="btn btn-default btn-sm" onclick="return HBServices.rmreminder('<?php echo $this->_tpl_vars['k']; ?>
');"><i class="fa fa-times-circle"></i></a></td>
                                                        </tr>
                                                    <?php endforeach; endif; unset($_from); ?>
                                                    <tr id="reminder_template" style="display: none">
                                                        <td>Send: </td>
                                                        <td width="180"><select name="config[InvoiceCustomReminderr][+n+][mail]" class="form-control">
                                                                <?php $_from = $this->_tpl_vars['emails']['Invoice']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['mail']):
?><option value="<?php echo $this->_tpl_vars['mail']['id']; ?>
"><?php echo $this->_tpl_vars['mail']['tplname']; ?>
</option><?php endforeach; endif; unset($_from); ?>
                                                            </select></td>
                                                        <td width="50"><input class="form-control" type="text" name="config[InvoiceCustomReminderr][+n+][days]" /></td>
                                                        <td>days</td>
                                                        <td width="80"><select name="config[InvoiceCustomReminderr][+n+][type]" class="form-control">
                                                                <option value="before">before</option>
                                                                <option value="after">after</option>
                                                            </select></td>
                                                        <td>due date</td>
                                                        <td><a class="btn btn-default btn-sm" onclick="return HBServices.rmreminder('+n+');"><i class="fa fa-times-circle"></i></a></td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                                <button class="btn btn-sm btn-default" onclick="return HBServices.customreminder();" >Add more custom reminders</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="200" align="right" valign="top"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['new_LateFeeType_on'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</strong></td>
                                    <td class="automate-options">
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '0'): ?>checked="checked"<?php endif; ?> name="config[LateFeeType_sw]" value="0"  onclick="$('#latefee_options').hide();" id="latefee_off"/><label  for="latefee_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                        <input type="radio" <?php if ($this->_tpl_vars['configuration']['LateFeeType'] != '0'): ?>checked="checked"<?php endif; ?> name="config[LateFeeType_sw]" value="1" onclick="$('#latefee_options').ShowNicely();" id="latefee_on"/><label  for="latefee_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                        <div class="p5" id="latefee_options" style="<?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '0'): ?>display:none;<?php endif; ?>" >

                                            <?php echo $this->_tpl_vars['lang']['new_LateFeeType_on1']; ?>
 <input size="1" class="inp config_val"  value="<?php echo $this->_tpl_vars['configuration']['LateFeeValue']; ?>
" name="config[LateFeeValue]"/>
                                            <select  class="inp config_val" name="config[LateFeeType]">
                                                <option <?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '1'): ?>selected="selected"<?php endif; ?> value="1">%</option>
                                                <option <?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '2'): ?>selected="selected"<?php endif; ?>value="2"><?php if ($this->_tpl_vars['currency']['code']): ?><?php echo $this->_tpl_vars['currency']['code']; ?>
<?php else: ?><?php echo $this->_tpl_vars['currency']['iso']; ?>
<?php endif; ?></option>
                                            </select>
                                            <?php echo $this->_tpl_vars['lang']['new_LateFeeType_on2']; ?>
<input type="text" size="3" value="<?php echo $this->_tpl_vars['configuration']['AddLateFeeAfter']; ?>
" name="config[AddLateFeeAfter]" class="config_val inp" /> <?php echo $this->_tpl_vars['lang']['LateFeeType2x']; ?>
 <br />

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <tbody  style="display:none" class="sectioncontent" >

                    <?php if (! $this->_tpl_vars['custom_automation']): ?>
                        <?php $_from = $this->_tpl_vars['supported_emails']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['event'] => $this->_tpl_vars['em']):
?>
                            <tr>
                                <td width="200" align="right"><strong><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['event']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['event']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['event']; ?>
<?php endif; ?></strong></td>
                                <td>
                                    <div class="editor-container" id="<?php echo $this->_tpl_vars['event']; ?>
_msg">
                                        <div class="no org-content " ><span class=" iseditable"><em><?php if ($this->_tpl_vars['product']['emails'][$this->_tpl_vars['event']] == '0'): ?><?php echo $this->_tpl_vars['lang']['none']; ?>
<?php else: ?>
                                            <?php $_from = $this->_tpl_vars['emails']['All']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['emailtpl']):
?><?php if ($this->_tpl_vars['product']['emails'][$this->_tpl_vars['event']] == $this->_tpl_vars['emailtpl']['id']): ?><?php echo $this->_tpl_vars['emailtpl']['tplname']; ?>
<?php endif; ?><?php endforeach; endif; unset($_from); ?><?php endif; ?></em>
                                            <a href="#" class="editbtn  "><?php echo $this->_tpl_vars['lang']['Change']; ?>
</a></span>
                                            <?php if ($this->_tpl_vars['product']['welcome_email_id'] != '0'): ?>
                                            <a href="?cmd=emailtemplates&action=edit&id=<?php echo $this->_tpl_vars['product']['emails'][$this->_tpl_vars['event']]; ?>
" target="blank" class="editbtn directlink editgray orspace"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a>
                                            <a href="?cmd=emailtemplates&action=preview&template_id=<?php echo $this->_tpl_vars['product']['emails'][$this->_tpl_vars['event']]; ?>
" target="blank" class="editbtn directlink editgray orspace"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</a>
                                        <?php endif; ?>
                                    </div>

                                    <div class="ex editor" style="display:none"><select name="emails[<?php echo $this->_tpl_vars['event']; ?>
]" class="inp">
                                            <option value="0"><?php echo $this->_tpl_vars['lang']['none']; ?>
</option> <?php $_from = $this->_tpl_vars['emails']['All']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['emailtpl']):
?> <option value="<?php echo $this->_tpl_vars['emailtpl']['id']; ?>
" <?php if ($this->_tpl_vars['product']['emails'][$this->_tpl_vars['event']] == $this->_tpl_vars['emailtpl']['id']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['emailtpl']['tplname']; ?>
</option><?php endforeach; endif; unset($_from); ?>

                                        </select>

                                        <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
 </span>
                                        <a href="?cmd=emailtemplates&action=add&inline=true" class="new_control colorbox"  target="_blank"  onclick="<?php echo '$.facebox({ajax: \'?cmd=emailtemplates&action=add&inline=true&to='; ?>
<?php echo $this->_tpl_vars['event']; ?>
<?php echo '\'});'; ?>

                                                return false;"><span class="addsth" ><?php echo $this->_tpl_vars['lang']['composenewmsg']; ?>
</span></a>

                                    </div>

                                </div></td>

                        </tr>
                        <?php endforeach; endif; unset($_from); ?>

                            <?php else: ?>
                                <tr >
                                    <td colspan="2">
                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['custom_automation'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                    </td>
                                </tr>
                                <?php endif; ?>

                                </tbody>




                                <tbody id="configfields" style="display:none" class="sectioncontent" >

                                    <?php if ($this->_tpl_vars['product']['id'] == 'new'): ?>
                                        <tr>
                                            <td  align="center"   colspan="2">
                                                <strong><?php echo $this->_tpl_vars['lang']['save_product_first']; ?>
</strong>

                                            </td>
                                        </tr>
                                    <?php else: ?>
                                        <tr id="importforms" style="display:none">
                                            <td colspan="2">
                                                <div style="margin-bottom: 15px;"  class="p6">


                                                    <table cellspacing="0" cellpadding="3" style="margin-bottom:5px;">
                                                        <tbody><tr>
                                                                <td>
                                                                    <input type="file" name="importforms" />
                                                                </td>
                                                                <td>
                                                                    <input type="button" value="Import" style="font-weight:bold" onclick="return saveProductFull();">
                                                                    <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> <a href="#" onclick="$('#importforms').hide();
                                                                            $('#importformsswitch').show();
                                                                            return false;" class="editbtn"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    <span class="pdescriptions fs11" ><?php echo $this->_tpl_vars['lang']['importformsnotice']; ?>
</span>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="configeditor" >

                                            <td id="configeditor_content" colspan="2">
                                                <?php if ($this->_tpl_vars['alerttab']['eq'] == 4): ?>
                                                    <div style="margin:0px 0px 15px;" class="imp_msg">
                                                        <strong>This domain extension requires additional attributes to be entered by customer - <a href="?cmd=services&action=product&id=<?php echo $this->_tpl_vars['product']['id']; ?>
&make=addextendedform">click here to add them</a></strong>
                                                    </div>
                                                <?php endif; ?>

                                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.configfields.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

                                            </td>
                                        </tr>
                                    <?php endif; ?>




                                </tbody>



                                <tbody style="display:none"  class="sectioncontent">

                                    <?php if ($this->_tpl_vars['product']['id'] == 'new'): ?>
                                        <tr>
                                            <td  align="center"   colspan="2">
                                                <strong><?php echo $this->_tpl_vars['lang']['save_product_first']; ?>
</strong>

                                            </td>
                                        </tr>
                                    <?php else: ?>
                                        <tr id="widgeteditor" >

                                            <td id="widgeteditor_content" colspan="2">
                                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.productwidgets.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

                                            </td>
                                        </tr>
                                    <?php endif; ?>


                                </tbody>







                            </table>
                        </td>

                    </tr>
                    <tr>
                        <td class="nicers" style="border:0px" colspan="2">
                            <a class="new_dsave new_menu" href="#" onclick="return saveProductFull();"  >
                                <span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span>
                            </a>
                        </td>

                    </tr>
                </table>



                <div class="clear"></div>
                <script type="text/javascript">
                    lang['Register'] = '<?php echo $this->_tpl_vars['lang']['Register']; ?>
';
                    lang['Transfer'] = '<?php echo $this->_tpl_vars['lang']['Transfer']; ?>
';
                    lang['Renew'] = '<?php echo $this->_tpl_vars['lang']['Renew']; ?>
';
                    lang['Years'] = '<?php echo $this->_tpl_vars['lang']['Years']; ?>
';
                    <?php if ($this->_tpl_vars['alerttab']): ?>
                    $('#newshelfnav li').eq(<?php echo $this->_tpl_vars['alerttab']['eq']; ?>
).find('span').addClass('notification');
                    <?php endif; ?>
                    <?php echo '

                        function loadDomainModule(sel) {
                            var v = $(sel).val();
                            if (v == \'new\') {
                                $(sel).val(0);
                                window.location = \'?cmd=managemodules&action=domain&do=inactive\';
                                return false;
                            } else {
                                ajax_update(\'?cmd=services&action=showdomainmodule\', {id: v, product_id: $(\'#product_id\').val()}, \'#app_picker\');
                            }
                            return false;
                        }
                        function activateDomainModule(frm) {
                            $(\'#facebox .spinner\').show();
                            $(\'#picked_tab\').val(1);
                            var m = $(frm).find(\'input[name=modulename]\').val();
                            if (m) {
                                $(document).bind(\'close.facebox\', function () {
                                    window.location = \'?cmd=services&action=product&picked_tab=1&id=\' + $(\'#product_id\').val()
                                });
                                $.post(\'?cmd=managemodules&action=quickactivate&type=domain\', {fname: m, product_id: $(\'#product_id\').val()}, function (data) {
                                    $(\'#facebox .spinner\').hide();
                                    var resp = parse_response(data);
                                    if (typeof (resp) != \'boolean\') {
                                        $(\'#facebox .content\').html(resp);
                                    } else {
                                        window.location = \'?cmd=services&action=product&picked_tab=1&id=\' + $(\'#product_id\').val();
                                        return false;
                                    }
                                });
                            } else {
                                $(document).trigger(\'close.facebox\');
                            }
                            return false;
                        }


                    '; ?>

                </script>