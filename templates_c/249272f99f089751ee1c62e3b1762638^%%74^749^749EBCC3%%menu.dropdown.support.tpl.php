<?php /* Smarty version 2.6.26, created on 2018-06-19 16:25:00
         compiled from menus/menu.dropdown.support.tpl */ ?>
<div class="cntn"><div class="row">
        <div class="span8">
            <div class="row ">
                <div class="span5">
                    <ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['tickets']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
tickets/new/"><?php echo $this->_tpl_vars['lang']['openticket']; ?>
</a></li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
tickets/" ><?php echo $this->_tpl_vars['lang']['ticketarchive']; ?>
</a></li>
                    </ul>

                    <?php if ($this->_tpl_vars['enableFeatures']['kb'] != 'off'): ?><ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['knowledgebase']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
knowledgebase/"  > <?php echo $this->_tpl_vars['lang']['vsarticles']; ?>
</a></li>
                    </ul> <?php endif; ?>


                    <?php if ($this->_tpl_vars['enableFeatures']['downloads'] != 'off'): ?>
                    <ul class="span2">
                        <li class="nav-header span2"><?php echo $this->_tpl_vars['lang']['downloads']; ?>
</li>
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
downloads/" ><?php echo $this->_tpl_vars['lang']['browsedownloads']; ?>
</a></li>
                    </ul>
                    <?php endif; ?>


                    <?php if ($this->_tpl_vars['enableFeatures']['chat'] != 'off'): ?>
                    <ul class="span2">
                        <li ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
chat/" ><?php echo $this->_tpl_vars['lang']['chat']; ?>
</a></li>
                    </ul>
                    <?php endif; ?>

                    <?php if ($this->_tpl_vars['enableFeatures']['netstat'] != 'off'): ?>
                    <ul class="span2"> <li  ><a href="<?php echo $this->_tpl_vars['ca_url']; ?>
netstat/" ><?php echo $this->_tpl_vars['lang']['netstat']; ?>
</a></li>  </ul>
                    <?php endif; ?>

                </div>
                <div class="span3">
                    <center>
                        <div class="iconwrap"><span style="" class="iconfont-question-round iconfont-size5 silver"></span><br/></div>
                        <p class="silver"><?php echo $this->_tpl_vars['lang']['wereherephrase']; ?>
</p>
                        <button href="<?php echo $this->_tpl_vars['ca_url']; ?>
support/" class="btn btn-success"><i class="icon-question-sign icon-white"></i> <?php echo $this->_tpl_vars['lang']['supporthome']; ?>
</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>