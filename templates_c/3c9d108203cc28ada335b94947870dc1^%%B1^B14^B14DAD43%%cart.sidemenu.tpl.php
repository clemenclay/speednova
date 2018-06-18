<?php /* Smarty version 2.6.26, created on 2018-06-18 09:51:53
         compiled from ../orderpages/cart.sidemenu.tpl */ ?>
<?php if ($this->_tpl_vars['step'] != 5 && $this->_tpl_vars['step'] != 0 && $this->_tpl_vars['step'] != 4 && ! $this->_tpl_vars['has_own_ajax']): ?>
    <div id="sidemenu" class="default-cart">
        <div style="position:relative;">
            <div id="floater" style="position:absolute;">
                <div class="wbox">
                    <div class="wbox_header"><?php echo $this->_tpl_vars['lang']['cartsum1']; ?>
</div>
                    <div class="wbox_content" id="cartSummary">
                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => '../orderpages/ajax.cart.summary.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                    </div>
                </div>
            </div>
        </div>
        <?php echo '
            <script type="text/javascript">
                function flyingSidemenu() {
                    $(\'#sidemenu\').height($(\'#floater\').height());
                    $(window).scroll(function () {
                        var t = $(window).scrollTop() - $(\'#sidemenu\').offset().top;
                        var maxi = $(\'#contener\').height() - $(\'#floater\').height() - 15;
                        if (t > maxi)
                            t = maxi;
                        if (t < 0)
                            t = 0;

                        $(\'#floater\').animate({top: t + "px"}, {queue: false, duration: 300});
                    });
                }
                appendLoader(\'flyingSidemenu\');

            </script>
        '; ?>

    </div>
<?php endif; ?>