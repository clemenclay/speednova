<?php /* Smarty version 2.6.26, created on 2018-06-19 16:06:58
         compiled from C:%5Cxampp%5Chtdocs%5Cspeednova%5Ctemplates%5Corderpages%5Conestep_triple_box.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'C:\\xampp\\htdocs\\speednova\\templates\\orderpages\\onestep_triple_box.tpl', 75, false),)), $this); ?>

<link href="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_triple_box/css/orderpage.css" rel="stylesheet" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html">
<script type="text/javascript" src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_triple_box/js/script.js"></script>




<div class="orderpage">


<div class="modal hide fade" id="modal-window">
    <div class="modal-header">
        <h3></h3>
    </div>
    <div class="modal-body">
        <p></p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" class="close" data-dismiss="modal" aria-hidden="true">Close</a>
    </div>
</div>


    <ul class="services-type nav nav-pills">
        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
            <?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?><li><strong><?php echo $this->_tpl_vars['i']['name']; ?>
</strong></li>
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
            <?php if ($this->_tpl_vars['i']['id'] != $this->_tpl_vars['current_cat']): ?>| <li><a href="<?php echo $this->_tpl_vars['system_url']; ?>
<?php echo $this->_tpl_vars['ca_url']; ?>
cart/<?php echo $this->_tpl_vars['i']['slug']; ?>
/&amp;step=<?php echo $this->_tpl_vars['step']; ?>
<?php if ($this->_tpl_vars['addhosting']): ?>&amp;addhosting=1<?php endif; ?>"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>

            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
    </ul>



<div class="orderpage-plans row">
    <h1><?php echo $this->_tpl_vars['lang']['serverpricing']; ?>
</h1>
    <h3><?php echo $this->_tpl_vars['lang']['afterchoise']; ?>
.</h3>




    <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
        <?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?><?php $this->assign('category_name', $this->_tpl_vars['i']['name']); ?><?php endif; ?>
    <?php endforeach; endif; unset($_from); ?>

    <?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['i']):
        $this->_foreach['loop']['iteration']++;
?>
    <div class="span4">
        <div class="plan plan-<?php echo ($this->_foreach['loop']['iteration']-1)+1; ?>
 <?php if ($this->_tpl_vars['product']['id'] == $this->_tpl_vars['i']['id']): ?>no-opacity<?php endif; ?>">
            <div class="plan-header">
                <div class="plan-bg"></div>
            </div>
            <div class="plan-icon-bg">
                <i class="icon-plan-<?php echo ($this->_foreach['loop']['iteration']-1)+1; ?>
"></i>
            </div>

            <div class="plan-info">
                <p class="plan-name"><?php echo $this->_tpl_vars['i']['name']; ?>
</p>
                <p class="plan-desc"><?php echo $this->_tpl_vars['category_name']; ?>
</p>
            </div>

            <div class="btn-center">
                <a href="#" class="btn-blue"><?php if ($this->_tpl_vars['product']['id'] == $this->_tpl_vars['i']['id']): ?>selected<?php else: ?><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['order'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
<?php endif; ?></a>
                <input type="hidden" value="<?php echo $this->_tpl_vars['i']['id']; ?>
"/>
            </div>

            <div class="modal-desc">
            <?php echo $this->_tpl_vars['i']['description']; ?>

            </div>

            <div class="clearfix">
                <div class="plan-price">
                    <div class="btn-center">
                        <i class="icon-plan-cart"></i>
                    </div>
                    <p><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/price.tpl', 'smarty_include_vars' => array('product' => $this->_tpl_vars['i'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></p>
                </div>

                <div class="plan-cycle">
                    <div class="btn-center">
                        <i class="icon-plan-details"></i>
                    </div>
                    <p><a href="#" class="modal-window">More details</a></p>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; endif; unset($_from); ?>

</div>




<!-- Product Configuration -->


<div class="step_2 page-full" id="configer">
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.onestep_triple_box.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</div>




<!-- Client details -->
<div class="row">
    <form action="?cmd=cart&cat_id=<?php echo $this->_tpl_vars['current_cat']; ?>
" method="post" id="orderform" onsubmit="return mainsubmit(this)">
     <input type="hidden" name="make" value="order" />
     <input type="hidden" name="gateway" />
    <div class="span8">
        <div>
            <?php if ($this->_tpl_vars['logged'] != '1'): ?>
            <div class="client-toggle">
                <div class="custom-select">
                    <div class="select-box">
                        <div class="select-value"></div>
                        <div class="select-arrow"><i class="icon-select-arrow"></i></div>
                        <ul class="select-list">
                            <li id="new-client" class="<?php if (! $this->_tpl_vars['submit'] || ! $this->_tpl_vars['submit']['make'] || $this->_tpl_vars['submit']['cust_method'] == 'newone' || $this->_tpl_vars['submit']['action'] != 'login'): ?>active-client<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['newclient']; ?>
</li>
                            <li id="registered" class="<?php if ($this->_tpl_vars['submit']['cust_method'] == 'login' || $this->_tpl_vars['submit']['action'] == 'login'): ?>active-client<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['registered']; ?>
</li>
                        </ul>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <h2 class="no-ml"><?php echo $this->_tpl_vars['lang']['ContactInfo']; ?>
</h2>
            <h3 class="no-ml"><?php echo $this->_tpl_vars['opconfig']['clientinfo']; ?>
</h3>
                                         <div class="contact-table-bg">
                            <?php if ($this->_tpl_vars['logged'] == '1'): ?>
                                <div class="client-logged">
                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "drawclientinfo.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                </div>
                            <?php else: ?>
                                <div id="updater" class="clear">
                                    <?php if ($this->_tpl_vars['submit']['cust_method'] == 'login' || $this->_tpl_vars['submit']['action'] == 'login'): ?>
                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.login.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                    <?php else: ?>
                                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'ajax.signup.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                                    <?php endif; ?>
                                    </div>
                            <?php endif; ?>
            </div>

                        </div>

            </div>


    <div class="span4">
        <div>
            <h2 class="no-ml"><?php echo $this->_tpl_vars['lang']['cart_add']; ?>
</h2>
            <h3 class="no-ml"><?php echo $this->_tpl_vars['lang']['c_tarea']; ?>
</h3>

            <div class="additional-information">
                <p>Write additional info here:</p>
                <textarea name="notes">
                </textarea>
            </div>

            <div class="tos">
                <?php if ($this->_tpl_vars['tos']): ?>
                <div class="padding">
                    <p><input id="checkbox-tos" type="checkbox" name="tos" /> <?php echo $this->_tpl_vars['lang']['tos1']; ?>
 <a href="<?php echo $this->_tpl_vars['tos']; ?>
" target="_blank"><?php echo $this->_tpl_vars['lang']['tos2']; ?>
</a></p>
                </div>
                <?php endif; ?>
                <button type="submit" class="btn-blue checkout-button btn-block disabled" disabled="disabled"><?php echo $this->_tpl_vars['lang']['checkout']; ?>
</button>
            </div>
        </div>
    </div>
</div>
</form>
<!-- End of Client details -->


</div>











