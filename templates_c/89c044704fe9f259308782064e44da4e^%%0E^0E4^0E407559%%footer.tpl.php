<?php /* Smarty version 2.6.26, created on 2018-06-20 15:23:09
         compiled from footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'adminfooter', 'footer.tpl', 2, false),array('function', 'securitytoken', 'footer.tpl', 7, false),)), $this); ?>
</div>
<?php echo smarty_function_adminfooter(array(), $this);?>

<div class="modal fade" tabindex="-1" role="dialog" id="reloginplace">
    <div class="modal-dialog" role="document">
        <form action="" method="POST">
            <input type="hidden" name="username" value="<?php echo $this->_tpl_vars['staff']['username']; ?>
">
            <?php echo smarty_function_securitytoken(array(), $this);?>

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Your Session Expired</h4>
                </div>
                <div class="modal-body">

                    <div class="alert alert-info" role="alert">
                        Enter your password to pickup where you left off.
                    </div>
                    <div class="form-group">
                        <label for="reloginpass">Password</label>
                        <input type="password" name="password" class="form-control" id="reloginpass" placeholder="Password">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="index.php" class="btn btn-default">Logout</a>
                    <button type="submit" class="btn btn-primary">Resume Session</button>
                </div>
            </div><!-- /.modal-content -->
        </form>

    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>