<?php /* Smarty version 2.6.26, created on 2018-06-19 15:29:11
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'adminheader', 'header.tpl', 27, false),array('function', 'adminwidget', 'header.tpl', 368, false),array('modifier', 'count', 'header.tpl', 319, false),)), $this); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
        <title><?php echo $this->_tpl_vars['hb']; ?>
<?php if ($this->_tpl_vars['pagetitle']): ?><?php echo $this->_tpl_vars['pagetitle']; ?>
 -<?php endif; ?> <?php echo $this->_tpl_vars['business_name']; ?>
 </title>
        <script type="text/javascript">
            var lang = [];
            lang['edit'] = "<?php echo $this->_tpl_vars['lang']['Edit']; ?>
";
            Date.format = '<?php echo $this->_tpl_vars['js_date']; ?>
';
            var startDate = '<?php echo $this->_tpl_vars['js_start']; ?>
';
            var ts = new Date();
            var ss = ts.getMinutes();
            if (ss < 10)
                ss = "0" + ss;
            var s = ts.getHours().toString() + ':' + ss;</script>
        <script type="text/javascript" src="<?php echo $this->_tpl_vars['template_dir']; ?>
dist/js/hostbill<?php if (! $this->_tpl_vars['DEV']): ?>.min<?php endif; ?>.js?v=<?php echo $this->_tpl_vars['hb_version']; ?>
"></script>



        <link href="<?php echo $this->_tpl_vars['template_dir']; ?>
dist/stylesheets/application.css?v=<?php echo $this->_tpl_vars['hb_version']; ?>
" rel="stylesheet" media="all" />
        <link href="?cmd=clients&action=groupcolors&v=<?php echo $this->_tpl_vars['hb_version']; ?>
" rel="stylesheet" media="all" />
        <link href="<?php echo $this->_tpl_vars['template_dir']; ?>
dist/stylesheets/font-awesome.min.css?v=<?php echo $this->_tpl_vars['hb_version']; ?>
" rel="stylesheet" media="all" />



        <?php echo smarty_function_adminheader(array(), $this);?>


        <?php echo '

            <script>
                $(document).ready(function () {

                    var touchHover = function (e) {
                        /*
                         * Emulate hover phase when using touch device
                         */
                        var self = $(this),
                            parents = $(e.target).parents(\'.mainer > li, .mainer .submenu > li, .leftNav, li\'),
                            target = parents.eq(0);
                        
                        
                        
                        var hovers = $(\'.hover\').filter(\'.mainer > li, .mainer .submenu > li, .leftNav\'),
                            hoverable = hovers.length && !hovers.filter(target[0]).length && !hovers.find(target[0]).length;
                        
                        if (!target.length || !target.find(\'.submenu, .topnav-popover, a.tstyled\').length) {
                            if (hoverable) {
                                hovers.removeClass(\'hover\');
                            }
                            return;
                        }

                        if (hovers.length && (hovers.filter(target[0]).length)) {
                            return true;
                        }
                        e.preventDefault();
                        e.stopPropagation();

                        hovers.removeClass();
                        parents.addClass(\'hover\');

                    };

                    $(\'#mmcontainer, .leftNav\').each(function(){
                        document.addEventListener(\'touchstart\', touchHover, false);
                    });
                });
            </script>

        '; ?>

    </head>

    <body class="<?php echo $this->_tpl_vars['language']; ?>
 cmd-<?php echo $this->_tpl_vars['cmd']; ?>
">

        <div id="topbar">
            <div class="left">


                <div id="taskMGR">

                    <div class="toper">
                        <span class="small-load" style="display:none;"></span>
                        <span class="progress" id="pb1" style="display:none;"></span>
                        <div id="numerrors"  style="display:none;">0</div>
                        <div id="numinfos"  style="display:none;">0</div>
                    </div>
                    <a class="showlog right" href="#"><?php echo $this->_tpl_vars['lang']['showlog']; ?>
</a>
                    <div id="outer">

                        <ul id="iner">
                            <?php $_from = $this->_tpl_vars['error']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['blad']):
?>
                                <li class="error visible"><script type="text/javascript"> document.write(s);</script> <?php echo $this->_tpl_vars['blad']; ?>
</li>
                                <?php endforeach; endif; unset($_from); ?>
                                <?php $_from = $this->_tpl_vars['info']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['infos']):
