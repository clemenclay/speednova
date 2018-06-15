<?php /* Smarty version 2.6.26, created on 2018-06-15 08:44:56
         compiled from clientarea/invoices.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'clientarea/invoices.tpl', 1, false),array('modifier', 'price', 'clientarea/invoices.tpl', 9, false),array('function', 'securitytoken', 'clientarea/invoices.tpl', 24, false),)), $this); ?>
<h2 class="pink-text"><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['invoices'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</h2>
<div class="card">
    <div class="card-body">
        <div>

        <?php if (( $this->_tpl_vars['acc_balance'] && $this->_tpl_vars['acc_balance'] > 0 ) || $this->_tpl_vars['enableFeatures']['deposit'] != 'off'): ?>
            <div class="ribbon form-horizontal">
                    <div class="control-group">
                        <label for="appendedPrependedInput" class="control-label left" style="width:auto"><?php echo $this->_tpl_vars['lang']['curbalance']; ?>
:  <b><?php echo ((is_array($_tmp=$this->_tpl_vars['acc_balance'])) ? $this->_run_mod_handler('price', true, $_tmp, $this->_tpl_vars['currency']) : smarty_modifier_price($_tmp, $this->_tpl_vars['currency'])); ?>
</b></label>
                        <?php if ($this->_tpl_vars['enableFeatures']['deposit'] != 'off'): ?>
                        <div class="right" style="margin-left:10px">
                            <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&action=addfunds" class="btn btn-info btn-large"><?php echo $this->_tpl_vars['lang']['addfunds']; ?>
</a>
                        </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['acc_balance'] && $this->_tpl_vars['acc_balance'] > 0 && $this->_tpl_vars['enableFeatures']['bulkpayments'] != 'off'): ?>
                        <div class="right" style="margin-left:10px">
                            <form method="post" action="index.php" id="payall">
                            <input type="hidden" name="action" value="payall"/>
                            <input type="hidden" name="cmd" value="clientarea"/>
                            <button class="btn btn-success btn-large">
                                <i class="icon-ok-sign icon-white"></i> <b class="payall-all"><?php echo $this->_tpl_vars['lang']['paynowdueinvoices']; ?>
</b>
                                <b class="payall-selected"><?php echo $this->_tpl_vars['lang']['payselectedinvoices']; ?>
</b>
                            </button>
                            <?php echo smarty_function_securitytoken(array(), $this);?>
</form>
                        </div>
                        <?php endif; ?>


                    </div>
            </div>
            <div class="ribbon-shadow-l"></div>
            <div class="ribbon-shadow-r"></div>
            <div class="divider"></div>
        <?php endif; ?>

        <?php if ($this->_tpl_vars['invoices']): ?>

<br>

        <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices" id="currentlist" style="display:none" updater="#updater"></a>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table">
        <colgroup class="firstcol"></colgroup>
        <?php if ($this->_tpl_vars['enableFeatures']['bulkpayments'] != 'off'): ?><colgroup class="firstcol"></colgroup><?php endif; ?>
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>

        <colgroup class="firstcol"></colgroup>
        <colgroup class="alternatecol"></colgroup>
        <tbody>
            <thead class="">
            
            <th><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices&amp;orderby=id|ASC" class="sortorder">#</a></th>
            <th width="30"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices&amp;orderby=status|ASC"  class="sortorder"><?php echo $this->_tpl_vars['lang']['status']; ?>
</a></th>
            <th width="120"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices&amp;orderby=total|ASC"  class="sortorder"><?php echo $this->_tpl_vars['lang']['total']; ?>
</a></th>
       <!--     <th width="120"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices&amp;orderby=date|ASC"  class="sortorder"><?php echo $this->_tpl_vars['lang']['invoicedate']; ?>
</a></th> -->
            <th width="120"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea&amp;action=invoices&amp;orderby=duedate|ASC"  class="sortorder d-none d-lg-block"><?php echo $this->_tpl_vars['lang']['duedate']; ?>
</a></th>
            <th class="" width="20"/>
            </thead>
        </tbody>
        <tbody id="updater">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax/ajax.invoices.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        </tbody>
        
        </table>

        <div class="clear"></div>



<!--Pagination-->
<nav aria-label="pagination example">
    <ul class="pagination pagination-lg pagination justify-content-center">
        <li class="page-item">
            <?php unset($this->_sections['foo']);
$this->_sections['foo']['name'] = 'foo';
$this->_sections['foo']['loop'] = is_array($_loop=$this->_tpl_vars['totalpages']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                <button class="page-link <?php if ($this->_sections['foo']['iteration'] == 1): ?>active<?php endif; ?>"><?php echo $this->_sections['foo']['iteration']; ?>
</button>
            <?php endfor; endif; ?>
        </li>
    </ul>
</nav>







            <div class="clear"></div>
        <?php else: ?>
        <h3 class="p19"><?php echo $this->_tpl_vars['lang']['nothing']; ?>
</h3>
        <?php endif; ?>
        </div> 
        <?php if ($this->_tpl_vars['enableFeatures']['bulkpayments'] != 'off'): ?>
            <script type="text/javascript">
                <?php echo '
                    var checks = $(\'input[name="selected[]"]\'),
                        pay = $(\'#payall\');
                
                    checks.change(function(){
                        if(checks.filter(\':checked\').length){
                            pay.find(\'.payall-selected\').show();
                            pay.find(\'.payall-all\').hide();
                        }else{
                            pay.find(\'.payall-selected\').hide();
                            pay.find(\'.payall-all\').show();
                        }
                    }).change();
                    pay.submit(function(){
                        if(checks.filter(\':checked\').length){
                            var a = checks.serializeArray();
                            for(var i = 0; i < a.length; i++){
                                pay.append(\'<input type="hidden" name="selected[]" value="\'+a[i].value+\'" />\');
                            }
                        }
                    });
                '; ?>

            </script>
        <?php endif; ?>
    </div>
</div>


