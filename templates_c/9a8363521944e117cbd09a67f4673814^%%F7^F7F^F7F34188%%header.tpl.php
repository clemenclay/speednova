<?php /* Smarty version 2.6.26, created on 2018-06-19 15:38:08
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'header.tpl', 48, false),)), $this); ?>
<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    
    
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/img/favicon-32x32.png" sizes="32x32">

    <title>Altair Admin v2.9.2</title>

    <!-- additional styles for plugins -->
        <!-- weather icons -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/weather-icons/css/weather-icons.min.css" media="all">
        <!-- metrics graphics (charts) -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/metrics-graphics/dist/metricsgraphics.css">
        <!-- chartist -->
        <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/chartist/dist/chartist.min.css">
    
    <!-- uikit -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
bower_components/uikit/css/uikit.almost-flat.min.css" media="all">

    <!-- flag icons -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/icons/flags/flags.min.css" media="all">

    <!-- style switcher -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/style_switcher.min.css" media="all">
    
    <!-- altair admin -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/main.min.css" media="all">

    <!-- themes -->
    <link rel="stylesheet" href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/themes/themes_combined.min.css" media="all">

</head>   
    


    <body class="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
 tpl_nextgen" >
<header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                                
                <!-- main sidebar switch -->
                <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                    <span class="sSwitchIcon"></span>
                </a>
                
                <!-- secondary sidebar switch -->
                <a href="#" id="sidebar_secondary_toggle" class="sSwitch sSwitch_right">
                    <span class="sSwitchIcon"></span>
                </a>
                
                    <div id="menu_top_dropdown" class="uk-float-left uk-hidden-small">
                        <div class="uk-button-dropdown" data-uk-dropdown="<?php echo '{mode:\'click\'}'; ?>
" aria-haspopup="true" aria-expanded="false">
                            <a href="#" class="top_menu_toggle"><i class="material-icons md-24"></i></a>
                            <div class="uk-dropdown uk-dropdown-width-3" aria-hidden="true">
                                <div class="uk-grid uk-dropdown-grid">
                                    <div class="uk-width-2-3">
                                        <div class="uk-grid uk-grid-width-medium-1-3 uk-margin-bottom uk-text-center">
                                            <a href="page_mailbox.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-light-green-600"></i>
                                                <span class="uk-text-muted uk-display-block">Mailbox</span>
                                            </a>
                                            <a href="page_invoices.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-purple-600"></i>
                                                <span class="uk-text-muted uk-display-block">Invoices</span>
                                            </a>
                                            <a href="page_chat.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-cyan-600"></i>
                                                <span class="uk-text-muted uk-display-block">Chat</span>
                                            </a>
                                            <a href="page_scrum_board.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-red-600"></i>
                                                <span class="uk-text-muted uk-display-block">Scrum Board</span>
                                            </a>
                                            <a href="page_snippets.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-blue-600"></i>
                                                <span class="uk-text-muted uk-display-block">Snippets</span>
                                            </a>
                                            <a href="page_user_profile.html" class="uk-margin-top">
                                                <i class="material-icons md-36 md-color-orange-600"></i>
                                                <span class="uk-text-muted uk-display-block">User profile</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="uk-width-1-3">
                                        <ul class="uk-nav uk-nav-dropdown uk-panel">
                                            <li class="uk-nav-header">Components</li>
                                            <li><a href="components_accordion.html">Accordions</a></li>
                                            <li><a href="components_buttons.html">Buttons</a></li>
                                            <li><a href="components_notifications.html">Notifications</a></li>
                                            <li><a href="components_sortable.html">Sortable</a></li>
                                            <li><a href="components_tabs.html">Tabs</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav user_actions">
                        <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light"></i></a></li>
                        <li><a href="#" id="main_search_btn" class="user_action_icon"><i class="material-icons md-24 md-light"></i></a></li>
                        <li data-uk-dropdown="<?php echo '{mode:\'click\',pos:\'bottom-right\'}'; ?>
">
                            <a href="#" class="user_action_icon"><i class="material-icons md-24 md-light"></i><span class="uk-badge">16</span></a>
                            <div class="uk-dropdown uk-dropdown-xlarge">
                                <div class="md-card-content">
                                    <ul class="uk-tab uk-tab-grid" data-uk-tab="<?php echo '{connect:\'#header_alerts\',animation:\'slide-horizontal\'}'; ?>
">
                                        <li class="uk-width-1-2 uk-active" aria-expanded="true"><a href="#" class="js-uk-prevent uk-text-small">Messages (12)</a></li>
                                        <li class="uk-width-1-2" aria-expanded="false"><a href="#" class="js-uk-prevent uk-text-small">Alerts (4)</a></li>
                                    <li class="uk-tab-responsive uk-active uk-hidden" aria-haspopup="true" aria-expanded="false"><a>Messages (12)</a><div class="uk-dropdown uk-dropdown-small" aria-hidden="true"><ul class="uk-nav uk-nav-dropdown"></ul><div></div></div></li></ul>
                                    <ul id="header_alerts" class="uk-switcher uk-margin">
                                        <li aria-hidden="false" class="uk-active">
                                            <ul class="md-list md-list-addon">
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <span class="md-user-letters md-bg-cyan">sj</span>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Quia molestiae error.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Ex omnis dolorem dolorum enim vero aut mollitia quia.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="assets/img/avatars/avatar_07_tn.png" alt="">
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Enim quisquam.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Provident repellat eos dolor voluptatem molestiae nihil animi.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <span class="md-user-letters md-bg-light-green">ff</span>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Quo occaecati.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Cupiditate provident consequatur alias quia animi odit dolor rem et.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="assets/img/avatars/avatar_02_tn.png" alt="">
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Aperiam nobis quidem.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Quisquam modi nam explicabo eius modi consequatur numquam.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <img class="md-user-image md-list-addon-avatar" src="assets/img/avatars/avatar_09_tn.png" alt="">
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><a href="pages_mailbox.html">Voluptas quae nesciunt.</a></span>
                                                        <span class="uk-text-small uk-text-muted">Vel alias quasi consectetur vel commodi soluta dicta aut et.</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="uk-text-center uk-margin-top uk-margin-small-bottom">
                                                <a href="page_mailbox.html" class="md-btn md-btn-flat md-btn-flat-primary js-uk-prevent">Show All</a>
                                            </div>
                                        </li>
                                        <li aria-hidden="true">
                                            <ul class="md-list md-list-addon">
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-warning"></i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Corrupti expedita.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Sed pariatur sunt non aut.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-success"></i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Odit quaerat ducimus.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Veritatis quasi quaerat id nisi.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-danger"></i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Et et.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Aut laudantium unde et officia.</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-primary"></i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">Suscipit et.</span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Cum nobis quo saepe ratione occaecati maxime.</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-uk-dropdown="<?php echo '{mode:\'click\',pos:\'bottom-right\'}'; ?>
" aria-haspopup="true" aria-expanded="false">
                            <a href="#" class="user_action_image"><img class="md-user-image" src="assets/img/avatars/avatar_11_tn.png" alt=""></a>
                            <div class="uk-dropdown uk-dropdown-small" aria-hidden="true">
                                <ul class="uk-nav js-uk-prevent">
                                    <li><a href="page_user_profile.html">My profile</a></li>
                                    <li><a href="page_settings.html">Settings</a></li>
                                    <li><a href="login.html">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

    </header>