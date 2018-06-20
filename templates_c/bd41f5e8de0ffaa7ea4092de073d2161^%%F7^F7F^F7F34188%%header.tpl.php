<?php /* Smarty version 2.6.26, created on 2018-06-20 11:28:43
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'header.tpl', 54, false),)), $this); ?>
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

    <!-- Custom Css clay -->
    <link href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/custom.css" rel="stylesheet">

    <!-- Font Google -->
    <link href="<?php echo $this->_tpl_vars['template_dir']; ?>
assets/css/google_fonts.css" rel="stylesheet">	

</head>   
    


    <body class="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
 header_sticky" >

<!--
http://altair_landing_page.tzdthemes.com/
-->
<!--
http://altair_landing_page.tzdthemes.com/
-->
<!--
http://altair_landing_page.tzdthemes.com/
-->

<header id="header_main">
        <nav class="uk-navbar">
            <div class="uk-container uk-container-center">
                <a href="#" class="uk-float-left" id="mobile_navigation_toggle" data-uk-offcanvas="<?php echo '{target:\'#mobile_navigation\'}'; ?>
"><i class="material-icons"></i></a>
                <a href="/" class="uk-navbar-brand">
                    <img src="assets/img/logo_main.png" alt="" width="71" height="15">
                </a>
                <a href="http://themeforest.net/item/altair-material-design-premium-template/12190654?ref=tzd" class="md-btn md-btn-primary uk-navbar-flip header_cta uk-margin-left">Buy Now!</a>
                <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav" id="main_navigation">
                        <li class="current_active">
                            <a href="#sect-overview">
                                Overview
                            </a>
                        </li>
                        <li class="">
                            <a href="#sect-features">
                                Features
                            </a>
                        </li>
                        <li>
                            <a href="#sect-gallery">
                                Gallery
                            </a>
                        </li>
                        <li>
                            <a href="#sect-pricing" class="uk-navbar-nav-subtitle">
                                Pricing
                                <div>Find the perfect plan</div>
                            </a>
                        </li>
                        <li>
                            <a href="#sect-team">
                                Team
                            </a>
                        </li>
                        <li>
                            <a href="#sect-contact">
                                Contact
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


<div id="mobile_navigation" class="uk-offcanvas">
        <div class="uk-offcanvas-bar">
            <ul>
                <li>
                    <a href="#sect-overview" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Overview</span>
                    </a>
                </li>
                <li>
                    <a href="#sect-features" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Features</span>
                    </a>
                </li>
                <li>
                    <a href="#sect-gallery" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Gallery</span>
                    </a>
                </li>
                <li>
                    <a href="#sect-pricing" class="uk-navbar-nav-subtitle" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Pricing<small>Find the perfect plan</small></span>
                    </a>
                </li>
                <li>
                    <a href="#sect-team" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Team</span>
                    </a>
                </li>
                <li>
                    <a href="#sect-contact" data-uk-smooth-scroll="<?php echo '{offset: 48}'; ?>
">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Contact</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>





<!--
<header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                                
                
                <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                    <span class="sSwitchIcon"></span>
                </a>
                
               
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




    <aside id="sidebar_main"><div class="scroll-wrapper scrollbar-inner" style="position: relative;"><div class="scrollbar-inner scroll-content scroll-scrolly_visible" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 487px;">
        
        <div class="sidebar_main_header">
            <div class="sidebar_logo">
                <a href="index.html" class="sSidebar_hide sidebar_logo_large">
                    <img class="logo_regular" src="assets/img/logo_main.png" alt="" height="15" width="71">
                    <img class="logo_light" src="assets/img/logo_main_white.png" alt="" height="15" width="71">
                </a>
                <a href="index.html" class="sSidebar_show sidebar_logo_small">
                    <img class="logo_regular" src="assets/img/logo_main_small.png" alt="" height="32" width="32">
                    <img class="logo_light" src="assets/img/logo_main_small_light.png" alt="" height="32" width="32">
                </a>
            </div>
            <div class="sidebar_actions">
                <select id="lang_switcher" name="lang_switcher" tabindex="-1" class="selectized" style="display: none;"><option value="gb" selected="selected">English</option></select><div class="selectize-control single"><div class="selectize-input items full has-options has-items"><div class="item" data-value="gb"><i class="item-icon flag-GB"></i></div><input type="text" autocomplete="off" tabindex="" id="lang_switcher-selectized" readonly="readonly" style="width: 4px;"></div><div class="selectize-dropdown single" style="display: none;"><div class="selectize-dropdown-content"></div></div></div>
            </div>
        </div>
        
        <div class="menu_section">
            <ul>
                <li class="current_section" title="Dashboard">
                    <a href="index.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Dashboard</span>
                    </a>
                    
                </li>
                <li title="Mailbox">
                    <a href="page_mailbox.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Mailbox</span>
                    </a>
                    
                </li>
                <li title="Invoices">
                    <a href="page_invoices.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Invoices</span>
                    </a>
                    
                </li>
                <li title="Chats" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Chats</span>
                    </a>
                    <ul>
                        <li><a href="page_chat.html">Regular Chat</a></li>
                        <li><a href="page_chat_small.html">Chatboxes</a></li>
                    </ul>
                
                </li>
                <li title="Scrum Board">
                    <a href="page_scrum_board.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Scrum Board</span>
                    </a>
                    
                </li>
                <li title="Snippets">
                    <a href="page_snippets.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Snippets</span>
                    </a>
                    
                </li>
                <li title="User Profile">
                    <a href="page_user_profile.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">User Profile</span>
                    </a>
                    
                </li>
                <li title="Sticky Notes">
                    <a href="page_sticky_notes.html">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Sticky Notes</span>
                    </a>
                    
                </li>
                <li title="Forms" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Forms</span>
                    </a>
                    <ul>
                        <li><a href="forms_regular.html">Regular Elements</a></li>
                        <li><a href="forms_advanced.html">Advanced Elements</a></li>
                        <li><a href="forms_dynamic.html">Dynamic</a></li>
                        <li><a href="forms_file_input.html">File Input</a></li>
                        <li><a href="forms_file_upload.html">File Upload</a></li>
                        <li><a href="forms_validation.html">Validation</a></li>
                        <li><a href="forms_wizard.html">Wizard</a></li>
                        <li class="menu_subtitle">WYSIWYG Editors</li>
                        <li><a href="forms_wysiwyg_ckeditor.html">CKeditor</a></li>
                        <li><a href="forms_wysiwyg_inline.html">Ckeditor Inline</a></li>
                        <li><a href="forms_wysiwyg_tinymce.html">TinyMCE</a></li>
                            </ul>
                
                </li>
                <li title="Layout" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Layout</span>
                    </a>
                    <ul>
                        <li><a href="layout_top_menu.html">Top Menu</a></li>
                        <li><a href="layout_header_full.html">Full Header</a></li>
                    </ul>
                
                </li>
                <li title="Kendo UI Widgets" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Kendo UI Widgets</span>
                    </a>
                    <ul>
                        <li><a href="kendoui_autocomplete.html">Autocomplete</a></li>
                        <li><a href="kendoui_calendar.html">Calendar</a></li>
                        <li><a href="kendoui_colorpicker.html">ColorPicker</a></li>
                        <li><a href="kendoui_combobox.html">ComboBox</a></li>
                        <li><a href="kendoui_datepicker.html">DatePicker</a></li>
                        <li><a href="kendoui_datetimepicker.html">DateTimePicker</a></li>
                        <li><a href="kendoui_dropdown_list.html">DropDownList</a></li>
                        <li><a href="kendoui_masked_input.html">Masked Input</a></li>
                        <li><a href="kendoui_menu.html">Menu</a></li>
                        <li><a href="kendoui_multiselect.html">MultiSelect</a></li>
                        <li><a href="kendoui_numeric_textbox.html">Numeric TextBox</a></li>
                        <li><a href="kendoui_panelbar.html">PanelBar</a></li>
                        <li><a href="kendoui_timepicker.html">TimePicker</a></li>
                        <li><a href="kendoui_toolbar.html">Toolbar</a></li>
                        <li><a href="kendoui_window.html">Window</a></li>
                    </ul>
                
                </li>
                <li title="Components" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Components</span>
                    </a>
                    <ul>
                        <li><a href="components_accordion.html">Accordions</a></li>
                        <li><a href="components_autocomplete.html">Autocomplete</a></li>
                        <li><a href="components_breadcrumbs.html">Breadcrumbs</a></li>
                        <li><a href="components_buttons.html">Buttons</a></li>
                        <li><a href="components_fab.html">Buttons: FAB</a></li>
                        <li><a href="components_cards.html">Cards</a></li>
                        <li><a href="components_colors.html">Colors</a></li>
                        <li><a href="components_common.html">Common</a></li>
                        <li><a href="components_dropdowns.html">Dropdowns</a></li>
                        <li><a href="components_dynamic_grid.html">Dynamic Grid</a></li>
                        <li><a href="components_footer.html">Footer</a></li>
                        <li><a href="components_grid.html">Grid</a></li>
                        <li><a href="components_icons.html">Icons</a></li>
                        <li><a href="components_modal.html">Lightbox/Modal</a></li>
                        <li><a href="components_lists.html">Lists</a></li>
                        <li><a href="components_nestable.html">Nestable</a></li>
                        <li><a href="components_notifications.html">Notifications</a></li>
                        <li><a href="components_panels.html">Panels</a></li>
                        <li><a href="components_preloaders.html">Preloaders</a></li>
                        <li><a href="components_slider.html">Slider</a></li>
                        <li><a href="components_slideshow.html">Slideshow</a></li>
                        <li><a href="components_sortable.html">Sortable</a></li>
                        <li><a href="components_switcher.html">Switcher</a></li>
                        <li><a href="components_tables.html">Tables</a></li>
                        <li><a href="components_tables_examples.html">Tables Examples</a></li>
                        <li><a href="components_tabs.html">Tabs</a></li>
                        <li><a href="components_tooltips.html">Tooltips</a></li>
                        <li><a href="components_typography.html">Typography</a></li>
                    </ul>
                
                </li>
                <li title="E-commerce" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">E-commerce</span>
                    </a>
                    <ul>
                        <li><a href="ecommerce_product_details.html">Product Details</a></li>
                        <li><a href="ecommerce_product_edit.html">Product Edit</a></li>
                        <li><a href="ecommerce_products_grid.html">Products Grid</a></li>
                        <li><a href="ecommerce_products_list.html">Products List</a></li>
                    </ul>
                
                </li>
                <li title="Plugins" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Plugins</span>
                    </a>
                    <ul>
                        <li><a href="plugins_calendar.html">Calendar</a></li>
                        <li><a href="plugins_charts.html">Charts</a></li>
                        <li><a href="plugins_code_editor.html">Code Editor</a></li>
                        <li><a href="plugins_context_menu.html">Context Menu</a></li>
                        <li><a href="plugins_crud_table.html">CRUD Table</a></li>
                        <li><a href="plugins_datatables.html">Datatables</a></li>
                        <li><a href="plugins_diff.html">Diff View</a></li>
                        <li><a href="plugins_filemanager.html">File Manager</a></li>
                        <li><a href="plugins_gantt_chart.html">Gantt Chart</a></li>
                        <li><a href="plugins_google_maps.html">Google Maps</a></li>
                        <li><a href="plugins_image_cropper.html">Image Cropper</a></li>
                        <li><a href="plugins_idle_timeout.html">Idle Timeout</a></li>
                        <li><a href="plugins_push_notifications.html">Push Notifications</a></li>
                        <li><a href="plugins_tour.html">Tour</a></li>
                        <li><a href="plugins_tablesorter.html">Tablesorter</a></li>
                        <li><a href="plugins_tree.html">Tree</a></li>
                        <li><a href="plugins_vector_maps.html">Vector Maps</a></li>
                    </ul>
                
                </li>
                <li title="Pages" class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Pages</span>
                    </a>
                    <ul>
                        <li><a href="page_blank.html">Blank</a></li>
                        <li><a href="page_contact_list.html">Contact List</a></li>
                        <li><a href="page_gallery.html">Gallery</a></li>
                        <li><a href="page_help.html">Help/Faq</a></li>
                        <li><a href="login.html">Login Page</a></li>
                        <li><a href="page_notes.html">Notes</a></li>
                        <li><a href="page_pricing_tables.html">Pricing Tables</a></li>
                        <li><a href="page_search_results.html">Search Results</a></li>
                        <li><a href="page_settings.html">Settings</a></li>
                        <li><a href="page_todo.html">Todo</a></li>
                        <li><a href="page_user_edit.html">User edit</a></li>
                        <li class="menu_subtitle">Issue Tracker</li>
                        <li><a href="page_issues_list.html">List View</a></li>
                        <li><a href="page_issue_details.html">Issue Details</a></li>
                                <li class="menu_subtitle">Blog</li>
                        <li><a href="page_blog_list.html">Blog List</a></li>
                        <li><a href="page_blog_article.html">Blog Article</a></li>
                                <li class="menu_subtitle">Errors</li>
                        <li><a href="error_404.html">Error 404</a></li>
                        <li><a href="error_500.html">Error 500</a></li>
                            </ul>
                
                </li>
                
                <li class="submenu_trigger">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons"></i></span>
                        <span class="menu_title">Multi level</span>
                    </a>
                    <ul>
                        <li class="submenu_trigger">
                            <a href="#">First level</a>
                            <ul>
                                <li class="submenu_trigger">
                                    <a href="#">Second Level</a>
                                    <ul>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu_trigger">
                                    <a href="#">Long title to test</a>
                                    <ul>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                        <li>
                                            <a href="#">Third level</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Even longer title multi line</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><div class="scroll-element scroll-x scroll-scrolly_visible"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="width: 89px;"></div></div></div><div class="scroll-element scroll-y scroll-scrolly_visible"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="height: 307px; top: 0px;"></div></div></div></div></aside>

-->