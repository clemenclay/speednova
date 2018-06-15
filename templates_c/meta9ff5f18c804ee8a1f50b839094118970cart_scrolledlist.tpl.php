<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_scrolledlist/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_scrolledlist.yml',
  'author' => 'HostBill Team',
  'name' => 'Scrolled list',
  'description' => 'A 5-step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.',
  'img' => 'templates/orderpages/cart_scrolledlist/preview.png',
  'file' => 'templates\\orderpages\\cart_scrolledlist.tpl',
  'template' => 'cart_scrolledlist',
  'template_old' => 'scrolledlist',
  'typespecific' => false,
  'hash' => '9ff5f18c804ee8a1f50b839094118970',
  'filebasename' => 'cart_scrolledlist',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_scrolledlist/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'highlighted' => 
    array (
      'value' => 0,
      'name' => 'Highlighted plan',
      'description' => '0 represents first package',
      'type' => 'input',
    ),
    'welcome' => 
    array (
      'value' => 'Welcome Customer!',
      'name' => 'Welcome text',
      'type' => 'input',
    ),
    'header' => 
    array (
      'value' => 'Please select <span>your</span> prefered plan',
      'name' => 'Section header',
      'description' => 'use <span></span> for green italic text',
      'type' => 'input',
    ),
    'footheader' => 
    array (
      'value' => 'About',
      'name' => 'Footer header',
      'type' => 'input',
    ),
    'footsubheader' => 
    array (
      'value' => 'Our Company',
      'name' => 'Footer subheader',
      'type' => 'input',
    ),
    'footer1head' => 
    array (
      'value' => 'Innovation',
      'name' => 'Left footer block header',
      'type' => 'input',
    ),
    'footer1text' => 
    array (
      'name' => 'Left footer block text',
      'type' => 'textarea',
      'value' => '',
    ),
    'footer2head' => 
    array (
      'value' => 'Weekly Releases',
      'name' => 'Center footer block header',
      'type' => 'input',
    ),
    'footer2text' => 
    array (
      'name' => 'Center footer block text',
      'type' => 'textarea',
      'value' => '',
    ),
    'footer3head' => 
    array (
      'value' => 'Weekly Releases',
      'name' => 'Right footer block header',
      'type' => 'input',
    ),
    'footer3text' => 
    array (
      'name' => 'Right footer block text',
      'type' => 'textarea',
      'value' => '<p>Whether its a new feature of bugfix HostBill users don\'t have to wait long for it. You can expect new HostBill with hassle-free automated update each Friday.</p><p>Check our changelog for latest HostBill improvements.</p>',
    ),
  ),
);