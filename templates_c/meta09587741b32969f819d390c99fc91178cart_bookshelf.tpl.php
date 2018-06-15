<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_bookshelf/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_bookshelf.yml',
  'author' => 'HostBill team',
  'name' => 'Bookshelf',
  'description' => 'Designed to hold 4 packages. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>',
  'img' => 'templates/orderpages/cart_bookshelf/preview.png',
  'file' => 'templates\\orderpages\\cart_bookshelf.tpl',
  'template' => 'cart_bookshelf',
  'template_old' => 'bookshelf',
  'typespecific' => false,
  'hash' => '09587741b32969f819d390c99fc91178',
  'filebasename' => 'cart_bookshelf',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_bookshelf/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'highlighted' => 
    array (
      'value' => 2,
      'name' => 'Highlighted plan',
      'description' => 'Value between 0 - 3, where 0 represents first package',
      'type' => 'input',
    ),
    'whyus' => 
    array (
      'value' => 'Why us?',
      'name' => 'Section header',
      'type' => 'input',
    ),
    'footer1head' => 
    array (
      'value' => 'Order Pages',
      'name' => 'Left block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer1text' => 
    array (
      'name' => 'Left block text',
      'type' => 'textarea',
      'value' => 'HostBill lets you choose a template for every order page you have. You can create your own Order Page template or use one from default templates that come with HostBill..',
    ),
    'footer2head' => 
    array (
      'value' => 'Live Support',
      'name' => 'Right block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer2text' => 
    array (
      'name' => 'Right block text',
      'type' => 'textarea',
      'value' => 'HostBill, an All-In-One billing & Support solution, comes with built-in Live Chat & Real-Time visitor monitoring to connect you to your website visitors and clients. Turn visitors into customers with few mouse clicks!.',
    ),
  ),
);