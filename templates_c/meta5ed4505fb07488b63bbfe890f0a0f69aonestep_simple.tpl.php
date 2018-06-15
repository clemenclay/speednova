<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_simple/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_simple.yml',
  'author' => 'HostBill team',
  'name' => 'Simple Full-Page Checkout, One-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
Nice clean full screen template with current plan highlighted.',
  'img' => 'templates/orderpages/onestep_simple/prew.png',
  'file' => 'templates\\orderpages\\onestep_simple.tpl',
  'template' => 'onestep_simple',
  'template_old' => 'simple',
  'typespecific' => false,
  'hash' => '5ed4505fb07488b63bbfe890f0a0f69a',
  'filebasename' => 'onestep_simple',
  'config' => 
  array (
    'template' => 
    array (
      'value' => 'hide',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/onestep_simple/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'righttext' => 
    array (
      'name' => 'Right side text',
      'description' => 'This phrase will be displayed on the right side above cart summary',
      'type' => 'textarea',
      'value' => '<b>You can easily add/edit/remove text placed here:</b>
<strong>Using orderpage configuration in admin panel</strong>
Settings &raquo; Products & Services &raquo; \'Orderpagename\' &raquo; Customize!
<strong>Over 205,000 customers worldwide</strong> Hundreds are joining every day.
<strong>5-star customer service</strong>
Fast & friendly help (phone, email & live-chat)',
    ),
    'tostext' => 
    array (
      'value' => 'Edit this text in order page configuration - notify your customers about additional Terms of Service/Acceptable use policy in your company.',
      'name' => 'Terms of Service',
      'description' => 'This phrase will be displayed right above order submit button, and below TOS checkbx',
      'type' => 'textarea',
    ),
  ),
);