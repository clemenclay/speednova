<?php /* Smarty version 2.6.26, created on 2018-06-18 16:21:21
         compiled from ajax.configuration.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'ajax.configuration.tpl', 67, false),array('modifier', 'escape', 'ajax.configuration.tpl', 340, false),array('modifier', 'ucfirst', 'ajax.configuration.tpl', 362, false),array('modifier', 'dateformat', 'ajax.configuration.tpl', 392, false),array('modifier', 'default', 'ajax.configuration.tpl', 741, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'pricepreview'): ?><span><b><?php echo $this->_tpl_vars['testprice']; ?>
</b></span>
<?php elseif ($this->_tpl_vars['action'] == 'gettask'): ?><?php if ($this->_tpl_vars['task']): ?>
<h2 style="margin-bottom:5px"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['task']['taskname']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['taskname']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['task']['taskname']; ?>
<?php endif; ?></h2>
<?php $this->assign('name', '_desc'); ?>
<?php $this->assign('name2', $this->_tpl_vars['task']['task']); ?>
<?php $this->assign('baz', ($this->_tpl_vars['name2']).($this->_tpl_vars['name'])); ?>
<?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>

<form method="post" action=""><input type="hidden" name="make" value="updatetask" />
    <input type="hidden" name="task" value="<?php echo $this->_tpl_vars['task']['task']; ?>
" />
    <table border="0" width="100%">
        <tr>
            <td style="padding:6px" width=180>
                <strong><?php echo $this->_tpl_vars['lang']['calledevery']; ?>
</strong>:
            </td>		
            <td style="padding:6px;">		
		<?php if ($this->_tpl_vars['task']['task'] == 'sendCronResults'): ?><?php echo $this->_tpl_vars['lang']['evd']; ?>
<input type="hidden" name="run_every" value="Time" /><?php else: ?>
                <input type="hidden" name="run_every" value="<?php echo $this->_tpl_vars['task']['run_every']; ?>
" />
                <b><?php if ($this->_tpl_vars['task']['run_every'] == 'Run'): ?><?php echo $this->_tpl_vars['lang']['croncall']; ?>

                <?php elseif ($this->_tpl_vars['task']['run_every'] == 'Hour'): ?><?php echo $this->_tpl_vars['lang']['evh']; ?>

                <?php elseif ($this->_tpl_vars['task']['run_every'] == 'Time'): ?><?php echo $this->_tpl_vars['lang']['evd']; ?>

                <?php elseif ($this->_tpl_vars['task']['run_every'] == 'Week'): ?><?php echo $this->_tpl_vars['lang']['evw']; ?>

                <?php elseif ($this->_tpl_vars['task']['run_every'] == 'Month'): ?><?php echo $this->_tpl_vars['lang']['evm']; ?>
<?php endif; ?></b>

                <?php endif; ?>
            </td>
            <td id="e_evd1" <?php if ($this->_tpl_vars['task']['run_every'] != 'Time'): ?>style="display:none"<?php endif; ?> class="e_evd" style="padding:6px"><input size="2"  name="run_every_time_hrs" class="inp" value="<?php echo $this->_tpl_vars['task']['run_every_time_hrs']; ?>
"/> : <input size="2" name="run_every_time_min" class="inp" value="<?php echo $this->_tpl_vars['task']['run_every_time_min']; ?>
"/> </td>
            <td id="e_evd2"  <?php if ($this->_tpl_vars['task']['run_every'] != 'Week'): ?>style="display:none"<?php endif; ?> class="e_evd" style="padding:6px">
                <select name="run_every_time_week" class="inp">
                    <option value="2" <?php if ($this->_tpl_vars['task']['run_every_time'] == 2): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['monday']; ?>
</option>
                    <option value="3" <?php if ($this->_tpl_vars['task']['run_every_time'] == 3): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['tuesday']; ?>
</option>
                    <option value="4" <?php if ($this->_tpl_vars['task']['run_every_time'] == 4): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['wednesday']; ?>
</option>
                    <option value="5" <?php if ($this->_tpl_vars['task']['run_every_time'] == 5): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['thursday']; ?>
</option>
                    <option value="6" <?php if ($this->_tpl_vars['task']['run_every_time'] == 6): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['friday']; ?>
</option>
                    <option value="7" <?php if ($this->_tpl_vars['task']['run_every_time'] == 7): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['saturday']; ?>
</option>
                    <option value="1" <?php if ($this->_tpl_vars['task']['run_every_time'] == 1): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['sunday']; ?>
</option>			
                </select>
            </td>
            <td id="e_evd3" <?php if ($this->_tpl_vars['task']['run_every'] != 'Month'): ?>style="display:none"<?php endif; ?>  class="e_evd" style="padding:6px">
                <select name="run_every_time_month" class="inp">
			<?php unset($this->_sections['foo']);
$this->_sections['foo']['name'] = 'foo';
$this->_sections['foo']['loop'] = is_array($_loop=31) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['foo']['show'] = true;
$this->_sections['foo']['max'] = $this->_sections['foo']['loop'];
$this->_sections['foo']['step'] = 1;
$this->_sections['foo']['start'] = $this->_sections['foo']['step'] > 0 ? 0 : $this->_sections['foo']['loop']-1;
if ($this->_sections['foo']['show']) {
    $this->_sections['foo']['total'] = $this->_sections['foo']['loop'];
    if ($this->_sections['foo']['total'] == 0)
        $this->_sections['foo']['show'] = false;
} else
    $this->_sections['foo']['total'] = 0;
if ($this->_sections['foo']['show']):

            for ($this->_sections['foo']['index'] = $this->_sections['foo']['start'], $this->_sections['foo']['iteration'] = 1;
                 $this->_sections['foo']['iteration'] <= $this->_sections['foo']['total'];
                 $this->_sections['foo']['index'] += $this->_sections['foo']['step'], $this->_sections['foo']['iteration']++):
$this->_sections['foo']['rownum'] = $this->_sections['foo']['iteration'];
$this->_sections['foo']['index_prev'] = $this->_sections['foo']['index'] - $this->_sections['foo']['step'];
$this->_sections['foo']['index_next'] = $this->_sections['foo']['index'] + $this->_sections['foo']['step'];
$this->_sections['foo']['first']      = ($this->_sections['foo']['iteration'] == 1);
$this->_sections['foo']['last']       = ($this->_sections['foo']['iteration'] == $this->_sections['foo']['total']);
?>
                    <option <?php if ($this->_sections['foo']['iteration'] == $this->_tpl_vars['task']['run_every_time']): ?>selected="selected"<?php endif; ?>><?php echo $this->_sections['foo']['iteration']; ?>
</option>	
                    <?php endfor; endif; ?>	
                </select>
            </td>
    </tr>
        <tr>
            <td style="padding:6px">
                <strong>Profile</strong>:
            </td>
            <td style="padding:6px" colspan="4">
                <select name="profile_id" class="form-control" >
                    <?php $_from = $this->_tpl_vars['profiles']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cls']):
?>
                        <option value="<?php echo $this->_tpl_vars['cls']['id']; ?>
" <?php if ($this->_tpl_vars['cls']['id'] == $this->_tpl_vars['task']['profile_id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['cls']['name']; ?>
</option>
                    <?php endforeach; endif; unset($_from); ?>
                </select>
            </td>

        </tr>
        <tr>

            <td style="padding:6px" colspan="5">

             <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" style="font-weight:bold" class="btn btn-primary" />
            </td>

        </tr>
    </table><?php echo smarty_function_securitytoken(array(), $this);?>
</form><script type="text/javascript"><?php echo '
        function shia1(el) {
		
            var cls=$(el).find(\'option:selected\').attr(\'class\');
            $(\'.e_evd\').hide();
            $(\'#e_evd\'+cls).show();
			
			
		
        }
        '; ?>

</script>
<?php endif; ?>

<?php elseif ($this->_tpl_vars['action'] == 'test_connection'): ?>
<?php if ($this->_tpl_vars['result']): ?>

<span style="font-weight: bold; color: <?php if ($this->_tpl_vars['result']['result'] == 'Success'): ?>#009900<?php else: ?>#990000<?php endif; ?>">
    <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['result']['result_text']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['result']['result_text']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['result']['result_text']; ?>
<?php endif; ?><?php if ($this->_tpl_vars['result']['error']): ?>: <?php echo $this->_tpl_vars['result']['error']; ?>
<?php endif; ?>
</span>

<?php endif; ?>

<?php elseif ($this->_tpl_vars['action'] == 'currency'): ?>

<?php if ($this->_tpl_vars['curr']): ?> 
<td colspan="7"  style="border:solid 2px #d6d6d6;border-top:0px;padding:5px;">
    <form action="" method="post">
        <input type="hidden" value="update" name="make" />
        <input type="hidden" value="<?php echo $this->_tpl_vars['curr']['id']; ?>
" name="id" />
        <table border="0" cellpadding="3" cellspacing="0" width="100%">
            <tr>
                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['currcode']; ?>
</td>
                <td style="border:none;"><input size="4" name="code"  value="<?php echo $this->_tpl_vars['curr']['code']; ?>
"/></td>

                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['currsign']; ?>
</td>
                <td style="border:none;"><input size="4" name="sign"  value="<?php echo $this->_tpl_vars['curr']['sign']; ?>
"/></td>

                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['currrate']; ?>
</td>
                <td style="border:none;"><input size="4" name="rate"   value="<?php echo $this->_tpl_vars['curr']['rate']; ?>
"/></td>				
            </tr>
            <tr>
                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['curriso']; ?>
</td>
                <td style="border:none;"><input size="4" name="iso"  value="<?php echo $this->_tpl_vars['curr']['iso']; ?>
"/></td>	

                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['currupdate']; ?>
</td>
                <td style="border:none;"><input type="checkbox" name="update" value="1" <?php if ($this->_tpl_vars['curr']['update'] == '1'): ?>checked="checked"<?php endif; ?>/></td>

                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['currdisplay']; ?>
</td>
                <td style="border:none;"><input type="checkbox" name="enable" value="1" <?php if ($this->_tpl_vars['curr']['enable'] == '1'): ?>checked="checked"<?php endif; ?>/></td>		
            </tr>
            <tr>
                <td width="130" style="border:none;"><?php echo $this->_tpl_vars['lang']['CurrencyFormat']; ?>
</td>
                <td style="border:none;">
                    <select  name="format" >
                        <option <?php if ($this->_tpl_vars['curr']['format'] == '1,234.56'): ?>selected="selected"<?php endif; ?>>1,234.56</option>
                        <option <?php if ($this->_tpl_vars['curr']['format'] == '1.234,56'): ?>selected="selected"<?php endif; ?>>1.234,56</option>
                        <option <?php if ($this->_tpl_vars['curr']['format'] == '1 234.56'): ?>selected="selected"<?php endif; ?> value="1 234.56">1 234.56</option>
                        <option <?php if ($this->_tpl_vars['curr']['format'] == '1 234,56'): ?>selected="selected"<?php endif; ?> value="1 234,56">1 234,56</option>
                    </select>
                </td>	
                
                <td width="130" style="border:none;">Display Decimal Places</td>
                <td style="border:none;" colspan="3">
                    <input size="4" name="decimal" value="<?php echo $this->_tpl_vars['curr']['decimal']; ?>
"/>
                </td>		
            </tr>
            <tr>
                <td colspan="6" style="border:none;"><center><input type="submit" style="font-weight:bold" value="<?php echo $this->_tpl_vars['lang']['submit']; ?>
"/></center></td>				
            </tr>
        </table>
    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
</td>
<?php endif; ?>

<?php elseif ($this->_tpl_vars['action'] == 'ticketrelated'): ?>



<div class="blu">
    <form name="" action="?cmd=configuration&action=ticketrelated" method="post">
        <input name="make" type="hidden" value="save_configuration"/>
        <?php $_from = $this->_tpl_vars['configuration']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
        <?php $this->assign('name', $this->_tpl_vars['k']); ?>
        <?php $this->assign('descr', '_descr'); ?>
        <?php $this->assign('baz', ($this->_tpl_vars['name']).($this->_tpl_vars['descr'])); ?>

        <?php if ($this->_tpl_vars['v'] == 'on' || $this->_tpl_vars['v'] == 'off'): ?>

        <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
 :<strong>On: </strong>
        <input type="radio" name="<?php echo $this->_tpl_vars['k']; ?>
" value="on" <?php if ($this->_tpl_vars['v'] == 'on'): ?>checked="checked"<?php endif; ?> />
               <strong>Off: </strong>
        <input type="radio" name="<?php echo $this->_tpl_vars['k']; ?>
" value="off" <?php if ($this->_tpl_vars['v'] == 'off'): ?>checked="checked"<?php endif; ?>/>
               <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
 <br />
        <?php else: ?>

        <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['k']]; ?>
 :
        <input name="<?php echo $this->_tpl_vars['k']; ?>
" value="<?php echo $this->_tpl_vars['v']; ?>
"/>
        <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<br />
        <?php endif; ?>

        <?php endforeach; endif; unset($_from); ?>
        <input type="submit" value="submit" />
    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
</div>

<?php elseif ($this->_tpl_vars['action'] == 'cron'): ?>

 <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'configuration/cron.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php elseif ($this->_tpl_vars['action'] == 'cronprofiles'): ?>

    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'configuration/cronprofiles.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php elseif ($this->_tpl_vars['action'] == 'default'): ?>
<form name="" action="" method="post"  id="saveconfigform">
    <input name="cmd" type="hidden" value="configuration"/>
    <input name="postform" type="hidden" value="save_configuration"/>
    <div class="newhorizontalnav"  id="newshelfnav">
        <div class="list-1">
            <ul>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['generalconfig']; ?>
</a></li>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['Ordering']; ?>
</a></li>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['Support']; ?>
</a></li>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['Billing']; ?>
</a></li>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['Mail']; ?>
</a></li>
                <li class="list-1elem"><a href="#"><?php echo $this->_tpl_vars['lang']['CurrencyName']; ?>
 &amp; <?php echo $this->_tpl_vars['lang']['taxconfiguration']; ?>
</a></li>
                <li class="list-1elem last"><a href="#"><?php echo $this->_tpl_vars['lang']['Other']; ?>
</a></li>
            </ul>
        </div>

        <div class="list-2">
            <div class="subm1"></div>
            <div class="subm1 haveitems" style="display:none">
                <ul >
                    <li class="picked"><a href="#"><span><?php echo $this->_tpl_vars['lang']['General']; ?>
</span></a></li>
                    <li class=""><a href="?cmd=configuration&action=orderscenarios"><span><?php echo $this->_tpl_vars['lang']['orderscenarios']; ?>
</span></a></li>
                </ul>
            </div>
            <div class="subm1 haveitems" style="display:none">
                <ul >
                    <li class="picked"><a href="#"><span><?php echo $this->_tpl_vars['lang']['General']; ?>
</span></a></li>
                    <li class=""><a href="?cmd=configuration&action=ticketstatuses"><span><?php echo $this->_tpl_vars['lang']['ticketstatuses']; ?>
</span></a></li>
                </ul></div>
            <div class="subm1 haveitems" style="display:none">
                <ul >
                    <li>
                        <a  href="?action=download&invoice=preview" onclick="return invoicePreview(this)"><span><b><?php echo $this->_tpl_vars['lang']['previewinvoice']; ?>
</b></span></a>
                        <script type="text/javascript">
                            <?php echo '
                            function invoicePreview(l) {
                                ajax_update(\'?cmd=configuration\',$(\'#saveconfigform\').serializeObject(),function(){
                                    window.location=$(l).attr(\'href\');
                                });
                                return false;
                            }
                            '; ?>

                        </script>
                    </li>
                    <li class="list-2elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['invmethod']; ?>
</span></a></li>
                    <li class=""><a href="?cmd=configuration&action=invoicetemplates"><span><?php echo $this->_tpl_vars['lang']['invcustomize']; ?>
</span></a></li>
                    <li class=""><a href="?cmd=configuration&action=estimatetemplates"><span>Estimate customization</span></a></li>
                    <li class="list-2elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['creditcards']; ?>
</span></a></li>
                    <li class="list-2elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['ACHecheck']; ?>
</span></a></li>
                    <li class="list-2elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['clbalance']; ?>
</span></a></li>
                    <li class="list-2elem"><a href="#"><span>Credit notes</span></a></li>
                </ul>
            </div>
            <div class="subm1 haveitems" style="display:none">
                    <ul > <li class="list-4elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['mailmethod']; ?>
</span></a></li>
                    <li class="list-4elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['mailcustomize']; ?>
</span></a></li>  </ul>
            </div>
            <div class="subm1 haveitems" style="display:none">
                <ul >
                    <li class="list-3elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['maincurrency']; ?>
</span></a></li>
                    <li class="list-3elem"><a href="#"><span><?php echo $this->_tpl_vars['lang']['addcurrencies']; ?>
</span></a></li>
                    <li><a href="?cmd=taxconfig"><span><?php echo $this->_tpl_vars['lang']['taxes']; ?>
</span></a></li>
                    <li><a href="?cmd=currencytocountry"><span>Currency to country</span></a></li>
                </ul>
            </div>
            <div class="subm1 haveitems" style="display:none">
                <ul >
                    <li class="list-7elem"><a href="#"><span>Client Permissions</span></a></li>
                    <li class="list-7elem"><a href="#"><span>Security & Display</span></a></li>
                </ul>
            </div>
        </div>
    </div>




    <div class="nicerblu">

        <div id="newtab">


            <div class="sectioncontent">

                <script type="text/javascript"><?php echo '
                    function c_reload(sel) {
                        switch($(sel).val()) {
                            case \'-1\': $(\'#currency_edit\').show(); break;
                            case \'USD\': 
                                $(\'#ISOCurrency\').val(\'USD\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'USD\'); 
                                $(\'#CurrencySign\').val(\'$\'); break;
                                break;
                            case \'GBP\': 
                                $(\'#ISOCurrency\').val(\'GBP\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'GBP\'); 
                                $(\'#CurrencySign\').val(\'£\'); break;
                            case \'EUR\': 
                                $(\'#ISOCurrency\').val(\'EUR\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'EUR\'); 
                                $(\'#CurrencySign\').val(\'€\');
                                break;
                            case \'BRL\': 
                                $(\'#ISOCurrency\').val(\'BRL\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'\'); 
                                $(\'#CurrencySign\').val(\'R$ \');
                                break;
                            case \'INR\': 
                                $(\'#ISOCurrency\').val(\'INR\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'INR\'); 
                                $(\'#CurrencySign\').val(\'\');
                                break;
                            case \'CAD\': 
                                $(\'#ISOCurrency\').val(\'CAD\');
                                $(\'#CurrencyFormat\').val(\'1,234.56\'); 
                                $(\'#CurrencyCode\').val(\'CAD\'); 
                                $(\'#CurrencySign\').val(\'$\'); 
                                break;
                            case \'ZAR\': 
                                $(\'#ISOCurrency\').val(\'ZAR\');
                                $(\'#CurrencyFormat\').val(\'1 234.56\');
                                $(\'#CurrencyCode\').val(\'ZAR\'); 
                                $(\'#CurrencySign\').val(\'R\'); 
                                break;
                        }
                        return false;
                    }
                    function checkdefault(el) {
                        if($(el).val()==\'default\') {
                            alert("Please note: Default clientarea is DEPRECATED and left only for backwards compatibility");
                        }
                    }
                    function shx() {
                        $(\'.cart_d\').hide().eq($(\'#template\').eq(0).prop("selectedIndex")).show();
                    }/*		
$(document).ready(function(){
$(\'a.colorbox\').colorbox({width:"80%", height:"80%", iframe:true,opacity:0.5});
});*/
		
                    '; ?>

                    </script>
                    <table border="0" cellpadding="10" width="100%" cellspacing="0">
                        <tr class="bordme">
                            <td width="205" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['MaintenanceMode']; ?>
