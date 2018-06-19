<?php /* Smarty version 2.6.26, created on 2018-06-19 16:24:47
         compiled from menus/menu.dropdown.account.tpl */ ?>
<div class="cntn">
    <div class="row">
        <div class="span8">
            <div class="row ">
                <div class="span5">
                    <ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['mainaccount']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/details/" ><?php echo $this->_tpl_vars['lang']['details']; ?>
</a></li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/password/" ><?php echo $this->_tpl_vars['lang']['changepass']; ?>
</a></li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
profiles/" ><?php echo $this->_tpl_vars['lang']['managecontacts']; ?>
</a></li>
                        <?php if ($this->_tpl_vars['enableFeatures']['security'] == 'on'): ?><li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/ipaccess/" ><?php echo $this->_tpl_vars['lang']['security']; ?>
</a></li><?php endif; ?>
                        <?php if ($this->_tpl_vars['enableFeatures']['deposit'] != 'off'): ?><li><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/addfunds/"><?php echo $this->_tpl_vars['lang']['addfunds']; ?>
</a></li><?php endif; ?>
                    </ul>

                    <ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['billing']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/invoices/"><?php echo $this->_tpl_vars['lang']['invoices']; ?>
</a></li>
                        <li ><?php if ($this->_tpl_vars['enableCCards']): ?><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/ccard/"><?php echo $this->_tpl_vars['lang']['ccard']; ?>
</a><?php else: ?><br /><?php endif; ?></li>
                    </ul>

                    <ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['userhistory']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/emails/"><?php echo $this->_tpl_vars['lang']['emails']; ?>
</a></li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/history/"><?php echo $this->_tpl_vars['lang']['logs']; ?>
</a></li>
                    </ul>
                </div>
                <div class="span3">
                    <center>
                        <div class="iconwrap"><span style="" class="iconfont-card iconfont-size5 silver"></span><br/></div>
                        <p class="silver"><?php echo $this->_tpl_vars['lang']['managedetailsinfo']; ?>
</p>
                        <button href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/" class="btn btn-success"><i class="icon-user icon-white"></i> <?php echo $this->_tpl_vars['lang']['dashboard']; ?>
</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>