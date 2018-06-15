<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:59
         compiled from productbilling_DomainRegular.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'price', 'productbilling_DomainRegular.tpl', 15, false),)), $this); ?>
<div id="DomainRegular_b" <?php if ($this->_tpl_vars['product']['paytype'] != 'DomainRegular'): ?>style="display:none"<?php endif; ?> class="p5 boption">

    <table border="0" cellpadding="6" cellspacing="0" width="100%">

        <?php $_from = $this->_tpl_vars['product']['periods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?>
        <tr  id="pricing_<?php echo $this->_tpl_vars['p']['period']; ?>
" class="havecontrols" >

            <td align="right" width="120" >
                <div class="controls"><a href="#" class="editbtn"><?php echo $this->_tpl_vars['lang']['Edit']; ?>
</a> <a href="#" class="delbtn"><?php echo $this->_tpl_vars['lang']['Delete']; ?>
</a></div>
                <strong><?php echo $this->_tpl_vars['p']['period']; ?>
 <?php echo $this->_tpl_vars['lang']['Years']; ?>
</strong></td>

            <td><div class="e1">
                    <table border="0" cellpadding="3" cellspacing="0">
                        <tr>
                            <td ><?php if ($this->_tpl_vars['p']['register'] != -1): ?><?php echo $this->_tpl_vars['lang']['Register']; ?>
: <strong><?php echo $this->_tpl_vars['currency']['sign']; ?>
 <span class="pricer"><?php echo ((is_array($_tmp=$this->_tpl_vars['p']['register'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
</span> <?php echo $this->_tpl_vars['currency']['code']; ?>
</strong><?php endif; ?></td>
                            <td ><?php if ($this->_tpl_vars['p']['transfer'] != -1): ?> <?php echo $this->_tpl_vars['lang']['Transfer']; ?>
: <strong><?php echo $this->_tpl_vars['currency']['sign']; ?>
 <span class="pricer"><?php echo ((is_array($_tmp=$this->_tpl_vars['p']['transfer'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
</span> <?php echo $this->_tpl_vars['currency']['code']; ?>
</strong><?php endif; ?></td>
                            <td ><?php if ($this->_tpl_vars['p']['renew'] != -1): ?> <?php echo $this->_tpl_vars['lang']['Renew']; ?>
: <strong><?php echo $this->_tpl_vars['currency']['sign']; ?>
 <span class="pricer"><?php echo ((is_array($_tmp=$this->_tpl_vars['p']['renew'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
</span> <?php echo $this->_tpl_vars['currency']['code']; ?>
</strong><?php endif; ?></td>
                        </tr>
                    </table>
                </div>
                <div class="e2">
                    <table border="0" cellpadding="3" cellspacing="0">
                        <tr>
                            <td ><?php echo $this->_tpl_vars['lang']['Register']; ?>
: <input type="checkbox"  value="1"   onclick="check_i(this)" <?php if ($this->_tpl_vars['p']['register'] != -1): ?>checked="checked"<?php endif; ?> /><input type="text" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['p']['register'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
" size="6" name="periods[<?php echo $this->_tpl_vars['p']['period']; ?>
][register]" class="config_val inp" /></td>
                            <td ><?php echo $this->_tpl_vars['lang']['Transfer']; ?>
: <input type="checkbox"  value="1"   onclick="check_i(this)" <?php if ($this->_tpl_vars['p']['transfer'] != -1): ?>checked="checked"<?php endif; ?> /><input type="text" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['p']['transfer'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
" size="6" name="periods[<?php echo $this->_tpl_vars['p']['period']; ?>
][transfer]" class="config_val inp" /></td>
                            <td ><?php echo $this->_tpl_vars['lang']['Renew']; ?>
: <input type="checkbox"  value="1"  onclick="check_i(this)" <?php if ($this->_tpl_vars['p']['renew'] != -1): ?>checked="checked"<?php endif; ?> /><input type="text" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['p']['renew'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false)); ?>
" size="6" name="periods[<?php echo $this->_tpl_vars['p']['period']; ?>
][renew]" class="config_val inp" /></td>
                        </tr>
                    </table>
                </div></td>
        </tr>
        <?php endforeach; endif; unset($_from); ?>

        <tr id="addpricingrow"><td align="left">
                <a href="#" class="new_control" onclick="$(this).hide();$('#tbpricingd').show();$('#tbpricingd select option:visible').eq(0).attr('selected','selected');return false;" id="addpricingd" ><span class="addsth" ><?php echo $this->_tpl_vars['lang']['addpricingoption']; ?>
</span></a>


            </td>
            <td align="right"><?php if ($this->_tpl_vars['product']['id'] != 'new'): ?><a href="?cmd=services&action=product&id=<?php echo $this->_tpl_vars['product']['id']; ?>
&category_id=<?php echo $this->_tpl_vars['product']['category_id']; ?>
&security_token=<?php echo $this->_tpl_vars['security_token']; ?>
&make=applycatpricing" class="editbtn" onclick="return confirm('Are you sure? All tld prices from this category will be changed')">Apply this pricing to all tlds from <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c']):
?><?php if ($this->_tpl_vars['c']['id'] == $this->_tpl_vars['product']['category_id']): ?><?php echo $this->_tpl_vars['c']['name']; ?>
<?php break; ?><?php endif; ?><?php endforeach; endif; unset($_from); ?></a><?php endif; ?></td>
        </tr>
    </table>

</div>
<div id="tbpricingd"  style="display:none;" class="p6">
    <div >
        <table border="0" cellpadding="3" cellspacing="0" width="100%">
            <tr>
                <td><strong><?php echo $this->_tpl_vars['lang']['Period']; ?>
:</strong></td>
                <td ><input id="pediodid" size="6" value="1" /> <?php echo $this->_tpl_vars['lang']['Years']; ?>
</td>

                <td ><strong><?php echo $this->_tpl_vars['lang']['Register']; ?>
</strong><input type="checkbox"  value="1"  id="register_on" onclick="check_i(this)" checked="checked"/> <input id="register_p" value="<?php echo ((is_array($_tmp=0)) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false, false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false, false)); ?>
" size="6" class="config_val price inp"/></td>
                <td ><strong><?php echo $this->_tpl_vars['lang']['Transfer']; ?>
</strong><input type="checkbox"  value="1"  id="transfer_on" onclick="check_i(this)" checked="checked"/> <input id="transfer_p" value="<?php echo ((is_array($_tmp=0)) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false, false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false, false)); ?>
" size="6" class="config_val price inp"/></td>
                <td ><strong><?php echo $this->_tpl_vars['lang']['Renew']; ?>
</strong><input type="checkbox"  value="1"  id="renew_on" onclick="check_i(this)" checked="checked"/> <input id="renew_p" value="<?php echo ((is_array($_tmp=0)) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false, false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false, false)); ?>
" size="6" class="config_val price inp"/></td>

                <td colspan="2" align="center"><input type="button" value="<?php echo $this->_tpl_vars['lang']['Add']; ?>
" class="btn btn-success btn-xs"  onclick="addopt_domain();return false;"/> <span class="orspace"><?php echo $this->_tpl_vars['lang']['Or']; ?>
 </span> <a href="#" onclick="$('#addpricingd').show();$('#tbpricingd').hide();return false;" class="editbtn" id="hidepricingadd"><?php echo $this->_tpl_vars['lang']['Cancel']; ?>
</a></td>
        </table>
    </div>
</div>
<?php echo '
<script type="text/javascript">
    var zero_value = \''; ?>
<?php echo ((is_array($_tmp=0)) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency'], false, false) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'], false, false)); ?>
<?php echo '\';
    function addopt_domain() {
        var per= $(\'#pediodid\').val();
        if((!$(\'#register_on\').is(\':checked\') && !$(\'#transfer_on\').is(\':checked\') && !$(\'#renew_on\').is(\':checked\'))|| !per || $(\'#pricing_\'+per).length) {
            $(\'#register_p\').val(zero_value);$(\'#renew_p\').val(zero_value);$(\'#transfer_p\').val(zero_value);$(\'#register_on\').attr(\'checked\',\'checked\');
            $(\'#transfer_on\').attr(\'checked\',\'checked\');
            $(\'#renew_on\').attr(\'checked\',\'checked\');
            $(\'#addpricingd\').show();$(\'#tbpricingd\').hide();
            return false;
        }
        var v = \'<tr  id="pricing_\'+per+\'" class="havecontrols" >\'+
            \'<td align="right" width="120" ><strong>\'+per+\' \'+lang[\'Years\']+\'</strong></td><td> <table border="0" cellpadding="3" cellspacing="0"><tr>\';





        v+=\'<td >\'+lang[\'Register\']+\': <input type="checkbox"  value="1"   onclick="check_i(this)" \';
        if ($(\'#register_on\').is(\':checked\'))
            v+=\'checked="checked"\';
        v+=\' /><input type="text" value="\'+$(\'#register_p\').val()+\'" size="6" name="periods[\'+per+\'][register]" class="config_val inp" \';
        if (!$(\'#register_on\').is(\':checked\'))
            v+=\'disabled="disabled"\';
        v+=\' /></td>\';
        v+=\'<td >\'+lang[\'Transfer\']+\': <input type="checkbox"  value="1"   onclick="check_i(this)" \';
        if ($(\'#transfer_on\').is(\':checked\'))
            v+=\'checked="checked"\';
        v+=\' /><input type="text" value="\'+$(\'#transfer_p\').val()+\'" size="6" name="periods[\'+per+\'][transfer]" class="config_val inp" \';
        if (!$(\'#transfer_on\').is(\':checked\'))
            v+=\'disabled="disabled"\';
        v+=\' /></td>\';
        v+=\'<td >\'+lang[\'Renew\']+\': <input type="checkbox"  value="1"  onclick="check_i(this)" \';
        if ($(\'#renew_on\').is(\':checked\'))
            v+=\'checked="checked"\';
        v+=\' /><input type="text" value="\'+$(\'#renew_p\').val()+\'" size="6" name="periods[\'+per+\'][renew]" class="config_val inp" \';
        if (!$(\'#renew_on\').is(\':checked\'))
            v+=\'disabled="disabled"\';
        v+=\' /></td>\';
        v+=\'</tr></table> </td></tr>\';

        $(\'#addpricingrow\').before(v);
        $(\'#register_on\').attr(\'checked\',\'checked\');
        $(\'#transfer_on\').attr(\'checked\',\'checked\');
        $(\'#renew_on\').attr(\'checked\',\'checked\');
        $(\'#register_p\').val(zero_value);$(\'#renew_p\').val(zero_value);$(\'#transfer_p\').val(zero_value);
        $(\'#addpricingd\').show();$(\'#tbpricingd\').hide();
        return false;
    }
    function bindMe2() {

        $(\'#DomainRegular_b .controls .editbtn\').click(function(){
            var e=$(this).parent().parent().parent();
            e.find(\'.e1\').hide();
            e.find(\'.e2\').show();
            e.parents(\'tbody.sectioncontent\').find(\'.savesection\').show();
            return false;
        });
        $(\'#DomainRegular_b .controls .delbtn\').click(function(){
            $(this).parents(\'.havecontrols\').eq(0).remove();

            return false;
        });

    }
    appendLoader(\'bindMe2\');
</script>


'; ?>