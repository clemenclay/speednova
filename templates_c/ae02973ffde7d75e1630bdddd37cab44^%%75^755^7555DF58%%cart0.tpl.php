<?php /* Smarty version 2.6.26, created on 2018-06-11 12:14:19
         compiled from cart_rotatebox/cart0.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'specs', 'cart_rotatebox/cart0.tpl', 41, false),)), $this); ?>
<link media="all" type="text/css" rel="stylesheet" href="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
cart_rotatebox/css/main.css" />

<div id="container">
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'cart_rotatebox/categories.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'cart_rotatebox/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

    <?php if (count ( $this->_tpl_vars['currencies'] ) > 1): ?>
    <form action="" method="post" id="currform">
        <p align="right" style="margin-right:15px">
            <input name="action" type="hidden" value="changecurr">
            <?php echo $this->_tpl_vars['lang']['Currency']; ?>
 <select name="currency" class="styled span2" onchange="$('#currform').submit()">
                <?php $_from = $this->_tpl_vars['currencies']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['crx']):
?>
                <option value="<?php echo $this->_tpl_vars['crx']['id']; ?>
" <?php if (! $this->_tpl_vars['selcur'] && $this->_tpl_vars['crx']['id'] == 0): ?>selected="selected"<?php elseif ($this->_tpl_vars['selcur'] == $this->_tpl_vars['crx']['id']): ?>selected="selected"<?php endif; ?>><?php if ($this->_tpl_vars['crx']['code']): ?><?php echo $this->_tpl_vars['crx']['code']; ?>
<?php else: ?><?php echo $this->_tpl_vars['crx']['iso']; ?>
<?php endif; ?></option>
                <?php endforeach; endif; unset($_from); ?>
            </select>
        </p>
    </form>
    <?php endif; ?>

    <div id="box-wrapper">
        <div id="info">
            <div class="i">Disc Space</div>
            <div class="i">CPU</div>
            <div class="i">RAM</div>
            <div class="i">SiteBuilder</div>
        </div>

        <ul id="boxes">
            <?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['i']):
        $this->_foreach['loop']['iteration']++;
?>
            <?php if (($this->_foreach['loop']['iteration']-1) > 2): ?><?php break; ?><?php endif; ?>

            <li class="scene <?php if (($this->_foreach['loop']['iteration']-1) == $this->_tpl_vars['opconfig']['highlighted']): ?>pink<?php else: ?>blue<?php endif; ?> <?php if (($this->_foreach['loop']['iteration']-1) == 1): ?>margin<?php endif; ?>">
                <div class="single-box">
                    <div class="info">
                        <div class="header">
                            <?php echo $this->_tpl_vars['i']['name']; ?>

                            <span><sup><?php echo $this->_tpl_vars['currency']['sign']; ?>
</sup><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/price.tpl', 'smarty_include_vars' => array('product' => $this->_tpl_vars['i'],'hideall' => true)));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> <span class="currency"><?php echo $this->_tpl_vars['currency']['iso']; ?>
</span></span>
                            <?php if (($this->_foreach['loop']['iteration']-1) == $this->_tpl_vars['opconfig']['highlighted']): ?><div class="green-badge"></div><?php endif; ?>
                        </div>

                        <?php echo smarty_function_specs(array('var' => 'awords','string' => $this->_tpl_vars['i']['description']), $this);?>

                        <?php $_from = $this->_tpl_vars['awords']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['lla'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['lla']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['prod']):
        $this->_foreach['lla']['iteration']++;
?>
                            <?php if ($this->_tpl_vars['prod']['specs']): ?> 
                            <?php $_from = $this->_tpl_vars['prod']['specs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ll'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ll']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['ka'] => $this->_tpl_vars['feat']):
        $this->_foreach['ll']['iteration']++;
?>
                            <div class="<?php if (($this->_foreach['ll']['iteration']-1) % 2 == 0): ?>odd<?php else: ?>even<?php endif; ?>"><?php echo $this->_tpl_vars['feat'][1]; ?>
</div>
                            <?php endforeach; endif; unset($_from); ?>
                            <?php endif; ?>
                        <?php endforeach; endif; unset($_from); ?>
                        <?php $this->assign('awords', false); ?>

                        <div class="odd">
                            <a class="btn-green"><i class="ico-info"></i><?php echo $this->_tpl_vars['lang']['plandetails']; ?>
</a>
                        </div>
                    </div>
                    <div class="details">
                        <div class="header">
                            <?php echo $this->_tpl_vars['i']['name']; ?>

                            <span><sup><?php echo $this->_tpl_vars['currency']['sign']; ?>
</sup><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/price.tpl', 'smarty_include_vars' => array('product' => $this->_tpl_vars['i'],'hideall' => true)));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> <span class="currency"><?php echo $this->_tpl_vars['currency']['iso']; ?>
</span></span>
                            <?php if (($this->_foreach['loop']['iteration']-1) == $this->_tpl_vars['opconfig']['highlighted']): ?><div class="green-badge"></div><?php endif; ?>
                        </div>
                        <div class="odd smaller">
                            <?php echo smarty_function_specs(array('var' => 'awords','string' => $this->_tpl_vars['i']['description']), $this);?>

                            <?php $_from = $this->_tpl_vars['awords']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['lla'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['lla']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['prod']):
        $this->_foreach['lla']['iteration']++;
?>

                            <strong>This plan best fits to:</strong>
                            <?php if ($this->_tpl_vars['prod']['features']): ?> 
                            <?php echo $this->_tpl_vars['prod']['features']; ?>

                            <?php endif; ?>

                            <?php endforeach; endif; unset($_from); ?>
                            <?php $this->assign('awords', false); ?>
                        </div>
                        <div class="even smaller">
                            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/cycle.tpl", 'smarty_include_vars' => array('product' => $this->_tpl_vars['i'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                            <span class="price"><sup><?php echo $this->_tpl_vars['currency']['sign']; ?>
</sup><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'common/price.tpl', 'smarty_include_vars' => array('product' => $this->_tpl_vars['i'],'hideall' => true)));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> <span class="currency"><?php echo $this->_tpl_vars['currency']['iso']; ?>
</span></span>
                        </div>
                        <div class="odd">
                            <form method="post" action="" class="parentform">
                                <input type="hidden" name="action" value="add" />
                                <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['i']['id']; ?>
" />
                                <a href="#" class="btn-green order-btn" onclick="$(this).parent().submit();
                                        return false;">
                                    <i class="ico-cart"></i><?php echo $this->_tpl_vars['lang']['ordernow']; ?>

                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </li>

            <?php endforeach; endif; unset($_from); ?>
        </ul>

    </div>


    <div class="clearfix"></div>

    <div id="footer">
        <h2><?php echo $this->_tpl_vars['opconfig']['footheader']; ?>
</h2>

        <div class="clearfix"></div>

        <div class="badge-box box">
            <img src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
cart_rotatebox/images/badge-ok.png" alt="" />
            <h3><?php echo $this->_tpl_vars['opconfig']['footer1head']; ?>
</h3>
            <p><?php echo $this->_tpl_vars['opconfig']['footer1text']; ?>
</p>
        </div>
        <div class="badge-box box margin">
            <img src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
cart_rotatebox/images/badge-ok.png" alt="" />
            <h3><?php echo $this->_tpl_vars['opconfig']['footer2head']; ?>
</h3>
            <p><?php echo $this->_tpl_vars['opconfig']['footer2text']; ?>
</p>
        </div>
        <div class="badge-box box">
            <img src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
cart_rotatebox/images/badge-ok.png" alt="" />
            <h3><?php echo $this->_tpl_vars['opconfig']['footer3head']; ?>
</h3>
            <p><?php echo $this->_tpl_vars['opconfig']['footer3text']; ?>
</p>
        </div>
    </div>

</div> 
