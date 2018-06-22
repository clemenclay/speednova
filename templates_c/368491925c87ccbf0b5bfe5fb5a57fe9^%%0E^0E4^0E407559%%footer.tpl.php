<?php /* Smarty version 2.6.26, created on 2018-06-21 21:35:34
         compiled from footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'userfooter', 'footer.tpl', 15, false),)), $this); ?>
</main><script>
    // this is why we can't have nice things
    var browser_old = true;
</script>


<script src="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/js/vendors.min.6ca4bb066c7a1820d701.js"></script>
<script src="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/js/app.min.abafa48b1cf9213b5731.js"></script>
</body>
</html>

</div>
</div>
<?php if ($this->_tpl_vars['enableFeatures']['chat'] != 'off'): ?><!--HostBill Chat Code, (c) HostBill --><div id="hbinvitationcontainer_f87dea01855e3766"></div><div id="hbtagcontainer_f87dea01855e3766"></div><script type="text/javascript">var hb_script_tag_f87dea01855e3766=document.createElement("script");hb_script_tag_f87dea01855e3766.type="text/javascript";setTimeout('hb_script_tag_f87dea01855e3766.src="<?php echo $this->_tpl_vars['system_url']; ?>
index.php?cmd=hbchat&action=embed&v=cmFuZGlkPWY4N2RlYTAxODU1ZTM3NjYmaW52aXRlX2lkPTMmdGFnPXNpZGViYXImc3RhdHVzX2lkPTI=";document.getElementById("hbtagcontainer_f87dea01855e3766").appendChild(hb_script_tag_f87dea01855e3766);',5);</script><!--END OF: HostBill Chat Code, (c) HostBill --><?php endif; ?>
<?php echo smarty_function_userfooter(array(), $this);?>

</body>
</html>