?>
                                <li class="info visible"><script type="text/javascript"> document.write(s);</script> <?php echo $this->_tpl_vars['infos']; ?>
</li>
                                <?php endforeach; endif; unset($_from); ?>
                        </ul>
                    </div>

                </div>

            </div>
            <div class="right">
                <span class="hidden-xs"><?php echo $this->_tpl_vars['lang']['loggedas']; ?>
:</span> <a href="?action=myaccount"><strong><?php echo $this->_tpl_vars['admindata']['username']; ?>
</strong></a>  |<span class="hidden-xs"> <a href="<?php echo $this->_tpl_vars['system_url']; ?>
"><?php echo $this->_tpl_vars['lang']['clientarea']; ?>
</a> | <a href="?action=myaccount"><?php echo $this->_tpl_vars['lang']['myaccount']; ?>
</a> |</span> <a href="?cmd=configuration"><?php echo $this->_tpl_vars['lang']['Configuration']; ?>
</a> |  <a href="?action=logout"><?php echo $this->_tpl_vars['lang']['Logout']; ?>
</a></div>
            <div class="clear"></div>

        </div>


        <div id="body-content">
            <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;" width="100%">
                <tr>
                    <td class="logoLeftNav"><a href="index.php"><img src="<?php echo $this->_tpl_vars['template_dir']; ?>
img/hostbill-logo.png"  alt="" id="hostbill-logo"/></a></td>
                    <td valign="middle" style="background:#354a5f;">
                        <div class="menushelf row no-gutter" id="menushelf">

                            <div class="col-sm-1 col-xs-6 collapse-container">
                                <button type="button" class="hidden-xs visible-sm-block navbar-toggle collapsed sm-control pull-left" data-toggle="collapse" data-target=".leftNav" aria-expanded="false">
                                    <span class="sr-only">Toggle left menu</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <button type="button" class=" navbar-toggle collapsed  pull-left" data-toggle="collapse" data-target=".leftNav" aria-expanded="false">
                                    <span class="sr-only">Toggle left menu</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                                <div class="col-xs-6">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse-target" aria-expanded="false">
                                        <span class="sr-only">Toggle right menu</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>

                            <div class="col-md-8 col-xs-12 col-sm-9">

                                   <div class="collapse navbar-collapse navbar-collapse-target">
                                        <ul class="mainer" id="mmcontainer" style="overflow:hidden" >
                                            <li class="home">
                                                <a href="index.php" >
                                                    <span class="second home"><?php echo $this->_tpl_vars['lang']['Home']; ?>
</span>

                                                </a>
                                            </li>

                                            <li class="clients">
                                                <a class="mainmenu" href="?cmd=clients">
                                                    <span class="second clients"><?php echo $this->_tpl_vars['lang']['Clients']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a> 
                                                <ul class="submenu megadropdown">
                                                    <li ><a href="?cmd=clients"><?php echo $this->_tpl_vars['lang']['manageclients']; ?>
</a></li>
                                                    <li ><a href="?cmd=newclient"><?php echo $this->_tpl_vars['lang']['registernewclient']; ?>
</a></li>
                                                    <li ><a href="?cmd=sendmessage"><?php echo $this->_tpl_vars['lang']['SendMessage']; ?>
</a></li>
                                                    <li ><a href="?cmd=affiliates"><?php echo $this->_tpl_vars['lang']['Affiliates']; ?>
</a></li>
                                                    <li >
                                                        <a href="?cmd=clients&action=groups"><?php echo $this->_tpl_vars['lang']['clientgroups']; ?>
</a>
                                                    </li>
                                                    <li >
                                                        <a href="?cmd=clients&action=fields"><?php echo $this->_tpl_vars['lang']['customerfields']; ?>
