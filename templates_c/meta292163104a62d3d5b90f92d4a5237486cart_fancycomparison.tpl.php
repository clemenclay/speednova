<?php
return array (
  'type' => 'wizard',
  'thumb' => 'templates/orderpages/cart_fancycomparison/thumb.png',
  'configfile' => 'templates\\orderpages\\config\\cart_fancycomparison.yml',
  'author' => 'HostBill team',
  'name' => 'Fancy 4 comparison boxes',
  'description' => 'Designed to hold 4 packages. Wizard-style checkout means your clients configure their order step-by-step on separate screens, with checkout at the end.<br/><br/>',
  'img' => 'templates/orderpages/cart_fancycomparison/preview.png',
  'file' => 'templates\\orderpages\\cart_fancycomparison.tpl',
  'template' => 'cart_fancycomparison',
  'template_old' => 'fancycomparison',
  'typespecific' => false,
  'hash' => '292163104a62d3d5b90f92d4a5237486',
  'filebasename' => 'cart_fancycomparison',
  'config' => 
  array (
    'productfeatures' => 
    array (
      'value' => 'ulli+description+',
    ),
    'imgpreview' => 
    array (
      'value' => '../templates/orderpages/cart_fancycomparison/howto.png',
      'name' => 'View editable areas',
      'type' => 'link',
    ),
    'header' => 
    array (
      'value' => 'Configure whatever you desire',
      'name' => 'Header',
      'description' => 'This phrase will be displayed right above category packages',
      'type' => 'input',
    ),
    'subheader' => 
    array (
      'value' => 'Fast. One-click. Cheap. For you!',
      'name' => 'Sub-header',
      'description' => 'Displayed below main header',
      'type' => 'input',
    ),
    'plandesc' => 
    array (
      'name' => 'Package descriptions',
      'description' => 'Short description displayed under product price',
      'value' => '<li>Perfect for starting, nice price and great options.</li>
<li>Great for advanced plans and fast servers.</li>
<li>The most popular!</li>
<li>The most complete plan of all, everything included!</li>',
      'type' => 'featurelist',
    ),
    'ribbon' => 
    array (
      'value' => 2,
      'name' => 'Display ribbon',
      'description' => 'Package namber, 0 means first',
      'type' => 'input',
    ),
    'footer1head' => 
    array (
      'value' => '24h Support',
      'name' => 'Left block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer1text' => 
    array (
      'name' => 'Left block text',
      'type' => 'textarea',
      'value' => 'HostBill helps run online businesses for companies all over the world. Our online forums is great meeting point for current and future users to exchange tips, opinions and ideas.',
    ),
    'footer1url' => 
    array (
      'value' => '#',
      'name' => 'Right block link url',
      'type' => 'input',
    ),
    'footer2head' => 
    array (
      'value' => '30 days tech-support',
      'name' => 'Right block header',
      'description' => 'This phrase will be displayed below package list',
      'type' => 'input',
    ),
    'footer2text' => 
    array (
      'name' => 'Right block text',
      'type' => 'textarea',
      'value' => 'HostBill helps run online businesses for companies all over the world. Our online forums is great meeting point for current and future users to exchange tips, opinions and ideas.',
    ),
    'footer2url' => 
    array (
      'value' => '#',
      'name' => 'Right block link url',
      'type' => 'input',
    ),
  ),
);