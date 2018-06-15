<?php
return array (
  'type' => 'domain',
  'thumb' => 'templates/orderpages/domain_r16/thumb.png',
  'configfile' => 'templates/orderpages/domain_r16/config.yml',
  'author' => 'HostBill team',
  'name' => 'Domain Cart',
  'description' => 'Offers domain registration and transfer, in bulk and single mode.',
  'img' => 'templates/orderpages/domain_r16/preview.png',
  'file' => 'templates\\orderpages\\domain_r16\\domain_r16.tpl',
  'template' => 'domain_r16\\domain_r16',
  'template_old' => NULL,
  'typespecific' => false,
  'hash' => '519d300ec057af00270565efe46a1de4',
  'filebasename' => 'domain_r16',
  'config' => 
  array (
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/domains_3in1/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'spotlight' => 
    array (
      'value' => 1,
      'name' => 'Enable spotlight',
      'type' => 'checkbox',
      'description' => 'It will display domains with \'featured\' tag',
    ),
    'custdescription' => 
    array (
      'value' => 1,
      'name' => 'Slogan',
      'description' => 'You can edit it in templates/orderpages/domain_r16/widgets/description.tpl',
      'type' => 'checkbox',
    ),
    'pricing' => 
    array (
      'value' => 1,
      'name' => 'Pricing table',
      'description' => '',
      'type' => 'checkbox',
    ),
  ),
);