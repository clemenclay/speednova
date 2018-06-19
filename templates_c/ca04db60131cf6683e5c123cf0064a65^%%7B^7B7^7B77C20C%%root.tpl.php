<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from root.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'root.tpl', 11, false),array('modifier', 'dateformat', 'root.tpl', 45, false),)), $this); ?>

<h3><?php echo $this->_tpl_vars['lang']['welcome']; ?>
</h3>
<div class="row box-feature-divider">
    <div class="span4">
        <div class="box-feature"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/"><span style="" class="iconfont-bag iconfont-size5 silver"></span></a>
               <h1><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['placeorder'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</h1>
                <p><?php echo $this->_tpl_vars['lang']['placeorder_desc']; ?>
</p>

        </div>
    </div>
    <div class="span4">

        <div class="box-feature">
            <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><span style="" class="iconfont-gear iconfont-size5 silver"></span></a>
                <h1><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['clientarea'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</h1>
                <p><?php echo $this->_tpl_vars['lang']['clientarea_desc']; ?>
</p>
        </div>
    </div>

    <div class="span4">
        <div class="box-feature">

            <a href="<?php if ($this->_tpl_vars['logged'] == '1'): ?><?php echo $this->_tpl_vars['ca_url']; ?>
support<?php elseif ($this->_tpl_vars['enableFeatures']['kb'] != 'off'): ?><?php echo $this->_tpl_vars['ca_url']; ?>
knowledgebase<?php else: ?><?php echo $this->_tpl_vars['ca_url']; ?>
tickets/new<?php endif; ?>/"><span style="" class="iconfont-question-round iconfont-size5 silver"></span></a>
                <h1><?php echo ((is_array($_tmp=$this->_tpl_vars['lang']['support'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</h1>
                <p><?php echo $this->_tpl_vars['lang']['support_desc']; ?>
</p>
        </div>
    </div>
</div>






<?php if ($this->_tpl_vars['enableFeatures']['news'] != 'off' && $this->_tpl_vars['annoucements']): ?>
<div id="announcements">
	<?php $_from = $this->_tpl_vars['annoucements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['annoucement']):
?>

<h3><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
news/view/<?php echo $this->_tpl_vars['annoucement']['id']; ?>
/<?php echo $this->_tpl_vars['annoucement']['slug']; ?>
/"><?php echo $this->_tpl_vars['annoucement']['title']; ?>
</a></h3>
<span class="annoucement_date"><i class="icon-time"></i> <?php echo $this->_tpl_vars['lang']['published']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['annoucement']['date'])) ? $this->_run_mod_handler('dateformat', true, $_tmp, $this->_tpl_vars['date_format']) : smarty_modifier_dateformat($_tmp, $this->_tpl_vars['date_format'])); ?>
</span>
<p ><?php echo $this->_tpl_vars['annoucement']['content']; ?>



</p><div class="right">
    <div  class="btn-group">
          <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
news/" class="btn btn-small"><?php echo $this->_tpl_vars['lang']['newsarchive']; ?>
</a>
          <a  href="<?php echo $this->_tpl_vars['ca_url']; ?>
news/view/<?php echo $this->_tpl_vars['annoucement']['id']; ?>
/<?php echo $this->_tpl_vars['annoucement']['slug']; ?>
/" class="btn btn-small"><?php echo $this->_tpl_vars['lang']['readall']; ?>
</a>
        </div> </div>
<div class="clear"></div>
	<?php endforeach; endif; unset($_from); ?>
</div>
<?php endif; ?>
