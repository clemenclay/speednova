<?php
return array (
  'type' => 'wizard',
  'thumb' => 'images/wizard_slide_thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_slide.yml',
  'author' => 'HostBill team',
  'name' => 'Fancy Slider - wizard theme',
  'description' => 'Customizable slider template - each product is slider block to choose from.
Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.',
  'img' => 'images/slide_preview.png',
  'file' => 'templates\\orderpages\\cart_slide.tpl',
  'template' => 'cart_slide',
  'template_old' => 'slide',
  'typespecific' => false,
  'hash' => '72740150f7995ce560ceb3c271379991',
  'filebasename' => 'cart_slide',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'configtext' => 
    array (
      'value' => 'Your Configuration',
      'name' => 'Configuration text',
      'description' => 'This text is displayed above configuration box, you can easily modify it here',
      'type' => 'input',
    ),
    'featurestext' => 
    array (
      'value' => 'Hot Features!',
      'name' => 'Features text',
      'description' => 'This text is displayed on orderpage above package features list',
      'type' => 'input',
    ),
    'chooseplantext' => 
    array (
      'value' => 'Choose your plan',
      'name' => 'Select plan text',
      'description' => 'This phrase will be displayed above available packages',
      'type' => 'input',
    ),
    'showothercat' => 
    array (
      'value' => 1,
      'name' => 'Show other categories',
      'description' => 'Decide whether HostBill should list other categories in this orderpage',
      'type' => 'checkbox',
    ),
  ),
);