<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_volume/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_volume.yml',
  'author' => 'HostBill team',
  'name' => 'Volume slider, One-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.',
  'img' => 'templates/orderpages/onestep_volume/preview.png',
  'file' => 'templates\\orderpages\\onestep_volume.tpl',
  'template' => 'onestep_volume',
  'template_old' => 'volume',
  'typespecific' => false,
  'hash' => '206b3c01f556ebecae69e75deda3dd4d',
  'filebasename' => 'onestep_volume',
  'config' => 
  array (
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/onestep_volume/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'header' => 
    array (
      'value' => 'Setup your <span>dream server</span>',
      'name' => 'Header',
      'type' => 'input',
    ),
    'subheader' => 
    array (
      'value' => 'Pick your best option. 60 second setup. Free to go!',
      'name' => 'Sub-header',
      'type' => 'input',
    ),
  ),
);