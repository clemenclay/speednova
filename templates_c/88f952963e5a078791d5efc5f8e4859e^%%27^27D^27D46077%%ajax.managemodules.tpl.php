<?php /* Smarty version 2.6.26, created on 2018-06-11 12:31:37
         compiled from ajax.managemodules.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'ajax.managemodules.tpl', 72, false),array('function', 'hbinput', 'ajax.managemodules.tpl', 460, false),array('modifier', 'strtolower', 'ajax.managemodules.tpl', 96, false),array('modifier', 'explode', 'ajax.managemodules.tpl', 540, false),array('modifier', 'trim', 'ajax.managemodules.tpl', 544, false),array('modifier', 'escape', 'ajax.managemodules.tpl', 667, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'getlatest'): ?><?php if ($this->_tpl_vars['latest']): ?>
        <?php $_from = $this->_tpl_vars['latest']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['feed']):
        $this->_foreach['floop']['iteration']++;
?>
            <div class="addon_module addon_module_new" <?php if (($this->_foreach['floop']['iteration'] == $this->_foreach['floop']['total'])): ?>style="border:none"<?php endif; ?>>
                <strong><a href="<?php echo $this->_tpl_vars['feed']['link']; ?>
" title="<?php echo $this->_tpl_vars['feed']['title']; ?>
" target="_blank"><?php echo $this->_tpl_vars['feed']['title']; ?>
</a></strong><br />
                <span style="color:#B0B0B0;font-size:11px;"><?php echo $this->_tpl_vars['feed']['pubDate']; ?>
</span><br/>
                <?php echo $this->_tpl_vars['feed']['description']; ?>

            </div>

        <?php endforeach; endif; unset($_from); ?>

<?php endif; ?><?php elseif ($this->_tpl_vars['action'] == 'ajaxactivate'): ?><script type="text/javascript"><?php echo '
    function gdesc(itm) {

        var el = $(itm).hide();
        $.post(\'?cmd=managemodules&action=getdescr&module=\' + $(itm).attr(\'rel\') + \'&type='; ?>
<?php echo $this->_tpl_vars['target']; ?>
<?php echo '\', {empty1r: \'asas\'}, function (data) {
            var resp = parse_response(data);
            if (resp) {
                $(\'#descr-\' + el.attr(\'target\')).html(resp).slideDown();
            }
        });
        return false;
    }
    function findModuleList(el) {
        var v = $(el).val();
        $(\'#grab-sorter .module_li\').show();
        if (v == \'\')
            return false;
        $(\'#grab-sorter .module_li\').each(function () {
            if ($(this).attr(\'id\').toString().search(new RegExp(v, "i")) < 0)
                $(this).hide();
        });
        return false;
    }
        '; ?>

    </script>
    <div class="mod_desc" style="margin-bottom:0px;border-radius:5px 5px 0px 0px">
        <div class="headshelf">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="mrow1" width="50%"><strong><?php echo $this->_tpl_vars['lang']['Module']; ?>
</strong></td>
                    <td class="mrow1"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
</strong></td>

                </tr>
            </table>
        </div>

        <div class="mmdescr" style="height:330px;overflow:auto">
            <ul id="grab-sorter" style="width:100%">
                <?php $_from = $this->_tpl_vars['avail_modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['modfor'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['modfor']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['b']):
        $this->_foreach['modfor']['iteration']++;
?>
                    <li  style="background:#ffffff" id="row_<?php echo $this->_tpl_vars['b']['filename']; ?>
" class="module_li">
                        <div>
                            <form name="" action="?cmd=managemodules&action=<?php echo $this->_tpl_vars['target']; ?>
" method="post" <?php if ($this->_tpl_vars['callback']): ?>onsubmit="<?php echo $this->_tpl_vars['callback']; ?>
"<?php endif; ?>>
                                <input type="hidden" name="modulename" value="<?php echo $this->_tpl_vars['b']['filename']; ?>
" />
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="mrow1" width="50%" valign="top">
                                            <div style="padding-bottom:10px" class="left"><strong><?php echo $this->_tpl_vars['b']['name']; ?>
</strong></div>
                                            <div style="text-align:right;padding:5px 0px"  class="right">
                                                <a class="new_control greenbtn" href="#" onclick="$('#activate-btn-<?php echo $this->_tpl_vars['b']['key']; ?>
').click();
                                                        return false;"><span ><?php echo $this->_tpl_vars['lang']['Activate']; ?>
</span></a>
                                            </div>
                                            <div class="clear"></div>
                                            <input type="submit" value="<?php echo $this->_tpl_vars['lang']['Activate']; ?>
"  name="activate" style="display:none" id="activate-btn-<?php echo $this->_tpl_vars['b']['key']; ?>
"/>
                                        </td>
                                        <td class="mrow1" valign="top">
                                            <div style="padding-bottom:10px" id="descr-<?php echo $this->_tpl_vars['b']['key']; ?>
" class="left">&nbsp;</div>
                                            <div style="padding:5px 0px" class="left"> <a   class="new_control loaddescr" rel="<?php echo $this->_tpl_vars['b']['filename']; ?>
" target="<?php echo $this->_tpl_vars['b']['key']; ?>
" href="#" onclick="return gdesc(this)"><span ><strong><?php echo $this->_tpl_vars['lang']['loaddetails']; ?>
</strong></span></a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <?php echo smarty_function_securitytoken(array(), $this);?>

                            </form>
                        </div>
                    </li>
                <?php endforeach; endif; unset($_from); ?>
            </ul>
        </div>
    </div>
    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="left fs11" style="color:white"><span class="left">Search: </span><div class="spinner left" style="display:block;margin-left:5px;"><input type="text" id="searchin" style="font-size:11px !important;" onkeyup="findModuleList(this)" /></div><div class="clear"></div></div>
        <div class="right">
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick="$(document).trigger('close.facebox');
                    return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>
        </div>
        <div class="clear"></div>
    </div>
<?php elseif ($this->_tpl_vars['action'] == 'searchmodule'): ?>
    <?php if ($this->_tpl_vars['result']): ?>
        <?php $_from = $this->_tpl_vars['result']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['module']):
        $this->_foreach['floop']['iteration']++;
?> 
            <div class="addon_module"  <?php if (($this->_foreach['floop']['iteration'] == $this->_foreach['floop']['total'])): ?>style="border:none"<?php endif; ?>>
                <div class="left">
                    <strong>
                        <?php if ($this->_tpl_vars['module']['active'] == '1'): ?>
                            <a href="?cmd=managemodules&action=<?php echo ((is_array($_tmp=$this->_tpl_vars['module']['type'])) ? $this->_run_mod_handler('strtolower', true, $_tmp) : strtolower($_tmp)); ?>
&expand=true&id=<?php echo $this->_tpl_vars['module']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"><?php echo $this->_tpl_vars['module']['modname']; ?>
</a>
                        <?php else: ?>
                            <a href="?cmd=managemodules&action=<?php echo ((is_array($_tmp=$this->_tpl_vars['module']['type'])) ? $this->_run_mod_handler('strtolower', true, $_tmp) : strtolower($_tmp)); ?>
&do=inactive&&expand=true&id=<?php echo $this->_tpl_vars['module']['filename']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"><?php echo $this->_tpl_vars['module']['modname']; ?>
</a>
                        <?php endif; ?>
                    </strong>
                    <br />
                    <?php echo $this->_tpl_vars['module']['description']; ?>

                </div>
                <div class="right">
                    <?php if ($this->_tpl_vars['module']['active'] == '1'): ?>
                        <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&expand=true&id=<?php echo $this->_tpl_vars['module']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="menuitm disabled">
                            <span>Activated</span>
                        </a> 
                    <?php else: ?>
                        <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&activate&modulename=<?php echo $this->_tpl_vars['module']['filename']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="new_control greenbtn">
                            <span>Activate</span>
                        </a> 
                    <?php endif; ?>

                </div>
                <div class="clear"></div></div>
            <?php endforeach; endif; unset($_from); ?>
        <?php else: ?>
        <center>
            <strong><?php echo $this->_tpl_vars['lang']['nothingtodisplay']; ?>
</strong>
        </center>
    <?php endif; ?>
<?php elseif ($this->_tpl_vars['action'] == 'getdescr'): ?>
    <?php if ($this->_tpl_vars['details']): ?>
        <?php if ($this->_tpl_vars['details']['modname']): ?><strong><?php echo $this->_tpl_vars['lang']['modulename']; ?>
: </strong><?php echo $this->_tpl_vars['details']['modname']; ?>
<br /><?php endif; ?>
        <?php if ($this->_tpl_vars['details']['version']): ?><strong><?php echo $this->_tpl_vars['lang']['version']; ?>
: </strong><?php echo $this->_tpl_vars['details']['version']; ?>
<br /><?php endif; ?>
        <?php if ($this->_tpl_vars['details']['filename']): ?><strong><?php echo $this->_tpl_vars['lang']['filename']; ?>
: </strong><?php echo $this->_tpl_vars['details']['filename']; ?>
<br /><?php endif; ?>
    <?php if ($this->_tpl_vars['details']['type'] == 'Payment'): ?><strong><?php echo $this->_tpl_vars['lang']['supcurrencies']; ?>
: </strong><?php if ($this->_tpl_vars['details']['currencies']): ?><?php echo $this->_tpl_vars['details']['currencies']; ?>
<?php else: ?><?php echo $this->_tpl_vars['lang']['All']; ?>
<?php endif; ?><br /><?php endif; ?>
    <?php if ($this->_tpl_vars['details']['txt']): ?><strong><?php echo $this->_tpl_vars['lang']['detaileddescr']; ?>
: </strong><?php echo $this->_tpl_vars['details']['txt']; ?>
<br /><?php endif; ?>
    <?php if ($this->_tpl_vars['details']['author']): ?><strong><?php echo $this->_tpl_vars['lang']['author']; ?>
: </strong><?php echo $this->_tpl_vars['details']['author']; ?>
&nbsp;&nbsp;<?php endif; ?> <?php if ($this->_tpl_vars['details']['website']): ?><a href="<?php echo $this->_tpl_vars['details']['website']; ?>
" target="_blank"><?php echo $this->_tpl_vars['details']['website']; ?>
</a>&nbsp;&nbsp;<?php endif; ?>
    <?php if ($this->_tpl_vars['details']['wiki']): ?><strong><?php echo $this->_tpl_vars['lang']['wiki']; ?>
: </strong><a href="<?php echo $this->_tpl_vars['details']['wiki']; ?>
" target="_blank"><?php echo $this->_tpl_vars['details']['wiki']; ?>
</a><br /><?php endif; ?>
    <?php if ($this->_tpl_vars['details']['cron'] == 'add'): ?><div class="important_notify"><?php echo $this->_tpl_vars['lang']['havecron']; ?>
 <a href="?cmd=configuration&action=cron&viewaddform=true" target="_blank" class="editbtn"><strong><?php echo $this->_tpl_vars['lang']['clicktoadd']; ?>
</strong></a></div><?php endif; ?>
            <?php endif; ?>
        <?php elseif ($this->_tpl_vars['action'] == 'quickactivate'): ?>
            <?php if ($this->_tpl_vars['modconfig']['config']): ?>
                <?php echo '
        <script type="text/javascript">
            function submit_externalc(f) {
                var s = $(f).serialize();
                $(\'#facebox .spinner\').show();
                $.post(\'?cmd=managemodules&action='; ?>
<?php echo $this->_tpl_vars['type']; ?>
<?php echo '&\' + s, {changeconfig: true}, function () {
                    $(document).trigger(\'close.facebox\');
                });
                return false;
            }
        </script>
    '; ?>

    <div style="padding:10px;background:#fff;" class="form conv_content">
        <h3><?php echo $this->_tpl_vars['modconfig']['module']; ?>
 Configuration</h3>
        <form action="" method="post" onsubmit="return submit_externalc(this);" >
            <input type="hidden" name="filename" value="<?php echo $this->_tpl_vars['modconfig']['filename']; ?>
" />
            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['modconfig']['id']; ?>
" />

            <table border="0" width="100%" cellpadding="5" cellspacing="0">
                <?php $_from = $this->_tpl_vars['modconfig']['config']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['conf']):
?>
                    <tr >
                        <?php $this->assign('name', $this->_tpl_vars['k']); ?>
                        <?php $this->assign('name2', $this->_tpl_vars['modconfig']['module']); ?>
                        <?php $this->assign('baz', ($this->_tpl_vars['name2']).($this->_tpl_vars['name'])); ?>

                        <?php if ($this->_tpl_vars['conf']['type'] == 'input'): ?>
                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>   
                            <td ><input type="text" name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" style="margin:0px" /></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'password'): ?>
                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>   <td ><input type="password" autocomplete="off" name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" style="margin:0px" /></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'check'): ?>
                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>  <td ><input name="option[<?php echo $this->_tpl_vars['k']; ?>
]" type="checkbox" value="1" <?php if ($this->_tpl_vars['conf']['value'] == '1'): ?>checked="checked"<?php endif; ?> style="margin:0px"  /></td>
                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'select'): ?>
                            <td width="170" align="right"> <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>: </td>  <td >
                                <select name="option[<?php echo $this->_tpl_vars['k']; ?>
]" style="margin:0px" >
                                    <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['selectopt']):
?>
                                        <option <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['selectopt']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['selectopt']; ?>
</option>
                                    <?php endforeach; endif; unset($_from); ?>
                                </select> 
                            </td>
                        <?php elseif ($this->_tpl_vars['conf']['type'] == 'textarea'): ?>
                            <td colspan="2"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:<br />
                                <span style="vertical-align:top"><textarea name="option[<?php echo $this->_tpl_vars['k']; ?>
]" rows="5" cols="60" style="margin:0px" ><?php echo $this->_tpl_vars['conf']['value']; ?>
</textarea></span>
                            </td>
                        <?php endif; ?>
                    </tr>
                <?php endforeach; endif; unset($_from); ?>
            </table>   
            <input type="submit" value="submit" style="display:none" id="moduleconfigsubmit" />
        </form>
    </div>
    <div class="dark_shelf dbottom">
        <div class="left spinner"><img src="ajax-loading2.gif"></div>
        <div class="right">
            <span class="bcontainer " ><a class="new_control greenbtn" href="#" onclick="$('#moduleconfigsubmit').click();
                    return false;"><span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span></a></span>
            <span ><?php echo $this->_tpl_vars['lang']['Or']; ?>
</span>
            <span class="bcontainer"><a href="#" class="submiter menuitm" onclick=" saveProductFull();
                    return false;"><span><?php echo $this->_tpl_vars['lang']['Close']; ?>
</span></a></span>
        </div>
        <div class="clear"></div>
    </div>
<?php endif; ?>
<?php elseif ($this->_tpl_vars['action'] == 'default'): ?>

    <div class="container-fluid clear" style="padding-top:14px">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <form action="" method="post" onsubmit="return perform_search()">
                    <div class="input-group">
                        <input type="text" value="<?php echo $this->_tpl_vars['lang']['missingm']; ?>
" name="search-input"  class="form-control" onclick="if ($(this).val() == '<?php echo $this->_tpl_vars['lang']['missingm']; ?>
')
                                $(this).val('');" id="search-input">
                        <span class="input-group-btn">
    <button type="button" id="test" class="btn btn-info" onclick="return perform_search();">Search</button>
    </span>
                    </div><?php echo smarty_function_securitytoken(array(), $this);?>

                    </form>

                </div>
                <div class="panel panel-default" id="search-results" style="display:none;">
                    <div class="panel-heading" id="status">
                        <h3 class="panel-title">Search results</h3>
                    </div>
                    <div class="panel-body" id="sresults" > Loading ... </div>
                </div>

                <div class="panel panel-default" >
                    <div class="panel-heading" >
                        <h3 class="panel-title">Popular modules</h3>
                    </div>
                    <div class="panel-body" >
                        <?php $_from = $this->_tpl_vars['featured']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['floop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['floop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['module']):
        $this->_foreach['floop']['iteration']++;
?>
                            <div class="addon_module"  <?php if (($this->_foreach['floop']['iteration'] == $this->_foreach['floop']['total'])): ?>style="border:none"<?php endif; ?>>
                                <div class="left">
                                    <strong>
                                        <?php if ($this->_tpl_vars['module']['active'] == '1'): ?>
                                            <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&expand=true&id=<?php echo $this->_tpl_vars['module']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"><?php echo $this->_tpl_vars['module']['name']; ?>
</a>
                                        <?php else: ?>
                                            <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&do=inactive&&expand=true&id=<?php echo $this->_tpl_vars['k']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
"><?php echo $this->_tpl_vars['module']['name']; ?>
</a>
                                        <?php endif; ?>
                                    </strong>
                                    <br />
                                    <?php echo $this->_tpl_vars['module']['description']; ?>

                                </div>
                                <div class="right">
                                    <?php if ($this->_tpl_vars['module']['active'] == '1'): ?>
                                        <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&expand=true&id=<?php echo $this->_tpl_vars['module']['id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="menuitm disabled">
                                            <span><?php if ($this->_tpl_vars['module']['active'] == '1'): ?>Activated<?php else: ?>Activate<?php endif; ?></span>
                                        </a>
                                    <?php else: ?>
                                        <a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['module']['type']; ?>
&activate&modulename=<?php echo $this->_tpl_vars['k']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
" class="new_control greenbtn">
                                            <span><?php if ($this->_tpl_vars['module']['active'] == '1'): ?>Activated<?php else: ?>Activate<?php endif; ?></span>
                                        </a>
                                    <?php endif; ?>

                                </div>
                                <div class="clear"></div></div>
                        <?php endforeach; endif; unset($_from); ?>
                    </div>
                </div>
            </div>


            <div class="col-md-6">

                <div class="panel panel-default" id="latest_additions">
                    <div class="panel-heading">
                        <h3 class="panel-title">Latest additions</h3>
                    </div>
                    <div class="panel-body" id="loadme"> Loading ... </div>
                </div>

            </div>
        </div>
    </div>


    <script type="text/javascript">
        <?php echo '
        function perform_search() {
            $(\'#search-results\').fadeIn();
            $.get("?cmd=managemodules&action=searchmodule", {queryin: $(\'#search-input\').val()}, function (data) {
                var r = parse_response(data);
                $(\'#sresults\').fadeOut(\'fast\', function () {
                    $(\'#sresults\').html(r).fadeIn(\'fast\');
                });
            });
            return false;
        }
        function LatestModules() {
            $.get("?cmd=managemodules&action=getlatest", {}, function (data) {
                var r = parse_response(data);
                if (r) {
                    $(\'#loadme\').fadeOut(\'fast\', function () {
                        $(this).html(r).fadeIn(\'fast\');
                    });
                } else {
                    $(\'#latest_additions\').fadeOut();
                }
            });
        }
        appendLoader(\'LatestModules\');
        '; ?>

    </script>
<?php else: ?>
    <div >

        <div class="newhorizontalnav" id="newshelfnav">
            <div class="list-1">
                <ul>
                    <li class="list-1elem <?php if ($this->_tpl_vars['do'] != 'inactive'): ?>active picked<?php endif; ?>"><a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['action']; ?>
&do=active"><?php echo $this->_tpl_vars['lang']['Active']; ?>
 (<?php echo $this->_tpl_vars['count_active']; ?>
)</a></li>
                    <li class="list-1elem <?php if ($this->_tpl_vars['do'] == 'inactive'): ?>active picked<?php endif; ?> last"><a href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['action']; ?>
&do=inactive"><?php echo $this->_tpl_vars['lang']['Inactive']; ?>
 (<?php echo $this->_tpl_vars['count_avail_modules']; ?>
)</a></li>
                </ul>
            </div>
        </div>



        <div class="mod_desc">
            <div class="headshelf">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td <?php if ($this->_tpl_vars['action'] == 'payment'): ?>width="30"<?php else: ?>width="20"<?php endif; ?>><input type="checkbox" id="checkthemall" /></td>
                        <td class="mrow1" width="30%"><strong><?php echo $this->_tpl_vars['lang']['Module']; ?>
</strong></td>
                        <td class="mrow1"><strong><?php echo $this->_tpl_vars['lang']['Description']; ?>
</strong></td>

                    </tr>
                </table>
            </div>
            <div class="mmdescr">
                <?php if ($this->_tpl_vars['do'] == 'inactive'): ?>
                    <?php if ($this->_tpl_vars['avail_modules']): ?>
                        <ul id="grab-sorter" style="width:100%">
                            <?php $_from = $this->_tpl_vars['avail_modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['modfor'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['modfor']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['b']):
        $this->_foreach['modfor']['iteration']++;
?>
                                <li  style="background:#ffffff">
                                    <div >
                                        <form name="" action="" method="post">
                                            <input type="hidden" name="modulename" value="<?php echo $this->_tpl_vars['b']['filename']; ?>
" />  
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td <?php if ($this->_tpl_vars['action'] == 'payment'): ?>width="30"<?php else: ?>width="20"<?php endif; ?> valign="top"><input type="checkbox"  value="<?php echo $this->_tpl_vars['b']['filename']; ?>
" class="sorters" name="selected[]"/></td>
                                                    <td class="mrow1" width="30%" valign="top">
                                                        <div style="padding-bottom:10px"><strong><?php echo $this->_tpl_vars['b']['name']; ?>
</strong></div>
                                                        <div style="text-align:right;padding:5px 0px">
                                                            <a   class="new_control greenbtn" href="#" onclick="$('#activate-btn-<?php echo $this->_tpl_vars['b']['key']; ?>
').click();
                                                                    return false;"><span ><?php echo $this->_tpl_vars['lang']['Activate']; ?>
</span></a>
                                                        </div>
                                                        <input type="submit" value="<?php echo $this->_tpl_vars['lang']['Activate']; ?>
"  name="activate" style="display:none" id="activate-btn-<?php echo $this->_tpl_vars['b']['key']; ?>
"/>

                                                    </td>
                                                    <td class="mrow1" valign="top">
                                                        <div style="padding-bottom:10px" id="descr-<?php echo $this->_tpl_vars['b']['key']; ?>
">&nbsp;</div>
                                                        <div style="padding:5px 0px"> <a   class="new_control loaddescr" rel="<?php echo $this->_tpl_vars['b']['filename']; ?>
" target="<?php echo $this->_tpl_vars['b']['key']; ?>
" href="#"><span ><strong><?php echo $this->_tpl_vars['lang']['loaddetails']; ?>
</strong></span></a></div>

                                                    </td>
                                                </tr>
                                            </table> 
                                            <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                                    </div>
                                </li>
                            <?php endforeach; endif; unset($_from); ?>
                            <li style="border:none;"> 
                                <div style="padding:5px;">
                                    <?php echo $this->_tpl_vars['lang']['withselected']; ?>
 <a   class="new_control greenbtn" href="#" onclick="activate_s();
                                            return false;"><span ><?php echo $this->_tpl_vars['lang']['Activate']; ?>
</span></a>
                                </div> 
                            </li>
                        </ul>   
                    <?php else: ?>
                        <center>
                            <strong><?php echo $this->_tpl_vars['lang']['noactivemodules']; ?>
</strong>
                        </center>	
                    <?php endif; ?>
                <?php else: ?>
                    <?php if ($this->_tpl_vars['active']): ?>
                        <ul id="grab-sorter" style="width:100%">
                            <?php $_from = $this->_tpl_vars['active']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['modfor'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['modfor']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['b']):
        $this->_foreach['modfor']['iteration']++;
?>
                                <li  style="background:#ffffff">
                                    <div >
                                        <form name="" action="" method="post">
                                            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['b']['id']; ?>
" />
                                            <input type="hidden" name="filename" value="<?php echo $this->_tpl_vars['b']['filename']; ?>
" class="modfilename"/>  
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td <?php if ($this->_tpl_vars['action'] == 'payment' || $this->_tpl_vars['action'] == 'fraud'): ?>width="30"<?php else: ?>width="20"<?php endif; ?> valign="top">
                                                        <input type="checkbox"  value="<?php echo $this->_tpl_vars['b']['id']; ?>
" class="sorters" name="selected[]"/>
                                                        <?php if ($this->_tpl_vars['action'] == 'payment' || $this->_tpl_vars['action'] == 'fraud'): ?>
                                                            <a class="sorter-handle" style="float:right;margin-top:4px"><?php echo $this->_tpl_vars['lang']['move']; ?>
</a>
                                                        <?php endif; ?>
                                                    </td>
                                                    <td class="mrow1" width="30%" valign="top">
                                                        <div style="padding-bottom:10px">
                                                            <strong><?php echo $this->_tpl_vars['b']['modname']; ?>
</strong>
                                                        </div>
                                                        <div style="text-align:right;padding:5px 0px">
                                                            <?php if ($this->_tpl_vars['b']['type'] == 'Payment' || $this->_tpl_vars['b']['type'] == 'Hosting' || $this->_tpl_vars['b']['type'] == 'Domain' || $this->_tpl_vars['b']['type'] == 'Fraud'): ?>
                                                                <input type="hidden" name="sort[]" value="<?php echo $this->_tpl_vars['b']['id']; ?>
" class="sorters2"/>
                                                                <?php if (( ! empty ( $this->_tpl_vars['b']['config'] ) && $this->_tpl_vars['b']['type'] != 'Hosting' && $this->_tpl_vars['b']['type'] != 'Domain' ) || $this->_tpl_vars['b']['type'] == 'Payment'): ?> 
                                                                    <a class="menuitm menu-auto <?php if ($this->_tpl_vars['expand'] == $this->_tpl_vars['b']['id']): ?>activated<?php endif; ?>"   href="#" onclick="$('#config-row-<?php echo $this->_tpl_vars['b']['id']; ?>
').toggle();
                                                                            $(this).toggleClass('activated');
                                                                            return false;">
                                                                        <span >
                                                                            <strong><?php echo $this->_tpl_vars['lang']['editConfiguration']; ?>
</strong>
                                                                        </span>
                                                                    </a>
                                                                <?php endif; ?>
                                                                <a class="menuitm  menu-auto" href="#" onclick="$('#deactivate-btn-<?php echo $this->_tpl_vars['b']['id']; ?>
').click();
                                                                            return false;">
                                                                    <span style="color:red"><?php echo $this->_tpl_vars['lang']['Deactivate']; ?>
</span>
                                                                </a>
                                                            <?php elseif ($this->_tpl_vars['b']['type'] == 'Other' || $this->_tpl_vars['b']['type'] == 'Notification'): ?>
                                                                <a class="menuitm menu-auto <?php if ($this->_tpl_vars['expand'] == $this->_tpl_vars['b']['id']): ?>activated<?php endif; ?>" href="#" onclick="$('#config-row-<?php echo $this->_tpl_vars['b']['id']; ?>
').toggle();
                                                                            $(this).toggleClass('activated');
                                                                            return false;">
                                                                    <span>
                                                                        <strong><?php echo $this->_tpl_vars['lang']['editConfiguration']; ?>
</strong>
                                                                    </span>
                                                                </a>
                                                                <?php if ($this->_tpl_vars['b']['template']): ?>
                                                                    <a class="menuitm menu-auto"   href="?cmd=module&module=<?php echo $this->_tpl_vars['b']['id']; ?>
" target="_blank">
                                                                        <span ><?php echo $this->_tpl_vars['lang']['Manage']; ?>
</span>
                                                                    </a>
                                                                <?php endif; ?>
                                                                <?php if ($this->_tpl_vars['b']['uninstall']): ?>
                                                                    <a class="menuitm menu-auto" href="#" onclick="$('#uninstall-btn-<?php echo $this->_tpl_vars['b']['id']; ?>
').click();
                                                                            return false;">
                                                                        <span style="color:red"><?php echo $this->_tpl_vars['lang']['Uninstall']; ?>
</span>
                                                                    </a>
                                                                <?php endif; ?>
                                                                <a class="menuitm  menu-auto" href="#" onclick="$('#deactivate-btn-<?php echo $this->_tpl_vars['b']['id']; ?>
').click();
                                                                            return false;">
                                                                    <span style="color:red"><?php echo $this->_tpl_vars['lang']['Deactivate']; ?>
</span>
                                                                </a>
                                                                <?php if ($this->_tpl_vars['b']['uninstall']): ?>
                                                                    <input type="submit" value="<?php echo $this->_tpl_vars['lang']['Uninstall']; ?>
" name="uninstall" onclick='return confirm("<?php echo $this->_tpl_vars['lang']['uninstallmoduleconfirm']; ?>
")' style="display:none" id="uninstall-btn-<?php echo $this->_tpl_vars['b']['id']; ?>
"/>
                                                                <?php endif; ?>
                                                            <?php endif; ?>
                                                        </div>
                                                        <input type="submit" value="<?php echo $this->_tpl_vars['lang']['Deactivate']; ?>
"  name="deactivate" style="display:none" id="deactivate-btn-<?php echo $this->_tpl_vars['b']['id']; ?>
"/>
                                                    </td>
                                                    <td class="mrow1" valign="top">
                                                        <?php if ($this->_tpl_vars['b']['description']): ?><div style="margin-bottom:5px"><?php echo $this->_tpl_vars['b']['description']; ?>
</div><?php endif; ?>
                                                        <div class="fs11">
                                                            <?php if ($this->_tpl_vars['b']['version']): ?><strong><?php echo $this->_tpl_vars['lang']['version']; ?>
: </strong><?php echo $this->_tpl_vars['b']['version']; ?>
 <?php endif; ?>
                                                            <?php if ($this->_tpl_vars['b']['filename']): ?><strong><?php echo $this->_tpl_vars['lang']['filename']; ?>
: </strong><?php echo $this->_tpl_vars['b']['filename']; ?>
<br /><?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['type'] == 'Payment'): ?><strong><?php echo $this->_tpl_vars['lang']['supcurrencies']; ?>
: </strong><?php if ($this->_tpl_vars['b']['currencies']): ?><?php echo $this->_tpl_vars['b']['currencies']; ?>
<?php else: ?><?php echo $this->_tpl_vars['lang']['All']; ?>
<?php endif; ?><br /><?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['author']): ?><strong><?php echo $this->_tpl_vars['lang']['author']; ?>
: </strong><?php echo $this->_tpl_vars['b']['author']; ?>
&nbsp;&nbsp;<?php endif; ?> <?php if ($this->_tpl_vars['b']['website']): ?><a href="<?php echo $this->_tpl_vars['b']['website']; ?>
" target="_blank"><?php echo $this->_tpl_vars['b']['website']; ?>
</a>&nbsp;&nbsp;<?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['wiki']): ?><strong><?php echo $this->_tpl_vars['lang']['wiki']; ?>
: </strong><a href="<?php echo $this->_tpl_vars['b']['wiki']; ?>
" target="_blank"><?php echo $this->_tpl_vars['b']['wiki']; ?>
</a><br /><?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['cron'] == 'add'): ?><div class="important_notify"><?php echo $this->_tpl_vars['lang']['havecron']; ?>
 <a href="?cmd=configuration&action=cron&viewaddform=true" target="_blank" class="editbtn"><strong><?php echo $this->_tpl_vars['lang']['clicktoadd']; ?>
</strong></a></div><?php endif; ?>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr <?php if ($this->_tpl_vars['expand'] != $this->_tpl_vars['b']['id']): ?>style="display:none"<?php endif; ?>  id="config-row-<?php echo $this->_tpl_vars['b']['id']; ?>
">
                                                <td></td>
                                                <td colspan="2">
                                                    <div class="clear">	</div>

                                                    <table border="0" width="100%" cellpadding="3">
                                                        <?php if ($this->_tpl_vars['b']['type'] == 'Payment' || $this->_tpl_vars['b']['type'] == 'Other'): ?>  
                                                            <tr>
                                                                <td width="170" style="vertical-align: top;text-align: right"><?php echo $this->_tpl_vars['lang']['dispname']; ?>
: </td>
                                                                <td> 
                                                                    <?php echo smarty_function_hbinput(array('value' => $this->_tpl_vars['b']['modname_unparsed'],'name' => 'name'), $this);?>


                                                                </td>
                                                            </tr>
                                                        <?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['type'] == 'Other'): ?>
                                                            <tr>
                                                                <td width="170" style="vertical-align: top; text-align: right"><?php echo $this->_tpl_vars['lang']['allowedtouse']; ?>
 </td>
                                                                <td class="fs11">
                                                                    <label>
                                                                        <input type="radio" value="1" name="admins_all" <?php if (! $this->_tpl_vars['b']['admins']): ?>checked="checked"<?php endif; ?> />All staff members
                                                                    </label>
                                                                    <label>
                                                                        <input type="radio" value="0"  name="admins_all" <?php if ($this->_tpl_vars['b']['admins']): ?>checked="checked"<?php endif; ?>/>Selected staff members
                                                                    </label>

                                                                    <div <?php if (! $this->_tpl_vars['b']['admins']): ?>style="display: none"<?php endif; ?>>
                                                                        <br /><br />
                                                                        <?php $_from = $this->_tpl_vars['admins']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['adm']):
?>
                                                                            <label style="width:10%; display: inline-block">
                                                                                <input type="checkbox" <?php if ($this->_tpl_vars['b']['admins'][$this->_tpl_vars['adm']['id']] || ! $this->_tpl_vars['b']['admins']): ?>checked="checked"<?php endif; ?> name="admins[<?php echo $this->_tpl_vars['adm']['id']; ?>
]" value="<?php echo $this->_tpl_vars['adm']['id']; ?>
"/>
                                                                                <?php echo $this->_tpl_vars['adm']['username']; ?>

                                                                            </label>
                                                                        <?php endforeach; endif; unset($_from); ?>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php endif; ?>
                                                        <?php if ($this->_tpl_vars['b']['type'] == 'Payment' || $this->_tpl_vars['b']['type'] == 'Notification' || $this->_tpl_vars['b']['type'] == 'Other' || $this->_tpl_vars['b']['type'] == 'Fraud'): ?> <?php if (! empty ( $this->_tpl_vars['b']['config'] )): ?>
                                                                <?php $_from = $this->_tpl_vars['b']['config']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['conf']):
?>
                                                                    <tr >

                                                                        <?php $this->assign('name', $this->_tpl_vars['k']); ?>
                                                                        <?php $this->assign('name2', $this->_tpl_vars['b']['module']); ?>
                                                                        <?php $this->assign('baz', ($this->_tpl_vars['name2']).($this->_tpl_vars['name'])); ?>

                                                                        <?php if ($this->_tpl_vars['conf']['type'] == 'input'): ?>
                                                                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>: </td>   
                                                                            <td ><?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?> <input name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" /></td>
                                                                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'password'): ?>
                                                                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>   
                                                                            <td ><?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?> <input type="password" autocomplete="off" name="option[<?php echo $this->_tpl_vars['k']; ?>
]" value="<?php echo $this->_tpl_vars['conf']['value']; ?>
" /></td>
                                                                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'check'): ?>
                                                                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>  
                                                                            <td ><?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 5px 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?> <input name="option[<?php echo $this->_tpl_vars['k']; ?>
]" type="checkbox" value="1" <?php if ($this->_tpl_vars['conf']['value'] == '1'): ?>checked="checked"<?php endif; ?> /></td>
                                                                            <?php elseif ($this->_tpl_vars['conf']['type'] == 'checklist'): ?>
                                                                            <td width="170" align="right"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>:</td>  
                                                                            <td class="fs11" ><?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 5px 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?> 
                                                                                <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['selectopt']):
?>
                                                                                    <label class="left" style="padding-right:10px"><input name="option[<?php echo $this->_tpl_vars['k']; ?>
][]" type="checkbox" value="<?php echo $this->_tpl_vars['selectopt']; ?>
" <?php if (in_array ( $this->_tpl_vars['selectopt'] , $this->_tpl_vars['conf']['value'] )): ?>checked="checked"<?php endif; ?> />&nbsp;<?php echo $this->_tpl_vars['selectopt']; ?>
</label>
                                                                                    <?php endforeach; endif; unset($_from); ?>
                                                                            </td>
                                                                        <?php elseif ($this->_tpl_vars['conf']['type'] == 'select'): ?>
                                                                            <td width="170" align="right"> <?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>: </td>  
                                                                            <td ><?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?> 
                                                                                <select name="option[<?php echo $this->_tpl_vars['k']; ?>
]">
                                                                                    <?php $_from = $this->_tpl_vars['conf']['default']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['selectopt']):
?>
                                                                                        <option <?php if ($this->_tpl_vars['conf']['value'] == $this->_tpl_vars['selectopt']): ?>selected="selected" <?php endif; ?>><?php echo $this->_tpl_vars['selectopt']; ?>
</option>
                                                                                    <?php endforeach; endif; unset($_from); ?>
                                                                                </select> 
                                                                            </td>
                                                                        <?php elseif ($this->_tpl_vars['conf']['type'] == 'textarea'): ?>
                                                                            <td colspan="2"><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?>: <?php if ($this->_tpl_vars['conf']['description']): ?><a style="padding: 0 12px 0 10px; background-position: center center;" class="vtip_description" title="<?php echo $this->_tpl_vars['conf']['description']; ?>
"></a><?php endif; ?><br />
                                                                                <span style="vertical-align:top"><textarea name="option[<?php echo $this->_tpl_vars['k']; ?>
]" rows="5" cols="60"><?php echo $this->_tpl_vars['conf']['value']; ?>
</textarea></span>
                                                                            </td>
                                                                        <?php elseif ($this->_tpl_vars['conf']['type'] == 'button'): ?>
                                                                            <td colspan="2" >
                                                                                <a href="#" class="menuitm menu" onclick="<?php echo $this->_tpl_vars['conf']['value']; ?>
"><span><strong><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php elseif ($this->_tpl_vars['lang'][$this->_tpl_vars['name']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['name']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['name']; ?>
<?php endif; ?></strong></span></a>
                                                                            </td>
                                                                        <?php endif; ?>


                                                                    </tr>
                                                                <?php endforeach; endif; unset($_from); ?>
                                                            <?php if ($this->_tpl_vars['b']['currencies']): ?>
                                                                <td width="170" align="right">Background conversion:</td>
                                                                <td ><a style="padding: 5px 12px 0 10px; background-position: center center;" class="vtip_description" title="When enabled, gateway will appear in all currencies - even unsupported by this gateway.
                                                                            Unsupported currency will be converted in background to target currency selected here<br>
                                                                            Note: Target currency needs to be available in your HostBill configuration as main or additional currency"></a>
                                                                     <select name="option[background_conversion]">
                                                                        <?php $this->assign('cursplit', ((is_array($_tmp=",")) ? $this->_run_mod_handler('explode', true, $_tmp, $this->_tpl_vars['b']['currencies']) : explode($_tmp, $this->_tpl_vars['b']['currencies']))); ?>

                                                                        <option value="" <?php if (! $this->_tpl_vars['b']['config']['background_conversion']['value']): ?>selected="selected"<?php endif; ?>>None. Disable conversion</option>
                                                                        <?php $_from = $this->_tpl_vars['cursplit']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cur']):
?>
                                                                            <option value="<?php echo ((is_array($_tmp=$this->_tpl_vars['cur'])) ? $this->_run_mod_handler('trim', true, $_tmp) : trim($_tmp)); ?>
" <?php if (((is_array($_tmp=$this->_tpl_vars['cur'])) ? $this->_run_mod_handler('trim', true, $_tmp) : trim($_tmp)) == $this->_tpl_vars['b']['config']['background_conversion']['value']): ?>selected="selected"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['cur'])) ? $this->_run_mod_handler('trim', true, $_tmp) : trim($_tmp)); ?>
</option>
                                                                        <?php endforeach; endif; unset($_from); ?>
                                                                    </select>

                                                                </td>
                                                            <?php endif; ?>
                                                                <?php if ($this->_tpl_vars['b']['callback']): ?>
                                                                    <tr >
                                                                        <td width="170"  align="right"><?php echo $this->_tpl_vars['lang']['callbackurl']; ?>
:</td>
                                                                        <td ><input readonly="readonly" value="<?php echo $this->_tpl_vars['b']['callback']; ?>
" size="70"/></td>
                                                                    </tr>
                                                                <?php endif; ?>
                                                            <?php endif; ?>
                                                        <?php endif; ?>
                                                        <tr>
                                                            <td align="right" style="padding:10px;">
                                                                <a href="#" class="new_control greenbtn" onclick="$(this).parent().find('input').click();
                                                                            return false;">
                                                                    <span><?php echo $this->_tpl_vars['lang']['savechanges']; ?>
</span>
                                                                </a>
                                                                <input type="submit" value="<?php echo $this->_tpl_vars['lang']['savechanges']; ?>
" style="font-weight:bold;margin-left:10px;display:none;" name="changeconfig"/>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table> 
                                                </td>
                                            </tr>
                                        </table>
                                        <?php echo smarty_function_securitytoken(array(), $this);?>

                                    </form>
                                </div>
                            </li>
                        <?php endforeach; endif; unset($_from); ?>
                        <li style="border:none;"> 
                            <div style="padding:5px;"><?php echo $this->_tpl_vars['lang']['withselected']; ?>
 
                                <a   class="menuitm  " href="#" onclick="deactivate_s();
                                        return false;">
                                    <span style="color:red"><?php echo $this->_tpl_vars['lang']['Deactivate']; ?>
</span>
                                </a>
                            </div> 
                        </li>
                    </ul>   
                    <?php if ($this->_tpl_vars['action'] == 'payment' || $this->_tpl_vars['action'] == 'fraud'): ?>
                        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
js/jquery.dragsort-0.3.10.min.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>
                        <?php echo '
                            <script type="text/javascript">
                                $("#grab-sorter").dragsort({dragSelector: "a.sorter-handle", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'><div></div></li>"});
                                function saveOrder() {
                                    var sorts = $(\'.sorters2\').serialize();
                                    ajax_update(\'?cmd=managemodules&action='; ?>
<?php echo $this->_tpl_vars['action']; ?>
<?php echo '&do=saveorder&\' + sorts, {});
                                }
                                ;
                            </script>
                        '; ?>

                    <?php endif; ?>
                <?php else: ?>
                    <div class="blank_state blank_services">
                        <div class="blank_info">
                            <h1><?php echo $this->_tpl_vars['lang']['blank_mm']; ?>
</h1>
                            <?php echo $this->_tpl_vars['lang']['blank_mm_desc']; ?>

                            <div class="clear"></div>

                            <a class="new_add new_menu" href="?cmd=managemodules&action=<?php echo $this->_tpl_vars['action']; ?>
&do=inactive" style="margin-top:10px">
                                <span><?php echo $this->_tpl_vars['lang']['activatemodules']; ?>
</span></a>
                            <div class="clear"></div>

                        </div>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
            <script type="text/javascript">
                <?php echo '
                    function deactivate_s() {
                        if ($(\'.sorters:checked\').length) {
                            window.location.href = \'?cmd=managemodules'; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
<?php echo '&action='; ?>
<?php echo $this->_tpl_vars['action']; ?>
<?php echo '&deactivate&\' + $(\'.sorters\').serialize();
                        }
                    }
                    function activate_s() {
                        if ($(\'.sorters:checked\').length) {
                            window.location.href = \'?cmd=managemodules'; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
<?php echo '&action='; ?>
<?php echo $this->_tpl_vars['action']; ?>
<?php echo '&activate&\' + $(\'.sorters\').serialize();
                        }
                    }

                    function  getdesc() {
                        $(\'.loaddescr\').click(function () {
                            var el = $(this).hide();
                            $.post(\'?cmd=managemodules&action=getdescr&module=\' + $(this).attr(\'rel\') + \'&type='; ?>
<?php echo $this->_tpl_vars['action']; ?>
<?php echo '\', {empty1r: \'asas\'}, function (data) {
                                var resp = parse_response(data);
                                if (resp) {
                                    $(\'#descr-\' + el.attr(\'target\')).html(resp).slideDown();
                                }
                            });
                            return false;
                        });


                        $(\'.sorters\').click(
                            function () {
                                if ($(this).is(\':checked\')) {
                                    $(this).parents(\'li\').addClass(\'checkedRow\');
                                } else {
                                    $(this).parents(\'li\').removeClass(\'checkedRow\');
                                }
                            }
                        );
                        $(\'#checkthemall\').click(function () {
                            if ($(this).is(\':checked\')) {
                                $(\'.sorters\').attr(\'checked\', true).parents(\'li\').addClass(\'checkedRow\');
                            } else {
                                $(\'.sorters\').attr(\'checked\', false).parents(\'li\').removeClass(\'checkedRow\');
                            }

                        });
                        $(\'input[name=admins_all]\').change(function () {
                            var self = $(this);
                            if (self.val() == \'1\')
                                self.parent().nextAll(\'div\').slideUp();
                            else
                                self.parent().nextAll(\'div\').slideDown();
                        });
                '; ?>
      

                <?php if ($this->_tpl_vars['do'] == 'inactive' && $this->_tpl_vars['expand']): ?>
                        var inact = $('input[value="<?php echo ((is_array($_tmp=$this->_tpl_vars['expand'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'javascript') : smarty_modifier_escape($_tmp, 'javascript')); ?>
"]').parents('li');
                        $('.loaddescr', inact).click();
                        inact.scrollToEl();
                <?php elseif ($this->_tpl_vars['expand']): ?>
                        $('#config-row-<?php echo $this->_tpl_vars['expand']; ?>
').scrollToEl();
                <?php endif; ?>
                <?php echo '
                    }

                    var PaymentConfigPerCurrency = {
                        add: function (id, list) {
                            if (list.indexOf(\'currency\') == -1)
                                list.push(\'currency\')
                            list = jQuery.map(list, function (e) {
                                return \'[name="option[\' + e + \']"]\';
                            });

                            var fields = $(list.join(\', \'), \'#\' + id);
                            if (!fields.length)
                                return false;

                            var last = fields.eq(-1).attr(\'name\').replace(/\\]$/, \'\');
                            last = $(\'[name^="\' + last + \'"]:last\', \'#\' + id);

                            var lastN = last.attr(\'name\').match(/(\\d+)\\]$/);
                            lastN = lastN && lastN[1] && parseInt(lastN[1]) || 0;
                            lastN++;

                            var currencies = $(\'[name^="option[currency"]\', \'#\' + id);

                            if (currencies.eq(0).children().length < lastN + 1)
                                return false;

                            fields.each(function () {
                                var self = $(this),
                                    tr = self.parents(\'tr\').eq(0).clone(),
                                    inp = tr.find(\'[name]\'),
                                    td = tr.children(\':first\');

                                td.text(td.text().replace(/(:)?(\\s*)$/, \' (\' + (lastN + 1) + \') $1$2\'))
                                inp.val(\'\').attr(\'name\', inp.attr(\'name\').replace(/\\d*\\]/, lastN + \']\'));

                                tr.insertAfter(last.parents(\'tr\').eq(0));
                                last = inp;
                            })


                            return false;
                        }
                    }

                    appendLoader(\'getdesc\');
                '; ?>
         
            </script>  
        </div>
    </div>
</div>
<?php endif; ?>