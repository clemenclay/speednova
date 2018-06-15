<?php
return array (
  'type' => 'onestep',
  'thumb' => 'templates/orderpages/onestep_coverflow/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\onestep_coverflow.yml',
  'author' => 'Amarok Design',
  'name' => 'Coverflow, one-step',
  'description' => 'A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page.
Nice clean template with current plan highlighted',
  'img' => 'templates/orderpages/onestep_coverflow/preview.png',
  'file' => 'templates\\orderpages\\onestep_coverflow.tpl',
  'template' => 'onestep_coverflow',
  'template_old' => 'coverflow',
  'typespecific' => false,
  'hash' => 'a4bcc9b277c32600a3bec6ff31730136',
  'filebasename' => 'onestep_coverflow',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/onestep_coverflow/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'highlighted' => 
    array (
      'value' => 1,
      'name' => 'Highlighted plan',
      'description' => 'Type which plan should be highlighted at start (index from 0)',
      'type' => 'input',
    ),
    'header' => 
    array (
      'value' => 'Select server you need',
      'name' => 'Section header',
      'type' => 'input',
    ),
    'subheader' => 
    array (
      'value' => 'Lorem ipsum dolor sit amet.',
      'name' => 'Section subheader',
      'type' => 'input',
    ),
  ),
);