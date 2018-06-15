<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/slidersquaretab/images/wizard_slidersquaretab_thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_slidersquaretab.yml',
  'author' => 'HostBill team',
  'name' => 'Double Slider - wizard theme',
  'description' => 'Designed to work with a few packages. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>',
  'img' => 'templates/orderpages/slidersquaretab/images/slidersquaretab_preview.png',
  'file' => 'templates\\orderpages\\cart_slidersquaretab.tpl',
  'template' => 'cart_slidersquaretab',
  'template_old' => 'slidersquaretab',
  'typespecific' => false,
  'hash' => 'b0d43c8ba6f3f4c4e64767a14d450032',
  'filebasename' => 'cart_slidersquaretab',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/slidersquaretab/cart_slidersquare_howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'chooseplantext' => 
    array (
      'value' => 'Select your plan',
      'name' => 'Select plan text',
      'description' => 'This phrase will be displayed above available packages',
      'type' => 'input',
    ),
    'whyourplanintro' => 
    array (
      'value' => 'Why us?',
      'name' => 'Why us header text',
      'description' => 'This phrase will be displayed below available packages',
      'type' => 'input',
    ),
    'whyourplan' => 
    array (
      'value' => 'Lorem ipsum dolor sit amet',
      'name' => 'Why us text',
      'description' => 'HTML allowed, explain why your customer should choose you.',
      'type' => 'textarea',
    ),
    'promotext' => 
    array (
      'value' => 'Use promo code: <span>XXXXXXX</span> to get 50% off for 1 year signup* ',
      'name' => 'Promotion text',
      'description' => 'Its a good place to put promotional code.',
      'type' => 'input',
    ),
    'redstriptext' => 
    array (
      'value' => '<span class="tab-or1">50%</span><span class="tab-or2">off <br>1 year</span>',
      'name' => 'Red strip text',
      'description' => 'Use this to draw more attention to your plan',
      'type' => 'input',
    ),
  ),
);