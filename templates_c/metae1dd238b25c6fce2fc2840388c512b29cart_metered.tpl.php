<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/metered/images/metered_plans_thumbs_preview.png',
  'configfile' => 'templates\\orderpages\\config\\cart_metered.yml',
  'author' => 'HostBill team',
  'name' => 'Metered plans',
  'description' => 'Simple, flexible template - works well with any type of product offered.',
  'img' => 'templates/orderpages/metered/images/metered_plans_preview.png',
  'file' => 'templates\\orderpages\\cart_metered.tpl',
  'template' => 'cart_metered',
  'template_old' => 'metered',
  'typespecific' => false,
  'hash' => 'e1dd238b25c6fce2fc2840388c512b29',
  'filebasename' => 'cart_metered',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+description',
    ),
    'defaultselect' => 
    array (
      'value' => '1',
      'name' => 'Default plan selection',
      'description' => 'Use this specify wich plan should be selected at start, to select first plan enter \'1\', second \'2\' ...',
      'type' => 'input',
    ),
  ),
);