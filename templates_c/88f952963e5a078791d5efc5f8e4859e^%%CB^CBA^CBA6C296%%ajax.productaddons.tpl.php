<?php /* Smarty version 2.6.26, created on 2018-06-11 12:09:44
         compiled from ajax.productaddons.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'hbinput', 'ajax.productaddons.tpl', 65, false),array('function', 'hbwysiwyg', 'ajax.productaddons.tpl', 71, false),array('function', 'securitytoken', 'ajax.productaddons.tpl', 376, false),array('modifier', 'capitalize', 'ajax.productaddons.tpl', 303, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'addon' && $this->_tpl_vars['addon']): ?>
<script type="text/javascript"><?php echo '
    function saveAddonFull() {
        $(\'#addonform\').submit();
        return false;
    }
    '; ?>

</script>
<form action="" method="post" id="addonform">
    <input type="hidden" name="make" value="update"/>


    <table width="100%" cellspacing="0" cellpadding="10" border="0">
        <tr><td style="padding:0px">
                <div class="newhorizontalnav" id="newshelfnav">
                    <div class="list-1">
                        <ul>
                            <li>
                                <a href="#"><span class="ico money">General</span></a>
                            </li>
                            <?php if ($this->_tpl_vars['addon']['module'] != ''): ?>
                            <li >
                                <a href="#"><span class="ico plug">Connect with App</span></a>
                            </li>
                            <?php endif; ?>
                            <li >
                                <a href="#"><span class="ico gear">Automation</span></a>
                            </li>
                            <li class="last">
                                <a href="#"><span class="ico gear"><?php echo $this->_tpl_vars['lang']['Emails']; ?>
</span></a>
                            </li>

                        </ul>
                    </div>
                    <div class="list-2">
                        <div class="subm1 haveitems">
                            <ul >
						<?php if ($this->_tpl_vars['addon']['visible'] == '1'): ?><li>
                                    <a href="#" onclick=" $('#add_visibility').removeAttr('checked');$('#addonvisibility').ShowNicely();$(this).hide();return false;"><span ><?php echo $this->_tpl_vars['lang']['hide_addon']; ?>
</span></a></li><?php endif; ?>
						<?php if ($this->_tpl_vars['addon']['unique'] != '1'): ?><li >
                                    <a href="#" onclick="$('#add_unique').attr('checked',true);$('#adddonunique').ShowNicely();$(this).hide();return false;"><span ><?php echo $this->_tpl_vars['lang']['make_unique']; ?>
</span></a></li>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['configuration']['EnableProRata'] != 'on'): ?><li >
                                    <a href="#" onclick="$('#prorated_ctrl').show();$('#prorata_on').click();$(this).hide();return false"><span ><?php echo $this->_tpl_vars['lang']['new_EnableProRata']; ?>
</span></a></li><?php endif; ?>
                            </ul>

                        </div>
                        <div class="subm1" style="display:none"></div>
                        <div class="subm1" style="display:none"></div>
                        <div class="subm1" style="display:none"></div>


                    </div>
                </div>

            </td></tr>
        <tr><td class="nicers" style="border:none">

                <table cellspacing="0" cellpadding="6" border="0" width="100%">
                    <tbody class="sectioncontent">

                        <tr>
                            <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Name']; ?>
</strong></td>
                            <td align="left">
                                <?php echo smarty_function_hbinput(array('value' => $this->_tpl_vars['addon']['tag_name'],'style' => "font-size: 16px !important; font-weight: bold;",'class' => 'inp','size' => '60','name' => 'name'), $this);?>
</td>
                        </tr>
                        <tr>
                            <td align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
</strong></td>
                            <td align="left">
                            <?php if ($this->_tpl_vars['addon']['description'] == ''): ?><a href="#" onclick="$(this).hide();$('#prod_desc_c').show();return false;"><strong><?php echo $this->_tpl_vars['lang']['adddescription']; ?>
</strong></a>
                            <div id="prod_desc_c" style="display:none"><?php echo smarty_function_hbwysiwyg(array('value' => $this->_tpl_vars['addon']['tag_description'],'style' => "width:99%;",'class' => 'inp wysiw_editor','cols' => '100','rows' => '6','id' => 'prod_desc','name' => 'description','featureset' => 'full'), $this);?>
</div>
			  <?php else: ?>
                              <?php echo smarty_function_hbwysiwyg(array('value' => $this->_tpl_vars['addon']['tag_description'],'style' => "width:99%;",'class' => 'inp wysiw_editor','cols' => '100','rows' => '6','id' => 'prod_desc','name' => 'description','featureset' => 'full'), $this);?>


                                  <?php endif; ?>
                            </td>
                        </tr>
                        <tr id="addonvisibility" <?php if ($this->_tpl_vars['addon']['visible'] == '1'): ?>style="display:none"<?php endif; ?>>
                            <td align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['Visible']; ?>
</strong></td>
                            <td><input type="checkbox" name="visible" <?php if ($this->_tpl_vars['addon']['visible'] == '1'): ?>checked="checked"<?php endif; ?> id="add_visibility" /></td>
                        </tr>
                        <tr id="adddonunique" <?php if ($this->_tpl_vars['addon']['unique'] != '1'): ?>style="display:none"<?php endif; ?>>
                            <td align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['Unique']; ?>
</strong></td>
                            <td><input type="checkbox" name="unique" <?php if ($this->_tpl_vars['addon']['unique'] == '1'): ?>checked="checked"<?php endif; ?> id="add_unique" /> <?php echo $this->_tpl_vars['lang']['UniqueDesc']; ?>
</td>
                        </tr>

                        <tr>
                            <td valign="top" width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Price']; ?>
</strong></td>
                            <td id="priceoptions">
                                <?php $_from = $this->_tpl_vars['supported_billingmodels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['boptloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['boptloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['bm']):
        $this->_foreach['boptloop']['iteration']++;
?>
                                <a href="#" class="billopt <?php if (($this->_foreach['boptloop']['iteration'] <= 1)): ?>bfirst<?php endif; ?> <?php if ($this->_tpl_vars['product']['paytype'] == $this->_tpl_vars['bm']): ?>checked<?php endif; ?>"  <?php if ($this->_tpl_vars['product']['paytype'] != $this->_tpl_vars['bm']): ?>style="display:none"<?php endif; ?> onclick='return switch_t2(this,"<?php echo $this->_tpl_vars['bm']; ?>
");'><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['bm']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['bm']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['bm']; ?>
<?php endif; ?></a>
                                <input type="radio" value="<?php echo $this->_tpl_vars['bm']; ?>
" name="paytype" <?php if ($this->_tpl_vars['product']['paytype'] == $this->_tpl_vars['bm']): ?>checked="checked"<?php endif; ?>  id="<?php echo $this->_tpl_vars['bm']; ?>
" style="display:none"/>
                                <?php endforeach; endif; unset($_from); ?>

                                <a href="#" class="editbtn" onclick="$(this).hide();$(this).parent().find('.billopt').show();return false;"><?php echo $this->_tpl_vars['lang']['Change']; ?>
</a>


                                      <?php $_from = $this->_tpl_vars['supported_billingmodels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['boptloop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['boptloop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['bm']):
        $this->_foreach['boptloop']['iteration']++;
?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "productbilling_".($this->_tpl_vars['bm']).".tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php endforeach; endif; unset($_from); ?>


                            </td>


                        </tr>


                                        <tr >
                                             <td valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['taxaddon']; ?>
</strong></td>
                                            <td><input type="checkbox" <?php if ($this->_tpl_vars['addon']['taxable'] == '1'): ?>checked="checked"<?php endif; ?> name="taxable" value="1"/></td>
                                        </tr>
                                        <tr <?php if ($this->_tpl_vars['configuration']['EnableProRata'] == 'off'): ?>style="display:none"<?php endif; ?> id="prorated_ctrl">

                                            <td align="right"><strong><?php echo $this->_tpl_vars['lang']['new_EnableProRata']; ?>
</strong></td>
                                            <td>
                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableProRata'] == 'off'): ?>checked="checked"<?php endif; ?> name="config[EnableProRata]" value="off" onclick="$('#prorated').hide();" id="prorata_off"/> <label for="prorata_off"><strong><?php echo $this->_tpl_vars['lang']['no']; ?>
</strong></label>
                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableProRata'] == 'on'): ?>checked="checked"<?php endif; ?> name="config[EnableProRata]" value="on" onclick="$('#prorated').ShowNicely();" id="prorata_on"/> <label for="prorata_on"><strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
</strong></label>
                                            </td>
                                            </td>
                                        </tr>
                                        <tr id="prorated" <?php if ($this->_tpl_vars['configuration']['EnableProRata'] == 'off'): ?>style="display:none"<?php endif; ?>>
                                            <td></td>
                                            <td>
	<?php echo $this->_tpl_vars['lang']['new_ProRataDay']; ?>
 <input class="inp" size="2" name="config[ProRataDay]" value="<?php echo $this->_tpl_vars['configuration']['ProRataDay']; ?>
"/>
	<?php echo $this->_tpl_vars['lang']['new_ProRataMonth']; ?>
 <select class="inp" name="config[ProRataMonth]">
                                                    <option value="disabled" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'disabled'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['new_ProRataMonth_disabled']; ?>
</option>
                                                    <option value="January" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'January'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['January']; ?>
</option>
                                                    <option value="February" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'February'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['February']; ?>
</option>
                                                    <option value="March" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'March'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['March']; ?>
</option>
                                                    <option value="April" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'April'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['April']; ?>
</option>
                                                    <option value="May" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'May'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['May']; ?>
</option>
                                                    <option value="June" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'June'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['June']; ?>
</option>
                                                    <option value="July" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'July'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['July']; ?>
</option>
                                                    <option value="August" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'August'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['August']; ?>
</option>
                                                    <option value="September" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'September'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['September']; ?>
</option>
                                                    <option value="October" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'October'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['October']; ?>
</option>
                                                    <option value="November" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'November'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['November']; ?>
</option>
                                                    <option value="December" <?php if ($this->_tpl_vars['configuration']['ProRataMonth'] == 'December'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['December']; ?>
</option>
                                                </select><br />
                                                <span><?php echo $this->_tpl_vars['lang']['new_ProRataNextMonth']; ?>
 <a class="vtip_description" title="<?php echo $this->_tpl_vars['lang']['promonthdesc']; ?>
"></a> <input type="checkbox" onclick="check_i(this)" <?php if ($this->_tpl_vars['configuration']['ProRataNextMonth'] > 0): ?>checked="checked"<?php endif; ?> value="1"/> <input type="text" name="config[ProRataNextMonth]" value="<?php echo $this->_tpl_vars['configuration']['ProRataNextMonth']; ?>
" class="config_val  inp" size="3" <?php if ($this->_tpl_vars['configuration']['ProRataNextMonth'] == 0): ?>disabled="disabled"<?php endif; ?>/></span>

                                            </td>
                                        </tr>


                                        </tbody>


			 <?php if ($this->_tpl_vars['addon']['module'] != ''): ?><tbody class="sectioncontent" style="display:none">
                                            <tr>
                                                <td colspan="2" style="padding:0px !important">
                                                    <table border="0" width="100%" cellpadding="6" cellspacing="0">



					 <?php if ($this->_tpl_vars['addon']['modulename']): ?><tbody id="loadable">
                                                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.configmodule.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

                                                        </tbody><?php endif; ?>


                                                    </table>

                                                </td></tr>


                                        </tbody><?php endif; ?>


                                        <tbody class="sectioncontent" style="display:none">
                                            <tr>
                                                <td  id="auts-settings" colspan="2">

                                                    <table class="editor-container" cellspacing="0" cellpadding="6" width="100%">

                                                        <tr class="odd"> <td align="right" valign="top" width="200"><strong><?php echo $this->_tpl_vars['lang']['auto_create']; ?>
</strong></td>

                                                            <td id="automateoptions">
                                                                <input type="radio" value="0" name="autosetup2" <?php if ($this->_tpl_vars['addon']['autosetup'] == '0'): ?>checked="checked"<?php endif; ?> id="autooff" onclick="$('#autosetup_opt').hide();$('#autooff_').click();"/><label for="autooff"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio"  value="1" name="autosetup2" <?php if ($this->_tpl_vars['addon']['autosetup'] != '0'): ?>checked="checked"<?php endif; ?> id="autoon" onclick="$('#autosetup_opt').ShowNicely();$('#autoon_').click();"/><label for="autoon"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                                                <div class="p5" id="autosetup_opt" style="<?php if ($this->_tpl_vars['addon']['autosetup'] == '0'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >
                                                                    <input type="radio" style="display:none" <?php if ($this->_tpl_vars['addon']['autosetup'] == '0'): ?>checked="checked"<?php endif; ?> value="0" name="autosetup" id="autooff_"/>
                                                                           <input type="radio" <?php if ($this->_tpl_vars['addon']['autosetup'] == '3'): ?>checked="checked"<?php endif; ?> value="3" name="autosetup" id="autosetup3"/> <label for="autosetup3"><?php echo $this->_tpl_vars['lang']['whenorderplaced']; ?>
</label><br />
                                                                    <input type="radio" <?php if ($this->_tpl_vars['addon']['autosetup'] == '2'): ?>checked="checked"<?php endif; ?> value="2" name="autosetup" id="autoon_"/> <label for="autoon_"><?php echo $this->_tpl_vars['lang']['whenpaymentreceived']; ?>
</label><br />
                                                                    <input type="radio" <?php if ($this->_tpl_vars['addon']['autosetup'] == '1'): ?>checked="checked"<?php endif; ?> value="1" name="autosetup" id="autosetup1"/> <label for="autosetup1"><?php echo $this->_tpl_vars['lang']['whenmanualaccept']; ?>
</label> <br />
                                                                    <input type="radio" <?php if ($this->_tpl_vars['addon']['autosetup'] == '4'): ?>checked="checked"<?php endif; ?> value="4" name="autosetup" id="autosetup4"/> <label for="autosetup4"><?php echo $this->_tpl_vars['lang']['whenaccreated']; ?>
</label>


                                                                    <div class="clear"></div>

                                                                </div>


                                                            </td></tr>

                                                        <tr>
                                                            <td width="200" valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['new_EnableAutoSuspension']; ?>
</strong></td>
                                                            <td>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoSuspension'] == 'off'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoSuspension]" value="off" onclick="$('#suspension_options').hide();" id="suspend_off"/><label  for="suspend_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoSuspension'] == 'on'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoSuspension]" value="on" onclick="$('#suspension_options').ShowNicely()" id="suspend_on"/><label  for="suspend_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>
                                                                <div class="p5" id="suspension_options" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoSuspension'] == 'off'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >
	<?php echo $this->_tpl_vars['lang']['new_EnableAutoSuspension1']; ?>
 <input type="text" size="3" value="<?php echo $this->_tpl_vars['configuration']['AutoSuspensionPeriod']; ?>
"  name="config[AutoSuspensionPeriod]" class="inp config_val" /> <?php echo $this->_tpl_vars['lang']['new_EnableAutoSuspension2']; ?>



                                                                    <div class="clear"></div>


                                                                </div>

                                                            </td>
                                                        </tr>

                                                        <tr class="odd">
                                                            <td width="200"  valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['new_EnableAutoUnSuspension']; ?>
</strong></td>
                                                            <td>

                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoUnSuspension'] == 'off'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoUnSuspension]" value="off" onclick="$('#unsuspension_options').hide();" id="unsuspend_off"/><label  for="unsuspend_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoUnSuspension'] == 'on'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoUnSuspension]" value="on" onclick="$('#unsuspension_options').ShowNicely();" id="unsuspend_on"/><label  for="unsuspend_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>



                                                                <div class="p5" id="unsuspension_options" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoUnSuspension'] == 'off'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >
	<?php echo $this->_tpl_vars['lang']['new_EnableAutoUnSuspension1']; ?>



                                                                    <div class="clear"></div>


                                                                </div>


                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td width="200" valign="top" align="right"><strong><?php echo $this->_tpl_vars['lang']['new_EnableAutoTermination']; ?>
</strong></td>
                                                            <td>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoTermination'] == 'off'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoTermination]" value="off" onclick="$('#termination_options').hide();" id="termination_off"/><label  for="termination_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['EnableAutoTermination'] == 'on'): ?>checked="checked"<?php endif; ?> name="config[EnableAutoTermination]" value="on" onclick="$('#termination_options').ShowNicely();" id="termination_on"/><label  for="termination_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>



                                                                <div class="p5" id="termination_options" style="<?php if ($this->_tpl_vars['configuration']['EnableAutoTermination'] == 'off'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >
	<?php echo $this->_tpl_vars['lang']['new_EnableAutoTermination1']; ?>
 <input type="text" size="3" value="<?php echo $this->_tpl_vars['configuration']['AutoTerminationPeriod']; ?>
" name="config[AutoTerminationPeriod]"  class="inp config_val" /> <?php echo $this->_tpl_vars['lang']['new_EnableAutoTermination2']; ?>
 
                                                                    <br /><input type="checkbox" <?php if ($this->_tpl_vars['configuration']['EnableAddonRelatedTermination'] == 'on'): ?>checked="checked"<?php endif; ?> value="on" name="config[EnableAddonRelatedTermination]" /> <?php echo $this->_tpl_vars['lang']['EnableAddonRelatedTermination']; ?>


                                                                                 <div class="clear"></div>


                                                                </div>


                                                            </td>

                                                        </tr>



                                                        <tr class="odd">
                                                            <td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoiceGeneration']; ?>
 </strong>
                                                            </td>
                                                            <td><input type="text" size="3" value="<?php echo $this->_tpl_vars['configuration']['InvoiceGeneration']; ?>
" name="config[InvoiceGeneration]" class="inp"/> <?php echo $this->_tpl_vars['lang']['InvoiceGeneration2']; ?>
</td>

                                                        </tr>






                                                        <tr >
                                                            <td width="200" align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['new_SendPaymentReminderEmails']; ?>
</strong></td>
                                                            <td>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'off'): ?>checked="checked"<?php endif; ?>   name="config[SendPaymentReminderEmails]" value="off"  onclick="$('#reminder_options').hide();" id="reminder_off"/><label  for="reminder_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'on'): ?>checked="checked"<?php endif; ?>  name="config[SendPaymentReminderEmails]" onclick="$('#reminder_options').ShowNicely();" id="reminder_on"/><label  for="reminder_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                                                <div class="p5" id="reminder_options" style="<?php if ($this->_tpl_vars['configuration']['SendPaymentReminderEmails'] == 'off'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >


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



                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr class="odd">
                                                            <td width="200" align="right" valign="top"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['new_LateFeeType_on'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</strong></td>
                                                            <td>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '0'): ?>checked="checked"<?php endif; ?> name="config[LateFeeType_sw]" value="0"  onclick="$('#latefee_options').hide();" id="latefee_off"/><label  for="latefee_off"><b><?php echo $this->_tpl_vars['lang']['no']; ?>
</b></label>
                                                                <input type="radio" <?php if ($this->_tpl_vars['configuration']['LateFeeType'] != '0'): ?>checked="checked"<?php endif; ?> name="config[LateFeeType_sw]" value="1" onclick="$('#latefee_options').ShowNicely();" id="latefee_on"/><label  for="latefee_on"><b><?php echo $this->_tpl_vars['lang']['yes']; ?>
</b></label>

                                                                <div class="p5" id="latefee_options" style="<?php if ($this->_tpl_vars['configuration']['LateFeeType'] == '0'): ?>display:none;<?php endif; ?>margin-top:10px;border:#ccc 1px solid;" >


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

                                            <?php $_from = $this->_tpl_vars['supported_emails']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['event'] => $this->_tpl_vars['em']):
?>
                                            <tr>
                                                <td width="200" align="right"><strong><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['event']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['event']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['event']; ?>
<?php endif; ?></strong></td>
                                                <td><div class="editor-container" id="<?php echo $this->_tpl_vars['event']; ?>
_msg">
                                                        <div class="no org-content " ><span class=" iseditable"><em><?php if ($this->_tpl_vars['addon']['emails'][$this->_tpl_vars['event']] == '0'): ?><?php echo $this->_tpl_vars['lang']['none']; ?>
<?php else: ?>
                                                                    <?php $_from = $this->_tpl_vars['messages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['emailtpl']):
?><?php if ($this->_tpl_vars['addon']['emails'][$this->_tpl_vars['event']] == $this->_tpl_vars['emailtpl']['id']): ?><?php echo $this->_tpl_vars['emailtpl']['tplname']; ?>
<?php endif; ?><?php endforeach; endif; unset($_from); ?><?php endif; ?></em>
                                                                <a href="#" class="editbtn  "><?php echo $this->_tpl_vars['lang']['Change']; ?>
</a></span>
                                                            <?php if ($this->_tpl_vars['addon']['welcome_email_id'] != '0'): ?>
                                                            <a href="?cmd=emailtemplates&action=edit&id=<?php echo $this->_tpl_vars['addon']['emails'][$this->_tpl_vars['event']]; ?>
" target="blank" class="editbtn directlink editgray orspace"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a>
                                                            <a href="?cmd=emailtemplates&action=preview&template_id=<?php echo $this->_tpl_vars['addon']['emails'][$this->_tpl_vars['event']]; ?>
" target="blank" class="editbtn directlink editgray orspace"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</a>
                                                            <?php endif; ?>
                                                        </div>

                                                        <div class="ex editor" style="display:none"><select name="emails[<?php echo $this->_tpl_vars['event']; ?>
]" class="inp">
                                                                <option value="0"><?php echo $this->_tpl_vars['lang']['none']; ?>
</option> <?php $_from = $this->_tpl_vars['messages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['emailtpl']):
?> <option value="<?php echo $this->_tpl_vars['emailtpl']['id']; ?>
" <?php if ($this->_tpl_vars['addon']['emails'][$this->_tpl_vars['event']] == $this->_tpl_vars['emailtpl']['id']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['emailtpl']['tplname']; ?>
</option><?php endforeach; endif; unset($_from); ?>
                                                            </select>
                                                            <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
 </span>
                                                            <a href="?cmd=emailtemplates&action=add&inline=true" class="new_control colorbox"  target="_blank"  onclick="<?php echo '$.facebox({ ajax: \'?cmd=emailtemplates&action=add&inline=true&to='; ?>
<?php echo $this->_tpl_vars['event']; ?>
<?php echo '\' });'; ?>
 return false;"><span class="addsth" ><?php echo $this->_tpl_vars['lang']['composenewmsg']; ?>
</span></a>
                                                        </div>
                                                    </div></td>

                                            </tr>
                                            <?php endforeach; endif; unset($_from); ?>



                                        </tbody>
                                        </table>

                                        </td>
                                        </tr>
                                        <tr><td class="nicers" style="border:0px">
                                                <a class="new_dsave new_menu" href="#" onclick="return saveAddonFull();"  >
                                                    <span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span>
                                                </a>
                                            </td></tr>
                                        </table>


                                        <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                </div>
                                <?php elseif ($this->_tpl_vars['action'] == 'categories'): ?>

                                <?php if ($this->_tpl_vars['categories']): ?>
                                <div class="blu">
                                    <input type="button" value="<?php echo $this->_tpl_vars['lang']['createnewaddon']; ?>
" class="linkDirectly" href="?cmd=productaddons&action=addaddon"/>
                                    <input type="button" value="<?php echo $this->_tpl_vars['lang']['createnewcat']; ?>
" class="linkDirectly" href="?cmd=productaddons&action=addcategory"/>
                                </div>
                                <form id="serializeit" method="post">
                                    <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">

                                        <tr>
                                            <th width="10">&nbsp;</th>
                                            <th  width="32%"><?php echo $this->_tpl_vars['lang']['Name']; ?>
</th>
                                            <th  width="32%"><?php echo $this->_tpl_vars['lang']['Description']; ?>
</th>
                                            <th  width="32%"><?php echo $this->_tpl_vars['lang']['DefaultOption']; ?>
</th>
                                            <th width="20">&nbsp;</th>
                                            <th width="10">&nbsp;</th>
                                        </tr>

                                    </table>
                                    <ul id="grab-sorter" >
                                        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['protd'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['protd']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['a']):
        $this->_foreach['protd']['iteration']++;
?>
                                        <li><div> <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                                                    <tr   class="havecontrols">
                                                        <td  width="14"> <div class="controls"><a class="sorter-handle">sort</a></div></td>

                                                        <td width="32%"><input type="hidden" name="sorts[]" value="<?php echo $this->_tpl_vars['a']['id']; ?>
" /><a href="?cmd=productaddons&action=category&id=<?php echo $this->_tpl_vars['a']['id']; ?>
"><?php echo $this->_tpl_vars['a']['name']; ?>
</a></td>
                                                        <td width="31%"><?php echo $this->_tpl_vars['a']['description']; ?>
</td>
                                                        <td width="31%"><?php echo $this->_tpl_vars['a']['default_name']; ?>
</td>

                                                        <td width="20"><a href="?cmd=productaddons&action=category&id=<?php echo $this->_tpl_vars['a']['id']; ?>
" class="editbtn"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a></td>
                                                        <td width="10"><a href="?cmd=productaddons&make=deletecat&cat_id=<?php echo $this->_tpl_vars['a']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" onclick="return confirm('<?php echo $this->_tpl_vars['lang']['deletecategoryconfirm']; ?>
');" class="delbtn">Delete</a></td>
                                                    </tr></table></div></li>

                                        <?php endforeach; endif; unset($_from); ?>
                                    </ul>
                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                <table class="table glike" cellpadding="3" cellspacing="0" width="100%">
                                    <tr >
                                        <th width="10">&nbsp;</th>
                                        <th  ><a href="?cmd=productaddons&action=addcategory" class="editbtn" ><?php echo $this->_tpl_vars['lang']['createnewcat']; ?>
</a></th>
                                    </tr>
                                </table>
                                <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jquery.dragsort-0.3.10.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                                <script type="text/javascript"><?php echo '
                                    $("#grab-sorter").dragsort({ dragSelector: "a.sorter-handle",  dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'><div></div></li>" });
		
                                    function saveOrder() {
                                        var sorts = $(\'#serializeit\').serialize();
                                        ajax_update(\'?cmd=productaddons&action=listcats&\'+sorts,{});
                                    };


                                    '; ?>

                                </script>
                                <?php else: ?>
                                <div class="blank_state blank_news">
                                    <div class="blank_info">
                                        <h1><?php echo $this->_tpl_vars['lang']['blank_kb2']; ?>
</h1>
				<?php echo $this->_tpl_vars['lang']['blank_kb2_desc']; ?>

                                        <div class="clear"></div>

                                        <a class="new_add new_menu" href="?cmd=productaddons&action=addcategory" style="margin-top:10px">
                                            <span><?php echo $this->_tpl_vars['lang']['createnewcat']; ?>
</span></a>
                                        <div class="clear"></div>

                                    </div>
                                </div>
                                <?php endif; ?>

                                <?php elseif ($this->_tpl_vars['action'] == 'addcategory'): ?>
                                <form action="" method="post"  onsubmit="selectalladdons()">
                                    <input type="hidden" name="make" value="addcategory"/>
                                    <div class="blu"> <a href="?cmd=productaddons&action=categories"  class="tload2"><strong>&laquo; <?php echo $this->_tpl_vars['lang']['backtoaddonscat']; ?>
</strong></a>
                                    </div>
                                    <div style="padding:5px; " class="lighterblue">
                                        <table cellspacing="0" cellpadding="6" border="0" width="600">
                                            <tbody>
                                                <tr>
                                                    <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Name']; ?>
</strong></td>
                                                    <td><input type="text"  size="60" name="name"  value="<?php echo $this->_tpl_vars['submit']['name']; ?>
"   class="inp"/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
</strong></td>
                                                    <td><textarea rows="3" cols="60" name="description"   class="inp"><?php echo $this->_tpl_vars['submit']['description']; ?>
</textarea></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['clientcanorder']; ?>
</strong></td>
                                                    <td><select name="type"  class="inp">
                                                            <option value="one" ><?php echo $this->_tpl_vars['lang']['onlyoneaddonradio']; ?>
</option>
                                                            <option value="list" ><?php echo $this->_tpl_vars['lang']['onlyoneaddonlist']; ?>
</option>
                                                            <option value="many" ><?php echo $this->_tpl_vars['lang']['manyaddons']; ?>
</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['defoptname']; ?>
</strong></td>
                                                    <td><input type="text"  size="60" name="default_name"  class="inp"/></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <div style="padding:5px; " class="lighterblue" id="aplicator">
	<?php if ($this->_tpl_vars['addons']): ?>
                                            <table width="80%" cellpadding="6" cellspacing="0">
                                                <tbody>

                                                    <tr>
                                                        <td valign="top" align="center">

							 <?php echo $this->_tpl_vars['lang']['applicableaddons']; ?>
<br />
                                                            <select multiple="multiple" name="addons2[]" style="width:300px;height:300px;" id="listAvail">

									<?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
										<?php if (! $this->_tpl_vars['cat']['assigned']): ?>
                                                                <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
"><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
										<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
                                                            </select><br />




                                                        </td>
                                                        <td valign="middle">
                                                            <input type="button" value=">>" onclick="addItem();return false;" name="move" /><br />
                                                            <input type="button" value="<<"  onclick="delItem();return false;"  name="move" />
                                                        </td>
                                                        <td valign="top"  align="center">
							<?php echo $this->_tpl_vars['lang']['appliedaddons']; ?>
 <br />
                                                            <select multiple="multiple" name="addons[]" style="width:300px;height:300px;" id="listAlready">


									<?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
										<?php if ($this->_tpl_vars['cat']['assigned']): ?>
                                                                <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
" ><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
										<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
				<?php else: ?>
							<?php echo $this->_tpl_vars['lang']['noaddonsyet']; ?>
 <a href="?cmd=productaddons&action=addaddon"><?php echo $this->_tpl_vars['lang']['heretoadd']; ?>
</a> <?php echo $this->_tpl_vars['lang']['newaddon']; ?>
.
							<?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="blu"> <a href="?cmd=productaddons&action=categories"  class="tload2"><strong>&laquo; <?php echo $this->_tpl_vars['lang']['backtoaddonscat']; ?>
</strong></a>
                                        <input type="submit" style="font-weight:bold" value="<?php echo $this->_tpl_vars['lang']['addcategory']; ?>
" />
                                        <input type="button" onclick="window.location='?cmd=productaddons'" style="" value="<?php echo $this->_tpl_vars['lang']['Cancel']; ?>
"/>

                                    </div>
                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                </div>
                                <?php elseif ($this->_tpl_vars['action'] == 'category'): ?>
                                <form action="" method="post" onsubmit="selectalladdons()">
                                    <input type="hidden" name="make" value="update"/>
                                    <div class="blu"> <a href="?cmd=productaddons&action=categories"  class="tload2"><strong>&laquo; <?php echo $this->_tpl_vars['lang']['backtoaddonscat']; ?>
</strong></a>
                                    </div>
                                    <div style="padding:5px; " class="lighterblue">
                                        <table cellspacing="0" cellpadding="6" border="0" width="600">
                                            <tbody>
                                                <tr>
                                                    <td width="160" align="right"><strong><?php echo $this->_tpl_vars['lang']['Name']; ?>
</strong></td>
                                                    <td><input type="text"  size="60" name="name"  value="<?php echo $this->_tpl_vars['category']['name']; ?>
"   class="inp"/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
</strong></td>
                                                    <td><textarea rows="3" cols="60" name="description"   class="inp"><?php echo $this->_tpl_vars['category']['description']; ?>
</textarea></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['clientcanorder']; ?>
</strong></td>
                                                    <td><select name="type"  class="inp">
                                                            <option value="one" <?php if ($this->_tpl_vars['category']['type'] == 'one'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['onlyoneaddonradio']; ?>
</option>
                                                            <option value="list" <?php if ($this->_tpl_vars['category']['type'] == 'list'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['onlyoneaddonlist']; ?>
</option>
                                                            <option value="many" <?php if ($this->_tpl_vars['category']['type'] == 'many'): ?>selected="selected"<?php endif; ?> ><?php echo $this->_tpl_vars['lang']['manyaddons']; ?>
</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><strong><?php echo $this->_tpl_vars['lang']['defoptname']; ?>
</strong></td>
                                                    <td><input type="text"  size="60" name="default_name" value="<?php echo $this->_tpl_vars['category']['default_name']; ?>
" class="inp"/></td>
                                                </tr>

                                            </tbody>
                                        </table>

                                        <div style="padding:5px;" class="lighterblue" id="aplicator">
	<?php if ($this->_tpl_vars['addons']): ?>
                                            <table width="80%" cellpadding="6" cellspacing="0">
                                                <tbody>

                                                    <tr>
                                                        <td valign="top" align="center">

							<?php echo $this->_tpl_vars['lang']['applicableaddons']; ?>
 <br />
                                                            <select multiple="multiple" name="addons2[]" style="width:300px;height:300px;" id="listAvail">

									<?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
										<?php if (! $this->_tpl_vars['cat']['assigned']): ?>
                                                                <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
"><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
										<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
                                                            </select><br />




                                                        </td>
                                                        <td valign="middle">
                                                            <input type="button" value=">>" onclick="addItem();return false;" name="move" /><br />
                                                            <input type="button" value="<<"  onclick="delItem();return false;"  name="move" />
                                                        </td>
                                                        <td valign="top"  align="center">
							<?php echo $this->_tpl_vars['lang']['appliedaddons']; ?>
 <br />
                                                            <select multiple="multiple" name="addons[]" style="width:300px;height:300px;" id="listAlready">


									<?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
										<?php if ($this->_tpl_vars['cat']['assigned']): ?>
                                                                <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
" ><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
										<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
				<?php else: ?>
							<?php echo $this->_tpl_vars['lang']['noaddonsyet']; ?>
 <a href="?cmd=productaddons&action=addaddon"><?php echo $this->_tpl_vars['lang']['heretoadd']; ?>
</a> <?php echo $this->_tpl_vars['lang']['newaddon']; ?>
.
							<?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="blu">
                                        <input type="submit" style="font-weight:bold" value="<?php echo $this->_tpl_vars['lang']['updatecategory']; ?>
" />
                                        <input type="button" onclick="window.location='?cmd=productaddons'" style="" value="<?php echo $this->_tpl_vars['lang']['Cancel']; ?>
"/>

                                    </div>
                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                </div>


                                <?php elseif ($this->_tpl_vars['action'] == 'default'): ?>
                                <?php if ($this->_tpl_vars['addons']): ?>
                                <div class="blu" >
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left"><strong><?php echo $this->_tpl_vars['lang']['Addons']; ?>
</strong></td>
                                            <td align="right"><a href="?cmd=productaddons&action=addaddon" class="editbtn"><?php echo $this->_tpl_vars['lang']['createnewaddon']; ?>
</a> </td>
                                        </tr>
                                    </table>
                                </div>
                                <form id="serializeit" method="post">

                                    <table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">

                                        <tr>
                                            <th width="14">&nbsp;</th>
                                            <th  width="31%"><?php echo $this->_tpl_vars['lang']['Name']; ?>
</th>
                                            <th  width="60%"><?php echo $this->_tpl_vars['lang']['Description']; ?>
</th>
                                            <th width="20">&nbsp;</th>
                                            <th width="30">&nbsp;</th>
                                            <th width="10">&nbsp;</th>
                                        </tr>
                                    </table>
                                    <ul id="grab-sorter" >
                                        <?php $_from = $this->_tpl_vars['addons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['protd'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['protd']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['cat_id'] => $this->_tpl_vars['a']):
        $this->_foreach['protd']['iteration']++;
?>
                                        <li <?php if ($this->_tpl_vars['a']['visible'] == '0'): ?>class="ishidden"<?php endif; ?>><div><table width="100%" cellspacing="0" cellpadding="3" border="0" class="table glike">
                                                    <tr  class="havecontrols">
                                                        <td  width="14" valign="middle"><div class="controls"><a class="sorter-handle">sort</a></div>&nbsp;</td>
                                                        <td width="31%"><input type="hidden" name="sorts[]" value="<?php echo $this->_tpl_vars['a']['id']; ?>
" /><?php if ($this->_tpl_vars['a']['visible'] == '0'): ?><em class="ishidden"><?php endif; ?><a href="?cmd=productaddons&action=addon&id=<?php echo $this->_tpl_vars['a']['id']; ?>
"><?php echo $this->_tpl_vars['a']['name']; ?>
</a><?php if ($this->_tpl_vars['a']['visible'] == '0'): ?></em><?php endif; ?> <?php if ($this->_tpl_vars['a']['visible'] == '0'): ?><em class="hidden fs11"><?php echo $this->_tpl_vars['lang']['hidden']; ?>
</em><?php endif; ?></td>
                                                        <td width="60%"><?php echo $this->_tpl_vars['a']['description']; ?>
<?php if ($this->_tpl_vars['a']['modulename']): ?><div style="font-size:10px">Module: <strong><?php echo $this->_tpl_vars['a']['modulename']; ?>
</strong></div><?php endif; ?></td>
                                                        <td  width="20">
                                                            <a href="?cmd=productaddons&action=addon&id=<?php echo $this->_tpl_vars['a']['id']; ?>
" class="editbtn"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a>
                                                        </td>
                                                        <td  width="30">
                                                            <a href="?cmd=productaddons&action=duplicate&id=<?php echo $this->_tpl_vars['a']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="editbtn editgray"><?php echo $this->_tpl_vars['lang']['Duplicate']; ?>
</a>
                                                        </td>
                                                        <td  width="10">
	<?php if ($this->_tpl_vars['a']['system'] != '1'): ?><a href="?cmd=productaddons&make=deleteaddon&id=<?php echo $this->_tpl_vars['a']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" onclick="return confirm('<?php echo $this->_tpl_vars['lang']['deleteaddonconfirm']; ?>
');" class="delbtn">Delete</a><?php endif; ?>
                                                        </td>
                                                    </tr>
                                                </table></div></li>
                                        <?php endforeach; endif; unset($_from); ?>
                                    </ul>
                                    <table class="table glike" cellpadding="3" cellspacing="0" width="100%">
                                        <tr >
                                            <th width="10">&nbsp;</th>
                                            <th  ><a href="?cmd=productaddons&action=addaddon" class="editbtn" ><?php echo $this->_tpl_vars['lang']['createnewaddon']; ?>
</a></th>
                                        </tr>
                                    </table>



                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form><script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jquery.dragsort-0.3.10.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                                <script type="text/javascript"><?php echo '
                                    $("#grab-sorter").dragsort({ dragSelector: "a.sorter-handle",  dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'><div></div></li>" });
		
                                    function saveOrder() {
                                        var sorts = $(\'#serializeit\').serialize();
                                        ajax_update(\'?cmd=productaddons&action=listprods&\'+sorts,{});
                                    };


                                    '; ?>

                                </script>
                                <?php else: ?>
                                <div class="blank_state blank_news">
                                    <div class="blank_info">
                                        <h1><?php echo $this->_tpl_vars['lang']['blank_kb']; ?>
</h1>
				<?php echo $this->_tpl_vars['lang']['blank_kb_desc']; ?>

                                        <div class="clear"></div>

                                        <a class="new_add new_menu" href="?cmd=productaddons&action=addaddon" style="margin-top:10px">
                                            <span><?php echo $this->_tpl_vars['lang']['createnewaddon']; ?>
</span></a>
                                        <div class="clear"></div>

                                    </div>
                                </div>
                                <?php endif; ?>
                                <?php endif; ?>
                                <?php if ($this->_tpl_vars['action'] == 'addon' || $this->_tpl_vars['action'] == 'addaddon'): ?>
                    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/tiny_mce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/tinymce/jquery.tinymce.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                    <script type="text/javascript">
                        <?php echo '
				
                        function loadMod(el) {
   
                            $(\'#subloader\').html(\'<center><img src="ajax-loading.gif" /></center>\');
                            ajax_update(\'index.php?cmd=productaddons&action=showparentmod&addon_id='; ?>
<?php echo $this->_tpl_vars['addon']['id']; ?>
<?php echo '&parentid=\'+$(el).val(),{},\'#loadable\');

                        }

                        function changeFunction(el) {
                            $(\'.mdesc\').hide().eq(el.selectedIndex).ShowNicely();
                            $(\'#subloader\').html(\'<center><img src="ajax-loading.gif" /></center>\');
                            ajax_update(\'index.php?cmd=productaddons&action=showparentmod&addon_id='; ?>
<?php echo $this->_tpl_vars['addon']['id']; ?>
<?php echo '&id=\'+$(el).val(),{},\'#loadable\');return false;
                        }
                        function switch_t3(el,id) {
                            $(\'#automateoptions .billopt\').removeClass(\'checked\');
                            $(el).addClass(\'checked\');
                            if(id=="on1")
                                $(el).removeClass(\'bfirst\');
                            $(\'input[name=autosetup]\').removeAttr(\'checked\');
                            $(\'input#\'+id).attr(\'checked\',\'checked\');
                            $(\'#off1_a\').hide();
                            $(\'#on1_a\').hide();
                            $(el).parents(\'tbody.sectioncontent\').find(\'.savesection\').show();
                            $(\'#\'+id+\'_a\').show();
                            return false;
                        }
                        function check_i(element) {
                            var td = $(element).parent();
                            if ($(element).is(\':checked\'))
                                $(td).find(\'.config_val\').removeAttr(\'disabled\');
                            else
                                $(td).find(\'.config_val\').attr(\'disabled\',\'disabled\');
                        }
                        function bindMe() {
                            $(\'#newshelfnav\').TabbedMenu({elem:\'.sectioncontent\',picker:\'.list-1 li\',aclass:\'active\''; ?>
<?php if ($this->_tpl_vars['picked_tab']): ?>,picked:<?php echo $this->_tpl_vars['picked_tab']; ?>
<?php endif; ?><?php echo '});
                            $(\'#newshelfnav\').TabbedMenu({elem:\'.subm1\',picker:\'.list-1 li\''; ?>
<?php if ($this->_tpl_vars['picked_tab']): ?>,picked:<?php echo $this->_tpl_vars['picked_tab']; ?>
<?php endif; ?><?php echo '});
                            $(\'#newsetup1\').click(function(){
                                $(this).hide();
                                $(\'#newsetup\').show();
                                return false;
                            });
                            $(\'#Regular_b .controls .editbtn\').click(function(){
                                    var e=$(this).parent().parent().parent();
                                    e.find(\'.e1\').hide();
                                    e.find(\'.e2\').show();
                                    return false;
                            });
                        $(\'#Regular_b .controls .delbtn\').click(function(){
                        var e=$(this).parent().parent().parent();
                                e.find(\'.e2\').hide();
                                e.find(\'.e1\').show();
                                e.find(\'input\').val(\'0.00\');
                                e.hide();
                                var id = e.attr(\'id\').substr(0,1);
                                if($(\'#tbpricing select option:visible\').length<1) {
                                        $(\'#addpricing\').show();
                                }
                                 $(\'#tbpricing select option[value=\'+id+\']\').show();

                                return false;
                        });
                        }
                        function add_message(gr,id,msg) {
                            var sel=$(\'#\'+gr+\'_msg select\');
                            sel.find(\'option:selected\').removeAttr(\'selected\');
                            sel.prepend(\'<option value="\'+id+\'">\'+msg+\'</option>\').find(\'option\').eq(0).attr(\'selected\',\'selected\');
                            return false;

                        }
                        appendLoader(\'bindMe\');
                        function addopt() {
                            var e=$(\'#\'+$(\'#tbpricing select\').val()+\'pricing\');
                            e.find(\'.inp\').eq(0).val($(\'#newprice\').val());
                            e.find(\'.inp\').eq(1).val($(\'#newsetup\').val());
                            e.find(\'.pricer_setup\').html($(\'#newsetup\').val());
                            if($(\'#newsetup\').val()!=\'0.00\')
                                e.find(\'.pricer_setup\').parent().parent().show();
                            e.find(\'.pricer\').html($(\'#newprice\').val());
                            e.show();
                            $(\'#tbpricing select option:selected\').hide();
                            if($(\'#tbpricing select option:visible\').length<1) {
				 	
                            } else {
                                $(\'#tbpricing select option:visible\').eq(0).attr(\'selected\',\'selected\');
                                $(\'#addpricing\').show();
                            }
                            $(\'#tbpricing\').hide();
                            $(\'#newprice\').val(\'0.00\');
                            $(\'#newsetup\').val(\'0.00\').hide();$(\'#newsetup1\').show();
				
                            return false;
                        }
                       function switch_t2(el,id) {
                                $(\'#priceoptions .billopt\').removeClass(\'checked\');
                                $(el).addClass(\'checked\');

                                $(\'input[name=paytype]\').removeAttr(\'checked\').prop(\'checked\', false);
                                $(\'input#\'+id).attr(\'checked\',\'checked\').prop(\'checked\', true);
                                    if(id==\'recurx\')
                                            $(\'input#recur\').attr(\'checked\',\'checked\').prop(\'checked\', true);

                                $(\'.boption\').hide();
                                $(\'#recurx_b\').hide();
                                $(\'#\'+id+\'_b\').show();
                                $(\'#hidepricingadd\').click();
                                return false;
                        }
                        '; ?>

                    </script>
                    <?php endif; ?>