</strong>
                            </td>
                            <td>
                                <input name="MaintenanceMode" type="checkbox" value="on" <?php if ($this->_tpl_vars['configuration']['MaintenanceMode'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> 
                                <?php echo $this->_tpl_vars['lang']['MaintenanceMode_descr']; ?>

                            </td>
                        </tr>
                        <tr class="bordme">
                            <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['BusinessName']; ?>
</strong></td>
                            <td><input style="width:50%" name="BusinessName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['configuration']['BusinessName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
"  class="inp"/></td>
                        </tr>
                        <tr  class="bordme">
                            <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['UserTemplate']; ?>
</strong></td>
                            <td>
                                <select style="width:40%" name="UserTemplate"  class="inp" onchange="shx();checkdefault(this);"  id="template">
                                    <?php $_from = $this->_tpl_vars['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['t']):
?>
                                        <option <?php if ($this->_tpl_vars['configuration']['UserTemplate'] == $this->_tpl_vars['t']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['t']; ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                </select>
                                <?php $_from = $this->_tpl_vars['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['t']):
?>
                                    <span <?php if ($this->_tpl_vars['configuration']['UserTemplate'] != $this->_tpl_vars['t']): ?>style="display:none"<?php endif; ?> class="cart_d"> 
                                        <a href="<?php echo $this->_tpl_vars['system_url']; ?>
?systemtemplate=<?php echo $this->_tpl_vars['t']; ?>
" target="_blank" class="colorbox editbtn" title="<?php echo $this->_tpl_vars['t']; ?>
 template"><?php echo $this->_tpl_vars['lang']['clicktopreview']; ?>
</a>
                                    </span>
                                <?php endforeach; endif; unset($_from); ?>
                            </td>
                        </tr>
                        <tr  class="bordme">
                            <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['UserLanguage']; ?>
</strong></td>
                            <td>
                                <select style="width:40%" name="UserLanguage"  class="inp">
                                    <?php $_from = $this->_tpl_vars['user_languages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['t']):
?>
                                        <option <?php if ($this->_tpl_vars['configuration']['UserLanguage'] == $this->_tpl_vars['t']): ?>selected="selected"<?php endif; ?> value="<?php echo $this->_tpl_vars['t']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['t'])) ? $this->_run_mod_handler('ucfirst', true, $_tmp) : ucfirst($_tmp)); ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                </select>
                                <span><a href="?cmd=langedit" class="colorbox editbtn" title="<?php echo $this->_tpl_vars['lang']['languages']; ?>
"><?php echo $this->_tpl_vars['lang']['languages']; ?>
</a></span>
                            </td>
                        </tr>

                        <tr  class="bordme">
                            <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['UserCountry']; ?>
</strong></td>
                            <td>
                                <select style="width:50%" name="UserCountry" class="inp">
                                    <?php $_from = $this->_tpl_vars['countries']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                        <option value="<?php echo $this->_tpl_vars['k']; ?>
" <?php if ($this->_tpl_vars['k'] == $this->_tpl_vars['configuration']['UserCountry']): ?> selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['v']; ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                </select>
                            </td>
                        </tr>

                        <tr  class="bordme">
                            <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['DefaultTimezone']; ?>
</strong></td>
                            <td>
                                <select style="width:50%" name="DefaultTimezone" class="inp">
                                   <?php $_from = $this->_tpl_vars['timezones']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['code'] => $this->_tpl_vars['zone']):
?>
                                        <option value="<?php echo $this->_tpl_vars['code']; ?>
" <?php if ($this->_tpl_vars['code'] == $this->_tpl_vars['configuration']['DefaultTimezone']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['zone']; ?>
</option>
                                   <?php endforeach; endif; unset($_from); ?>
                                </select>
                            </td>
                        </tr>
                        <tr class="bordme">
                            <td align="right"><strong><?php echo $this->_tpl_vars['lang']['DateFormat']; ?>
</strong></td><td><select style="width:50%" name="DateFormat" class="inp">
                                    <option value="YYYY-MM-DD" <?php if ($this->_tpl_vars['configuration']['DateFormat'] == 'YYYY-MM-DD'): ?>selected="selected"<?php endif; ?>>YYYY-MM-DD (<?php echo ((is_array($_tmp='')) ? $this->_run_mod_handler('dateformat', true, $_tmp, 'Y-m-d') : smarty_modifier_dateformat($_tmp, 'Y-m-d')); ?>
)</option>
                                    <option value="YYYY.MM.DD" <?php if ($this->_tpl_vars['configuration']['DateFormat'] == 'YYYY.MM.DD'): ?>selected="selected"<?php endif; ?>>YYYY.MM.DD (<?php echo ((is_array($_tmp='')) ? $this->_run_mod_handler('dateformat', true, $_tmp, 'Y.m.d') : smarty_modifier_dateformat($_tmp, 'Y.m.d')); ?>
)</option>
                                    <option value="MM/DD/YYYY" <?php if ($this->_tpl_vars['configuration']['DateFormat'] == 'MM/DD/YYYY'): ?>selected="selected"<?php endif; ?>>MM/DD/YYYY (<?php echo ((is_array($_tmp='')) ? $this->_run_mod_handler('dateformat', true, $_tmp, 'm/d/Y') : smarty_modifier_dateformat($_tmp, 'm/d/Y')); ?>
)</option>
                                    <option value="DD/MM/YYYY" <?php if ($this->_tpl_vars['configuration']['DateFormat'] == 'DD/MM/YYYY'): ?>selected="selected"<?php endif; ?>>DD/MM/YYYY (<?php echo ((is_array($_tmp='')) ? $this->_run_mod_handler('dateformat', true, $_tmp, 'd/m/Y') : smarty_modifier_dateformat($_tmp, 'd/m/Y')); ?>
)</option>
                                    <option value="DD.MM.YYYY" <?php if ($this->_tpl_vars['configuration']['DateFormat'] == 'DD.MM.YYYY'): ?>selected="selected"<?php endif; ?>>DD.MM.YYYY (<?php echo ((is_array($_tmp='')) ? $this->_run_mod_handler('dateformat', true, $_tmp, 'd.m.Y') : smarty_modifier_dateformat($_tmp, 'd.m.Y')); ?>
)</option>
                                </select>
                            </td>
                        </tr>

                        <tr class="bordme">
                            <td align="right"><strong>Logging Level</strong></td><td><select style="width:50%" name="LoggerLevel" class="inp">
                                    <option value="100" <?php if ($this->_tpl_vars['configuration']['LoggerLevel'] == '100'): ?>selected="selected"<?php endif; ?>>DEBUG</option>
                                    <option value="200" <?php if ($this->_tpl_vars['configuration']['LoggerLevel'] == '200'): ?>selected="selected"<?php endif; ?>>INFO</option>
                                    <option value="250" <?php if ($this->_tpl_vars['configuration']['LoggerLevel'] == '250'): ?>selected="selected"<?php endif; ?>>NOTICE</option>
                                    <option value="300" <?php if ($this->_tpl_vars['configuration']['LoggerLevel'] == '300'): ?>selected="selected"<?php endif; ?>>WARNING</option>
                                    <option value="400" <?php if ($this->_tpl_vars['configuration']['LoggerLevel'] == '400'): ?>selected="selected"<?php endif; ?>>ERROR</option>

                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            <div class="sectioncontent" style="display:none">

                <table border="0" cellpadding="10" width="100%" cellspacing="0">
                    <tr class="bordme"><td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['ApplyTermsURL']; ?>
</strong></td><td><input type="checkbox" value="1" <?php if ($this->_tpl_vars['configuration']['ApplyTermsURL'] != ''): ?>checked="checked"<?php endif; ?> onclick="check_i(this)"/><input style="width:50%" name="ApplyTermsURL" value="<?php echo $this->_tpl_vars['configuration']['ApplyTermsURL']; ?>
" class="config_val inp" <?php if ($this->_tpl_vars['configuration']['ApplyTermsURL'] == ''): ?>disabled="disabled"<?php endif; ?>/></td></tr>

                    <tr >
                        <td width="205" align="right" valign="top"><strong>Multi-Item Cart</strong></td><td>
                            <input type="radio" name="ShopingCartMode" value="1" <?php if ($this->_tpl_vars['configuration']['ShopingCartMode'] == '1'): ?> checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['Enable']; ?>
</strong>, allow more than one service in cart<br />
                            <input type="radio" name="ShopingCartMode" value="0" <?php if ($this->_tpl_vars['configuration']['ShopingCartMode'] == '0'): ?> checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['Disable']; ?>
</strong>, only one service in cart<br />
                        </td>
                    </tr>

                    <tr ><td width="205" align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['AfterOrderRedirect']; ?>
</strong></td><td>

                            <input type="radio" name="AfterOrderRedirect" value="0" <?php if ($this->_tpl_vars['configuration']['AfterOrderRedirect'] == '0'): ?> checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['AfterOrderRedirect0']; ?>
<br />
                            <input type="radio" name="AfterOrderRedirect" value="1" <?php if ($this->_tpl_vars['configuration']['AfterOrderRedirect'] == '1'): ?> checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['AfterOrderRedirect1']; ?>
<br />
                            <input type="radio" name="AfterOrderRedirect" value="2" <?php if ($this->_tpl_vars['configuration']['AfterOrderRedirect'] == '2'): ?> checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['AfterOrderRedirect2']; ?>
<br />
                        </td></tr>					

                </table>
            </div>

            <div class="sectioncontent" style="display:none">
                <table border="0" cellpadding="10" width="100%" cellspacing="0">
                    <tr  class="bordme"><td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['AllowedAttachmentExt']; ?>
</strong></td><td><input style="width:50%" name="AllowedAttachmentExt" value="<?php echo $this->_tpl_vars['configuration']['AllowedAttachmentExt']; ?>
" id="extensions" class="inp"/>&nbsp;<a href="" onclick="add_extension(); return false;"><?php echo $this->_tpl_vars['lang']['addext']; ?>
</a></td></tr>
                    <tr  class="bordme">
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['MaxAttachmentSize']; ?>
</strong></td>
                        <td>
                            <input style="width:30px" name="MaxAttachmentSize" value="<?php echo $this->_tpl_vars['configuration']['MaxAttachmentSize']; ?>
" class="inp"/>&nbsp;<?php echo $this->_tpl_vars['lang']['MaxAttachmentSize_descr']; ?>

                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['CaptchaUnregTickets']; ?>
</strong></td>
                        <td>
                            <input name="CaptchaUnregTickets" type="radio" value="on_all" <?php if ($this->_tpl_vars['configuration']['CaptchaUnregTickets'] == 'on_all'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
</strong>, <?php echo $this->_tpl_vars['lang']['CaptchaAllTickets_descr']; ?>
<br />
                            <input name="CaptchaUnregTickets" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['CaptchaUnregTickets'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
</strong>, <?php echo $this->_tpl_vars['lang']['CaptchaUnregTickets_descr']; ?>
<br />
                            <input name="CaptchaUnregTickets" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['CaptchaUnregTickets'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
</strong>, <?php echo $this->_tpl_vars['lang']['CaptchaUnregTickets_descr1']; ?>

                        </td>
                    </tr>
                    
                    <tr class="bordme">
                        <td align="right"><strong>HTML in imported tickets</strong> </td>
                        <td>
                            <input name="TicketHTMLTags" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['TicketHTMLTags'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
</strong>, html tags will be displayed in ticket message <br />
                            <input name="TicketHTMLTags" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['TicketHTMLTags'] == 'off' || ! $this->_tpl_vars['configuration']['TicketHTMLTags']): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
</strong>, html tags will be removed completely from tickets
                        </td>
                    </tr>
                    <tr  class="bordme">
                        <td align="right"><strong>Import time difference</strong><a href="#" class="vtip_description" title="Set minimum number of seconds between two messages from single email address that will be accepted. Messages sent from single email with smaller time difference will be rejected. Set to low value for automated notifications. <br>Default: 5"></a></td>
                        <td>
                            <input style="width:30px" name="TicketImportTimeLimit" value="<?php echo $this->_tpl_vars['configuration']['TicketImportTimeLimit']; ?>
" class="inp"/> seconds
                        </td>
                    </tr>
                </table>
            </div>

            <!-- invoices -->


            <div class="sectioncontent" style="display:none">
                <table border="0" cellpadding="10" width="100%" cellspacing="0"  class="sectioncontenttable">

                    <tr>
                        <td colspan="4" align="center">
                            <div style="width:70%">
                                <div class="left" style="padding:5px;margin-right:5px;width:46%;border-right:solid 1px #c0c0c0;text-align:left">
                                    <input type="radio" name="InvoiceModel" value="default" checked="checked" onclick="$('.definvoices').show();$('.euinvoices').hide();" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] == 'default'): ?>checked="checked"<?php endif; ?> id="nom_invmodel"/>	<label  for="nom_invmodel" style="font-size:16px !important;font-weight:bold"><?php echo $this->_tpl_vars['lang']['def_invmethod']; ?>
</label><br />
								<?php echo $this->_tpl_vars['lang']['def_invmethod_descr']; ?>


                                </div>
                                <div  class="left" style="width:46%;padding:5px;margin-left:5px;text-align:left;">
                                    <input type="radio" name="InvoiceModel" value="eu" onclick="$('.definvoices').hide();$('.euinvoices').show();" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] == 'eu'): ?>checked="checked"<?php endif; ?> id="eu_invmodel"/>	<label for="eu_invmodel" style="font-size:16px !important;font-weight:bold"><?php echo $this->_tpl_vars['lang']['eu_invmethod']; ?>
</label><br />
								<?php echo $this->_tpl_vars['lang']['eu_invmethod_descr']; ?>

                                </div>
                                <div class="clear"></div></div>
                        </td>
                    </tr>

                    <tr class="bordme definvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] == 'eu'): ?>style="display:none"<?php endif; ?>><td align="right" ><strong><?php echo $this->_tpl_vars['lang']['InvoiceNumerationFrom']; ?>
</strong></td><td colspan="3"><input style="width:80px" name="InvoiceNumerationFrom" value="<?php echo $this->_tpl_vars['configuration']['InvoiceNumerationFrom']; ?>
" class="inp"/></td></tr>


                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>>
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoiceNumerationFrom']; ?>
</strong></td><td  width="305"><input style="width:100px" name="InvoiceNumerationPaid" value="<?php echo $this->_tpl_vars['configuration']['InvoiceNumerationPaid']; ?>
" class="inp"/></td>
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['ProFormaNumerationFrom']; ?>
</strong></td><td><input style="width:100px" name="InvoiceNumerationFrom_eu" value="<?php echo $this->_tpl_vars['configuration']['InvoiceNumerationFrom']; ?>
" class="inp"/></td>


                    </tr>

                    <tr class="bordme definvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] == 'eu'): ?>style="display:none"<?php endif; ?>>
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoicePrefix']; ?>
</strong></td><td colspan="3">
                            <select class="inp" name="InvoicePrefix_list" id="InvoicePrefix_list" onchange="if($(this).val()=='0') $('#InvoicePrefix_custom').show(); else  $('#InvoicePrefix').val($(this).val());">
                                <option value="" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == ""): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['none']; ?>
</option>
                                <option value="<?php echo '{$m}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'm'): ?>selected="selected"<?php endif; ?>>MM</option>
                                <option value="<?php echo '{$y}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'y'): ?>selected="selected"<?php endif; ?>>YYYY</option>
                                <option value="<?php echo '{$y}{$m}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'ym'): ?>selected="selected"<?php endif; ?>>YYYYMM</option>
                                <option value="0"  
                                        <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] != '' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'm' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'y' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'ym'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['other']; ?>
</option>

                            </select>
                            <a class="editbtn" href="#" onclick="$('#InvoicePrefix_custom').toggle();return false;"><?php echo $this->_tpl_vars['lang']['customize']; ?>
</a>
                            <div id="InvoicePrefix_custom" style="margin-top:10px;
                                 <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] != '' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'm' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'y' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'ym'): ?><?php else: ?>display:none<?php endif; ?>"><input style="width:100px" name="InvoicePrefix" id="InvoicePrefix"  value="<?php echo $this->_tpl_vars['configuration']['InvoicePrefix']; ?>
