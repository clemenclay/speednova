<?php /* Smarty version 2.6.26, created on 2018-06-11 12:08:03
         compiled from ajax.productwidgets.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'hbinput', 'ajax.productwidgets.tpl', 214, false),array('function', 'securitytoken', 'ajax.productwidgets.tpl', 265, false),array('modifier', 'escape', 'ajax.productwidgets.tpl', 214, false),)), $this); ?>
<?php if (( $this->_tpl_vars['cmd'] == 'services' && $this->_tpl_vars['action'] == 'product' )): ?>
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/hbwidget.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
    <script type="text/javascript">
        HBWidget.product_id = "<?php echo $this->_tpl_vars['product_id']; ?>
";
    </script>
<?php elseif ($this->_tpl_vars['action'] == 'getaddwidget' || $this->_tpl_vars['action'] == 'editwidget'): ?>
    <?php echo '
        <style type="text/css">
            #facebox .body, #formcontainer {
                padding:0px;
                border-radius: 6px 6px 6px 6px;
                background:none;
            }
            .conv_content .tabb {
                max-height:500px;
                overflow:auto;
            }
            .conv_content {
                padding:5px 5px 25px 5px;
                background:#FFFFFF;

                border-radius: 0px 5px 0px 0px;
            }
            .conv_content h3 {
                margin-top:0px;
            }
            #s_menu {
                background:#6b6b6b;
                padding:40px 0px;
                vertical-align:top;
                color:#fff;
                border-radius: 5px 0px 0px 0px;
            }
            #s_menu #initial-desc, #s_menu .description {
                padding:0px 5px;}
            #s_menu .descr_image {
                width:170px;
                height:62px;
                margin:60px 5px 0px;
            }
            fieldset {
                border: 1px solid #BBBBBB;
                border-radius: 5px 5px 5px 5px;
                margin-bottom: 10px;
                padding: 10px;
            }
            fieldset legend {
                padding: 0 10px;
                font-weight:bold;
            }
            fieldset label {
                cursor:pointer;
            }
            .fselect {
                float:left;
                padding:3px;
                border:solid 1px #fff;
                border-radius:3px;}
            .fselect.selected {
                border:1px solid #E3E3E3;
                background:#f3f3f3;
            }
            .spinner {
                display:none;
                background: none repeat scroll 0 0 #888;
                border: 1px solid #191919;
                box-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
                border-radius: 3px;
                padding:1px;
                margin-top:-3px;
            }
            #facebox select, #facebox textarea, #facebox input[type="text"],
            #facebox input[type="password"], #facebox input[type="email"], #facebox input[type="url"],
            #facebox input[type="date"], #facebox input[type="number"], #facebox input[type="time"],
            #facebox  input[type="date"], #facebox  input.date {
                border: 1px solid #CCCCCC;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) inset;
                font: 13px/16px Arial,sans-serif !important;
                padding: 4px 6px;
            }
            #facebox .pw-form small {
                color: #666666;
                font-size: 11px;
            }
            #facebox .pw-form label small {
                color: #666666;
                display: block;
                font-size: 11px;
                font-weight: normal;
                line-height: 11px;
                text-align: right;
                width: 160px;
            }
            #facebox .pw-form label {
                clear: left;
                display: block;
                float: left;
                font-size: 12px;
                font-weight: bold;
                margin: 0;
                text-align: right;
                width: 160px;
            }
            #facebox .pw-form label.nodescr {
                padding-top:7px !important;
            }
            #facebox .pw-form .w250 {
                width: 250px;
            }
            #facebox .pw-form input, .pw-form textarea, .pw-form select, .pw-form .winput {
                clear: right;
                float: left;
                margin: 2px 0 20px 10px;
            }
            .pricingtable input {
                float:none !important;
                margin:0px !important;
            }
        </style>

    '; ?>

<?php endif; ?>
<?php if (( $this->_tpl_vars['cmd'] == 'services' && $this->_tpl_vars['action'] == 'product' ) || ( $this->_tpl_vars['cmd'] == 'productwidgets' && $this->_tpl_vars['loadproduct'] )): ?>
    <div >
        <?php if ($this->_tpl_vars['widgets']): ?>
            <div id="listform2">
                <div id="serializeit2">
                    <ul id="grab-sorter2" class="grab-sorter">
                        <?php $_from = $this->_tpl_vars['widgets']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['widget']):
?>
                            <li class="product-widget <?php if ($this->_tpl_vars['widget']['unique']): ?>unique<?php endif; ?> <?php if ($this->_tpl_vars['widget']['assigned']): ?>active<?php else: ?>disabled<?php endif; ?> w<?php echo $this->_tpl_vars['widget']['widget_id']; ?>
" id="widget-<?php echo $this->_tpl_vars['widget']['id']; ?>
">
                                <table border="0" width="100%" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td valign="top" width="70">
                                            <input type="hidden" name="sort[]" value="<?php echo $this->_tpl_vars['widget']['id']; ?>
" class="ser"/>
                                            <a name="f<?php echo $this->_tpl_vars['widget']['id']; ?>
"></a>
                                            <?php if ($this->_tpl_vars['widget']['assigned']): ?>
                                                <a href="#"  class="sorter-ha menuitm menu-auto" onclick="return false">
                                                    <span class="movesth" title="<?php echo $this->_tpl_vars['lang']['move']; ?>
"></span>
                                                </a>
                                                <a href="#"  class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['Edit']; ?>
" 
                                                   onclick="return HBWidget.editWidgetForm(<?php echo $this->_tpl_vars['widget']['id']; ?>
);" style="">
                                                    <span class="editsth"></span>
                                                </a>
                                            <?php endif; ?>
                                        </td>
                                        <td width="190">
                                            <?php echo $this->_tpl_vars['widget']['name']; ?>

                                        </td>
                                        <td valign="middle">
                                            <?php if ($this->_tpl_vars['widget']['assigned']): ?>
                                                <a onclick="HBWidget.disableWidget(<?php echo $this->_tpl_vars['widget']['id']; ?>
, <?php echo $this->_tpl_vars['widget']['widget_id']; ?>
);
                                                        return false;" class="new_control" href="#"><span class="delsth">Disable</span></a>
                                            <?php else: ?>
                                                <a onclick="HBWidget.enableWidget(<?php echo $this->_tpl_vars['widget']['id']; ?>
, <?php echo $this->_tpl_vars['widget']['widget_id']; ?>
);
                                                        return false;" class="new_control" href="#"><span class="addsth">Enable</span></a>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                </table>

                            </li>
                        <?php endforeach; endif; unset($_from); ?>
                    </ul>
                </div>
            </div>
        <?php else: ?>
            <div class="blank_state_smaller blank_forms">
                <div class="blank_info">
                    <h3><?php echo $this->_tpl_vars['lang']['widgetsbs']; ?>
</h3>
                    <div class="clear"></div>
                    <br/>
                    <a  href="#" class="new_control"  onclick="return HBWidget.addCustomWidgetForm();" ><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['assign_custom_widg']; ?>
</strong></span></a>
                    <div class="clear"></div>

                </div>
            </div>

        <?php endif; ?>
    </div>
    <?php echo '
        <script type="text/javascript">
            //appendLoader(\'latebindme3\');
            appendLoader(\'HBWidget.init\');
        </script>
    '; ?>

<?php elseif ($this->_tpl_vars['action'] == 'editwidget'): ?>
    <div id="formloader">
        <form id="saveform" method="post" action="?cmd=productwidgets" enctype="multipart/form-data">
            <input type="hidden" name="wid" value="<?php echo $this->_tpl_vars['widget']['id']; ?>
" id="widget_id"/>
            <input type="hidden" name="make" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
            <input type="hidden" name="action" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
            <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>

            <table border="0" cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                    <td width="140" id="s_menu" style="" valign="top">
                        <div id="lefthandmenu">
                            <a class="tchoice" href="#">Appearance</a>
                            <?php $_from = $this->_tpl_vars['widget']['info']['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tpname'] => $this->_tpl_vars['tp']):
?>
                                <a class="tchoice" href="#"><?php echo $this->_tpl_vars['tpname']; ?>
</a>
                            <?php endforeach; endif; unset($_from); ?>

                        </div>
                        <?php if ($this->_tpl_vars['widget']['info']['description']): ?><div class="description" style="margin-top:80px"><?php echo $this->_tpl_vars['widget']['info']['description']; ?>
</div><?php endif; ?>
                    </td>
                    <td class="conv_content pw-form"  valign="top">
                        <div class="tabb">
                            <h3 style="margin-bottom:0px;"><img src="../<?php echo $this->_tpl_vars['widget']['config']['smallimg']; ?>
" alt="" style="margin-right:5px" class="left"  />  Function &raquo; <?php echo $this->_tpl_vars['widget']['info']['fullname']; ?>
 &raquo; Appearance</h3>
                            <div class="clear"></div>

                            <div style="margin-bottom: 10px">
                                <label class="nodescr">Display as</label>
                                <?php echo smarty_function_hbinput(array('value' => ((is_array($_tmp=$this->_tpl_vars['widget']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)),'style' => "margin-bottom: 0",'class' => 'inp','size' => '60','name' => 'name'), $this);?>

                            </div>
                            <div class="clear"></div>

                            <label class="nodescr">Display in</label>
                            <select class="winput w250" name="group">
                                <option value="sidemenu" <?php if ($this->_tpl_vars['widget']['group'] == 'sidemenu'): ?>selected="selected"<?php endif; ?>>Service sidemenu</option>
                                <option value="apps" <?php if ($this->_tpl_vars['widget']['group'] == 'apps'): ?>selected="selected"<?php endif; ?>>Service "apps" menu</option>
                            </select>
                            <div class="clear"></div>

                            <label>Small icon <small>Use 16x16px png image</small></label>
                            <div class="winput">

                                <input type="text" class="w250" name="config[smallimg]" value="<?php echo $this->_tpl_vars['widget']['config']['smallimg']; ?>
" style="margin:0px 5px 5px 0px;" />
                                <div class="clear"></div>
                                <div class="left fs11" style="padding:5px 5px 5px 0px;">Upload new</div><input type="file" name="smallimgnew" style="margin:0px 5px 5px 0px;" />
                            </div>
                            <div class="left">
                                <img src="../<?php echo $this->_tpl_vars['widget']['config']['smallimg']; ?>
" alt="" style="margin:5px 10px;"   />
                            </div>

                            <div class="clear"></div>

                            <label>Large icon <small>Use 48x48px png image</small></label>
                            <div class="winput">
                                <input type="text" class="w250" name="config[bigimg]" value="<?php echo $this->_tpl_vars['widget']['config']['bigimg']; ?>
" style="margin:0px 5px 5px 0px;"  />
                                <div class="clear"></div>
                                <div class="left fs11" style="padding:5px 5px 5px 0px;">Upload new</div><input type="file" name="bigimgnew" style="margin:0px 5px 5px 0px;" />
                            </div>

                            <div class="left">
                                <img src="../<?php echo $this->_tpl_vars['widget']['config']['bigimg']; ?>
" alt="" style="margin:5px 10px;"   />
                            </div>
                            <div class="clear"></div>


                        </div>



                        <?php $_from = $this->_tpl_vars['widget']['info']['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tpname'] => $this->_tpl_vars['tp']):
?>
                            <div class="tabb" style="display:none">
                                <h3><img src="../<?php echo $this->_tpl_vars['widget']['config']['smallimg']; ?>
" alt="" style="margin-right:5px" class="left"  />  Function &raquo; <?php echo $this->_tpl_vars['widget']['info']['fullname']; ?>
 &raquo; <?php echo $this->_tpl_vars['tpname']; ?>
</h3>
                                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tp'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                            </div>
                        <?php endforeach; endif; unset($_from); ?>

                    </td>
                </tr>
            </table>
            <?php echo smarty_function_securitytoken(array(), $this);?>

        </form> 
    </div>
    <?php echo '
        <script type="text/javascript">
            $(\'#picked_tab\').clone().appendTo(\'#saveform\');
            $(\'#lefthandmenu\').TabbedMenu({elem:\'.tabb\', picker_id:\'picked_subtab\''; ?>
<?php if ($this->_tpl_vars['picked_tab']): ?>, picked:<?php echo $this->_tpl_vars['picked_tab']; ?>
<?php endif; ?><?php echo '});
        </script>
    '; ?>

    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span class="bcontainer " >
                <a class="new_control greenbtn" href="#" onclick="$('.spinner').show();
                        $('#saveform').submit();
                        return false;"><span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span></a>
            </span>
            <span ><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
            <span class="bcontainer">
                <a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                        return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span>
                </a>
            </span>
        </div>
        <div class="clear"></div>
    </div>

<?php endif; ?>