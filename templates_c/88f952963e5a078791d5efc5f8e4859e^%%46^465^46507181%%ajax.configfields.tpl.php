<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from ajax.configfields.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'regex_replace', 'ajax.configfields.tpl', 95, false),array('modifier', 'escape', 'ajax.configfields.tpl', 100, false),array('modifier', 'default', 'ajax.configfields.tpl', 520, false),array('function', 'hbinput', 'ajax.configfields.tpl', 296, false),array('function', 'hbwysiwyg', 'ajax.configfields.tpl', 308, false),array('function', 'securitytoken', 'ajax.configfields.tpl', 513, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'getaddform' || $this->_tpl_vars['action'] == 'field' || $this->_tpl_vars['action'] == 'getduplicateform' || $this->_tpl_vars['action'] == 'addconfig' || $this->_tpl_vars['action'] == 'previewfields'): ?><?php echo '
        <style type="text/css">

            .pricingtable input {
                float:none !important;
                margin:0px !important;
            }
            .formbilling-head{
                text-align: left;
                clear:both;
                line-height: 23px;
                border-bottom: 1px solid #d9d9d9;
                margin: 0 0 15px 0;
            }
            .formbilling-head a{
                padding: 4px 15px;
                text-transform: capitalize;
            }
            .formbilling-head a.active{
                border-bottom: 3px solid #C2C3C4/*#3491DF*/;
                text-decoration: none;
                color: black;

            }

        </style>
    '; ?>

    <script type="text/javascript">
        var configfields_lang = <?php echo '{}'; ?>
;
        configfields_lang['premade_over'] = "<?php echo $this->_tpl_vars['lang']['premade_over']; ?>
";
        configfields_lang['delconf2'] = "<?php echo $this->_tpl_vars['lang']['delconf2']; ?>
";
    </script>
    <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/configfields.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
<?php endif; ?>
<?php if ($this->_tpl_vars['action'] == 'loadpremade_field'): ?>
    <?php if ($this->_tpl_vars['fields']): ?>
        <div class="clear"></div><label><?php echo $this->_tpl_vars['lang']['premade']; ?>
<small><?php echo $this->_tpl_vars['lang']['premade_desc']; ?>
</small></label>
        <select name="premade" style="margin:0 10px;" id="premade_val" onchange="if ($(this).val() == '1')
                    $('#loadurl').show();
                else
                    $('#loadurl').hide()">
            <option value="0"><?php echo $this->_tpl_vars['lang']['none']; ?>
</option>
            <option value="1" style="font-weight:bold">Load from URL</option>

            <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['f']):
?>
                <option><?php echo $this->_tpl_vars['f']; ?>
</option>
            <?php endforeach; endif; unset($_from); ?></select>

        <div style="padding: 2px " class="fs11"> 
            <strong>You can also find dozen of premade &amp; easy to use fields here:</strong>
            <a href="http://hostbillapp.com/fastconfig/forms/" target="_blank" class="external">http://hostbillapp.com/fastconfig/forms/</a>
        </div>
        <div class="clear"></div>
        <div id="loadurl" style="display:none">
            <label>Step 1. <small>Paste <a href="http://hostbillapp.com/fastconfig/forms/" target="_blank">config url</a></small></label>
            <input class="w250" type="text" name="premadeurl" id="premadeurl_val"/><div class="clear"></div>
            <label>Step 2. <small>Submit and verify setup</small></label>
            <div style="margin:2px 10px" class="left">
                <span style="" class="bcontainer dhidden"><a onclick="return createField()" href="#" class="new_control greenbtn"><span><?php echo $this->_tpl_vars['lang']['createnewcfield']; ?>
</span></a></span>
            </div>
        </div>				  
    <?php endif; ?>
<?php elseif (( $this->_tpl_vars['cmd'] == 'services' && $this->_tpl_vars['action'] == 'product' ) || ( $this->_tpl_vars['cmd'] == 'configfields' && $this->_tpl_vars['loadproduct'] )): ?>


    <div ><script type="text/javascript">  $('body').unbind('ajaxComplete');</script>
        <?php if ($this->_tpl_vars['config']): ?>


            <div id="listform">
                <div id="serializeit"><ul id="grab-sorter" style="border:solid 1px #ddd;border-bottom:none;">
                        <?php $_from = $this->_tpl_vars['config']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
                            <li style="background:#ffffff"><div style="border-bottom:solid 1px #ddd;">
                                    <table border="0" width="100%" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td valign="top" width="140"><div style="padding:10px 0px;"><input type="hidden" name="sortc[]" value="<?php echo $this->_tpl_vars['field']['id']; ?>
" class="ser"/><a name="f<?php echo $this->_tpl_vars['field']['id']; ?>
"></a>
                                                    <a href="#"  class="sorter-ha menuitm menu-auto" onclick="return false">
                                                        <span class="movesth" title="<?php echo $this->_tpl_vars['lang']['move']; ?>
"></span>
                                                    </a>
                                                    <a href="#"  class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['Edit']; ?>
" onclick="return editCustomFieldForm(<?php echo $this->_tpl_vars['field']['id']; ?>
,<?php echo $this->_tpl_vars['product_id']; ?>
);" style="">
                                                        <span class="editsth"></span>
                                                    </a>
                                                    <a href="#" class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['Duplicate']; ?>