" class="inp"/>
                                <br /><small><?php echo $this->_tpl_vars['lang']['InvoicePrefix_desc']; ?>
</small>
                            </div>

                        </td></tr>

                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>>
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoiceNumerationFormat']; ?>
</strong></td>
                        <td width="305">

                            <select class="inp" name="InvoiceNumerationFormat_list" id="InvoiceNumerationFormat_list" onchange="if($(this).val()=='0') $('#InvoiceNumerationFormat_custom').show(); else  $('#InvoiceNumerationFormat').val($(this).val());">
                                <option value="<?php echo '{$number}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] == 'number'): ?>selected="selected"<?php endif; ?>>number</option>
                                <option value="<?php echo '{$m}/{$number}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] == "m/number"): ?>selected="selected"<?php endif; ?>>MM/number</option>
                                <option value="<?php echo '{$y}/{$number}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] == "y/number"): ?>selected="selected"<?php endif; ?>>YYYY/number</option>
                                <option value="<?php echo '{$y}/{$m}/{$number}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] == "y/m/number"): ?>selected="selected"<?php endif; ?>>YYYY/MM/number</option>
                                <option value="0"  
                                        <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'm/number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'y/number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'y/m/number'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['other']; ?>
</option>

                            </select>
                            <a class="editbtn" href="#" onclick="$('#InvoiceNumerationFormat_custom').toggle();return false;"><?php echo $this->_tpl_vars['lang']['customize']; ?>
