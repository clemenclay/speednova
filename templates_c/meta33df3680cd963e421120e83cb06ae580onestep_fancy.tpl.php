<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_fancy/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_fancy.yml',
  'author' => 'HostBill team',
  'name' => 'Fancy comparison, one-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
Nice clean template with current plan highlighted, can hold maximum of four products',
  'img' => 'templates/orderpages/onestep_fancy/preview.png',
  'file' => 'templates\\orderpages\\onestep_fancy.tpl',
  'template' => 'onestep_fancy',
  'template_old' => 'fancy',
  'typespecific' => false,
  'hash' => '33df3680cd963e421120e83cb06ae580',
  'filebasename' => 'onestep_fancy',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/nestep_fancy/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'lighter' => 
    array (
      'value' => '',
      'name' => 'First color',
      'type' => 'colorpicker',
      'description' => 'Color used for highlights and as top gradient value',
    ),
    'darker' => 
    array (
      'value' => '',
      'name' => 'Second color',
      'type' => 'colorpicker',
      'description' => 'Color used for price, buttons and as bottom gradient value',
    ),
    'description' => 
    array (
      'value' => '<h1>Need something special?</h1>
<p><i>
HostBill lets you choose a template for every order page you have. You can create your own Order Page template or use one from templates that come with HostBill.
</i></p>',
      'name' => 'Custom Description',
      'description' => 'HTML is allowed.',
      'type' => 'textarea',
    ),
  ),
);