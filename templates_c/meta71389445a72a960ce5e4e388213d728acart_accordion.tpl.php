<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_accordion/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_accordion.yml',
  'author' => 'HostBill Team',
  'name' => 'Accordion Slider',
  'description' => 'A 5-step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.',
  'img' => 'templates/orderpages/cart_accordion/preview.png',
  'file' => 'templates\\orderpages\\cart_accordion.tpl',
  'template' => 'cart_accordion',
  'template_old' => 'accordion',
  'typespecific' => false,
  'hash' => '71389445a72a960ce5e4e388213d728a',
  'filebasename' => 'cart_accordion',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_accordion/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'highlighted' => 
    array (
      'value' => 1,
      'name' => 'Default opened plan',
      'description' => 'Value between 0 - 3, where 0 represents first package',
      'type' => 'input',
    ),
    'header' => 
    array (
      'value' => 'Select your best server',
      'name' => 'Section header',
      'type' => 'input',
    ),
    'subheader' => 
    array (
      'value' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'name' => 'Section subheader',
      'type' => 'input',
    ),
    'footheader' => 
    array (
      'value' => 'Our Awesome Key Features',
      'name' => 'Header under accordion',
      'type' => 'input',
    ),
    'footsubheader' => 
    array (
      'value' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'name' => 'Subheader under accordion',
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