<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/comparetable/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_comparetable.yml',
  'author' => 'HostBill team',
  'name' => 'Comparison table, 3 plans',
  'description' => 'Designed to work with a few packages. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>',
  'img' => 'templates/orderpages/comparetable/preview.png',
  'file' => 'templates\\orderpages\\cart_comparetable.tpl',
  'template' => 'cart_comparetable',
  'template_old' => 'comparetable',
  'typespecific' => false,
  'hash' => '93625997bb3c15e06f129fe7ca9678f8',
  'filebasename' => 'cart_comparetable',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+spec',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/comparetable/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'selected' => 
    array (
      'value' => 1,
      'name' => 'Highlight plan selection',
      'description' => 'Enter a number to highlight one of your products, \'0\' refers to first',
      'type' => 'input',
    ),
    'customheader' => 
    array (
      'value' => 'HostBill Advantages:',
      'name' => 'Custom header',
      'type' => 'input',
    ),
    'firstblock' => 
    array (
      'value' => '<h2>100%</h2>
<h3>Server Stability</h3>
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
<a href="#" >Read More &raquo;</a>',
      'name' => 'First block',
      'description' => 'Left most block, html available',
      'type' => 'textarea',
    ),
    'secondblock' => 
    array (
      'value' => '<h2>24 hour</h2>
<h3>User support</h3>
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
<a href="#" >Read More &raquo;</a>',
      'name' => 'Second block',
      'description' => 'Middle block, html available',
      'type' => 'textarea',
    ),
    'thirdblock' => 
    array (
      'value' => '<h2>Lifetime</h2>
<h3>Quarantee for all</h3>
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
<a href="#" >Read More &raquo;</a>',
      'name' => 'Third block',
      'description' => 'Right most block, html available',
      'type' => 'textarea',
    ),
    'footer' => 
    array (
      'value' => '<strong>Not happy with our plans?</strong> Don\'t worry! Write to us for a personalized plan that fits your needs. <a href="?cmd=tickets&action=new" >Write to us &raquo;</a>',
      'name' => 'Cart Footer',
      'description' => 'Html available',
      'type' => 'textarea',
    ),
  ),
);