</a>
                            <div id="InvoiceNumerationFormat_custom" style="margin-top:10px;
                                 <?php if ($this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'm/number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'y/number' && $this->_tpl_vars['configuration']['InvoiceNumerationFormatdc'] != 'y/m/number'): ?><?php else: ?>display:none<?php endif; ?>">
                                <input style="width:100px" name="InvoiceNumerationFormat" id="InvoiceNumerationFormat"  value="<?php echo $this->_tpl_vars['configuration']['InvoiceNumerationFormat']; ?>
" class="inp"/>
                                <br /><small><?php echo $this->_tpl_vars['lang']['InvoicePrefix2_desc']; ?>
</small>
                            </div>

                        </td>
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['ProFormaPrefix']; ?>
</strong></td>
                        <td >
                            <select class="inp" name="InvoicePrefix_eu_list" id="InvoicePrefix_eu_list" onchange="if($(this).val()=='0') $('#InvoicePrefix_eu_custom').show(); else  $('#InvoicePrefix_eu').val($(this).val());">
                                <option value="" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == ""): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['none']; ?>
</option>
                                <option value="<?php echo '{$m}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'm'): ?>selected="selected"<?php endif; ?>>MM</option>
                                <option value="<?php echo '{$y}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'y'): ?>selected="selected"<?php endif; ?>>YYYY</option>
                                <option value="<?php echo '{$y}{$m}'; ?>
" <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] == 'ym'): ?>selected="selected"<?php endif; ?>>YYYYMM</option>
                                <option value="0"  
                                        <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] != '' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'm' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'y' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'ym'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['other']; ?>
</option>

                            </select>
                            <a class="editbtn" href="#" onclick="$('#InvoicePrefix_eu_custom').toggle();return false;"><?php echo $this->_tpl_vars['lang']['customize']; ?>
</a>
                            <div id="InvoicePrefix_eu_custom" style="margin-top:10px;
                                 <?php if ($this->_tpl_vars['configuration']['InvoicePrefixdc'] != '' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'm' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'y' && $this->_tpl_vars['configuration']['InvoicePrefixdc'] != 'ym'): ?><?php else: ?>display:none<?php endif; ?>"><input style="width:100px" name="InvoicePrefix_eu" id="InvoicePrefix_eu"  value="<?php echo $this->_tpl_vars['configuration']['InvoicePrefix']; ?>
" class="inp"/>
                                <br /><small><?php echo $this->_tpl_vars['lang']['InvoicePrefix_desc']; ?>
</small>
                            </div>

                        </td>

                    </tr>

                    
                    <tr class="bordme">
                        <td align="right"><strong>Edit Warning</strong></td>
                        <td colspan="3">
                            <input name="InvoiceEditWarning" type="checkbox" value="1" 
                                   <?php if ($this->_tpl_vars['configuration']['InvoiceEditWarning']): ?>checked="checked"<?php endif; ?> />
                            Show confirmation dialog before submitting changes to non-draft invoices.
                        </td>
                    </tr>
                    
                    <tr class="bordme" ><td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoiceStoreClient']; ?>
