<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from ajax.tasklist.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'ajax.tasklist.tpl', 213, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'assigntask' || ( $this->_tpl_vars['action'] == 'taskdetails' && $this->_tpl_vars['task']['id'] )): ?><?php echo '

<style type="text/css">
    #msgcomposer input, #msgcomposer select, #msgcomposer textarea {
        float:none !important;
        clear:none !important;
        margin:auto !important;
    }
    .pricingtable input {
        float:none !important;
        margin:0px !important;
    }
    .modernfacebox .form input,   .modernfacebox .form select {
    margin: 2px 0 20px 10px !important;
}
</style>
<script type="text/javascript">

    function wbw(val) {
        $(\'#what_before, #what_after\').hide();
        $(\'#what_\'+val).show();
        if(val==\'before\') {
            if($(\'#interval_type\').val()==\'MINUTE\')
                $(\'#interval_type\').val(\'HOUR\');
            $(\'#interval_type option:eq(2)\').hide();
        } else {
            $(\'#interval_type option:eq(2)\').show();
        }
    }
       
    function saveChangesTask() {
        $(\'.spinner\',\'#facebox\').show();
        ajax_update(\'index.php?cmd=tasklist&x=\'+Math.random(),$(\'#saveform\').serializeObject(),function(){
            refreshTaskView($(\'#saveform\').find(\'input[name=product_id]\').val());
            $(document).trigger(\'close.facebox\');
        });
    }
    function changeTaskType(taskid,place) {
        $(\'#msgcomposer\').html(\'\').show();
        if(taskid==0) {
            $(\'#taskoptions\').hide();
            $(\'#usepredefined\',\'#facebox\').show();
            $(\'#savechanges\',\'#facebox\').hide();
            return false;
        }
        $(\'#savechanges\',\'#facebox\').show();
        $(\'#usepredefined\',\'#facebox\').hide();
        $(\'.spinner\',\'#facebox\').show();
        $.post(\'?cmd=tasklist&action=taskdetails\',{task:taskid,place:place},function(data){
            var d= parse_response(data);
            $(\'.spinner\',\'#facebox\').hide();
            if(typeof(d)==\'string\') {
                $(\'#taskoptions\').html(d).show();
            }
        });
    }
    function composemsg(href) {
        $(\'#msgcomposer\').html(\'\').show();
        ajax_update(href,false,\'#msgcomposer\');
    }
</script>
'; ?>
<?php endif; ?><?php if ($this->_tpl_vars['cmd'] == 'services' || $this->_tpl_vars['action'] == 'getproducttasks' || $this->_tpl_vars['cmd'] == 'accounts' || $this->_tpl_vars['cmd'] == 'domains'): ?>
<?php if ($this->_tpl_vars['tasks']): ?>
<b>Custom automation tasks: </b>
<div class="p5">
    <table width="100%" cellspacing="0" cellpadding="6" border="0">

        <?php $_from = $this->_tpl_vars['tasks']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['task']):
?>
        <tr  class="havecontrols"><td width="80">
                <div>
                    <a href="#"class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['Edit']; ?>
" 
                       onclick="return TaskDetails(<?php echo $this->_tpl_vars['task']['id']; ?>
,<?php echo $this->_tpl_vars['product_id']; ?>
);" style="">
                        <span class="editsth"></span>
                    </a>
                    <a  href="#" class="menuitm menu-auto" title="<?php echo $this->_tpl_vars['lang']['Remove']; ?>
"  
                        onclick="return removeTask(<?php echo $this->_tpl_vars['product_id']; ?>
,<?php echo $this->_tpl_vars['task']['id']; ?>
);">
                        <span class="delsth"></span>
                    </a>
                </div>
            </td>
            <td align="left">
                <?php echo $this->_tpl_vars['task']['interval']; ?>
 <?php if ($this->_tpl_vars['task']['interval_type'] == 'DAY'): ?><?php echo $this->_tpl_vars['lang']['days']; ?>
<?php elseif ($this->_tpl_vars['task']['interval_type'] == 'MINUTE'): ?><?php echo $this->_tpl_vars['lang']['minutes']; ?>
<?php else: ?><?php echo $this->_tpl_vars['lang']['hours']; ?>
<?php endif; ?> <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['task']['when']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['when']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['task']['when']; ?>
<?php endif; ?> <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['task']['event']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['event']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['task']['event']; ?>
<?php endif; ?>
                -
                <?php if ($this->_tpl_vars['task']['action_config']['email_id']): ?><a href="?cmd=emailtemplates&action=edit&id=<?php echo $this->_tpl_vars['task']['action_config']['email_id']; ?>
" target="_blank"><?php endif; ?>
                    <?php if ($this->_tpl_vars['task']['langid']): ?> <?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['langid']]; ?>
<?php elseif ($this->_tpl_vars['task']['name']): ?><?php echo $this->_tpl_vars['task']['name']; ?>
 <?php else: ?><?php echo $this->_tpl_vars['task']['task']; ?>
<?php endif; ?>
                    <?php if ($this->_tpl_vars['task']['action_config']['email_id']): ?></a><?php endif; ?>
            </td>
        </tr>
        <?php endforeach; endif; unset($_from); ?>
        <tr><td colspan="2"><a id="addnew_addon_btn" onclick="return assignNewTask(<?php echo $this->_tpl_vars['product_id']; ?>
);" class="new_control" href="#"><span class="addsth">Add new custom task</span></a></td></tr>
    </table>
</div>
<?php endif; ?>
<script type="text/javascript">

    <?php echo '
    var HBTasklist={};
    HBTasklist.place = '; ?>
"<?php echo $this->_tpl_vars['place']; ?>
"<?php echo ';
    HBTasklist.pid = '; ?>
"<?php echo $this->_tpl_vars['product_id']; ?>
"<?php echo ';
    function assignNewTask(pid,place) {
        if(!place || place==undefined)
            place=HBTasklist.place;
        $.facebox({ ajax: "?cmd=tasklist&action=assigntask&product_id="+pid+"&place="+place,width:900,nofooter:true,opacity:0.5,addclass:\'modernfacebox\' });
        return false;
    }
    function TaskDetails(id,pid) {
        $.facebox({ ajax: "?cmd=tasklist&action=taskdetails&id="+id+\'&product_id=\'+pid,width:900,nofooter:true,opacity:0.5,addclass:\'modernfacebox\' });
        return false;
    }
    function removeTask(pid,id) {
        if(confirm("'; ?>
<?php echo $this->_tpl_vars['lang']['task_remove_confirm']; ?>
<?php echo '"))
            ajax_update(\'index.php?cmd=tasklist&action=getproducttasks\',{product_id:pid,make:\'removetask\',task:id,place:HBTasklist.place},"#tasklistloader");
        return false;
    }
		
    function refreshTaskView(pid) {
        ajax_update(\'index.php?cmd=tasklist&action=getproducttasks\',{product_id:pid,place:HBTasklist.place},"#tasklistloader");
    }
    '; ?>

</script>
<?php elseif ($this->_tpl_vars['action'] == 'taskdetails' && $this->_tpl_vars['task']): ?>
<?php if ($this->_tpl_vars['task']['id']): ?>

<div id="formcontainer">
    <div id="formloader" style="background:#fff;padding:10px;">
        <form action="" method="post" id="saveform">
            <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
            <input type="hidden" name="make" value="savechanges" />
            <input type="hidden" name="action" value="savetask" />
            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['task']['id']; ?>
" />
            <div class="tabb">
                <h3 style="margin:0px;">Edit task: <?php echo $this->_tpl_vars['task']['name']; ?>
</h3>
                <div class="clear"></div>

                <div class="form" style="margin:10px 0px">

                    <label class="nodescr">Task:</label>
                    <input type="text" disabled="disabled" value="<?php if ($this->_tpl_vars['task']['langid']): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['langid']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['task']['name']; ?>
<?php endif; ?>" class="w250" />

                    <div class="clear"></div>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['task']['description']): ?><div class="clear" style="padding: 5px 0px 15px 160px;font-size:11px;color:#707070"><?php echo $this->_tpl_vars['task']['description']; ?>
</div><?php endif; ?>
                    <label class="nodescr">Execute</label>
                    <input name="days" size="2" value="<?php if ($this->_tpl_vars['task']['interval']): ?><?php echo $this->_tpl_vars['task']['interval']; ?>
<?php else: ?>1<?php endif; ?>" type="text"  />
                    <select name="interval_type" id="interval_type">
                        <option value="DAY" <?php if ($this->_tpl_vars['task']['interval_type'] == 'DAY'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['days']; ?>
</option>
                        <option value="HOUR" <?php if ($this->_tpl_vars['task']['interval_type'] == 'HOUR'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['hours']; ?>
</option>
                        <option value="MINUTE" <?php if ($this->_tpl_vars['task']['interval_type'] == 'MINUTE'): ?>selected="selected"<?php endif; ?> <?php if ($this->_tpl_vars['task']['when'] == 'before' || ! $this->_tpl_vars['task']['id']): ?>style="display:none"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['minutes']; ?>
</option>
                    </select>
                    <select name="when" onchange="wbw($(this).val())">
                        <?php if ($this->_tpl_vars['task']['havebefore']): ?> <option value="before" <?php if ($this->_tpl_vars['task']['when'] == 'before'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['before']; ?>
</option><?php endif; ?>
                        <?php if ($this->_tpl_vars['task']['haveafter']): ?>  <option value="after" <?php if ($this->_tpl_vars['task']['when'] == 'after'): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['after']; ?>
</option><?php endif; ?>
                    </select>
                    <?php if ($this->_tpl_vars['task']['havebefore']): ?>
                    <select name="what_before" id="what_before" <?php if ($this->_tpl_vars['task']['when'] == 'after'): ?>style='display:none'<?php endif; ?>>
                            <?php $_from = $this->_tpl_vars['task']['events']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['eventname'] => $this->_tpl_vars['event']):
?>
                            <?php if ($this->_tpl_vars['event']['before']): ?> <option value="<?php echo $this->_tpl_vars['eventname']; ?>
" <?php if ($this->_tpl_vars['eventname'] == $this->_tpl_vars['task']['event']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['eventname']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['eventname']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['eventname']; ?>
<?php endif; ?></option><?php endif; ?>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
						<?php endif; ?>
                    <?php if ($this->_tpl_vars['task']['haveafter']): ?>
                    <select name="what_after" id="what_after"  <?php if ($this->_tpl_vars['task']['havebefore'] && $this->_tpl_vars['task']['when'] != 'after'): ?>style="display:none"<?php endif; ?>>
                            <?php $_from = $this->_tpl_vars['task']['events']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['eventname'] => $this->_tpl_vars['event']):
?>
                            <?php if ($this->_tpl_vars['event']['after']): ?> <option value="<?php echo $this->_tpl_vars['eventname']; ?>
" <?php if ($this->_tpl_vars['eventname'] == $this->_tpl_vars['task']['event']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['eventname']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['eventname']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['eventname']; ?>
<?php endif; ?></option><?php endif; ?>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
						<?php endif; ?>
                    <div class="clear"></div>

                    <?php $_from = $this->_tpl_vars['task']['config']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['conf']):
?>
                    <label class="nodescr"><?php echo $this->_tpl_vars['conf']['name']; ?>
</label>
                    <?php if ($this->_tpl_vars['k'] == 'email_id'): ?>

                    <div id="new_taskmail_msg"><select name="config[email_id]"  >
                            <?php $_from = $this->_tpl_vars['conf']['default']['All']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['email']):
?>
                            <option value="<?php echo $this->_tpl_vars['email']['id']; ?>
" <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['email']['id']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['email']['tplname']; ?>
</option>
                            <?php endforeach; endif; unset($_from); ?>
                        </select></div>
                    <div class="left" style="padding-top:7px">
                        <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
 </span>
                        <a href="?cmd=emailtemplates&action=add&inline=true&to=new_taskmail&dontclose=true" class="new_control colorbox"  target="_blank" onclick="composemsg($(this).attr('href'));return false;"><span class="addsth" ><?php echo $this->_tpl_vars['lang']['composenewmsg']; ?>
</span></a>

                    </div>


                    <?php else: ?>
						<?php if ($this->_tpl_vars['conf']['type'] == 'select'): ?>
                    <select name="config[<?php echo $this->_tpl_vars['k']; ?>
]"  >
                        <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
                        <option  <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['i']): ?>selected="selected"<?php endif; ?>><?php echo $this->_tpl_vars['i']; ?>
</option>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
						<?php elseif ($this->_tpl_vars['conf']['type'] == 'loadable'): ?>
                    <select name="config[<?php echo $this->_tpl_vars['k']; ?>
]"  >
                        <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
                        <option value="<?php if ($this->_tpl_vars['i']['id']): ?><?php echo $this->_tpl_vars['i']['id']; ?>
<?php else: ?><?php echo $this->_tpl_vars['i']['name']; ?>
<?php endif; ?>"  <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['i']['id']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['i']['name']): ?><?php echo $this->_tpl_vars['i']['name']; ?>
<?php endif; ?></option>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
						<?php elseif ($this->_tpl_vars['conf']['type'] == 'textarea'): ?>
                    <textarea name="config[<?php echo $this->_tpl_vars['k']; ?>
]"  style="width:600px" rows="6"><?php echo $this->_tpl_vars['conf']['value']; ?>
</textarea>
						<?php elseif ($this->_tpl_vars['conf']['type'] == 'input'): ?>
                    <input name="config[<?php echo $this->_tpl_vars['k']; ?>
]" class="w250" rows="6" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" type="text" />

						<?php endif; ?>

                    <?php endif; ?>
                    <div class="clear"></div>
                    <?php endforeach; endif; unset($_from); ?>



                    <?php if ($this->_tpl_vars['task']['id']): ?>
                </div></div><?php echo smarty_function_securitytoken(array(), $this);?>
</form><div id="msgcomposer"></div></div>
    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span id="savechanges" >
                <span class="bcontainer " ><a class="new_control greenbtn" href="#" onclick="saveChangesTask(); return false"><span><b><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</b></span></a></span>
                <span ><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
            </span>
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>
        </div>
        <div class="clear"></div>
    </div>
</div>

<?php endif; ?>

<?php elseif ($this->_tpl_vars['action'] == 'assigntask'): ?>
<div id="formcontainer">
    <div id="formloader" style="background:#fff;padding:10px;">
        <form action="" method="post" id="saveform">
            <input type="hidden" name="product_id" value="<?php echo $this->_tpl_vars['product_id']; ?>
"/>
            <input type="hidden" name="make" value="savechanges" />
            <input type="hidden" name="action" value="savetask" />
            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['task']['id']; ?>
" />
            <input type="hidden" name="place" value="<?php echo $this->_tpl_vars['place']; ?>
" />
            <div class="tabb">
                <h3 style="margin:0px;">Create new custom automation task</h3>
                <div class="clear"><small>You can schedule any taks to be executed automatically on certain events</small></div>

                <div class="form" style="margin:10px 0px">

                    <label class="nodescr">Task:</label>
                    <select class="w250" name="task" onchange="changeTaskType($(this).val(),'<?php echo $this->_tpl_vars['place']; ?>
');" >
                        <option value="0">Select task type</option>
                        <?php $_from = $this->_tpl_vars['tasks']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['task']):
?>
                        <option value="<?php echo $this->_tpl_vars['k']; ?>
"><?php if ($this->_tpl_vars['task']['langid']): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['task']['langid']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['task']['name']; ?>
<?php endif; ?></option>
                        <?php endforeach; endif; unset($_from); ?>
                    </select>
                    <div class="clear"></div>
                    <div id="taskoptions" style="display:none">

                    </div>
				<?php if ($this->_tpl_vars['premade']): ?>	<div id="usepredefined" class="shownice" style="padding:5px 0px">
                        <div class="clear"></div><label>Premade tasks<small>To save configuration time you can use premade tasks</small></label>
                        <select onchange="$('#savechanges').hide(); if($(this).val()=='1')$('#loadurl').show();else if($(this).val()=='0') $('#loadurl').hide(); else <?php echo '{ $(\'#loadurl\').hide(); $(\'#savechanges\').show(); }'; ?>
" id="premade_val" style="width:120;margin-right:10px;" name="premade">
                            <option value="0">None</option>
                            <!--<option style="font-weight:bold" value="1">Load from URL</option>-->
						<?php $_from = $this->_tpl_vars['premade']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?>
                            <option value="<?php echo $this->_tpl_vars['p']['file']; ?>
"><?php echo $this->_tpl_vars['p']['name']; ?>
</option>
						<?php endforeach; endif; unset($_from); ?>
                        </select>
                        <div class="fs11" style="padding: 2px ">
                            <!--
						<strong>You can also find other premade tasks here:</strong>
						<a class="external" target="_blank" href="http://hostbillapp.com/fastconfig/forms/">http://hostbillapp.com/fastconfig/forms/</a>
						-->
                        </div>
                        <div class="clear"></div>
                        <div style="display:none" id="loadurl">
                            <label>Step 1. <small>Paste <a target="_blank" href="http://hostbillapp.com/fastconfig/forms/">config url</a></small></label>
                            <input type="text" id="premadeurl_val" name="premadeurl" class="w250"><div class="clear"></div>
                            <label>Step 2. <small>Submit and verify setup</small></label>
                            <div class="left" style="margin:2px 10px">
                                <span class="bcontainer dhidden" style=""><a class="new_control greenbtn" href="#" onclick="return createField()"><span>Crate new task</span></a></span>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div><?php endif; ?>
                </div>
            </div>

            <?php echo smarty_function_securitytoken(array(), $this);?>
</form>

        <div id="msgcomposer"></div>


    </div>
    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span id="savechanges" style="display:none">
                <span class="bcontainer " ><a class="new_control greenbtn" href="#" onclick="saveChangesTask(); return false"><span><b><?php echo $this->_tpl_vars['lang']['addnewtask']; ?>
</b></span></a></span>
                <span ><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
            </span>
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>
        </div>
        <div class="clear"></div>
    </div>

</div>
<?php endif; ?>