<?php /* Smarty version 2.6.26, created on 2018-06-20 19:37:41
         compiled from root.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'root.tpl', 25, false),array('modifier', 'price', 'root.tpl', 36, false),array('function', 'adminwidget', 'root.tpl', 88, false),)), $this); ?>
<script type="text/javascript">loadelements.widgets = true;</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%" >

    <tr>
        <td class="leftNav" style="line-height:20px;">

            <button class="btn btn-default btn-xs" id="addnewwidget"><i class="fa fa-cog"></i> Add new widget</button>
            <br />   <br />
            <div style="font-size:11px;line-height:15px;">
                <strong><?php echo $this->_tpl_vars['lang']['whosonline']; ?>
</strong>
                <br />

                <?php $_from = $this->_tpl_vars['others']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['o']):
?>
                    <span><?php echo $this->_tpl_vars['o']['username']; ?>
</span>
                <?php endforeach; endif; unset($_from); ?>

                <br />
                <br />	

                <span style="font-size:11px;">
                    <?php echo $this->_tpl_vars['lang']['Licenseto']; ?>
: <strong><?php echo $this->_tpl_vars['license']['to']; ?>
</strong><br />
                    <?php echo $this->_tpl_vars['lang']['Expires']; ?>
: <strong><?php echo $this->_tpl_vars['license']['expires']; ?>
</strong><br />
                    <?php echo $this->_tpl_vars['lang']['Version']; ?>
: <strong><?php echo $this->_tpl_vars['version']; ?>
</strong><?php if ($this->_tpl_vars['build']): ?><em>:<?php echo $this->_tpl_vars['build']; ?>
</em><?php endif; ?>
                    <?php if ($this->_tpl_vars['newversion']): ?><br /><span style="color:red"><?php echo $this->_tpl_vars['lang']['newVersion']; ?>
: <strong><?php echo $this->_tpl_vars['newversion']; ?>
</strong></span> 
                        (<a class="external" target="_blank" href="http://hostbillapp.com/changelog" ><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['more'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</a>)
                    <?php endif; ?>
                </span>
                <br />

                <?php if ($this->_tpl_vars['forecast']): ?>
                    <br />

                    <strong><?php echo $this->_tpl_vars['lang']['incomeforecast']; ?>
</strong>
                    <div id="forecast">
                        <strong><?php echo $this->_tpl_vars['lang']['i6m']; ?>
:</strong> <br />
                        <div style="text-align:right"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['forecast']['total6'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></div>
                        <strong><?php echo $this->_tpl_vars['lang']['i12m']; ?>
:</strong> <br />
                        <div style="text-align:right"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['forecast']['total'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></div>
                        <strong><?php echo $this->_tpl_vars['lang']['i24m']; ?>
:</strong> <br />
                        <div style="text-align:right"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['forecast']['total24'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></div>
                    </div>	
                <?php endif; ?>
            </div>
        </td>

        <td  valign="top" id="dashboard-table">

            <?php if ($this->_tpl_vars['fake_pdo']): ?>
                <div class="gbox1 dashboard-header" style="background:red">
                    <div class="left">
                        <strong>Important!</strong> Please make sure you have PDO &amp; PDO_MySQL installed. After that remove line <b>$force_fake_pdo</b> from your includes/config.php
                    </div>

                    <div class="clear"></div>
                </div>
            <?php endif; ?>
            <?php if ($this->_tpl_vars['low_php']): ?>
                <div class="gbox1 dashboard-header" style="background:red;padding:5px 10px">
                    <div >
                        <strong>Important!</strong> You are using old (<b>End-Of-Life</b>) version of PHP. HostBill longer supports it.<br/>Please update to more recent PHP (5.6 or 7.0) release before being able to update to newer HostBill versions
                    </div>

                    <div class="clear"></div>
                </div>
            <?php endif; ?>

            <?php if ($this->_tpl_vars['stats']): ?>
                <div class="row no-gutter gbox1 dashboard-header">
                    <div class="col-md-6" style="padding-left:10px">
                        <span class="dashboard-income-line"><?php echo $this->_tpl_vars['lang']['incometoday']; ?>
: <strong><?php echo ((is_array($_tmp=$this->_tpl_vars['stats']['today'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></span>
                        <span class="dashboard-income-line"><?php echo $this->_tpl_vars['lang']['thismonth']; ?>
: <strong><?php echo ((is_array($_tmp=$this->_tpl_vars['stats']['month'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></span>
                        <span class="dashboard-income-line"><?php echo $this->_tpl_vars['lang']['thisyear']; ?>
: <strong><?php echo ((is_array($_tmp=$this->_tpl_vars['stats']['year'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</strong></span>
                    </div>
                    <div class="col-md-6" style="padding-right:10px">
                        <div class="pull-right" style="white-space: nowrap">
                        <span class="hidden-xs"><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['orders'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
:</span>
                        <a class="dashboard-stat-line" href="?cmd=orders">Today <strong><?php echo $this->_tpl_vars['stats']['orders']; ?>
</strong></a>
                        <a class="dashboard-stat-line" href="?cmd=orders&list=active"><?php echo $this->_tpl_vars['lang']['Activated']; ?>
 <strong><?php echo $this->_tpl_vars['stats']['active_orders']; ?>
</strong></a>
                        <a class="dashboard-stat-line" href="?cmd=orders&list=pending"><?php echo $this->_tpl_vars['lang']['Pending']; ?>
 <strong><?php echo $this->_tpl_vars['stats']['pending_orders']; ?>
</strong></a>
                        <a class="dashboard-stat-line <?php if ($this->_tpl_vars['stats']['requests'] > 0): ?>dashboard-stat-red<?php endif; ?>" href="?cmd=logs&action=cancelations"><?php echo $this->_tpl_vars['lang']['pendingtocancel']; ?>
 <strong><?php echo $this->_tpl_vars['stats']['requests']; ?>
</strong></a>
                        </div>
                        <div class="clear"></div>
                     </div>
                </div>
            <?php endif; ?>
            <div class="row no-gutter" >
                <div class="col-md-12 top-widgets" data-widget-group="dashboard" data-widget-panel="top">
                    <?php echo smarty_function_adminwidget(array('module' => 'dashboard','section' => 'blocks','wrapper' => "adminwidgets/wrap_dashboard.tpl",'panel' => 'top'), $this);?>

                </div>

                    <div class="col-md-6  mainleftcol" data-widget-group="dashboard" data-widget-panel="left" >

                        <?php if (! $this->_tpl_vars['temp_queue_check']): ?>
                        <div class="box box-solid box-icewhite" >
                            <div class="box-header" >
                                <h3 class="box-title">Note: Enable queue module</h3>

                            </div>
                            <div class="box-body" style="display: block;">
                                Queue is included in your HostBill for free, it runs tasks in background improving frontend performance.
                                In next couple releases it will be included as core feature. To enable:<br><br>
                                <ol>
                                    <li>Add new crontab entry:<br>
                                        <code>* * * * * php <?php echo $this->_tpl_vars['hb_maindir']; ?>
queue.php</code></li>
                                    <li style="margin-top:5px;">Activate queue module:<br>
                                        <a href="?cmd=managemodules&action=other&activate&modulename=class.hostbillqueue.php&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="btn btn-xs btn-success">Activate</a>
                                    </li>
                                </ol>

                            </div>
                        </div>
                    <?php endif; ?>

                    <?php echo smarty_function_adminwidget(array('module' => 'dashboard','section' => 'blocks','wrapper' => "adminwidgets/wrap_dashboard.tpl",'panel' => 'left'), $this);?>

                </div>

                <div class="col-md-6  mainrightcol" data-widget-group="dashboard" data-widget-panel="right" >
                    <?php echo smarty_function_adminwidget(array('module' => 'dashboard','section' => 'blocks','wrapper' => "adminwidgets/wrap_dashboard.tpl",'panel' => 'right'), $this);?>

                </div>

                <div class="col-lg-12 col-md-6" data-widget-group="dashboard" data-widget-panel="bottom">
                    <?php echo smarty_function_adminwidget(array('module' => 'dashboard','section' => 'blocks','wrapper' => "adminwidgets/wrap_dashboard.tpl",'panel' => 'bottom'), $this);?>

                </div>
            </div>
            <?php if ($this->_tpl_vars['qc_features']): ?>
                <?php echo '
                    <script type="text/javascript">
                        function appendMe1() {
                            $.facebox({ajax: \'?cmd=root&action=initialconfig\'});
                        }
                        appendLoader(\'appendMe1\');
                    </script>
                '; ?>

            <?php endif; ?>


            <div id="fp_leftcol">
                <table id="dashboard-sections">

                </table>


                <?php if ($this->_tpl_vars['HBaddons']['mainpage']): ?>
                    <div class="bborder">
                        <div class="bborder_header">
                            <?php echo $this->_tpl_vars['lang']['Plugins']; ?>

                        </div>
                        <div class="bborder_content">
                            <?php $_from = $this->_tpl_vars['HBaddons']['mainpage']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['module']):
?>
                                <div class="addon_module"><strong><a href="?cmd=module&module=<?php echo $this->_tpl_vars['module']['id']; ?>
"><?php echo $this->_tpl_vars['module']['name']; ?>
</a></strong></div>
                                <div class="clear"></div>
                            <?php endforeach; endif; unset($_from); ?>
                        </div>
                    </div>
                <?php endif; ?>

            </div>

            <div id="fp_bottomcol">

            </div>

        </td>
    </tr>
</table>
<script>
    loadelements.pops=false;
</script>
<link href="templates/default/dist/plugins/datatables/dataTables.bootstrap.min.css" type="text/css" rel="stylesheet">
<script src="templates/default/dist/plugins/chartjs/Chartjs.min.js"></script>
<script src="templates/default/dist/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="templates/default/dist/plugins/datatables/dataTables.bootstrap.min.js"></script>