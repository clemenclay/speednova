<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_comparison_boxes/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_comparison_boxes.yml',
  'author' => 'HostBill team',
  'name' => 'Four comparison boxes, One-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. Nice clean template with current plan highlighted, designed to hold 4 packages.',
  'img' => 'templates/orderpages/onestep_comparison_boxes/preview.png',
  'file' => 'templates\\orderpages\\onestep_comparison_boxes.tpl',
  'template' => 'onestep_comparison_boxes',
  'template_old' => 'comparison_boxes',
  'typespecific' => false,
  'hash' => '25f94a8356edd11608eac90b40ba891a',
  'filebasename' => 'onestep_comparison_boxes',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/onestep_comparison_boxes/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'footer' => 
    array (
      'value' => 'Checkout',
      'name' => 'Footer',
      'type' => 'input',
    ),
    'subfooter' => 
    array (
      'value' => 'Not happy with our plans? Don\'t worry! Write to us for a personalized plan that fits your needs. <a href="?cmd=tickets&action=new" >Write to us &raquo;</a>',
      'name' => 'Sub-footer',
      'type' => 'textarea',
    ),
    'footertext' => 
    array (
      'value' => '<strong>Need something special?</strong><br />
HostBill lets you choose a template for every order page you have. You can create your own Order Page template or use one from templates that come with HostBill.',
      'name' => 'Footer Description',
      'description' => 'HTML is allowed.',
      'type' => 'textarea',
    ),
  ),
);