</strong></td><td colspan="3">
                            <input name="InvoiceStoreClient" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['InvoiceStoreClient'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['InvoiceStoreClient_descr']; ?>
<br />
                            <input name="InvoiceStoreClient" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['InvoiceStoreClient'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/>  <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['InvoiceStoreClient1_descr']; ?>


                        </td></tr>

                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>>
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['InvoicePaidAutoReset']; ?>
</strong></td>
                        <td colspan="3">
                            <input name="InvoicePaidAutoReset" type="radio" value="0" <?php if ($this->_tpl_vars['configuration']['InvoicePaidAutoReset'] == '0'): ?>checked="checked"<?php endif; ?>  class="inp"/> 
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['InvoicePaidAutoReset_descr']; ?>
<br />
                            <input name="InvoicePaidAutoReset" type="radio" value="1" <?php if ($this->_tpl_vars['configuration']['InvoicePaidAutoReset'] == '1'): ?>checked="checked"<?php endif; ?>  class="inp"/>  
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['InvoicePaidAutoReset1_descr']; ?>
<br />
                            <input name="InvoicePaidAutoReset" type="radio" value="2" <?php if ($this->_tpl_vars['configuration']['InvoicePaidAutoReset'] == '2'): ?>checked="checked"<?php endif; ?>  class="inp"/>  
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['InvoicePaidAutoReset2_descr']; ?>


                        </td> 
                    </tr>

                    <tr class="bordme">
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['ContinueInvoices']; ?>
</strong></td>
                        <td colspan="3">
                            <input name="ContinueInvoices" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['ContinueInvoices'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['ContinueInvoices_descr']; ?>
<br />
                            <input name="ContinueInvoices" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['ContinueInvoices'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/>  
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['ContinueInvoices_descr1']; ?>

                        </td>
                    </tr>
                    
                    <tr class="bordme">
                        <td align="right"><strong>Merge Invoices</strong></td>
                        <td colspan="3">
                            <input name="GenerateSeparateInvoices" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['GenerateSeparateInvoices'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> Automaticaly merge invoices generated on the same day (cron run)<br />
                            <input name="GenerateSeparateInvoices" type="radio" value="due" <?php if ($this->_tpl_vars['configuration']['GenerateSeparateInvoices'] == 'due'): ?>checked="checked"<?php endif; ?>  class="inp"/> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> Automaticaly merge genearated invoices with the same due date<br />
                            <input name="GenerateSeparateInvoices" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['GenerateSeparateInvoices'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/>  
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> Generate separate invoice for each service
                        </td>
                    </tr>
                    
                    <tr class="bordme">
                        <td align="right"><strong>Merge Domain Renewals</strong></td>
                        <td colspan="3">
                            <input name="MergeDomainRenewals" type="checkbox" value="on" <?php if ($this->_tpl_vars['configuration']['MergeDomainRenewals'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/>
                            Issue invoice for domain renewal sooner, if customer have invoice for other services issued in renewal month<br />

                        </td>
                    </tr>

                    <tr class="bordme definvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] == 'eu'): ?>style="display:none"<?php endif; ?>>
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice']; ?>
</strong><?php if ($this->_tpl_vars['memorywarn']): ?><br/><b style="color:red"><?php echo $this->_tpl_vars['lang']['memory_limit_low']; ?>
</b><?php endif; ?></td>
                        <td colspan="3">
                            <input name="AttachPDFInvoice" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoice'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice_descr']; ?>
<br />
                            <input name="AttachPDFInvoice" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoice'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice_descr1']; ?>

                        </td>
                    </tr>
                     <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>">
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['AttachProFormaInvoice']; ?>
</strong><?php if ($this->_tpl_vars['memorywarn']): ?><br/><b style="color:red"><?php echo $this->_tpl_vars['lang']['memory_limit_low']; ?>
</b><?php endif; ?></td>
                        <td colspan="3">
                            <input name="AttachPDFInvoiceUnpaid" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoice'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice_descr3']; ?>
<br />
                            <input name="AttachPDFInvoiceUnpaid" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoice'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice_descr4']; ?>

                        </td>
                    </tr>
                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu' || $this->_tpl_vars['configuration']['InvoiceDelay'] == 'on'): ?>style="display:none"<?php endif; ?>" id="attachpaid">
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoice']; ?>
</strong><?php if ($this->_tpl_vars['memorywarn']): ?><br/><b style="color:red"><?php echo $this->_tpl_vars['lang']['memory_limit_low']; ?>
</b><?php endif; ?></td>
                        <td colspan="3">
                            <input name="AttachPDFInvoicePaid" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoicePaid'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoicePaid_descr']; ?>
<br />
                            <input name="AttachPDFInvoicePaid" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['AttachPDFInvoicePaid'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFInvoicePaid_descr1']; ?>

                        </td>
                    </tr>
                    
                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>">
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['InvoiceDelay']; ?>
</strong></td>
                        <td colspan="3">
                            <input name="InvoiceDelay" type="radio" value="off"  onclick="$('#attachpaid').fadeIn();" <?php if ($this->_tpl_vars['configuration']['InvoiceDelay'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['InvoiceDelay_descr']; ?>
<br />
                            <input name="InvoiceDelay" type="radio" value="on"  onclick="$('#attachpaid').fadeOut();" <?php if ($this->_tpl_vars['configuration']['InvoiceDelay'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['InvoiceDelay_descr1']; ?>
 <input class="inp" value="<?php echo $this->_tpl_vars['configuration']['InvoiceDelayDays']; ?>
" name="InvoiceDelayDays" size="2" > <?php echo $this->_tpl_vars['lang']['InvoiceDelay_descr2']; ?>

                        </td>
                    </tr>
                    
                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>">
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['StorePDFInvoice']; ?>
</strong><?php if ($this->_tpl_vars['memorywarn']): ?><br/><b style="color:red"><?php echo $this->_tpl_vars['lang']['memory_limit_low']; ?>
</b><?php endif; ?></td>
                        <td colspan="3">
                            <input name="StorePDFInvoice" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['StorePDFInvoice'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['StorePDFInvoice_descr']; ?>
 <input class="inp" value="<?php if ($this->_tpl_vars['configuration']['StorePDFPath']): ?><?php echo $this->_tpl_vars['configuration']['StorePDFPath']; ?>
<?php else: ?><?php echo $this->_tpl_vars['maindir']; ?>
<?php endif; ?>" name="StorePDFPath" style="width:205px"> <a class="vtip_description" title="<?php echo $this->_tpl_vars['lang']['StorePDFInvoice_descr2']; ?>
"></a><br />
                            <input name="StorePDFInvoice" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['StorePDFInvoice'] != 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['StorePDFInvoice_descr1']; ?>

                        </td>
                    </tr>
                    <tr class="bordme euinvoices" <?php if ($this->_tpl_vars['configuration']['InvoiceModel'] != 'eu'): ?>style="display:none"<?php endif; ?>">
                        <td align="right" width="205"><strong><?php echo $this->_tpl_vars['lang']['AttachPDFCopy']; ?>
</strong></td>
                        <td colspan="3">
                            <input name="AttachPDFCopy" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['AttachPDFCopy'] == 'on'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFCopy_descr']; ?>
<br />
                            <input name="AttachPDFCopy" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['AttachPDFCopy'] == 'off'): ?>checked="checked"<?php endif; ?>  class="inp"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AttachPDFCopy_descr1']; ?>

                        </td>
                    </tr>

                     <tr class="bordme" >
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['BCCInvoiceEmails']; ?>
</strong></td>
                        <td colspan="3"><input name="BCCInvoiceEmails_on" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['BCCInvoiceEmails'] == ''): ?>checked="checked"<?php endif; ?>  /> <?php echo $this->_tpl_vars['lang']['BCCInvoiceEmails1']; ?>
<br />
                            <input name="BCCInvoiceEmails_on" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['BCCInvoiceEmails'] != ''): ?>checked="checked"<?php endif; ?>  /> <?php echo $this->_tpl_vars['lang']['BCCInvoiceEmails2']; ?>
 <input class="inp" value="<?php echo $this->_tpl_vars['configuration']['BCCInvoiceEmails']; ?>
" name="BCCInvoiceEmails" style="width:160px"><br />
                        </td>
                     </tr>

                    <tr class="bordme">
                        <td align="right"><strong><?php echo $this->_tpl_vars['lang']['DontSendSubscrInvNotify']; ?>
</strong></td>
                        <td colspan="3"><input name="DontSendSubscrInvNotify" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['DontSendSubscrInvNotify'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <?php echo $this->_tpl_vars['lang']['DontSendSubscrInvNotify_descr']; ?>
<br />
                            <input name="DontSendSubscrInvNotify" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['DontSendSubscrInvNotify'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <?php echo $this->_tpl_vars['lang']['DontSendSubscrInvNotify_descr1']; ?>
<br />
                        </td>
                    </tr>
                    <tr >
                        <td align="right"><strong>Auto-cancel invoices</strong></td>
                        <td colspan="3">
                            <input name="CancelInvoicesOnExpire" type="hidden"  value="off"/>
                            <input name="CancelInvoicesOnTerminate" type="hidden"  value="off"/>
                            <input name="CancelInvoicesOnExpire" type="checkbox" value="on" <?php if ($this->_tpl_vars['configuration']['CancelInvoicesOnExpire'] == 'on'): ?>checked="checked"<?php endif; ?>  /> Cancel renew invoices when related domain expires<br />
                            <input name="CancelInvoicesOnTerminate" type="checkbox" value="on" <?php if ($this->_tpl_vars['configuration']['CancelInvoicesOnTerminate'] == 'on'): ?>checked="checked"<?php endif; ?>  /> Cancel overdue invoices when related account gets terminated<br />
                            <input name="CancelInvoicesOnDays" type="checkbox" value="on" <?php if ($this->_tpl_vars['configuration']['CancelInvoicesOnDays'] == 'on'): ?>checked="checked"<?php endif; ?>  /> Cancel overdue invoices <input type="text" name="CancelInvoicesOnDaysValue" value="<?php echo $this->_tpl_vars['configuration']['CancelInvoicesOnDaysValue']; ?>
" size=3 /> days after due date<br />
                        </td>
                    </tr>
                </table>
                

                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable" style="display:none">


                    <tr class="bordme" ><td align="right"><strong><?php echo $this->_tpl_vars['lang']['SupportedCC']; ?>
</strong></td>
                        <td colspan="3"><input class="inp" value="<?php echo $this->_tpl_vars['configuration']['SupportedCC']; ?>
" name="SupportedCC" style="width:260px" /><br/><small>Provide comma separated list of accepted Credit Cards</small>
                        </td></tr>

                    <tr class="bordme">
                        <td  align="right" valign="top"><strong>Allow Credit Card Storage</strong></td>
                        <td colspan="3">
                            <input type="radio" name="CCAllowStorage" value="on" <?php if ($this->_tpl_vars['configuration']['CCAllowStorage'] == 'on'): ?>checked="checked"<?php endif; ?> />
                            <strong>Yes</strong>, allow saving credit card for later use<br />
                                
                            <input type="radio" name="CCAllowStorage" value="token" <?php if ($this->_tpl_vars['configuration']['CCAllowStorage'] == 'token'): ?>checked="checked"<?php endif; ?> />
                            <strong>Yes</strong>, but only if credit card is <strong>tokenized</strong> by gateway<br />
                                
                            <input type="radio" name="CCAllowStorage" value="off" <?php if ($this->_tpl_vars['configuration']['CCAllowStorage'] == 'off'): ?>checked="checked"<?php endif; ?> />
                            <strong>No</strong>, do not store credit card details in database<br />
                        </td>
                    </tr>
                    
                    <tr class="bordme"><td  align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['CCAllowRemove']; ?>
</strong></td>
                        <td colspan="3">
                            <input type="radio"
                                   name="CCAllowRemove"
                                   value="off"
                                   <?php if ($this->_tpl_vars['configuration']['CCAllowRemove'] == 'off'): ?>checked="checked"<?php endif; ?> /><strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['CCAllowRemove_dscr1']; ?>
<br />

                            <input type="radio" name="CCAllowRemove"
                                   value="on"
                                   <?php if ($this->_tpl_vars['configuration']['CCAllowRemove'] == 'on'): ?>checked="checked"<?php endif; ?> /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['CCAllowRemove_dscr2']; ?>

                        </td>
                    </tr>
                    
                    <tr class="bordme">
                        <td  align="right" valign="top">
                            <strong>Credit Cards Update Limit</strong>
                        </td>
                        <td colspan="3">
                            <input type="radio" name="CCUpdateLimit" value="off"
                                   <?php if ($this->_tpl_vars['configuration']['CCUpdateLimit'] != 'on'): ?>checked="checked"<?php endif; ?> /><strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> 
                            There is no limit to credit card updates.
                            <br />

                            <input type="radio" name="CCUpdateLimit" value="on"
                                   <?php if ($this->_tpl_vars['configuration']['CCUpdateLimit'] == 'on'): ?>checked="checked"<?php endif; ?> /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> 
                            Limit the amount of credit card updates to a client's account to
                            <input type="text" size="3" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['configuration']['CCUpdateLimitTimes'])) ? $this->_run_mod_handler('default', true, $_tmp, 3) : smarty_modifier_default($_tmp, 3)); ?>
" name="CCUpdateLimitTimes"/> 
                            time(s) per
                            <select name="CCUpdateLimitPariod">
                                <option <?php if ($this->_tpl_vars['configuration']['CCUpdateLimitPariod'] == '1'): ?>selected="selected"<?php endif; ?> value="1">Day</option>
                                <option <?php if ($this->_tpl_vars['configuration']['CCUpdateLimitPariod'] == '7'): ?>selected="selected"<?php endif; ?> value="7">Week</option>
                                <option <?php if ($this->_tpl_vars['configuration']['CCUpdateLimitPariod'] == '30'): ?>selected="selected"<?php endif; ?> value="30">Month</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr class="bordme">
                        <td  align="right" valign="top">
                            <strong>Block Credit Cards</strong>
                        </td>
                        <td colspan="3">
                            <input type="radio" name="CCBanDeclined" value="off"
                                   <?php if ($this->_tpl_vars['configuration']['CCBanDeclined'] != 'on'): ?>checked="checked"<?php endif; ?> /><strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> 
                            Process every credit card.
                            <br />

                            <input type="radio" name="CCBanDeclined" value="on"
                                   <?php if ($this->_tpl_vars['configuration']['CCBanDeclined'] == 'on'): ?>checked="checked"<?php endif; ?> /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> 
                            Reject credit cards that were declined 
                            <input type="text" size="3" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['configuration']['CCBanDeclinedTimes'])) ? $this->_run_mod_handler('default', true, $_tmp, 3) : smarty_modifier_default($_tmp, 3)); ?>
" name="CCBanDeclinedTimes"/> 
                            time(s) or more. 
                        </td>
                    </tr>

                    <tr>
                        <td  align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['CCChargeAuto']; ?>
</strong></td>
                        <td colspan="3">
                            <input type="radio"
                                   name="CCChargeAuto" 
                                   value="off" 
                                   <?php if ($this->_tpl_vars['configuration']['CCChargeAuto'] == 'off'): ?>checked="checked"<?php endif; ?> 
                                   onclick="$('.chargefew').hide();"/>
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['CCChargeAuto_dscr1']; ?>

                            <br />

                            <input type="radio" name="CCChargeAuto"
                                   value="on" 
                                   <?php if ($this->_tpl_vars['configuration']['CCChargeAuto'] == 'on'): ?>checked="checked"<?php endif; ?> 
                                   onclick="$('.chargefew').show();"/> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['CCChargeAuto_dscr']; ?>
 
                            <input type="text" size="3" <?php if ($this->_tpl_vars['configuration']['CCChargeAuto'] != 'on'): ?>value="0"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['CCDaysBeforeCharge']; ?>
"<?php endif; ?> name="CCDaysBeforeCharge"/> <?php echo $this->_tpl_vars['lang']['CCChargeAuto2']; ?>

                            <br />

                            <div class="chargefew" <?php if ($this->_tpl_vars['configuration']['CCChargeAuto'] != 'on'): ?>style="display:none"<?php endif; ?>> <br />
                                <input type="radio" name="CCAttemptOnce" value="on" <?php if ($this->_tpl_vars['configuration']['CCAttemptOnce'] == 'on'): ?>checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['CCAttemptOnce']; ?>
<br />
                                <input type="radio" name="CCAttemptOnce" value="off" <?php if ($this->_tpl_vars['configuration']['CCAttemptOnce'] == 'off'): ?>checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['CCAttemptOnce2']; ?>

                                <input type="text" size="3" name="CCRetryForDays" value="<?php echo $this->_tpl_vars['configuration']['CCRetryForDays']; ?>
" /> <?php echo $this->_tpl_vars['lang']['days']; ?>

                            </div>
                            <div class="chargefew" <?php if ($this->_tpl_vars['configuration']['CCChargeAuto'] != 'on'): ?>style="display:none"<?php endif; ?>> <br />
                                <input type="radio" name="CCForceAttempt" value="off" <?php if (! $this->_tpl_vars['configuration']['CCForceAttempt'] || $this->_tpl_vars['configuration']['CCForceAttempt'] == 'off'): ?>checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
</strong>, use payment module related to invoice to capture payment <br />
                                <input type="radio" name="CCForceAttempt" value="on" <?php if ($this->_tpl_vars['configuration']['CCForceAttempt'] == 'on'): ?>checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['Yes']; ?>
</strong>, use credit card module if card is present and non-credit card gateway is related to invoice 
                            </div>
                        </td>

                    </tr>

                </table>
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable" style="display:none">

                    <tr class="bordme"><td  align="right" valign="top"><strong></strong></td>
                        <td colspan="3">
                            <?php echo $this->_tpl_vars['lang']['ACHAdminInfo']; ?>

                                  </td>
                    </tr>

                    <tr class="bordme">
                        <td  align="right" valign="top"><strong>Allow bank details storage</strong></td>
                        <td colspan="3">
                            <input type="radio" name="ACHAllowStorage" value="on" <?php if ($this->_tpl_vars['configuration']['ACHAllowStorage'] == 'on'): ?>checked="checked"<?php endif; ?> />
                            <strong>Yes</strong>, allow saving bank details for later use<br />

                            <input type="radio" name="ACHAllowStorage" value="off" <?php if ($this->_tpl_vars['configuration']['ACHAllowStorage'] == 'off'): ?>checked="checked"<?php endif; ?> />
                            <strong>No</strong>, do not store bank account details in database<br />
                        </td>
                    </tr>

                    <tr class="bordme"><td  align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['ACHAllowRemove']; ?>
</strong></td>
                        <td colspan="3">
                            <input type="radio"
                                   name="ACHAllowRemove"
                                   value="off"
                                   <?php if ($this->_tpl_vars['configuration']['ACHAllowRemove'] == 'off'): ?>checked="checked"<?php endif; ?> /><strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['ACHAllowRemove_dscr1']; ?>
<br />

                            <input type="radio" name="ACHAllowRemove"
                                   value="on"
                                   <?php if ($this->_tpl_vars['configuration']['ACHAllowRemove'] == 'on'): ?>checked="checked"<?php endif; ?> /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['ACHAllowRemove_dscr2']; ?>

                        </td>
                    </tr>


                    <tr>
                        <td  align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['ACHChargeAuto']; ?>
</strong></td>
                        <td colspan="3">
                            <input type="radio"
                                   name="ACHChargeAuto"
                                   value="off"
                                   <?php if ($this->_tpl_vars['configuration']['ACHChargeAuto'] == 'off'): ?>checked="checked"<?php endif; ?>
                                   onclick="$('.chargefew2').hide();"/>
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['CCChargeAuto_dscr1']; ?>

                            <br />

                            <input type="radio" name="ACHChargeAuto"
                                   value="on"
                                   <?php if ($this->_tpl_vars['configuration']['ACHChargeAuto'] == 'on'): ?>checked="checked"<?php endif; ?>
                                   onclick="$('.chargefew2').show();"/>
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong> <?php echo $this->_tpl_vars['lang']['ACHChargeAuto_dscr']; ?>

                            <input type="text" size="3" <?php if ($this->_tpl_vars['configuration']['ACHChargeAuto'] != 'on'): ?>value="0"<?php else: ?>value="<?php echo $this->_tpl_vars['configuration']['ACHChargeAutoDays']; ?>
"<?php endif; ?> name="ACHChargeAutoDays"/> <?php echo $this->_tpl_vars['lang']['CCChargeAuto2']; ?>

                            <br />

                            <div class="chargefew2" <?php if ($this->_tpl_vars['configuration']['ACHChargeAuto'] != 'on'): ?>style="display:none"<?php endif; ?>> <br />
                                <input type="radio" name="ACHReChargeAuto" value="on" <?php if ($this->_tpl_vars['configuration']['ACHReChargeAuto'] == 'on'): ?>checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['CCAttemptOnce']; ?>
<br />
                                <input type="radio" name="ACHReChargeAuto" value="off" <?php if ($this->_tpl_vars['configuration']['ACHReChargeAuto'] == 'off'): ?>checked="checked"<?php endif; ?>/> <?php echo $this->_tpl_vars['lang']['ACHAttemptOnce2']; ?>

                                <input type="text" size="3" name="ACHRetryForDays" value="<?php echo $this->_tpl_vars['configuration']['ACHRetryForDays']; ?>
" /> <?php echo $this->_tpl_vars['lang']['days']; ?>

                            </div>
                        </td>

                    </tr>

                </table>

                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable" style="display:none">

                    <tr class="bordme"><td align="right"><strong><?php echo $this->_tpl_vars['lang']['OfferDeposit']; ?>
</strong></td>
                        <td colspan="3"><input name="OfferDeposit" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['OfferDeposit'] == 'off'): ?>checked="checked"<?php endif; ?>  onclick="$('#offerdeposit').hide();"/> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['OfferDeposit_descr1']; ?>
<br />
                            <input name="OfferDeposit" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['OfferDeposit'] == 'on'): ?>checked="checked"<?php endif; ?>   onclick="$('#offerdeposit').show();"/> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['OfferDeposit_descr']; ?>
<br />

                            <div id="offerdeposit" <?php if ($this->_tpl_vars['configuration']['OfferDeposit'] != 'on'): ?>style="display:none"<?php endif; ?>>
                                <?php echo $this->_tpl_vars['lang']['MinDeposit']; ?>
