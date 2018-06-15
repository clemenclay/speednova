<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/flexboxes/images/flexboxes_thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_flexboxes.yml',
  'author' => 'HostBill team',
  'name' => 'Flexible Height Boxes',
  'description' => 'Designed to work with a few packages. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>',
  'img' => 'templates/orderpages/flexboxes/images/flexboxes_preview.png',
  'file' => 'templates\\orderpages\\cart_flexboxes.tpl',
  'template' => 'cart_flexboxes',
  'template_old' => 'flexboxes',
  'typespecific' => false,
  'hash' => '0a2ea2a5204569900b75948e23198b1e',
  'filebasename' => 'cart_flexboxes',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+features',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/flexboxes/cart_flexboxes_howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
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