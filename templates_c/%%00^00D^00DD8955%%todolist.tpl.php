<?php /* Smarty version 2.6.26, created on 2018-06-11 12:07:07
         compiled from adminwidgets/todolist.tpl */ ?>
<?php if (! empty ( $this->_tpl_vars['todo'] )): ?>
<p style="line-height: 1.75em;">
    <?php if ($this->_tpl_vars['todo']['templates_c_outside']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label> Move templates_c directory outside of web-accessible folder! <a href="https://hostbill.atlassian.net/wiki/display/DOCS/Additional+security+steps" target="_blank">Secure directories</a></a> <br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['emailoff']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['emailisturnetoff']; ?>
</label> <br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['install']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['removeinstall']; ?>
<br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['changepass']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['changeadminpass']; ?>
<br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['cron']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['cronnotwork']; ?>
 <a href="?cmd=configuration&action=cron"><?php echo $this->_tpl_vars['lang']['doitnow']; ?>
.</a><br />

        <?php if ($this->_tpl_vars['todo']['chmodcron']): ?>
            <label class="label label-info">Info</label> <?php echo $this->_tpl_vars['lang']['chmodcron']; ?>
<br />
        <?php endif; ?>
    <?php endif; ?>

    <?php if ($this->_tpl_vars['todo']['queue_failed']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  Queue is not enabled in cron. Add following crontab entry: <code>* * * * * php <?php echo $this->_tpl_vars['hb_maindir']; ?>
queue.php</code><br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['queue_slow']): ?>
        <label class="label label-info">Info</label> You can increase your queue processing performance: <a href="https://hostbill.atlassian.net/wiki/display/DOCS/HostBill+Queue+Performance" target="_blank">Learn more</a><br />
    <?php endif; ?>

    <?php if ($this->_tpl_vars['todo']['crontaskblock']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['crontaskdisabled']; ?>
</label> <a href="?cmd=configuration&action=cron"><?php echo $this->_tpl_vars['lang']['Learnmore']; ?>
.</a> <a href="?cmd=logs&action=errorlog"> Error Log</a><br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['downindex']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['placeindexdownload']; ?>
<br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['tempindex']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['placeindextemplates']; ?>
<br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['attindex']): ?>
        <label class="label label-danger"><?php echo $this->_tpl_vars['lang']['critical']; ?>
</label>  <?php echo $this->_tpl_vars['lang']['placeindexattachments']; ?>
<br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['config']): ?>
        <label class="label label-info">Info</label> <?php echo $this->_tpl_vars['lang']['shouldeditconfig']; ?>
. <a href="?cmd=configuration"><?php echo $this->_tpl_vars['lang']['doitnow']; ?>
.</a><br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['modules']): ?>
        <label class="label label-info">Info</label> <?php echo $this->_tpl_vars['lang']['tostartconfigservers']; ?>
 <a href="?cmd=managemodules"><?php echo $this->_tpl_vars['lang']['doitnow']; ?>
.</a><br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['servers']): ?>
        <label class="label label-info">Info</label> <?php echo $this->_tpl_vars['lang']['configureservers']; ?>
 <a href="?cmd=servers"><?php echo $this->_tpl_vars['lang']['doitnow']; ?>
.</a><br />
    <?php endif; ?>
    <?php if ($this->_tpl_vars['todo']['packages']): ?>
        <label class="label label-info">Info</label> <?php echo $this->_tpl_vars['lang']['addpackagestosell']; ?>
<a href="?cmd=services&action=addproduct"><?php echo $this->_tpl_vars['lang']['doitnow']; ?>
.</a><br />
    <?php endif; ?>
</p>
<?php endif; ?>