<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_flipcover/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_flipcover.yml',
  'author' => 'HostBill Team',
  'name' => 'Cover flip',
  'description' => 'A 5-step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.',
  'img' => 'templates/orderpages/cart_flipcover/preview.png',
  'file' => 'templates\\orderpages\\cart_flipcover.tpl',
  'template' => 'cart_flipcover',
  'template_old' => 'flipcover',
  'typespecific' => false,
  'hash' => 'c4c7f85275ba3110cad222bf717a1cd9',
  'filebasename' => 'cart_flipcover',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_flipcover/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'highlighted' => 
    array (
      'value' => 1,
      'name' => 'Highlighted plan',
      'description' => '0 represents first package',
      'type' => 'input',
    ),
    'header' => 
    array (
      'value' => 'Select your best server',
      'name' => 'Section header',
      'description' => 'use <span></span> for green italic text',
      'type' => 'input',
    ),
    'subheader' => 
    array (
      'value' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'name' => 'Section subheader',
      'type' => 'input',
    ),
    'footer1head' => 
    array (
      'value' => 'Self Hosted',
      'name' => 'Left footer block header',
      'type' => 'input',
    ),
    'footer1text' => 
    array (
      'name' => 'Left footer block text',
      'type' => 'textarea',
      'value' => 'HostBill is installed in your own environment, an infrastructure you understand and know it is secure - keep your billing data on your servers.',
    ),
    'footer2head' => 
    array (
      'value' => 'No Recurring Fees',
      'name' => 'Center footer block header',
      'type' => 'input',
    ),
    'footer2text' => 
    array (
      'name' => 'Center footer block text',
      'type' => 'textarea',
      'value' => 'Pay once - licenses are perpetual. There are no renewal or recurring fees for HostBill platform or its components.',
    ),
    'footer3head' => 
    array (
      'value' => 'Innovation',
      'name' => 'Right footer block header',
      'type' => 'input',
    ),
    'footer3text' => 
    array (
      'name' => 'Right footer block text',
      'type' => 'textarea',
      'value' => 'We spend countless hours on reasearch, so you don\'t have to. In short time HostBill has become the application to look for new, revolutionizing features.',
    ),
  ),
);