<?php /* Smarty version 2.6.26, created on 2018-06-15 08:44:04
         compiled from clientarea/leftnavigation.tpl */ ?>
<h2 style="color: transparent;">Menu</h2>
<div class="card">
        <ul class="list-group list-group-flush">
            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'details'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/details/"><span class="iconfont-card iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['mydetails']; ?>
</h4></a>
            </li>

            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'password'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/password/"><span class="iconfont-lock iconfont-size4 silver" style=""></span>
                <h4><?php if ($this->_tpl_vars['clientdata']['contact_id']): ?><?php echo $this->_tpl_vars['lang']['changemainpass']; ?>
<?php else: ?><?php echo $this->_tpl_vars['lang']['changepass']; ?>
<?php endif; ?></h4></a>
            </li>

            <?php if ($this->_tpl_vars['enableFeatures']['deposit'] != 'off'): ?>
            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'addfunds'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/addfunds/"><span class="iconfont-plus-round iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['addfunds']; ?>
</h4></a>
            </li>
            <?php endif; ?>
            <?php if ($this->_tpl_vars['clientdata']['contact_id'] != 'off'): ?>
            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'profilepassword'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/profilepassword/"><span class="iconfont-lock iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['changemypass']; ?>
</h4></a>
            </li>
            <?php endif; ?>


            <?php if ($this->_tpl_vars['enableCCards'] != 'off'): ?>
            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'ccard'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/ccard/"><span class="iconfont-extract iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['ccard']; ?>
</h4></a>
            </li>
            <?php endif; ?>


            <?php if ($this->_tpl_vars['enableACH'] != 'off'): ?>
                <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'ach'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/ach/"><span class="iconfont-card iconfont-size4 silver" style=""></span>
                    <h4><?php echo $this->_tpl_vars['lang']['ACHecheck']; ?>
</h4></a>
                </li>
            <?php endif; ?>
            <!--
            <div class="box-feature<?php if ($this->_tpl_vars['cmd'] == 'profiles'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
profiles/"><span class="iconfont-add-user iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['profiles']; ?>
</h4></a>
            </div>-->
            <?php if ($this->_tpl_vars['enableFeatures']['security'] == 'on'): ?>
            <li class="list-group-item<?php if ($this->_tpl_vars['action'] == 'ipaccess'): ?> active<?php endif; ?>"><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
clientarea/ipaccess/"><span class="iconfont-cloud-upload iconfont-size4 silver" style=""></span>
                <h4><?php echo $this->_tpl_vars['lang']['ipaccess']; ?>
</h4></a>
            </li>
            <?php endif; ?>
        </ul>
</div>