:  <input name="MinDeposit" class="inp" value="<?php echo $this->_tpl_vars['configuration']['MinDeposit']; ?>
" size="4"/>  &nbsp;&nbsp;
                                <?php echo $this->_tpl_vars['lang']['MaxDeposit']; ?>
:  <input name="MaxDeposit" class="inp" value="<?php echo $this->_tpl_vars['configuration']['MaxDeposit']; ?>
" size="4"/> 
                            </div>

                        </td></tr>
                     <tr><td align="right"><strong><?php echo $this->_tpl_vars['lang']['AllowBulkPayment']; ?>
</strong></td>
                        <td colspan="3"><input name="AllowBulkPayment" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['AllowBulkPayment'] == 'off'): ?>checked="checked"<?php endif; ?> /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AllowBulkPayment_descr1']; ?>
<br />
                            <input name="AllowBulkPayment" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['AllowBulkPayment'] == 'on'): ?>checked="checked"<?php endif; ?>   /> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
, </strong><?php echo $this->_tpl_vars['lang']['AllowBulkPayment_descr']; ?>
<br />
                        </td>
                     </tr>
                </table>
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable" style="display:none">
                    <tr class="bordme">
                        <td width="205" align="right"><strong>Credit notes</strong></td>
                        <td >
                            <input type="radio" name="CnoteEnable" value="off" <?php if ($this->_tpl_vars['configuration']['CnoteEnable'] != 'on'): ?>checked="checked"<?php endif; ?> onchange="c_note()" /> Disabled <br />
                            <input type="radio" name="CnoteEnable" value="on" <?php if ($this->_tpl_vars['configuration']['CnoteEnable'] == 'on'): ?>checked="checked"<?php endif; ?> onchange="c_note()"/> Enabled
                        </td>
                    </tr>
                    <tr class="bordme cnote" <?php if ($this->_tpl_vars['configuration']['CnoteEnable'] != 'on'): ?>style="display:none"<?php endif; ?>>
                        <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['CNoteNumerationFrom']; ?>
</strong></td>
                        <td >
                            <input style="width:100px" name="CNoteNumerationPaid" value="<?php echo $this->_tpl_vars['configuration']['CNoteNumerationPaid']; ?>
" class="inp"/>
                        </td>
                    </tr>

                    <tr class="bordme cnote" <?php if ($this->_tpl_vars['configuration']['CnoteEnable'] != 'on'): ?>style="display:none"<?php endif; ?>>
                        <td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['CNoteNumerationFormat']; ?>
</strong></td>
                        <td >
                            <select class="inp" name="CNoteNumerationFormat_list" id="CNoteNumerationFormat_list" 
                                    onchange="if($(this).val()=='0') $('#CNoteNumerationFormat_custom').show(); else  $('#CNoteNumerationFormat').val($(this).val());">
                                <option value="<?php echo '{$number}'; ?>
" <?php if ($this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] == 'number'): ?>selected="selected"<?php endif; ?>>number</option>
                                <option value="<?php echo '{$number}/{$m}'; ?>
" <?php if ($this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] == "number/m"): ?>selected="selected"<?php endif; ?>>number/MM</option>
                                <option value="<?php echo '{$number}/{$y}'; ?>
" <?php if (! $this->_tpl_vars['configuration']['CNoteNumerationFormat'] || $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] == "number/y"): ?>selected="selected"<?php endif; ?>>number/YYYY</option>
                                <option value="<?php echo '{$number}/{$m}/{$y}'; ?>
" <?php if ($this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] == "number/m/y"): ?>selected="selected"<?php endif; ?>>number/MM/YYYY</option>
                                <option value="0"  
                                <?php if ($this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/m' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/y' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/m/y'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['other']; ?>
</option>

                            </select>
                            <a class="editbtn" href="#" onclick="$('#CNoteNumerationFormat_custom').toggle();return false;"><?php echo $this->_tpl_vars['lang']['customize']; ?>
</a>
                            <div id="CNoteNumerationFormat_custom" style="margin-top:10px;
                                 <?php if ($this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/m' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/y' && $this->_tpl_vars['configuration']['CNoteNumerationFormatdc'] != 'number/m/y'): ?><?php else: ?>display:none<?php endif; ?>">
                                <input style="width:100px" name="CNoteNumerationFormat" id="CNoteNumerationFormat"  value="<?php echo $this->_tpl_vars['configuration']['CNoteNumerationFormat']; ?>
" class="inp"/>
                                <br /><small><?php echo $this->_tpl_vars['lang']['InvoicePrefix2_desc']; ?>
</small>
                            </div>

                        </td>
                    </tr>
                    <tr class="bordme cnote" <?php if ($this->_tpl_vars['configuration']['CnoteEnable'] != 'on'): ?>style="display:none"<?php endif; ?>>
                        <td width="205" align="right"><strong>Unpaid invoices</strong></td>
                        <td >
                            <input type="checkbox" name="CNoteIssueForUnpaid" value="1"
                                   <?php if ($this->_tpl_vars['configuration']['CNoteIssueForUnpaid']): ?>checked<?php endif; ?>/>
                            Allow credit notes for unpaid invoices
                        </td>
                    </tr>
                </table>
            </div>

            <div class="sectioncontent" style="display:none">
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable4" >
                    <tr class="bordme"><td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['sendeme']; ?>
</strong></td><td>

                            <input name="EmailSwitch" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['EmailSwitch'] == 'on'): ?>checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['EmailSwitchd1']; ?>
</strong><br />

                            <input name="EmailSwitch" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['EmailSwitch'] == 'off'): ?>checked="checked"<?php endif; ?>/> <strong><?php echo $this->_tpl_vars['lang']['EmailSwitchd2']; ?>
</strong>
                            <br />	
                        </td></tr>

                        <tr class="bordme"><td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['SystemMail']; ?>
</strong></td><td><input  style="width:50%" name="SystemMail" value="<?php echo $this->_tpl_vars['configuration']['SystemMail']; ?>
" class="inp"/></td></tr>

                       

                        <tr><td width="205" align="right"><strong><?php echo $this->_tpl_vars['lang']['MailerMethod']; ?>
</strong></td><td>
                                <div class="left"><input type="radio" name="MailUseSMTP" value="off" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'off'): ?>checked="checked"<?php endif; ?>  onclick="$('.smtp').hide();"/><strong><?php echo $this->_tpl_vars['lang']['MailUsePHP']; ?>
</strong><br />

                                <input type="radio" name="MailUseSMTP" value="on" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'on'): ?>checked="checked"<?php endif; ?> onclick="$('.smtp').show();"/><strong><?php echo $this->_tpl_vars['lang']['MailUseSMTP']; ?>
</strong>
                                </div><div class="left" style="padding:10px 20px;">
<a class="new_control" href="#"   onclick="$(this).hide();$('#testmailsuite').show();return false;"><span class="wizard"><?php echo $this->_tpl_vars['lang']['sendtestmail']; ?>
</span></a>
<div id="testmailsuite" style="display:none">
<span id="testmailsuite2">
    Enter email address: <input type="text" name="testmail" id="testmailaddress" /> <a class="new_control" href="#"   onclick="testConfiguration() ;return false;"><span ><b><?php echo $this->_tpl_vars['lang']['Send']; ?>
</b></span></a>
    </span><span  id="testing_result"></span>
</div>

</div>
                                <div class="clear"></div>
                            </td></tr>

                        <tr class="smtp" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'off'): ?>style="display:none"<?php endif; ?>>
                            <td width="205" align="right">SMTP Email address</td>
                            <td><input class="inp" name="MailSMTPEmail" value="<?php echo $this->_tpl_vars['configuration']['MailSMTPEmail']; ?>
" style="width: 250px"/> </td>				
                        </tr>
                        
                        <tr class="smtp" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'off'): ?>style="display:none"<?php endif; ?>>
                            <td width="205" align="right"><?php echo $this->_tpl_vars['lang']['MailSMTPHost']; ?>
</td>
                            <td><input class="inp" name="MailSMTPHost" value="<?php echo $this->_tpl_vars['configuration']['MailSMTPHost']; ?>
" style="width: 250px" /> 
                                <?php echo $this->_tpl_vars['lang']['MailSMTPPort']; ?>
 <input class="inp" name="MailSMTPPort" value="<?php echo $this->_tpl_vars['configuration']['MailSMTPPort']; ?>
" size="3" /></td>				
                        </tr>

                        <tr class="smtp" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'off'): ?>style="display:none"<?php endif; ?>>
                            <td width="205" align="right"><?php echo $this->_tpl_vars['lang']['MailSMTPUsername']; ?>
</td>
                            <td><input class="inp" name="MailSMTPUsername" value="<?php echo $this->_tpl_vars['configuration']['MailSMTPUsername']; ?>
" style="width: 250px" /> </td>				
                        </tr>

                        <tr class="smtp" <?php if ($this->_tpl_vars['configuration']['MailUseSMTP'] == 'off'): ?>style="display:none"<?php endif; ?>>
                            <td width="205" align="right"><?php echo $this->_tpl_vars['lang']['MailSMTPPassword']; ?>
</td>
                            <td><input class="inp" name="MailSMTPPassword" value="<?php echo $this->_tpl_vars['configuration']['MailSMTPPassword']; ?>
" style="width: 250px"type="password" autocomplete="off" /> </td>				
                        </tr>

                    <tr class="bordme"><td width="205" align="right"><strong>Limit mails per cron run </strong>
                            <a href="#" class="vtip_description" title="Set maximum number of email notifications HostBill should sent per one cron run"></a>
                        </td><td><input  style="width:30px" name="EmailsPerCronRun" value="<?php echo $this->_tpl_vars['configuration']['EmailsPerCronRun']; ?>
" class="inp"/></td></tr>



                </table>
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectioncontenttable4" style="display:none" >
                    <tr>
                        <td width="205" align="right"><strong>Wrap plain text emails</strong><br /> <small>(This will convert them to html)</small> </td>
                        <td><input type="checkbox" name="ForceWraperOnPlaintext" value="on" <?php if ($this->_tpl_vars['configuration']['ForceWraperOnPlaintext'] == 'on'): ?>checked="checked"<?php endif; ?> /> </td>
                    </tr>
                    <tr class="bordme">
                        <td width="205" align="right" valign="top">
                            <strong><?php echo $this->_tpl_vars['lang']['htmlwrapper']; ?>
</strong>
                            <br><br> 
                            <a onclick="$(this).attr('href',$(this).attr('rel')+'&EmailHTMLWrapper='+$('#EmailHTMLWrapper').val());return true" class="new_control" href="?cmd=emailtemplates&action=preview&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&body=Your message will be placed here" rel="?cmd=emailtemplates&action=preview&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&body=Your message will be placed here" target="_blank">
                                <span class="zoom"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</span>
                            </a>
                        </td>
                        <td>
                            <textarea  style="width:50%;height:100px;" name="EmailHTMLWrapper" class="inp" id="EmailHTMLWrapper"><?php echo $this->_tpl_vars['configuration']['EmailHTMLWrapper']; ?>
</textarea><br/>
                            <small><?php echo $this->_tpl_vars['lang']['htmlwrapper_desc']; ?>
</small>
                        </td>
                    </tr>

                    <tr class="bordme">
                        <td width="205" align="right" valign="top">
                            <strong>Inline CSS</strong>
                            <a href="#" class="vtip_description" title="With this option enabled style blocks in your email templates will be inlined before sending emails. This is required by some email clients that does not allow/parse style tag"></a>
                        </td>
                        <td>
                            <input type="checkbox" value="on" name="EmailInlineCSS" <?php if ($this->_tpl_vars['configuration']['EmailInlineCSS'] == 'on'): ?>checked="checked"<?php endif; ?> />
                        </td>
                    </tr>
                 <tr class="bordme">
                     <td width="205" align="right" valign="top"><strong><?php echo $this->_tpl_vars['lang']['EmailSignature']; ?>
</strong></td><td>
                         <textarea  style="width:50%;height:55px;" name="EmailSignature" class="inp"><?php echo $this->_tpl_vars['configuration']['EmailSignature']; ?>
</textarea><br />
                         <small>Note: HTML tags will be removed from signatures attached to plain text emails</small>
                     </td>
                 </tr>

                </table>
            </div>



            <div class="sectioncontent" style="display:none">
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="list-3content">
                    <tr class="bordme">
                        <td width="205px" align="right">
                            <strong><?php echo $this->_tpl_vars['lang']['CurrencyName']; ?>