</a>
                                                    </li>
                                                    <?php $_from = $this->_tpl_vars['HBaddons']['clients_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                        <li >
                                                            <a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a>
                                                        </li>
                                                    <?php endforeach; endif; unset($_from); ?>
                                                </ul>
                                            </li>

                                            <li class="support"><a class="mainmenu" href="?cmd=tickets">
                                                    <span class="second support"><?php echo $this->_tpl_vars['lang']['Support']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a> 
                                                <ul class="submenu megadropdown">
                                                    <?php if ($this->_tpl_vars['enableFeatures']['support']): ?>
                                                        <li ><a href="?cmd=tickets" class="hassub"><?php echo $this->_tpl_vars['lang']['supptickets']; ?>
</a>
                                                            <div  class="topnav-popover">
                                                                <div class="topnav-popover-content">
                                                                    <ul class="subbmenu">
                                                                        <li ><a href="?cmd=tickets">All tickets</a></li>
                                                                        <li ><a href="?cmd=tickets&list=all&showall=true&assigned=true">My tickets</a></li>
                                                                        <li ><a href="?cmd=tickets&list=Open&showall=true">Open tickets</a></li>
                                                                        <li ><a href="?cmd=tickets&list=Client-Reply&showall=true">Client-Reply tickets</a></li>
                                                                        <li ><a href="?cmd=tickets&action=new" >Open New Ticket</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    <?php endif; ?>
                                                    <?php if ($this->_tpl_vars['enableFeatures']['chatmodule'] == 'on'): ?>
                                                        <li ><a href="?cmd=hbchat"><?php echo $this->_tpl_vars['lang']['LiveChat']; ?>
</a></li>
                                                        <?php endif; ?>
                                                    <li ><a href="?cmd=annoucements"><?php echo $this->_tpl_vars['lang']['News']; ?>
</a></li>
                                                    <li ><a href="?cmd=knowledgebase"><?php echo $this->_tpl_vars['lang']['Knowledgebase']; ?>
</a></li>
                                                        <?php if ($this->_tpl_vars['enableFeatures']['support']): ?>
                                                        <li ><a href="?cmd=ticketdepts"><?php echo $this->_tpl_vars['lang']['ticketdepts']; ?>
</a></li>
                                                        <li ><a href="?cmd=predefinied"><?php echo $this->_tpl_vars['lang']['ticketmacros']; ?>
</a></li>
                                                        <?php endif; ?>
                                                    <li ><a href="?cmd=editadmins"><?php echo $this->_tpl_vars['lang']['Administrators']; ?>
</a></li>
                                                        <?php $_from = $this->_tpl_vars['HBaddons']['support_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                        <li ><a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                </ul>
                                            </li>

                                            <li class="payments"><a class="mainmenu" href="?cmd=invoices">
                                                    <span class="second payments"><?php echo $this->_tpl_vars['lang']['Payments']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a> 
                                                <ul class="submenu megadropdown">

                                                    <li ><a href="?cmd=invoices"  class="hassub"><?php echo $this->_tpl_vars['lang']['Invoices']; ?>
</a><div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <li ><a href="?cmd=invoices&amp;list=paid&amp;showall=true">Paid Invoices</a></li>
                                                                    <li ><a href="?cmd=invoices&amp;list=unpaid&amp;showall=true">UnPaid Invoices</a></li>
                                                                    <li ><a href="?cmd=invoices&amp;list=refunded&amp;showall=true">Refunded Invoices</a></li>

                                                                </ul>
                                                            </div></li>
                                                    <li ><a href="?cmd=invoices&list=recurring"><?php echo $this->_tpl_vars['lang']['Recurringinvoices']; ?>
</a></li>

                                                    <li ><a href="?cmd=estimates"><?php echo $this->_tpl_vars['lang']['Estimates']; ?>
</a></li>
                                                    <li><a href="?cmd=transactions"><?php echo $this->_tpl_vars['lang']['Transactions']; ?>
</a></li>
                                                    <li><a href="?cmd=gtwlog"><?php echo $this->_tpl_vars['lang']['Gatewaylog']; ?>
</a></li>
                                                        <?php $_from = $this->_tpl_vars['HBaddons']['payment_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                        <li ><a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                </ul>
                                            </li>

                                            <li class="orders"><a class="mainmenu" href="?cmd=orders">
                                                    <span class="second orders"><?php echo $this->_tpl_vars['lang']['ordersandaccounts']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a> 
                                                <ul class="submenu megadropdown">

                                                    <li ><a href="?cmd=orders"  class="hassub"><?php echo $this->_tpl_vars['lang']['Orders']; ?>
</a>
                                                        <div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <li ><a href="?cmd=orders&amp;list=active" >Active Orders</a></li>
                                                                    <li ><a href="?cmd=orders&amp;list=pending">Pending Orders</a></li>
                                                                    <li ><a href="?cmd=orders&amp;list=fraud">Fraud Orders</a></li>
                                                                    <li ><a href="?cmd=orders&action=createdraft">Create Order</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li ><a href="?cmd=accounts"  class="hassub"><?php echo $this->_tpl_vars['lang']['Accounts']; ?>
</a>
                                                        <div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <li ><a href="?cmd=accounts&amp;list=all_active" >Active </a></li>
                                                                    <li ><a href="?cmd=accounts&amp;list=all_pending" >Pending </a></li>
                                                                    <li ><a href="?cmd=accounts&amp;list=all_suspended" >Suspended </a></li>
                                                                        <?php if ($this->_tpl_vars['HBaddons']['orders_accounts']): ?>
                                                                            <?php $_from = $this->_tpl_vars['HBaddons']['orders_accounts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                                                <?php $this->assign('descr', '_hosting'); ?>
                                                                                <?php $this->assign('baz', ($this->_tpl_vars['ad']).($this->_tpl_vars['descr'])); ?>
                                                                            <li><a href="?cmd=accounts&list=<?php echo $this->_tpl_vars['ad']; ?>
" ><?php if ($this->_tpl_vars['lang'][$this->_tpl_vars['baz']]): ?><?php echo $this->_tpl_vars['lang'][$this->_tpl_vars['baz']]; ?>
<?php else: ?><?php echo $this->_tpl_vars['ad']; ?>
<?php endif; ?></a></li>
                                                                            <?php endforeach; endif; unset($_from); ?>
                                                                        <?php endif; ?>

                                                                </ul>
                                                            </div>
                                                    </li>
                                                    <li ><a href="?cmd=domains"  class="hassub"><?php echo $this->_tpl_vars['lang']['Domains']; ?>
</a><div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <li ><a href="?cmd=domains&amp;list=active" >Active </a></li>
                                                                    <li ><a href="?cmd=domains&amp;list=pending" >Pending </a></li>
                                                                    <li ><a href="?cmd=domains&amp;list=expired" >Expired </a></li>
                                                                    <li ><a href="?cmd=domains&action=sync" >Synchronize </a></li>

                                                                </ul>
                                                            </div></li>
                                                            <?php $_from = $this->_tpl_vars['HBaddons']['orders_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                        <li ><a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                </ul>
                                            </li>

                                            <li class="configuration"><a class="mainmenu" href="?cmd=configuration">
                                                    <span class="second configuration"><?php echo $this->_tpl_vars['lang']['Configuration']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a> 
                                                <ul class="submenu megadropdown">
                                                    <li ><a href="?cmd=configuration"  class="hassub"><?php echo $this->_tpl_vars['lang']['generalconfig']; ?>
</a>
                                                        <div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <li><a href="?cmd=configuration">General Settings</a></li>
                                                                    <li><a href="?cmd=configuration&amp;action=cron">Task List</a></li>
                                                                    <li><a href="?cmd=langedit">Language settings</a></li>
                                                                </ul>
                                                            </div>
                                                    </li>
                                                    <li ><a href="?cmd=managemodules"><?php echo $this->_tpl_vars['lang']['Modules']; ?>
</a></li>
                                                    <li ><a href="?cmd=services"><?php echo $this->_tpl_vars['lang']['productsandservices']; ?>
</a></li>
                                                    <li ><a href="?cmd=productaddons"><?php echo $this->_tpl_vars['lang']['productaddons']; ?>
</a></li>
                                                    <li ><a href="?cmd=emailtemplates"><?php echo $this->_tpl_vars['lang']['emailtemplates']; ?>
</a></li>
                                                    <li ><a href="?cmd=security"><?php echo $this->_tpl_vars['lang']['securitysettings']; ?>
</a></li>
                                                    <li ><a href="?cmd=servers"><?php echo $this->_tpl_vars['lang']['manapps']; ?>
</a></li>
                                                </ul>
                                            </li>

                                            <li class="extras"><a class="mainmenu" href="?cmd=managemodules">
                                                    <span class="second extras"><?php echo $this->_tpl_vars['lang']['Extras']; ?>
</span>
                                                    <span class="fourth"></span>
                                                </a>
                                                <ul class="submenu megadropdown  extrasdropdown">
                                                    <li ><a href="?cmd=managemodules&action=other"   <?php if (count($this->_tpl_vars['HBaddons']['extras_menu']) > 4): ?>class="hassub"<?php endif; ?>><?php echo $this->_tpl_vars['lang']['Plugins']; ?>
</a>
                                                      <?php if (count($this->_tpl_vars['HBaddons']['extras_menu']) > 4): ?><div  class="topnav-popover">
                                                            <div class="topnav-popover-content">
                                                                <ul class="subbmenu">
                                                                    <?php $_from = $this->_tpl_vars['HBaddons']['extras_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                                        <li ><a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
                                                                    <?php endforeach; endif; unset($_from); ?>
                                                                </ul>
                                                            </div>
                                                        </div><?php endif; ?>
                                                    </li>
                                                    <li ><a href="?cmd=stats"><?php echo $this->_tpl_vars['lang']['systemstatistics']; ?>
</a></li>
                                                    <li ><a href="?cmd=logs"><?php echo $this->_tpl_vars['lang']['systemlogs']; ?>
</a></li>
                                                    <li ><a href="?cmd=notifications"><?php echo $this->_tpl_vars['lang']['Notifications']; ?>
</a></li>
                                                    <li ><a href="?cmd=importaccounts"><?php echo $this->_tpl_vars['lang']['impaccounts']; ?>
</a></li>
                                                    <li ><a href="?cmd=infopages"><?php echo $this->_tpl_vars['lang']['infopages']; ?>
</a></li>
                                                    <li ><a href="?cmd=coupons"><?php echo $this->_tpl_vars['lang']['promocodes']; ?>
</a></li>
                                                    <li ><a href="?cmd=downloads"><?php echo $this->_tpl_vars['lang']['Downloads']; ?>
</a></li>
                                                    <?php if (count($this->_tpl_vars['HBaddons']['extras_menu']) < 5): ?>
                                                        <?php $_from = $this->_tpl_vars['HBaddons']['extras_menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad']):
?>
                                                        <li ><a href="?cmd=module&module=<?php echo $this->_tpl_vars['ad']['id']; ?>
"><?php echo $this->_tpl_vars['ad']['name']; ?>
</a></li>
                                                        <?php endforeach; endif; unset($_from); ?>
                                                    <?php endif; ?>
                                                </ul>
                                            </li>


                                        </ul>
                                        </div>


                                <div class="clear"></div>
                                        </div>

                                        <div id="search_form_container" class="search_form_container collapse in navbar-collapse-target col-md-4 col-xs-12 col-sm-2">

                                            <input name="query" id="smarts" autocomplete="off" placeholder="<?php echo $this->_tpl_vars['lang']['smartsearch']; ?>
" type="text"/>
                                            <a href="#" id="search_submiter" class="search_submiter"><i class="fa fa-search"></i></a>

                                            <div id="smartres" class="smartres" style="display:none"><ul id="smartres-results" class="smartres-results col-xs-12" ></ul></div>
                                        </div>



                        </div>
                    </td>
                </tr>
            </table>

    <?php echo smarty_function_adminwidget(array('module' => 'any','section' => 'beforecontent'), $this);?>