<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_cloud/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_cloud.yml',
  'author' => 'HostBill team',
  'name' => 'Cloud order, One-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.',
  'img' => 'templates/orderpages/onestep_cloud/prev.png',
  'file' => 'templates\\orderpages\\onestep_cloud.tpl',
  'template' => 'onestep_cloud',
  'template_old' => 'cloud',
  'typespecific' => false,
  'hash' => 'd48f92bad43365b588d6af95f2b6f660',
  'filebasename' => 'onestep_cloud',
  'config' => 
  array (
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/onestep_cloud/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'steps' => 
    array (
      'value' => 'Fast and easy',
      'name' => 'Steps header',
      'type' => 'input',
    ),
    'step1' => 
    array (
      'value' => '1. Select a package',
      'name' => 'First step text',
      'type' => 'input',
    ),
    'step1d' => 
    array (
      'value' => 'Use the slider to setup your plan',
      'name' => 'First step description',
      'type' => 'input',
    ),
    'step2' => 
    array (
      'value' => '2. Customize your server',
      'name' => 'Second step text',
      'type' => 'input',
    ),
    'step2d' => 
    array (
      'value' => 'Select desired components',
      'name' => 'Second step description',
      'type' => 'input',
    ),
    'step3' => 
    array (
      'value' => '3. Start your cloud!',
      'name' => 'Last step text',
      'type' => 'input',
    ),
    'step3d' => 
    array (
      'value' => 'Create your cloud hosting with us!',
      'name' => 'Last step description',
      'type' => 'input',
    ),
  ),
);