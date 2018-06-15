<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/slide_step/preview_t.png',
  'configfile' => 'templates\\orderpages\\config\\cart_slide_step.yml',
  'author' => 'HostBill team',
  'name' => 'Step Slider - wizard theme',
  'description' => 'Customizable slider template - each product is slider block to choose from.
Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.',
  'img' => 'templates/orderpages/slide_step/preview.png',
  'file' => 'templates\\orderpages\\cart_slide_step.tpl',
  'template' => 'cart_slide_step',
  'template_old' => 'slide_step',
  'typespecific' => false,
  'hash' => '216ccd10cfc3a2d0c26a1011fd3152fd',
  'filebasename' => 'cart_slide_step',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/slide_step/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'info' => 
    array (
      'value' => 'Drag slider to select plan that bests suits your requirements.',
      'name' => 'Information text',
      'description' => 'This phrase will be displayed above slider in right corner',
      'type' => 'input',
    ),
    'feature_first' => 
    array (
      'value' => '<h4>Login notification</h4>
<p>This feature is responsible for notification of all admins if someone was logged into HostBill Adminarea.</p>',
      'name' => 'First feature',
      'description' => 'HTML is allowed.',
      'type' => 'textarea',
    ),
    'feature_second' => 
    array (
      'value' => '<h4>Language customization</h4>
<p>If you don\'t find standard translation good enough, want to change or add new translations for your custom templates.</p>',
      'name' => 'Second feature',
      'description' => 'HTML is allowed.',
      'type' => 'textarea',
    ),
    'footer' => 
    array (
      'value' => 'Looking for custom plan for your pocket? Contact us <a href="?cmd=tickets&action=new"> go get a quote.</a>',
      'name' => 'Footer',
      'type' => 'textarea',
    ),
  ),
);