</strong>
                        </td>
                        <td>
                            <select style="width:25%" class="inp" onchange="c_reload(this)">
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'USD'): ?>selected="selected"<?php endif; ?>>USD</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'GBP'): ?>selected="selected"<?php endif; ?>>GBP</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'EUR'): ?>selected="selected"<?php endif; ?>>EUR</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'BRL'): ?>selected="selected"<?php endif; ?>>BRL</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'INR'): ?>selected="selected"<?php endif; ?>>INR</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'CAD'): ?>selected="selected"<?php endif; ?>>CAD</option>
                                <option <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'ZAR'): ?>selected="selected"<?php endif; ?>>ZAR</option>
                                <option value="-1" <?php if (! ( $this->_tpl_vars['configuration']['ISOCurrency'] == 'USD' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'GBP' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'BRL' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'EUR' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'INR' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'CAD' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'ZAR' )): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['other']; ?>
...</option>
                            </select>
                            <a class="editbtn" href="#" onclick="$('#currency_edit').toggle(); return false;"><?php echo $this->_tpl_vars['lang']['customize']; ?>
</a>
                        </td>
                    </tr>
                    <tbody id="currency_edit" <?php if ($this->_tpl_vars['configuration']['ISOCurrency'] == 'USD' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'GBP' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'BRL' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'EUR' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'INR' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'CAD' || $this->_tpl_vars['configuration']['ISOCurrency'] == 'ZAR'): ?>style="display:none"<?php endif; ?> >
                        <tr class="bordme">
                            <td width="205px" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</strong>
                            </td>
                            <td id="pricepreview">
                                <span></span>
                            </td>

                        </tr>
                        <tr class="bordme">
                            <td width="205px" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['CurrencyFormat']; ?>
</strong>
                            </td>
                            <td>
                                <select style="width:25%" name="CurrencyFormat" id="CurrencyFormat" class="inp">
                                    <option value="1,234.56" <?php if ($this->_tpl_vars['configuration']['CurrencyFormat'] == "1,234.56"): ?>selected="selected"<?php endif; ?>>1,234.56</option>
                                    <option value="1.234,56" <?php if ($this->_tpl_vars['configuration']['CurrencyFormat'] == "1.234,56"): ?>selected="selected"<?php endif; ?>>1.234,56</option>
                                    <option value="1 234.56" <?php if ($this->_tpl_vars['configuration']['CurrencyFormat'] == "1 234.56"): ?>selected="selected"<?php endif; ?>>1 234.56</option>
                                    <option value="1 234,56" <?php if ($this->_tpl_vars['configuration']['CurrencyFormat'] == "1 234,56"): ?>selected="selected"<?php endif; ?>>1 234,56</option>
                                </select>
                            </td>
                        </tr>
                        
                        <tr class="bordme">
                            <td width="205px" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['ISOCurrency']; ?>
</strong>
                            </td>
                            <td>
                                <input style="width:50px" name="ISOCurrency" id="ISOCurrency" value="<?php echo $this->_tpl_vars['configuration']['ISOCurrency']; ?>
"  class="inp"/>
                            </td>
                        </tr>
                        <tr class="bordme">
                            <td width="205px" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['CurrencyCode']; ?>
</strong>
                            </td>
                            <td>
                                <input style="width:50px" name="CurrencyCode" id="CurrencyCode" value="<?php echo $this->_tpl_vars['configuration']['CurrencyCode']; ?>
"  class="inp"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="205px" align="right">
                                <strong><?php echo $this->_tpl_vars['lang']['CurrencySign']; ?>
</strong>
                            </td>
                            <td>
                                <input style="width:50px" name="CurrencySign" id="CurrencySign" value="<?php echo $this->_tpl_vars['configuration']['CurrencySign']; ?>
"  class="inp"/>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr class="bordme">
                            <td align="right">
                                <strong>Storage Decimal Places <a href="#" class="vtip_description" title="Number of decimal places you can use to setup pricing in admin area."></a></strong>
                            </td>
                            <td><span><?php echo $this->_tpl_vars['configuration']['DecimalPlaces']; ?>
 - <a class="editbtn" href="#" onclick="return confirm('Note: Decreasing Decimal Places value will result in truncating all prices to fit new format.') && $(this).parent().hide() && $('#DecimalPlaces').show();">edit</a></span>
                                                                <input style="display: none;" size="3" type="number" name="DecimalPlaces" max="20" id="DecimalPlaces" class="inp" value="<?php echo $this->_tpl_vars['configuration']['DecimalPlaces']; ?>
"
                                       onkeyup="if(parseInt($(this).val().replace(/\D/g,'')) > 20) $(this).val(20);"/>
                            </td>
                        </tr>
                         <tr class="bordme">
                            <td align="right">
                                <strong>Display Decimal Places <a href="#" class="vtip_description" title="Number of decimal places to display, prices will be rounded up to selected precision when ordering or generating invoices."></a></strong>
                            </td>
                            <td><span><?php echo $this->_tpl_vars['configuration']['DisplayDecimalPlaces']; ?>
 - <a class="editbtn" href="#" onclick="return $(this).parent().hide() && $('#DisplayDecimalPlaces').show();">edit</a></span>
                                                                <input style="display: none;" size="3" type="number"  name="DisplayDecimalPlaces" max="20" id="DisplayDecimalPlaces" class="inp" value="<?php echo $this->_tpl_vars['configuration']['DisplayDecimalPlaces']; ?>
