<?php /* Smarty version 2.6.26, created on 2018-06-19 15:29:13
         compiled from ajax.root.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securitytoken', 'ajax.root.tpl', 23, false),)), $this); ?>
<?php if ($this->_tpl_vars['action'] == 'initialconfig'): ?>
<h2 style="margin-top:0px;">Welcome in <span style="color:#484740;font-family:Calibri,Arial,Helvetica;font-size:21px">Host</span><span style="color:#6694e3;font-family:Calibri,Arial,Helvetica;font-size:21px">Bill</span></h2>
Thank you for choosing HostBill as your new billing application. For quick start use one of pre-configured settings below.

<div style="margin: 20px 0px"><form action="" method="post">
        <input type="hidden" name="action" value="saveprofile"/>
<?php if ($this->_tpl_vars['qc_features']): ?>
    <strong>Profile:</strong> <select class="inp" name="profile" onchange="ppp(this)">
        <?php $_from = $this->_tpl_vars['qc_features']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['q']):
?>
        <option value="<?php echo $this->_tpl_vars['q']['file']; ?>
"><?php echo $this->_tpl_vars['q']['name']; ?>
</option>
        <?php endforeach; endif; unset($_from); ?>
    </select>

    <input type="submit" value="Use this profile" class="submitme" style="font-weight:bold"/>

    <br/>
    <div id="pdesc" style="padding:10px 0px;font-size:11px">
        <?php $_from = $this->_tpl_vars['qc_features']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['q']):
?>
        <div id="o_<?php echo $this->_tpl_vars['k']; ?>
" <?php if ($this->_tpl_vars['k'] != 0): ?>style="display:none"<?php endif; ?>><?php echo $this->_tpl_vars['q']['description']; ?>
</div>
        <?php endforeach; endif; unset($_from); ?>
    </div>
<?php endif; ?>
    <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
</div>


<script type="text/javascript">
<?php echo '
    function ppp(el) {
        $("#pdesc div").hide();
        $(\'option\',$(el)).each(function(n){
            if($(this).is(\':selected\')) {
                $("#pdesc div").eq(n).show();
            }
        });

}
        $(\'#facebox .footer\').append(
            \'<div class="left"><input type="checkbox" id="dontshowmeagain"> Dont show this message again</div>\'
        );
            $(document).bind(\'close.facebox\',function(){
                if ($("#dontshowmeagain").is(":checked")) {
                    ajax_update(\'?cmd=root&action=hideqc\');
                }
            });
 '; ?>

</script>
<?php endif; ?>