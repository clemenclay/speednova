<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_premade/img/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_premade.yml',
  'author' => 'HostBill team',
  'name' => 'Premade sliders, Wizard theme',
  'description' => 'Allows creating predefined configurations that can help your clients choose their desired package. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.',
  'img' => 'templates/orderpages/cart_premade/img/preview.png',
  'file' => 'templates\\orderpages\\cart_premade.tpl',
  'template' => 'cart_premade',
  'template_old' => 'premade',
  'typespecific' => false,
  'hash' => '34284a9f1b47a6c55c6fafa91d5862d2',
  'filebasename' => 'cart_premade',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_premade/img/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'premade' => 
    array (
      'value' => '',
      'name' => 'Premade configuration',
      'type' => 'premade',
    ),
    'features' => 
    array (
      'value' => 'Hot features',
      'name' => 'Features header',
      'type' => 'input',
    ),
    'footer1head' => 
    array (
      'value' => 'Complete',
      'name' => 'Left block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer1text' => 
    array (
      'name' => 'Left block text',
      'type' => 'textarea',
      'value' => 'Over 2000 companies around the globe including hosting companies, Cloud/IaaS/VPS Solutions Providers, Domain name and SSL Resellers use HostBill to manage their online business.',
    ),
    'footer2head' => 
    array (
      'value' => 'Hosting Automation',
      'name' => 'Middle block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer2text' => 
    array (
      'name' => 'Middle block text',
      'type' => 'textarea',
      'value' => 'With HostBill you can create, suspend, unsuspend and terminate accounts automatically. We support more than 30 Hosting Control Panels.',
    ),
    'footer3head' => 
    array (
      'value' => '70+ payment gateways',
      'name' => 'Right block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer3text' => 
    array (
      'name' => 'Right block text',
      'type' => 'textarea',
      'value' => 'Enable Payment Processor. Create invoice and send to client. HostBill supports more than 70+ payment gateways',
    ),
  ),
);