"
                                       onkeyup="if(parseInt($(this).val().replace(/\D/g,'')) > 20) $(this).val(20);"/>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <script type="text/javascript">
                    <?php echo '
                        function pricepreview() {
                                
                            var sign = $(\'#CurrencySign\').val();
                            var format = $(\'#CurrencyFormat option:selected\').val();
                            var dp = $(\'#DecimalPlaces option:selected\').val();
                            ajax_update(\'?cmd=configuration&action=pricepreview&sign=\'+sign+\'&dp=\'+dp+\'&format=\'+format,false,\'#pricepreview\');
                        }
                        $(document).ready(function(){
                            pricepreview();
                        });
                        $(document).on(\'change\',\'#saveconfigform\',function(){
                            pricepreview();
                        });
                    '; ?>
    
                </script>
                <div class="list-3content" style="display: none;">

                    <div class="blu">
                        <input type="button"  value="<?php echo $this->_tpl_vars['lang']['addnewcurrency']; ?>
" style="font-weight:bold" onclick="$('#newcurr').toggle(); makeadd();"/> &nbsp;&nbsp;
                        <!--<?php echo $this->_tpl_vars['lang']['ISOCurrency']; ?>
: <strong><?php echo $this->_tpl_vars['main']['iso']; ?>
</strong> <?php echo $this->_tpl_vars['lang']['CurrencyCode']; ?>
: <strong><?php echo $this->_tpl_vars['main']['code']; ?>
</strong> <?php echo $this->_tpl_vars['lang']['CurrencySign']; ?>
: <strong><?php echo $this->_tpl_vars['main']['sign']; ?>
</strong>-->
                    </div>
                    <div class="lighterblue" style="padding:5px;display:none;" id="newcurr">
                        <input type="hidden" value="" name="make" />

                        <table border="0" cellpadding="3" cellspacing="0" width="100%">
                            <tr> 
                                <td width="130"><strong><?php echo $this->_tpl_vars['lang']['currcode']; ?>
</strong></td>
                                <td><input size="4" name="code"/><br /><small><?php echo $this->_tpl_vars['lang']['ccodedescr']; ?>
</small></td>

                                <td width="130"><strong><?php echo $this->_tpl_vars['lang']['currsign']; ?>
</strong></td>
                                <td><input size="4" name="sign"/><br /><small><?php echo $this->_tpl_vars['lang']['csigndescr']; ?>
</small></td>

                                <td width="130"><strong><?php echo $this->_tpl_vars['lang']['currrate']; ?>
</strong></td>
                                <td><input size="4" name="rate" value="1.0000"/><br /><small><?php echo $this->_tpl_vars['lang']['cratedescr']; ?>
<?php echo $this->_tpl_vars['currency']['code']; ?>
</small></td>				
                            </tr>
                            <tr>
                                <td width="130" style="border:none;"><strong><?php echo $this->_tpl_vars['lang']['curriso']; ?>
</strong></td>
                                <td style="border:none;"><input size="4" name="iso" /></td>	

                                <td width="130"><strong><?php echo $this->_tpl_vars['lang']['currupdate']; ?>
</strong></td>
                                <td><input type="checkbox" name="update" value="1"/></td>

                                <td width="130"><strong><?php echo $this->_tpl_vars['lang']['CurrencyFormat']; ?>
</strong></td>
                                <td>
                                    <select name="format" >
                                        <option>1,234.56</option>
                                        <option>1.234,56</option>
                                        <option>1 234.56</option>
                                        <option>1,234</option>
                                    </select>
                                </td>				
                            </tr>
                            <tr>

                                <td colspan="6"><center><input type="submit" style="font-weight:bold" value="<?php echo $this->_tpl_vars['lang']['submit']; ?>
"/> <input type="button" value="<?php echo $this->_tpl_vars['lang']['Cancel']; ?>
" onclick="$('#newcurr').hide()"/></center></td>				
                            </tr>
                        </table>


                    </div>
	<?php if ($this->_tpl_vars['currencies']): ?>
                    <table class="table glike" cellpadding="3" cellspacing="0"  width="100%">
                        <tr>
                            <th><?php echo $this->_tpl_vars['lang']['curriso']; ?>
</th>
                            <th><?php echo $this->_tpl_vars['lang']['currsign']; ?>
</th>
                            <th><?php echo $this->_tpl_vars['lang']['currcode']; ?>
</th>				
                            <th><?php echo $this->_tpl_vars['lang']['currrate']; ?>
</th>
                            <th><?php echo $this->_tpl_vars['lang']['currlastupdate']; ?>
</th>		
                            <th><?php echo $this->_tpl_vars['lang']['currdisplay']; ?>
</th>

                            <th width="60"></th>	
                        </tr>
		<?php $_from = $this->_tpl_vars['currencies']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['curr']):
?>
                        <tr id="curr_<?php echo $this->_tpl_vars['curr']['id']; ?>
">
                            <td><strong><?php echo $this->_tpl_vars['curr']['iso']; ?>
</strong></td>
                            <td><?php echo $this->_tpl_vars['curr']['sign']; ?>
</td>
                            <td><?php echo $this->_tpl_vars['curr']['code']; ?>
</td>				
                            <td><?php echo $this->_tpl_vars['curr']['rate']; ?>
</td>
                            <td><?php echo ((is_array($_tmp=$this->_tpl_vars['curr']['last_changes'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</td>		
                            <td><input type="checkbox" value="1" name="enable" <?php if ($this->_tpl_vars['curr']['enable']): ?>checked="checked"<?php endif; ?> onclick="updateEnable(this,<?php echo $this->_tpl_vars['curr']['id']; ?>
)"/></td>

                            <td><a href="?cmd=configuration&action=currency&getdetails=<?php echo $this->_tpl_vars['curr']['id']; ?>
" class="editbtn" onclick="return showeditform(this,<?php echo $this->_tpl_vars['curr']['id']; ?>
);"s><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a>
                                <a href="?cmd=configuration&action=currency&make=delete&id=<?php echo $this->_tpl_vars['curr']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="delbtn" onclick="return confirm('<?php echo $this->_tpl_vars['lang']['confirmCurrRemove']; ?>
');"><?php echo $this->_tpl_vars['lang']['remove']; ?>
</a>
                            </td> 
                        </tr>

		<?php endforeach; endif; unset($_from); ?>
                    </table>
	<?php endif; ?>
                    <script type="text/javascript"> <?php echo '
                        function makeadd() {
                            var make = $(\'#newcurr input[name=make]\').val();
                            if (make == \'\') {
                                $(\'#newcurr input[name=make]\').val(\'add\')
                            } else {
                                $(\'#newcurr input[name=make]\').val(\'\')
                            }
                        }
                        function updateEnable(el,id) {
                            var vis=($(el).is(\':checked\'))?\'1\':\'0\';
                            ajax_update(\'?cmd=configuration&action=currency&make=upenable&enable=\'+vis+\'&id=\'+id,false);return false;
                        } 
                        function showeditform(el,id) {
                            ajax_update($(el).attr(\'href\'),false,\'#curr_\'+id);return false;
                        }
                        '; ?>

                    </script>
                </div>
            </div>
            <div class="sectioncontent" style="display:none">

                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectiontable7">
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Logout inactive clients after</strong>
                        </td>
                        <td>
                            <input name="ClientLogoutAfter" type="text" value="<?php echo $this->_tpl_vars['configuration']['ClientLogoutAfter']; ?>
" size="3"/> minutes
                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong><?php echo $this->_tpl_vars['lang']['EnableProfiles']; ?>
</strong>
                        </td>
                        <td>
                            <input name="EnableProfiles" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['EnableProfiles'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="EnableProfiles" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['EnableProfiles'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong><?php echo $this->_tpl_vars['lang']['EnableClientScurity']; ?>
</strong>
                        </td>
                        <td>
                            <input name="EnableClientScurity" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['EnableClientScurity'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="EnableClientScurity" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['EnableClientScurity'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Allow canceling service with unpaid invoice</strong>
                        </td>
                        <td>
                            <input name="CanCancelUnpaidService" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['CanCancelUnpaidService'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="CanCancelUnpaidService" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['CanCancelUnpaidService'] != 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>

                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Allow canceling unpaid invoice for new order</strong>
                        </td>
                        <td>
                            <input name="CanCancelUnpaidInvoice" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['CanCancelUnpaidInvoice'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="CanCancelUnpaidInvoice" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['CanCancelUnpaidInvoice'] != 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Allow upgrading service with unpaid invoice</strong>
                        </td>
                        <td>
                            <input name="CanUpgradeUnpaidService" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['CanUpgradeUnpaidService'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="CanUpgradeUnpaidService" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['CanUpgradeUnpaidService'] != 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Grant domain access to contacts</strong>
                        </td>
                        <td>
                            <input name="GrantDomainAccessToContacts" type="radio" value="1" <?php if ($this->_tpl_vars['configuration']['GrantDomainAccessToContacts']): ?>checked="checked"<?php endif; ?>  /> 
                            <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
</strong>,
                            add domain management privileges to contacts used for registration or transfer.
                            <br />
                            <input name="GrantDomainAccessToContacts" type="radio" value="0" <?php if (! $this->_tpl_vars['configuration']['GrantDomainAccessToContacts']): ?>checked="checked"<?php endif; ?>  /> 
                            <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
</strong>, do not add domain access privileges to domain contacts.
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="10" width="100%" cellspacing="0" class="sectiontable7" style="display:none">
                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong><?php echo $this->_tpl_vars['lang']['RecordsPerPage']; ?>
</strong>
                        </td>
                        <td>
                            <select name="RecordsPerPage" class="inp">
                                <option value="25" <?php if ($this->_tpl_vars['configuration']['RecordsPerPage'] == '25'): ?>selected="selected"<?php endif; ?>>25</option>
                                <option value="50" <?php if ($this->_tpl_vars['configuration']['RecordsPerPage'] == '50'): ?>selected="selected"<?php endif; ?>>50</option>
                                <option value="75" <?php if ($this->_tpl_vars['configuration']['RecordsPerPage'] == '75'): ?>selected="selected"<?php endif; ?>>75</option>
                                <option value="100" <?php if ($this->_tpl_vars['configuration']['RecordsPerPage'] == '100'): ?>selected="selected"<?php endif; ?>>100</option>
                            </select> 
                        </td>
                    </tr>

                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Income Forecast for Suspended accounts</strong>
                        </td>
                        <td>
                            <input name="IncomeForecastSuspended" type="radio" value="on" 
                                   <?php if ($this->_tpl_vars['configuration']['IncomeForecastSuspended'] != 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="IncomeForecastSuspended" type="radio" value="off" 
                                   <?php if ($this->_tpl_vars['configuration']['IncomeForecastSuspended'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>

                     <tr class="bordme">
                        <td align="right" width="205">
                            <strong><?php echo $this->_tpl_vars['lang']['EnableClientCaptchaLogin']; ?>
</strong>
                        </td>
                        <td>
                            <input name="EnableClientCaptchaLogin" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['EnableClientCaptchaLogin'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="EnableClientCaptchaLogin" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['EnableClientCaptchaLogin'] == 'off'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>


                    <tr class="bordme">
                        <td align="right" width="205">
                            <strong>Force HTTPS in links  <a title="When enabled, all HostBill-generated/parsed links will use HTTPS protocol" class="vtip_description" href="#"></a></strong>
                        </td>
                        <td>
                            <input name="ForceHTTPS" type="radio" value="on" <?php if ($this->_tpl_vars['configuration']['ForceHTTPS'] == 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['yes']; ?>
 </strong><br />
                            <input name="ForceHTTPS" type="radio" value="off" <?php if ($this->_tpl_vars['configuration']['ForceHTTPS'] != 'on'): ?>checked="checked"<?php endif; ?>  /> <strong><?php echo $this->_tpl_vars['lang']['no']; ?>
 </strong>
                        </td>
                    </tr>


                    <tr class="bordme">
                         <td align="right" width="205" valign="top">
                            <strong>Trusted proxies</strong>
                            <a title="If you use loadbalancer, proxy, NAT, cloudflare etc. enter IP address/subnets that your traffic will be forwarded from to get real IP addresses<br>List shoudl be separated by comma (,) eg: <br/> 192.168.1.10,<br> 172.10.10.0/24" class="vtip_description" href="#"></a>
                        </td>
                        <td>
                            <textarea name="TrustedProxies" class="inp" placeholder="example: 192.168.1.0/24" style="width:500px;"><?php echo $this->_tpl_vars['configuration']['TrustedProxies']; ?>
</textarea>
                        </td>
                    </tr>
                     <tr class="bordme">
                         <td align="right" width="205" valign="top">
                            <strong><?php echo $this->_tpl_vars['lang']['SEOUrlMode']; ?>
</strong>
                        </td>
                        <td>
                            <input name="SEOUrlMode" type="radio" onclick="$('#htacode').slideUp();" value="index.php?/" <?php if ($this->_tpl_vars['configuration']['SEOUrlMode'] == 'index.php?/'): ?>checked="checked"<?php endif; ?> class="left" id="seo_1" /> <label class="w150 left" for="seo_1">Default</label> <div class="code left"><?php echo $this->_tpl_vars['system_url']; ?>
index.php?/cart/</div><br />
                            <div class="clear"></div>
                            <input name="SEOUrlMode" type="radio" onclick="$('#htacode').slideUp();" value="index.php/" <?php if ($this->_tpl_vars['configuration']['SEOUrlMode'] == 'index.php/'): ?>checked="checked"<?php endif; ?> class="left" id="seo_2"  /> <label class="w150 left" for="seo_2">Basic</label> <div class="code left"><?php echo $this->_tpl_vars['system_url']; ?>
index.php/cart/</div> <br />
                             <div class="clear"></div>
                            <input name="SEOUrlMode" type="radio" onclick="$('#htacode').slideUp();" value="?/" <?php if ($this->_tpl_vars['configuration']['SEOUrlMode'] == '?/'): ?>checked="checked"<?php endif; ?>  class="left" id="seo_3"  /> <label class="w150 left" for="seo_3">Advanced</label> <div class="code left"><?php echo $this->_tpl_vars['system_url']; ?>
?/cart/</div><br />
                            <div class="clear"></div>
                            <input name="SEOUrlMode" type="radio" onclick="$('#htacode').slideDown();" value="" <?php if ($this->_tpl_vars['configuration']['SEOUrlMode'] == ''): ?>checked="checked"<?php endif; ?> class="left" id="seo_4" /> <label class="w150 left" for="seo_4">Apache Mod Rewrite</label> <div class="code left"><?php echo $this->_tpl_vars['system_url']; ?>
cart/</div><br />
                             <div class="clear"></div>
                             <div id="htacode" class="code" style="<?php if ($this->_tpl_vars['configuration']['SEOUrlMode'] != ''): ?> display:none;<?php endif; ?>font-size:10px;width:500px;margin:5px 0px;-moz-box-shadow: inset 0 0 2px #888;-webkit-box-shadow: inset 0 0 2px #888;box-shadow: inner 0 0 2px #888;padding:10px;">## create .htaccess file in main HostBill directory with contents below<br>
&lt;IfModule mod_rewrite.c&gt;<br>
    RewriteEngine On <br>
    RewriteBase <?php echo $this->_tpl_vars['rewritebase']; ?>
<br>
    RewriteRule ^downloads/?$ ?cmd=downloads [NC,L]<br>
    <?php echo 'RewriteCond %{REQUEST_FILENAME} !-f<br>
    RewriteCond %{REQUEST_FILENAME} !-d<br>
    RewriteRule ^(.*)$ index.php?/$1 [L]<br>
&lt;/IfModule&gt;'; ?>

                             </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="nicerblu" style="text-align:center">
        <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" style="font-weight:bold" class="btn btn-primary"/>
    </div>
<?php echo smarty_function_securitytoken(array(), $this);?>
</form>

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
    function check_fee(elem){
        if($(elem).val() == \'0\')
            $(\'#fee_amount\').hide();
        else
            $(\'#fee_amount\').show();
    }
    function add_extension() {
        var ext=prompt("'; ?>
<?php echo $this->_tpl_vars['lang']['enterext']; ?>
<?php echo '","");
        if(!ext)
            return false;
        if(ext.substr(0,1) == \'.\')
            ext = ext.substr(1);
        $(\'#extensions\').val( $(\'#extensions\').val()+\';.\'+ext);
    }
    function testConfiguration() {
        $(\'#testing_result\').html(\'<img style="height: 16px" src="ajax-loading.gif" />\');
        ajax_update(\'?cmd=configuration&action=test_connection\',
        {
             \'SystemMail\': $(\'input[name="SystemMail"]\').val(),
             \'testmailaddress\': $(\'#testmailaddress\').val(),
            \'MailUseSMTP\': $(\'input[name="MailUseSMTP"]:checked\').val(),
            \'MailSMTPHost\': $(\'input[name="MailSMTPHost"]\').val(),
            \'MailSMTPPort\': $(\'input[name="MailSMTPPort"]\').val(),
            \'MailSMTPEmail\': $(\'input[name="MailSMTPEmail"]\').val(),
            \'MailSMTPUsername\': $(\'input[name="MailSMTPUsername"]\').val(),
            \'MailSMTPPassword\': $(\'input[name="MailSMTPPassword"]\').val()
        },\'#testing_result\', false);
    }
    function bindMe() {
        $(\'#newshelfnav\').TabbedMenu({elem:\'.sectioncontent\',picker:\'.list-1elem\',aclass:\'active\''; ?>
<?php if ($this->_tpl_vars['picked_tab']): ?>,picked:<?php echo $this->_tpl_vars['picked_tab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newshelfnav\').TabbedMenu({elem:\'.subm1\',picker:\'.list-1elem\''; ?>
<?php if ($this->_tpl_vars['picked_tab']): ?>,picked:<?php echo $this->_tpl_vars['picked_tab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newshelfnav\').TabbedMenu({elem:\'.sectioncontenttable\',picker:\'.list-2elem\',picktab:true,'; ?>
<?php if ($this->_tpl_vars['picked_subtab']): ?>picked:<?php echo $this->_tpl_vars['picked_subtab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newshelfnav\').TabbedMenu({elem:\'.sectioncontenttable4\',picker:\'.list-4elem\',picktab:true,'; ?>
<?php if ($this->_tpl_vars['picked_subtab']): ?>picked:<?php echo $this->_tpl_vars['picked_subtab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newshelfnav\').TabbedMenu({elem:\'.sectiontable7\',picker:\'.list-7elem\',picktab:true,'; ?>
<?php if ($this->_tpl_vars['picked_subtab']): ?>picked:<?php echo $this->_tpl_vars['picked_subtab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newshelfnav\').TabbedMenu({elem:\'.list-3content\',picker:\'.list-3elem\',picktab:true,'; ?>
<?php if ($this->_tpl_vars['picked_subtab']): ?>picked:<?php echo $this->_tpl_vars['picked_subtab']; ?>
<?php endif; ?><?php echo '});
        $(\'#newsetup1\').click(function(){
            $(this).hide();		
            $(\'#newsetup\').show();	
            return false; 
        });
        $(\'#recur_b .controls .editbtn\').click(function(){
            var e=$(this).parent().parent().parent();
            e.find(\'.e1\').hide();
            e.find(\'.e2\').show();
            return false;
        });
        $(\'#recur_b .controls .delbtn\').click(function(){
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
        $(\'.billopt\').removeClass(\'checked\');
        $(el).addClass(\'checked\');
		
        $(\'input[name=paytype]\').removeAttr(\'checked\').prop(\'checked\', false);
        $(\'input#\'+id).attr(\'checked\',\'checked\').prop(\'checked\', true);
        $(\'#once_b\').hide();
        $(\'#recur_b\').hide();
        $(\'#\'+id+\'_b\').show();
        $(\'#hidepricingadd\').click();
	
        return false;
    }
    function c_note(){
        var val = $(\'input[name=CnoteEnable]:checked\').val();
        if(val == \'on\')
            $(\'.cnote\').show()
        else
            $(\'.hide\').show()
    }
    '; ?>

</script>
<?php endif; ?>