"  onclick="return duplicateCustomFieldForm(<?php echo $this->_tpl_vars['field']['id']; ?>
,<?php echo $this->_tpl_vars['product_id']; ?>
);">
                                                        <span class="duplicatesth"></span>
                                                    </a>
                                                    <a href="?cmd=configfields&make=delete&id=<?php echo $this->_tpl_vars['field']['id']; ?>
&product_id=<?php echo $this->_tpl_vars['product_id']; ?>
" class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['delete']; ?>
" 
                                                       onclick="return deleteItemConfCat(this)" >
                                                        <span class="delsth"></span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td >
                                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['field']['configtemplates']['adminlist'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                <?php if ($this->_tpl_vars['field']['variable']): ?>
                                                    <input type="hidden" id="configvar_<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['variable'])) ? $this->_run_mod_handler('regex_replace', true, $_tmp, '/[^a-z0-9A-Z_-]/', '') : smarty_modifier_regex_replace($_tmp, '/[^a-z0-9A-Z_-]/', '')); ?>
" value="<?php echo $this->_tpl_vars['field']['id']; ?>
"/>
                                                    <script type="text/javascript">
                                                        <?php echo '
                                                            $(\'body\').ajaxComplete(function () {
                                                        '; ?>

                                                                $('#config_<?php echo $this->_tpl_vars['field']['variable']; ?>
').html('<em class="fs11">Set by client using <a href="#"   title="<?php echo $this->_tpl_vars['lang']['Edit']; ?>
" onclick="return editCustomFieldForm(<?php echo $this->_tpl_vars['field']['id']; ?>
,<?php echo $this->_tpl_vars['product_id']; ?>
);" >Forms: <?php echo ((is_array($_tmp=$this->_tpl_vars['field']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'javascript') : smarty_modifier_escape($_tmp, 'javascript')); ?>
</a> (<a href="?cmd=configfields&make=delete&id=<?php echo $this->_tpl_vars['field']['id']; ?>
&product_id=<?php echo $this->_tpl_vars['product_id']; ?>
" class="editbtn" onclick=" if(!deleteItemConfCat(this))$(\'#modulepicker\').change();return false;">remove</a>)</em>');
                                                                $('#config_<?php echo $this->_tpl_vars['field']['variable']; ?>
_descr').remove();
                                                        <?php echo '
                                                            });
                                                        '; ?>


                                                    </script>
                                                <?php endif; ?>
                                            </td>
                                            <td width="150" style="background:#F0F0F3;color:#767679;font-size:11px" valign="top">
                                                Field type: 
                                                <strong>
                                                    <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                    <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                    <?php endif; ?> 
                                                </strong>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </li>
                        <?php endforeach; endif; unset($_from); ?>
                    </ul>
                </div>	
            </div>

        <?php else: ?>

            <div class="blank_state_smaller blank_forms">
                <div class="blank_info">
                    <h3><?php echo $this->_tpl_vars['lang']['formsbs']; ?>
</h3>
                    <span class="fs11"><?php echo $this->_tpl_vars['lang']['bsdescription']; ?>
</span>
                    <div class="clear"></div>
                    <br/>
                    <a  href="#" class="new_control"  onclick="return addCustomFieldForm(<?php echo $this->_tpl_vars['product_id']; ?>
);" ><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['assign_custom_opt']; ?>
</strong></span></a> <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span> <a href="#"  class="new_control" onclick="$('#importforms').show();
                            return false"><span class="disk-import">Import</span></a>
                    <div class="clear"></div>

                </div>
            </div>

        <?php endif; ?>

        <script type="text/javascript"><?php echo '
            function saveOrder2() {
                var sorts = $(\'#customitemseditor input.ser2\').serialize();
                ajax_update(\'?cmd=configfields&action=changeorder&\' + sorts, {});
            }
            ;
            function latebindme() {
                $("#grab-sorter").dragsort({dragSelector: "a.sorter-ha", dragBetween: false, dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'><div></div></li>"});
                $("#customitemseditor").dragsort({dragSelector: "a.sorter-ha", dragBetween: false, dragEnd: saveOrder2, placeHolderTemplate: "<li class=\'placeHolder\'><div></div></li>"});
            }
            if (typeof saveOrder == \'function\' && typeof $("#customitemseditor").dragsort == \'function\') {
                latebindme();
            }

            function refreshConfigView(pid) {
                if (pid)
                    ajax_update("?cmd=configfields", {action: "loadproduct", product_id: pid}, \'#configeditor_content\');
                return false;
            }
            function addCustomFieldForm(pid) {
                $.facebox({ajax: "?cmd=configfields&action=addconfig&product_id=" + pid, width: 900, nofooter: true, opacity: 0.5, addclass: \'modernfacebox\'});
                return false;
            }
            function previewCustomForm(url) {
                $.facebox({ajax: url, width: 900, nofooter: true, opacity: 0.5, addclass: \'modernfacebox\'});
                return false;

            }
            function editCustomFieldForm(id, pid) {
                $.facebox({ajax: "?cmd=configfields&action=field&id=" + id + "&product_id=" + pid + \'&paytype=\' + $(\'input[name=paytype]:checked\').val(), width: 900, nofooter: true, opacity: 0.5, addclass: \'modernfacebox\'});
                return false;
            }
            function duplicateCustomFieldForm(id, pid) {
                ajax_update("?cmd=configfields&action=duplicatefield&id=" + id + "&product_id=" + pid, {}, function () {
                    refreshConfigView(pid);
                });

                return false;
            }
            function deleteItemConf(el) {
                if (confirm(\''; ?>
<?php echo $this->_tpl_vars['lang']['delconf2']; ?>
<?php echo '\')) {
                    ajax_update($(el).attr(\'href\'), {}, \'#configeditor_content\');

                }
                return false;
            }
            function deleteItemConfCat(el) {
                if (confirm(\''; ?>
<?php echo $this->_tpl_vars['lang']['delconf1']; ?>
<?php echo '\')) {
                    ajax_update($(el).attr(\'href\'), {}, \'#configeditor_content\');
                }
                return false;
            }

            '; ?>

            </script>


            <?php if ($this->_tpl_vars['config']): ?><div style="padding:10px 4px">
                    <a  href="#" class="new_control"  onclick="return addCustomFieldForm(<?php echo $this->_tpl_vars['product_id']; ?>
);" id="addnew_conf_btn"><span class="addsth" ><strong><?php echo $this->_tpl_vars['lang']['assign_custom_opt']; ?>
</strong></span></a>
                    <script type="text/javascript">$('#preview_forms_shelf').show();</script><a href="?cmd=configfields&product_id=<?php echo $this->_tpl_vars['product_id']; ?>
&action=previewfields" class="new_control" onclick="return previewCustomForm($(this).attr('href'))"><span class="zoom"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</span></a>
                    <a href="?cmd=configfields&action=export&id=<?php echo $this->_tpl_vars['product_id']; ?>
"  class="new_control" target="_blank"><span class="disk-export">Export</span></a>
                    <a href="#"  class="new_control" onclick="$('#importforms').show();
                            return false"><span class="disk-import">Import</span></a>
                </div>
            <?php endif; ?>
        </div>

        <?php elseif ($this->_tpl_vars['action'] == 'previewfields'): ?>
            <div id="formloader" style="background:#fff;padding:10px;">
                <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jqueryui/js/jquery-ui-1.8.12.custom.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                <link href="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jqueryui/css/ui-lightness/jquery-ui-1.8.12.custom.css" rel="stylesheet" media="all" />
                <?php if ($this->_tpl_vars['custom']): ?>
                    <table border="0" width="100%" cellspacing="0" cellpadding="3">
                        <?php $_from = $this->_tpl_vars['custom']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cf']):
?> 
                            <?php if ($this->_tpl_vars['cf']['items']): ?>

                                <tr>
                                    <td colspan="2" class="<?php echo $this->_tpl_vars['cf']['key']; ?>
 cf_option">

                                        <label for="custom[<?php echo $this->_tpl_vars['cf']['id']; ?>
]" class="styled"><b><?php echo $this->_tpl_vars['cf']['name']; ?>
 <?php if ($this->_tpl_vars['cf']['options'] & 1): ?>*<?php endif; ?></b></label><br/>
                                        <?php if ($this->_tpl_vars['cf']['description'] != ''): ?><div class="fs11 descr" style="color:#808080"><?php echo $this->_tpl_vars['cf']['description']; ?>
</div><?php endif; ?>

                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['cf']['configtemplates']['cart'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

                                    </td>
                                </tr>
                            <?php endif; ?>
                        <?php endforeach; endif; unset($_from); ?>
                    </table>
                <?php endif; ?>
            </div><?php if ($this->_tpl_vars['ajax']): ?>
            <div class="dark_shelf dbottom">

                <div class="right">
                    <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                            return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>


                </div>
                <div class="clear"></div>
            </div>	
            <?php endif; ?>
                <?php elseif ($this->_tpl_vars['action'] == 'field' || $this->_tpl_vars['action'] == 'getaddform' || $this->_tpl_vars['action'] == 'duplicatefield'): ?>
                    <div id="formloader">
                        <form id="saveform" method="post" action="">
                            <input type="hidden" name="type" value="<?php if ($this->_tpl_vars['type']): ?><?php echo $this->_tpl_vars['type']; ?>
<?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>
<?php endif; ?>"/>
                            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['field']['id']; ?>
" id="field_category_id"/>
                            <input type="hidden" name="make" value="<?php if ($this->_tpl_vars['field']['id'] == 'new'): ?>addfield<?php else: ?>editfield<?php endif; ?>"/>
                            <input type="hidden" name="action" value="field"/>
                            <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>


                            <table border="0" cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td width="140" id="s_menu" style="" valign="top">
                                        <div id="lefthandmenu">
                                            <a class="tchoice" href="#Basic">Basic settings</a>
                                            <?php if ($this->_tpl_vars['field']['type']['info']['subitems']): ?>
                                                <a class="tchoice" href="#Values">Values</a>
                                            <?php endif; ?>
                                            <?php if ($this->_tpl_vars['field']['type']['info']['pricing'] && ! $this->_tpl_vars['field']['type']['info']['subitems']): ?>
                                                <a class="tchoice" href="#Pricing">Pricing</a>
                                            <?php endif; ?>
                                            <?php if ($this->_tpl_vars['field']['type']['info']['validation']): ?>
                                                <a class="tchoice" href="#Validation">Validation</a>
                                            <?php endif; ?>
                                            <a class="tchoice" href="#Advanced">Advanced</a>
                                            <?php $_from = $this->_tpl_vars['field']['type']['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tpname'] => $this->_tpl_vars['tp']):
?>
                                                <a class="tchoice" href="#<?php echo $this->_tpl_vars['tpname']; ?>
"><?php echo $this->_tpl_vars['tpname']; ?>
</a>
                                            <?php endforeach; endif; unset($_from); ?>

                                        </div>
                                    </td>
                                    <td class="conv_content form"  valign="top">
                                        <div class="tabb">
                                            <h3 style="margin-bottom:0px;">
                                                <img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" 
                                                     alt="" style="margin-right:5px" class="left"  /> 
                                                <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                <?php endif; ?> 
                                                &raquo; Basic settings
                                            </h3>
                                            <div class="clear">
                                                <small><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['description']]; ?>
</small>
                                            </div>
                                            <div style="padding:10px 3px;border:solid 2px red;background:#FFFED1;margin:5px 0px 15px;display:none;" 
                                                 class="clear" id="lengthwarning">
                                                Your php.ini setting <b>max_input_vars</b> is too low to properly save this form element. 
                                                <a href="http://wiki.hostbillapp.com/index.php?title=Forms:_Fix_not_saving_forms_configuration" target="_blank">How to fix this.</a>
                                            </div>
                                            <div class="clear">
                                                <label class="nodescr">Field name</label>
                                                <?php echo smarty_function_hbinput(array('value' => $this->_tpl_vars['field']['tag_name'],'class' => 'w250','name' => 'name','style' => "margin:0px;",'wrapper' => 'div','wrapper_class' => 'w250 left','wrapper_style' => "clear:right;margin: 2px 0 10px 10px;"), $this);?>

                                            </div>

                                            <div class="clear">
                                                <label for="check-required">Required field</label>
                                                <input id="check-required" type="checkbox" name="options[]" value="1" <?php if ($this->_tpl_vars['field']['options'] & 1): ?>checked="checked"<?php endif; ?>/>
                                            </div>
                                            <div class="clear">
                                                <label >Description</label>
                                                <?php if ($this->_tpl_vars['field']['description'] != ''): ?>
                                                    <?php echo smarty_function_hbwysiwyg(array('value' => $this->_tpl_vars['field']['tag_description'],'style' => "margin:0px;width:250px",'blockwysiwyg' => 'true','class' => 'w250','name' => 'description','wrapper_id' => 'prod_desc_cx','wrapper' => 'div','wrapper_class' => 'w250 left','wrapper_style' => "clear:right;margin: 2px 0 10px 10px;"), $this);?>

                                                <?php else: ?>
                                                    <a href="#" onclick="$(this).hide();
                                                            $('#prod_desc_cx').show();
                                                            return false;" style="padding-left:10px;">
                                                        <strong><?php echo $this->_tpl_vars['lang']['adddescription']; ?>
</strong>
                                                    </a>
                                                    <?php echo smarty_function_hbwysiwyg(array('value' => $this->_tpl_vars['field']['tag_description'],'style' => "margin:0px;width:250px",'class' => 'inp wysiw_editor','name' => 'description','blockwysiwyg' => 'true','wrapper_id' => 'prod_desc_cx','wrapper' => 'div','wrapper_class' => 'w250 left','wrapper_style' => "display:none;clear:right;margin: 2px 0 10px 10px;"), $this);?>

                                                <?php endif; ?>
                                            </div>
                                        </div>

                                        <?php if ($this->_tpl_vars['field']['type']['info']['subitems']): ?>
                                            <div class="tabb" style="display:none">
                                                <h3>
                                                    <img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" 
                                                         alt="" style="margin-right:5px" class="left"  /> 
                                                    <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                    <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                    <?php endif; ?> &raquo; Values
                                                </h3>

                                                <div id="subitems_editor">
                                                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.configdrawsort.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                </div>

                                            </div>
                                        <?php endif; ?>

                                        <?php if ($this->_tpl_vars['field']['type']['info']['pricing'] && ! $this->_tpl_vars['field']['type']['info']['subitems']): ?>
                                            <div class="tabb" style="display:none">
                                                <h3>
                                                    <img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" 
                                                         alt="" style="margin-right:5px" class="left"  /> 
                                                    <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                    <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                    <?php endif; ?> &raquo; Pricing
                                                </h3>

                                                <label ><?php echo $this->_tpl_vars['lang']['enablepricing']; ?>
</label>
                                                <input  type="checkbox" name="items[<?php echo $this->_tpl_vars['k']; ?>
][pricing]" value="1" 
                                                        <?php if ($this->_tpl_vars['field']['items'][0]['pricing_enabled']): ?>checked="checked"<?php endif; ?> 
                                                        onclick="$('.formbilling, .pricingtable', '#facebox').toggle()"/> 
                                                <small>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <?php echo $this->_tpl_vars['lang']['chargeforvalue']; ?>

                                                </small>

                                                <?php $_from = $this->_tpl_vars['field']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['item']):
?>
                                                    <div class="formbilling formbilling-head" <?php if (! $this->_tpl_vars['field']['items'][0]['pricing_enabled']): ?>style="display: none"<?php endif; ?>>
                                                        <a href="#<?php echo $this->_tpl_vars['paytypeform']; ?>
" <?php if (! $this->_tpl_vars['item']['paytype'] || $this->_tpl_vars['item']['paytype'] == $this->_tpl_vars['paytypeform']): ?>class="active"<?php endif; ?> onclick="formbilling(this);
                                                                return false">Regular</a>
                                                        <?php $_from = $this->_tpl_vars['field']['type']['info']['adformbilling']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['formbilling']):
?>
                                                            <a href="#<?php echo $this->_tpl_vars['formbilling']; ?>
" <?php if ($this->_tpl_vars['item']['paytype'] == $this->_tpl_vars['formbilling']): ?>class="active"<?php endif; ?> 
                                                               onclick="formbilling(this);
                                                                       return false" >
                                                                <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['formbilling']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['formbilling']]; ?>

                                                                <?php else: ?><?php echo $this->_tpl_vars['formbilling']; ?>

                                                                <?php endif; ?>
                                                            </a>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                    </div>
                                                    <div class="clearfix formbilling" id="formbilling" <?php if (! $this->_tpl_vars['field']['items'][0]['pricing_enabled']): ?>style="display: none"<?php endif; ?>>

                                                        <input type="hidden" name="items[<?php echo $this->_tpl_vars['k']; ?>
][id]" value="<?php echo $this->_tpl_vars['item']['id']; ?>
"/>
                                                        <input class="formbilling-paytype" type="hidden" name="items[<?php echo $this->_tpl_vars['k']; ?>
][paytype]" value="<?php echo $this->_tpl_vars['item']['paytype']; ?>
"/>
                                                        <div id="formbilling_<?php echo $this->_tpl_vars['paytypeform']; ?>
" <?php if ($this->_tpl_vars['item']['paytype'] && $this->_tpl_vars['item']['paytype'] != $this->_tpl_vars['paytypeform']): ?>style="display: none"<?php endif; ?>>
                                                            <?php if ($this->_tpl_vars['paytypeform']): ?>
                                                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "formbilling_".($this->_tpl_vars['paytypeform']).".tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                            <?php else: ?>
                                                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'formbilling_Regular.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                            <?php endif; ?>
                                                        </div>

                                                        <?php if ($this->_tpl_vars['field']['type']['info']['adformbilling']): ?>
                                                            <?php $_from = $this->_tpl_vars['field']['type']['info']['adformbilling']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['formbilling']):
?>
                                                                <div id="formbilling_<?php echo $this->_tpl_vars['formbilling']; ?>
" <?php if ($this->_tpl_vars['item']['paytype'] != $this->_tpl_vars['formbilling']): ?>style="display: none"<?php endif; ?>>
                                                                    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "formbilling_".($this->_tpl_vars['formbilling']).".tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                                                </div>
                                                            <?php endforeach; endif; unset($_from); ?>
                                                        <?php endif; ?>
                                                    </div>
                                                <?php endforeach; endif; unset($_from); ?>
                                            </div>
                                            <script type="text/javascript">updatePricingForms();</script>
                                        <?php endif; ?>
                                        <?php if ($this->_tpl_vars['field']['type']['info']['validation']): ?>
                                            <div class="tabb" style="display:none">
                                                <h3><img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" alt="" style="margin-right:5px" class="left"  /> <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>
<?php endif; ?> &raquo; Validation</h3>
                                                <div class="clear"></div><label >Minimum value<small>must be greater than or equal to this value</small></label>
                                                <input type="text" size="2" name="config[minvalue]" id="configMinvalue" value="<?php echo $this->_tpl_vars['field']['config']['minvalue']; ?>
" />
                                                <div class="clear"></div><label >Maximum value<small>Leave blank for no limit</small></label>
                                                <input type="text" size="2" name="config[maxvalue]" id="configMaxvalue" value="<?php echo $this->_tpl_vars['field']['config']['maxvalue']; ?>
" />
                                            </div>
                                        <?php endif; ?>
                                        <div class="tabb" style="display:none">
                                            <h3>
                                                <img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" alt="" 
                                                     style="margin-right:5px" class="left"  /> 
                                                <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                <?php endif; ?> &raquo; Advanced settings
                                            </h3>
                                            <?php if ($this->_tpl_vars['types']): ?>
                                                <div class="clear">
                                                    <label class="nodescr" for="field-type">Field Type</label>
                                                    <select id="field-type" name="type" style="margin: 2px 0 10px 10px;">
                                                        <?php $_from = $this->_tpl_vars['types']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ft']):
?>
                                                            <option value="<?php echo $this->_tpl_vars['ft']['type']; ?>
" <?php if ($this->_tpl_vars['ft']['type'] == $this->_tpl_vars['field']['type']['type']): ?>selected<?php endif; ?>>
                                                                <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['ft']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['ft']['langid']]; ?>

                                                                <?php else: ?><?php echo $this->_tpl_vars['ft']['type']; ?>

                                                                <?php endif; ?>
                                                            </option>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                    </select>
                                                </div>
                                            <?php endif; ?>
                                            <div class="clear">
                                                <label for="text-key">
                                                    CSS Class 
                                                    <small>Field container will be displayed with this css class</small>
                                                </label>
                                                <input id="text-key" type="text" class="w250" name="key" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['key'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" />
                                            </div>
                                            <div class="clear">

                                                <label for="text-category">
                                                    Group 
                                                    <small>Supported by some order pages to group options</small>
                                                </label>
                                                <input id="text-category" type="text" class="w250" name="category" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['category'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" />
                                            </div>
                                            <div class="clear">
                                                <label for="text-variable">
                                                    Variable name 
                                                    <small>To use in emails, custom modules</small>
                                                </label>
                                                <input id="text-variable" type="text" class="w250" name="variable" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['field']['variable'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" />
                                            </div>
                                            <div class="clear">

                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="check-admin" >Admin only<small>Only admin can see this field</small></label>
                                                            <input id="check-admin" type="checkbox" name="options[]" value="4" <?php if ($this->_tpl_vars['field']['options'] & 4): ?>checked="checked"<?php endif; ?> onclick="if ($(this).is(':checked'))
                                                                        $('#check-show, #check-edit, #check-invoice, #check-upgrade, #check-down, #check-charge').removeAttr('checked').attr('disabled', 'disabled');
                                                                    else
                                                                        $('#check-show, #check-edit, #check-invoice, #check-upgrade, #check-down, #check-charge').removeAttr('disabled');"/>
                                                            <div class="clear"></div>
                                                        </td>
                                                        <td>
                                                            <?php if ($this->_tpl_vars['field']['type']['info']['upgrades']): ?><label for="check-upgrade" >Allow Upgrades<small>Can client upgrade after order</small></label>
                                                                <input id="check-upgrade" type="checkbox" name="options[]" value="16" <?php if ($this->_tpl_vars['field']['options'] & 16 || ( $this->_tpl_vars['field']['options'] == '' )): ?>checked="checked"<?php endif; ?>/>
                                                            <?php endif; ?>
                                                        </td>
                                                        <td>
                                                            <?php if ($this->_tpl_vars['field']['type']['info']['upgrades']): ?><label for="check-charge" >Upgrade setup fee<small>Charge setup fee on upgrades&nbsp;or&nbsp;downgrades</small></label>
                                                                <select id="check-charge" class="inp" name="options[]" style="padding: 0; width: 60px; margin-left: 5px;" >
                                                                    <option value="" <?php if (! ( $this->_tpl_vars['field']['options'] & 64 ) && ! ( $this->_tpl_vars['field']['options'] & 128 )): ?>selected="selected"<?php endif; ?>>No</option>
                                                                    <option value="64" <?php if ($this->_tpl_vars['field']['options'] & 64): ?>selected="selected"<?php endif; ?>>Price difference</option>
                                                                    <option value="192" <?php if (( $this->_tpl_vars['field']['options'] & 192 ) == 192): ?>selected="selected"<?php endif; ?>>Full</option>
                                                                </select>
                                                            <?php endif; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="check-show" >Show in cart<small>Display this option during order</small></label>
                                                            <input id="check-show" type="checkbox" name="options[]" value="2" <?php if ($this->_tpl_vars['field']['options'] & 2 || ( $this->_tpl_vars['field']['options'] == '' )): ?>checked="checked"<?php endif; ?>/>
                                                            <div class="clear"></div> 
                                                        </td>
                                                        <td>
                                                            <div class="clear"></div><label for="check-invoice" >Force show in Invoice<small>Include it in invoice even when&nbsp;it's&nbsp;empty or free</small></label>
                                                            <input id="check-invoice" type="checkbox" name="options[]" value="256" <?php if ($this->_tpl_vars['field']['options'] & 256): ?>checked="checked"<?php endif; ?>/>
                                                        </td>
                                                        <td>
                                                            <?php if ($this->_tpl_vars['field']['type']['info']['upgrades']): ?>
                                                                <div class="clear"></div><label for="check-down" >Allow Downgrades<small>Can client downgrade this field</small></label>
                                                                <input id="check-down" type="checkbox" name="options[]" value="32" <?php if ($this->_tpl_vars['field']['options'] & 32 || ( $this->_tpl_vars['field']['options'] == '' )): ?>checked="checked"<?php endif; ?>/>
                                                            <?php endif; ?>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>

                                        <?php $_from = $this->_tpl_vars['field']['type']['templates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tpname'] => $this->_tpl_vars['tp']):
?>
                                            <div class="tabb" style="display:none">
                                                <h3>
                                                    <img src="../includes/libs/configoptions/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
/<?php echo $this->_tpl_vars['field']['type']['type']; ?>
_thumb2.png" 
                                                         alt="" style="margin-right:5px" class="left"  /> 
                                                    <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['type']['langid']]; ?>

                                                    <?php else: ?><?php echo $this->_tpl_vars['field']['type']['type']; ?>

                                                    <?php endif; ?> &raquo; <?php echo $this->_tpl_vars['tpname']; ?>

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
                            (function () {

                                var inputvars = '; ?>
<?php echo ((is_array($_tmp=@$this->_tpl_vars['max_input_vars'])) ? $this->_run_mod_handler('default', true, $_tmp, -1) : smarty_modifier_default($_tmp, -1)); ?>
<?php echo ';
                                if (inputvars >= 0) {
                                    var inputs = $(\'input,select\', \'#facebox\').length;
                                    if (inputs > inputvars)
                                        $(\'#lengthwarning\').show();
                                }

                                var lastTab = $(\'#facebox\').data(\'last-tab\'),
                                    picked = lastTab ? $(\'#lefthandmenu a[href="\' + lastTab + \'"]\').index() || 0 : 0;

                                $(\'#lefthandmenu\').TabbedMenu({elem: \'.tabb\', picked: picked});
                            })()
                        </script>
                    '; ?>

                    <div class="dark_shelf dbottom">
                        <div class="left spinner"><img src="ajax-loading2.gif"></div>
                        <div class="right">
                            <?php if ($this->_tpl_vars['field']['id'] != 'new'): ?>
                                <span class="bcontainer " >
                                    <a href="?cmd=configfields&product_id=<?php echo $this->_tpl_vars['product_id']; ?>
&action=previewfields&highlight=<?php echo $this->_tpl_vars['field']['id']; ?>
" 
                                       class="new_control" target="_blank">
                                        <span class="zoom"><?php echo $this->_tpl_vars['lang']['Preview']; ?>
</span>
                                    </a>
                                </span>
                            <?php endif; ?>
                            <span class="bcontainer " >
                                <a class="new_control greenbtn" href="#" onclick="saveChangesField();
                                            return false"><span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span>
                                </a>
                            </span>
                            <span ><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
                            <span class="bcontainer">
                                <a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                                        return false;">
                                    <span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span>
                                </a>
                            </span>


                        </div>
                        <div class="clear"></div>
                    </div>

                    <?php elseif ($this->_tpl_vars['action'] == 'getduplicateform'): ?>
                        <div id="formloader">
                            <table border="0" cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td width="180" id="s_menu" style="padding-top:40px;" valign="top">
                                        <div id="initial-desc">To save time you can use one fields you've configured before</div>

                                    </td>
                                    <td class="conv_content"  valign="top">
                                        <h3>Duplicate existing field</h3>
                                        <?php if ($this->_tpl_vars['fields']): ?>
                                            <div class="form">
                                                <form id="duplicatefield" class="form-horizontal container-fluid" action="" method="post">
                                                    <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
                                                    <input type="hidden" name="action" value="duplicatefield"/>
                                                    <input type="hidden" name="cmd" value="configfields"/>
                                                    <input type="hidden" name="type" value="<?php echo $this->_tpl_vars['type']; ?>
"/>
                                                    <div class="form-group row">
                                                        <div class="col-sm-3">
                                                            <label for="duplicatefieldselect">Field to duplicate</label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <select name="id" class="chosen-edge form-control" id="duplicatefieldselect">
                                                                <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['f']):
?>
                                                                    <option value="<?php echo $this->_tpl_vars['f']['id']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['f']['catname'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
 - <?php echo ((is_array($_tmp=$this->_tpl_vars['f']['pname'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['f']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
</option>
                                                                <?php endforeach; endif; unset($_from); ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <?php echo smarty_function_securitytoken(array(), $this);?>

                                                </form>
                                                <?php echo '
                                                    <script>//chosen-container-active chosen-with-drop
                                                        setTimeout(function () {
                                                            $(\'#duplicatefieldselect\').chosenedge({width: \'100%\'});
                                                        }, 100);
                                                    </script>
                                                '; ?>

                                            </div>
                                        <?php else: ?> 
                                            <form id="addform" method="post" action="">
                                                <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
                                                <input type="hidden" name="type" value="<?php echo $this->_tpl_vars['type']; ?>
"/>
                                                <input type="hidden" name="cmd" value="configfields"/>
                                                <input type="hidden" name="action" value="getaddform"/>
                                                <?php echo smarty_function_securitytoken(array(), $this);?>

                                            </form>
                                            <div>
                                                There is no field of this type added yet<br/>
                                                <a href="#" onclick="return createField()"><?php echo $this->_tpl_vars['lang']['createnewcfield']; ?>
</a>
                                            </div>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="dark_shelf dbottom">
                            <div class="left spinner"><img src="ajax-loading2.gif"></div>
                            <div class="right">

                                <?php if ($this->_tpl_vars['fields']): ?><span class="bcontainer" ><a href="#" class="new_control greenbtn" onclick="return duplicateFieldSubmit()"><span><?php echo $this->_tpl_vars['lang']['Duplicate']; ?>
</span></a></span>
                                    <span class=""><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span><?php endif; ?>
                                    <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                                            return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>


                                </div>
                                <div class="clear"></div>
                            </div>
                        <?php elseif ($this->_tpl_vars['action'] == 'addconfig'): ?>
                            <div id="formcontainer">
                                <form id="addform" method="post" action="">
                                    <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
                                    <input type="hidden" name="type" value=""/>
                                    <input type="hidden" name="cmd" value="configfields"/>
                                    <input type="hidden" name="action" value="getaddform"/>
                                    <input type="hidden" name="premade" value="" id="premade_to_fill"/>
                                    <input type="hidden" name="premadeurl" value="" id="premadeurl_to_fill"/>
                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                <form id="duplicateform" method="post" action="">
                                    <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
                                    <input type="hidden" name="type" value=""/>
                                    <input type="hidden" name="cmd" value="configfields"/>
                                    <input type="hidden" name="action" value="getduplicateform"/>
                                    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                <div id="formloader" class="form-horizontal">
                                    <table border="0" cellspacing="0" cellpadding="0" border="0" width="100%">
                                        <tr>
                                            <td width="180" id="s_menu" style="" valign="top">
                                                <div id="initial-desc">Start by selecting field type, you will be able to configure it, add pricing, validation etc. in next steps.</div>
                                                <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ft'] => $this->_tpl_vars['f']):
?><?php $_from = $this->_tpl_vars['f']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
                                                        <div style="display:none" class="description" id="<?php echo $this->_tpl_vars['field']['type']; ?>
-description"><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['description']]; ?>
</div>
                                                <?php endforeach; endif; unset($_from); ?><?php endforeach; endif; unset($_from); ?>
                                                <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ft'] => $this->_tpl_vars['f']):
?><?php $_from = $this->_tpl_vars['f']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
                                                        <div class="descr_image" id="<?php echo $this->_tpl_vars['field']['type']; ?>
-descr_image" style="display:none;background:url('<?php echo $this->_tpl_vars['field']['image']; ?>
') no-repeat top left;"></div>
                                                <?php endforeach; endif; unset($_from); ?><?php endforeach; endif; unset($_from); ?>
                                            </td>
                                            <td class="conv_content"  valign="top">
                                                <h3>
                                                    Select field type
                                                </h3>
                                                <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ft'] => $this->_tpl_vars['f']):
?>
                                                    <fieldset>
                                                        <legend><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['ft']]; ?>
</legend>
                                                        <?php $_from = $this->_tpl_vars['f']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
                                                            <div class="fselect"><input type="radio" value="<?php echo $this->_tpl_vars['field']['type']; ?>
" name="type" id="field<?php echo $this->_tpl_vars['field']['type']; ?>
" onclick="fieldclick('<?php echo $this->_tpl_vars['field']['type']; ?>
');"/> <label for="field<?php echo $this->_tpl_vars['field']['type']; ?>
"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['field']['langid']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['field']['langid']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['field']['type']; ?>
<?php endif; ?></label></div>
                                                            <?php endforeach; endif; unset($_from); ?>
                                                        <div class="clear"></div>
                                                    </fieldset>
                                                <?php endforeach; endif; unset($_from); ?>

                                                <div class="form shownice tabb" id="premadeloader" style="display:none"></div>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="dark_shelf dbottom">
                                    <div class="left spinner"><img src="ajax-loading2.gif"></div>
                                    <div class="right">

                                        <span class="bcontainer dhidden" style="display:none"><a class="new_control greenbtn" href="#" onclick="return createField()"><span><?php echo $this->_tpl_vars['lang']['createnewcfield']; ?>
</span></a></span>
                                        <span class="bcontainer dhidden" style="display:none"><a href="#" class="submiter menuitm" onclick="return duplicateField()"><span>Duplicate existing field</span></a></span>
                                        <span class="dhidden" style="display:none"><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
                                        <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                                                return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>


                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>




                        <?php elseif ($this->_tpl_vars['action'] == 'helper'): ?>
                            <?php if ($this->_tpl_vars['do'] == 'getotherfields'): ?>
                                <?php if ($this->_tpl_vars['fields']): ?>
                                    <select style="margin: 26px 0px 0px;;float:left;" id="condition_field_target"  name="config[conditional][new][target]" onchange="$('#condition_field_targetname').val($('#condition_field_target option[value=' + $(this).val() + ']').text());">
                                        <?php $_from = $this->_tpl_vars['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['f']):
?>
                                            <option value="<?php echo $this->_tpl_vars['f']['id']; ?>
"><?php echo $this->_tpl_vars['f']['name']; ?>
</option>
                                        <?php endforeach; endif; unset($_from); ?>
                                    </select>
                                    <input type="hidden" name="config[conditional][new][targetname]" id="condition_field_targetname" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['fields'][0]['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" />

                                <?php else: ?>
                                    Add other fields first.
                                <?php endif; ?>
                                <?php if ($this->_tpl_vars['fields'] && $this->_tpl_vars['setval']): ?>
                                    <div class="padding:5px 2px;float:left">To</div>
                                    <input type="text" size="3" id="condition_field_value" style="margin:0px;float:left;"  name="config[conditional][new][targetval]"/>

                                <?php endif; ?>

                            <?php endif; ?>

                        <?php endif; ?>