<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'userfooter', 'footer.tpl', 21, false),)), $this); ?>
</div>
<div class="clear"></div>
</section>
<footer>
    <span class="left">&copy; 2012 <?php echo $this->_tpl_vars['business_name']; ?>
</span>
    <span class="right">
        <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
"><?php echo $this->_tpl_vars['lang']['homepage']; ?>
</a> -
        <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
cart/"><?php echo $this->_tpl_vars['lang']['order']; ?>
</a> -
        <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
<?php if ($this->_tpl_vars['enableFeatures']['kb'] != 'off'): ?>knowledgebase/<?php else: ?>tickets/new/<?php endif; ?>"><?php echo $this->_tpl_vars['lang']['support']; ?>
</a> -
        <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/"><?php echo $this->_tpl_vars['lang']['clientarea']; ?>
</a>
        <?php if ($this->_tpl_vars['enableFeatures']['affiliates'] != 'off'): ?>
        - <a href="<?php echo $this->_tpl_vars['ca_url']; ?>
affiliates/"><?php echo $this->_tpl_vars['lang']['affiliates']; ?>
</a>
        <?php endif; ?>
    </span>
    <div class="clear"></div>

</footer>
</div>
</div>
<?php if ($this->_tpl_vars['enableFeatures']['chat'] != 'off'): ?><!--HostBill Chat Code, (c) HostBill --><div id="hbinvitationcontainer_f87dea01855e3766"></div><div id="hbtagcontainer_f87dea01855e3766"></div><script type="text/javascript">var hb_script_tag_f87dea01855e3766=document.createElement("script");hb_script_tag_f87dea01855e3766.type="text/javascript";setTimeout('hb_script_tag_f87dea01855e3766.src="<?php echo $this->_tpl_vars['system_url']; ?>
index.php?cmd=hbchat&action=embed&v=cmFuZGlkPWY4N2RlYTAxODU1ZTM3NjYmaW52aXRlX2lkPTMmdGFnPXNpZGViYXImc3RhdHVzX2lkPTI=";document.getElementById("hbtagcontainer_f87dea01855e3766").appendChild(hb_script_tag_f87dea01855e3766);',5);</script><!--END OF: HostBill Chat Code, (c) HostBill --><?php endif; ?>
<?php echo smarty_function_userfooter(array(), $this);?>

</body>
</html>